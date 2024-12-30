using { ehbact as db } from '../db/schema';

service OrganizationService {
    entity Organizations as projection on db.Organization;
    entity Activities as projection on db.Activity;
    entity Positions as projection on db.Position;
    action PublishActivity(activityID: UUID) returns String;
    action GetActivityStats(activityID: UUID) returns {
        totalRegistrations: Integer;
        completedRegistrations: Integer;
        canceledRegistrations: Integer;
    };
}
