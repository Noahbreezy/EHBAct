const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Activity, Position } = this.entities;

    this.on('PublishActivity', async (req) => {
        const { activityID } = req.data;

        // Fetch the activity details
        const activity = await SELECT.one.from(Activity).where({ ID: activityID });
        if (!activity) return req.error(404, `Activity not found`);

        // Check if the activity is already published
        if (activity.status === 'Published') {
            return req.error(400, `Activity is already published`);
        }

        // Check if the activity has at least one position
        const positions = await SELECT.from(Position).where({ activity_ID: activityID });
        if (positions.length === 0) {
            return req.error(400, `Activity must have at least one position before publishing`);
        }

        // Ensure all positions have valid details
        for (const position of positions) {
            if (!position.title || !position.neededVolunteers || !position.startShift || !position.endShift) {
                return req.error(400, `All positions must have a title, required volunteers, start shift, and end shift`);
            }
        }

        // Update the activity status to "Published"
        await UPDATE(Activity).set({ status: 'Published' }).where({ ID: activityID });

        return `Activity "${activity.title}" has been successfully published`;
    });

    this.on('GetActivityStats', async (req) => {
        const { activityID } = req.data;
    
        // Count registrations grouped by status
        const stats = await SELECT.from(this.entities.Registration)
            .columns('status', 'count(ID) as count')
            .where({ activity_ID: activityID })
            .groupBy('status');
    
        const result = {
            totalRegistrations: stats.reduce((sum, s) => sum + s.count, 0),
            completedRegistrations: stats.find(s => s.status === 'Completed')?.count || 0,
            canceledRegistrations: stats.find(s => s.status === 'Cancelled')?.count || 0,
        };
    
        return result;
    });
    
});
