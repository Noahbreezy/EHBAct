using {ehbact as db} from '../db/schema';

service OrganizationService {

    @odata.draft.enabled
    entity Organizations              as
        projection on db.Organization {
            ID,
            name,
            contactPerson,
            activities : Association to many Activities on activities.organization = $self
        };

    @odata.draft.enabled
    entity Activities                 as
        projection on db.Activity {
            ID,
            title,
            location,
            date,
            requiredVolunteers,
            organization,
            positions : Association to many Positions on positions.activity = $self,
            status
        };

    @odata.draft.enabled
    entity Positions                  as
        projection on db.Position {
            ID,
            title,
            description,
            neededVolunteers,
            startShift,
            endShift,
            activity,
            registrations : Association to many Registrations on registrations.position = $self
        };

    @odata.draft.enabled
    entity Registrations              as
        projection on db.Registration {
            ID,
            status,
            performedHours,
            volunteer_ID,
            volunteer,
            volunteer.name as volunteerName,
            position,
            activity
        };

    // -- Actions -- //
    action PublishActivity(activityID : UUID)               returns String;

    action GetActivityStats(activityID : UUID)              returns {
        totalRegistrations : Integer;
        completedRegistrations : Integer;
        canceledRegistrations : Integer;
    };

    action GetOrganizationActivities(organizationID : UUID) returns many {
        ID : UUID;
        title : String;
        location : String;
        date : DateTime;
        requiredVolunteers : Integer;
        status : String;
        positionCount : Integer;
        participantCount : Integer;
    };

    action GetActivityDetails(activityID : UUID)            returns {
        ID : UUID;
        title : String;
        location : String;
        date : DateTime;
        requiredVolunteers : Integer;
        organization : {
            ID : UUID;
            name : String;
        };
    };

    action GetAllOrganizations()                            returns many {
        ID : UUID;
        name : String;
        contactPerson : String;
    };
}
