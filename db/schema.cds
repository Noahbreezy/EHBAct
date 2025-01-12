namespace ehbact;

entity Volunteer {
  key ID : UUID;
  name : String(100);
  email : String(100);
  totalHours : Decimal(10,2);

  registrations : Association to many Registration 
    on registrations.volunteer_ID = $self.ID;
}

entity Organization {
  key ID : UUID;
  name : String(100);
  contactPerson : String(100);

  activities : Composition of many Activity 
    on activities.organization = $self;
}

entity Activity {
  key ID : UUID;
  title : String(100);
  location : String(200);
  date : DateTime;
  requiredVolunteers : Integer;

  organization : Association to Organization;
  positions    : Composition of many Position 
    on positions.activity = $self;

  status : String enum { Draft; Published; };
}

entity Position {
  key ID : UUID;
  title : String(100);
  description : String(255);
  neededVolunteers : Integer;
  startShift : Time;
  endShift   : Time;

  activity : Association to Activity;

  registrations : Composition of many Registration 
    on registrations.position = $self;
}

entity Registration {
  key ID : UUID;
  status : String enum { Registered; Cancelled; Completed; };
  performedHours : Decimal(10,2);

  volunteer_ID : UUID; 
  volunteer    : Association to Volunteer 
    on volunteer.ID = $self.volunteer_ID;  // Ensure a unique match

  position : Association to Position;
  activity : Association to Activity;
}
