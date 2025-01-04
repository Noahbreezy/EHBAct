using { ehbact as db } from '../db/schema';


annotate OrganizationService.Organizations with @cds.draft.enabled;
annotate OrganizationService.Activities with @cds.draft.enabled;
annotate OrganizationService.Positions with @cds.draft.enabled;

service OrganizationService {
    @odata.draft.enabled
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
