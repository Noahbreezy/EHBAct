using { ehbact as db } from '../db/schema';

service VolunteerService {
    entity Volunteers as projection on db.Volunteer;
    action SignUp(volunteerID: UUID, positionID: UUID) returns String;
    action LogHours(registrationID: UUID, hours: Decimal(10,2)) returns String;
    action GetTotalHours(volunteerID: UUID) returns Decimal(10,2);
}

