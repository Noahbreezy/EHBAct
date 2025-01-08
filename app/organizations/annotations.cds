using OrganizationService as service from '../../srv/OrganizationService';
using VolunteerService as vsrv from '../../srv/VolunteerService';

// Annotate Organizations Entity
annotate service.Organizations with @(
    UI.FieldGroup #OrganizationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Name', Value : name },
            { $Type : 'UI.DataField', Label : 'Contact Person', Value : contactPerson }
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'OrganizationDetailsFacet',
            Label : 'Organization Details',
            Target : '@UI.FieldGroup#OrganizationDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ActivitiesFacet',
            Label : 'Activities',
            Target : '/Activities'
        }
    ],
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Name', Value : name },
        { $Type : 'UI.DataField', Label : 'Contact Person', Value : contactPerson }
    ]
);

// Annotate Activities Entity
annotate service.Activities with @(
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Title', Value : title },
        { $Type : 'UI.DataField', Label : 'Location', Value : location },
        { $Type : 'UI.DataField', Label : 'Date', Value : date },
        { $Type : 'UI.DataField', Label : 'Required Volunteers', Value : requiredVolunteers }
    ],
    UI.HeaderInfo : {
        TypeName : 'Activity',
        TypeNamePlural : 'Activities',
        Title : { Value : title }
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PositionsFacet',
            Label : 'Positions',
            Target : '/Positions'
        }
    ]
);

// Annotate Positions Entity
annotate service.Positions with @(
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Title', Value : title },
        { $Type : 'UI.DataField', Label : 'Description', Value : description },
        { $Type : 'UI.DataField', Label : 'Volunteers Needed', Value : neededVolunteers },
        { $Type : 'UI.DataField', Label : 'Start Shift', Value : startShift },
        { $Type : 'UI.DataField', Label : 'End Shift', Value : endShift }
    ],
    UI.HeaderInfo : {
        TypeName : 'Position',
        TypeNamePlural : 'Positions',
        Title : { Value : title }
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'RegistrationsFacet',
            Label : 'Registrations',
            Target : '/Registrations'
        }
    ]
);

// Annotate Registrations Entity
annotate service.Registrations with @(
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Status', Value : status },
        { $Type : 'UI.DataField', Label : 'Performed Hours', Value : performedHours },
        { $Type : 'UI.DataField', Label : 'Volunteer', Value : volunteer.name }
    ],
    UI.HeaderInfo : {
        TypeName : 'Registration',
        TypeNamePlural : 'Registrations',
        Title : { Value : status }
    }
);
