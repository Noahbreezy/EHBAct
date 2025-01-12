using VolunteerService as service from '../../srv/VolunteerService';

annotate service.Volunteers with @(
    UI.HeaderInfo                : {
        TypeName      : 'Volunteer',
        TypeNamePlural: 'Volunteers',
        Title         : {Value: name}
    },

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'email',
                Value: email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'totalHours',
                Value: totalHours,
            },
            {
                $Type: 'UI.DataFieldWithUrl',
                Label: 'Browse Activities',
                Value: 'Browse Activities',
                Url  : 'http://localhost:4004/volunteers/webapp/index.html#/ActivitiesList'
            }
        ],
    },

    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'RegistrationsFacet',
            Label : 'Registrations',
            Target: 'registrations/@UI.LineItem',
        },
    ],

    UI.Identification            : [

    ],

    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'email',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Label: 'totalHours',
            Value: totalHours,
        }
    ],
);

annotate service.Registrations with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Event',
        Value: activity.title,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Date',
        Value: activity.date,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Status',
        Value: status,
    },
]);

annotate service.Activities with @(
    UI.HeaderInfo                 : {
        TypeName      : 'Activity',
        TypeNamePlural: 'Activities',
        Title         : {Value: title}
    },

    UI.FieldGroup #ActivityDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Location',
                Value: location,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Date',
                Value: date,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Required Volunteers',
                Value: requiredVolunteers,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Value: status,
            },
        ],
    },

    UI.LineItem                   : [
        {
            $Type: 'UI.DataField',
            Label: 'Title',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Location',
            Value: location,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Date',
            Value: date,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Required Volunteers',
            Value: requiredVolunteers,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status',
            Value: status,
        },
    ],

    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ActivityDetailsFacet',
            Label : 'Activity Details',
            Target: '@UI.FieldGroup#ActivityDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'PositionsFacet',
            Label : 'Positions',
            Target: 'positions/@UI.LineItem#PositionsList',
        },
    ]
);

annotate service.Positions with @(
    UI.HeaderInfo                 : {
        TypeName      : 'Position',
        TypeNamePlural: 'Positions',
        Title         : {Value: title}
    },

    UI.FieldGroup #PositionDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Start Shift',
                Value: startShift,
            },
            {
                $Type: 'UI.DataField',
                Label: 'End Shift',
                Value: endShift,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Needed Volunteers',
                Value: neededVolunteers,
            }
        ]
    },

    UI.LineItem #PositionsList: [
        {
            $Type: 'UI.DataField',
            Label: 'Title',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Needed Volunteers',
            Value: neededVolunteers,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Start Shift',
            Value: startShift,
        },
        {
            $Type: 'UI.DataField',
            Label: 'End Shift',
            Value: endShift,
        }
    ],

    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'PositionDetailsFacet',
            Label : 'Position Details',
            Target: '@UI.FieldGroup#PositionDetails',
        }
    ]
);
