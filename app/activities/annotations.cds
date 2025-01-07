using OrganizationService as service from '../../srv/OrganizationService';
annotate service.Activities with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Location',
                Value : location,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Date',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Required Volunteers',
                Value : requiredVolunteers,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Organization',
            Value : organization.name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Location',
            Value : location,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Date',
            Value : date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Required Volunteers',
            Value : requiredVolunteers,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
    ],
);

annotate service.Activities with {
    organization @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Organizations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : organization_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactPerson',
            },
        ],
    }
};

