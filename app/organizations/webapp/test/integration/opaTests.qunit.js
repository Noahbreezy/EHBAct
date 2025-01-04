sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ehbact/organizations/organizations/test/integration/FirstJourney',
		'ehbact/organizations/organizations/test/integration/pages/OrganizationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrganizationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ehbact/organizations/organizations') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrganizationsObjectPage: OrganizationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);