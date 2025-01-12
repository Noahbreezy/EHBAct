const cds = require('@sap/cds');

// filepath: /home/user/projects/EhBact/srv/VolunteerService.js
module.exports = cds.service.impl(async function () {
    const { Registration, Position, Volunteer } = this.entities;

    this.before('CREATE', 'Registration', async (req) => {
        const { volunteer_ID, position_ID } = req.data;
    
        // Check for duplicate registrations
        const existing = await SELECT.one.from(Registration).where({ volunteer_ID, position_ID });
        if (existing) req.error(400, `You have already signed up for this position`);
    });
    
    this.on('SignUp', async (req) => {
        const { volunteerID, positionID } = req.data;

        // Check if position exists and is not full
        const position = await SELECT.one.from(Position).where({ ID: positionID });
        if (!position) return req.error(404, `Position not found`);
        const registrationsCount = await SELECT.from(Registration).where({ position_ID: positionID }).count();
        if (registrationsCount >= position.neededVolunteers) {
            return req.error(400, `Position is already full`);
        }

        // Create registration
        await INSERT.into(Registration).entries({
            volunteer_ID: volunteerID,
            position_ID: positionID,
            status: 'signed_up',
        });
        return `Volunteer successfully signed up for position: ${position.title}`;
    });

    this.on('LogHours', async (req) => {
        const { registrationID, hours } = req.data;

        // Update registration hours and volunteer total hours
        const registration = await SELECT.one.from(Registration).where({ ID: registrationID });
        if (!registration) return req.error(404, `Registration not found`);

        await UPDATE(Registration).set({ performedHours: hours, status: 'attended' }).where({ ID: registrationID });
        await UPDATE(Volunteer).set(`totalHours +=`, hours).where({ ID: registration.volunteer_ID });

        return `Logged ${hours} hours for registration ID: ${registrationID}`;
    });

    this.on('GetTotalHours', async (req) => {
        const { volunteerID } = req.data;
    
        // Sum the performedHours for the given volunteer
        const totalHours = await SELECT.one.columns('sum(performedHours) as total')
            .from(this.entities.Registration)
            .where({ volunteer_ID: volunteerID });
    
        return totalHours.total || 0;
    });

    this.on('navigateToActivities', async (req) => {
        const activities = await cds.tx(req).run(SELECT.from('VolunteerService.Activities'));
        return activities;
    });
});
