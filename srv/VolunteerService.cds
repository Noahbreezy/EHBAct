using { ehbact as db } from '../db/schema';

annotate VolunteerService.Volunteers with @cds.draft.enabled;

service VolunteerService {

  @odata.draft.enabled
  entity Volunteers as projection on db.Volunteer {
    ID,
    name,
    email,
    totalHours,
    registrations
  };

  @odata.draft.enabled
  entity Registrations as projection on db.Registration {
    ID,
    status,
    performedHours,
    volunteer_ID,
    volunteer.name as volunteerName,
    position,
    activity
  };

  @odata.draft.enabled
  entity Positions as projection on db.Position {
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
  entity Activities as projection on db.Activity {
    ID,
    title,
    location,
    date,
    requiredVolunteers,
    organization,
    positions : Association to many Positions on positions.activity = $self,
    status
  };

  action SignUp(volunteerID: UUID, positionID: UUID) returns String;
  action LogHours(registrationID: UUID, hours: Decimal(10,2)) returns String;
  action GetTotalHours(volunteerID: UUID) returns Decimal(10,2);
  action navigateToActivities() returns Activities;
}
