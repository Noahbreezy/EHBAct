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

  action SignUp(volunteerID: UUID, positionID: UUID) returns String;
  action LogHours(registrationID: UUID, hours: Decimal(10,2)) returns String;
  action GetTotalHours(volunteerID: UUID) returns Decimal(10,2);
}
