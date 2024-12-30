namespace ehbact;

entity Volunteer {
    key ID : UUID;
    name   : String(100);
    email  : String(100);
    totalHours : Decimal(10,2);
    registrations : Composition of many Registration on registrations.volunteer = $self;
}

entity Organization {
    key ID : UUID;
    name   : String(100);
    contactPerson : String(100);
    activities : Composition of many Activity on activities.organization = $self;
}

entity Activity {
    key ID : UUID;
    title  : String(100);
    location : String(200);
    date   : DateTime;
    requiredVolunteers : Integer;
    organization : Association to Organization;
    positions : Composition of many Position on positions.activity = $self;
    status : String enum { Draft; Published; }; 
}


entity Position {
    key ID : UUID;
    title  : String(100);
    description : String(255);
    neededVolunteers : Integer;
    startShift : Time;
    endShift : Time;
    activity : Association to Activity;
    registrations : Composition of many Registration on registrations.position = $self;
}

entity Registration {
    key ID : UUID;
    status : String enum { Registered; Cancelled; Completed; };
    performedHours : Decimal(10,2);
    volunteer : Association to Volunteer;
    position  : Association to Position;
    activity  : Association to Activity;
}
