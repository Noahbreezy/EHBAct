sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ehbact/volunteers/volunteers/test/integration/FirstJourney',
		'ehbact/volunteers/volunteers/test/integration/pages/VolunteersList',
		'ehbact/volunteers/volunteers/test/integration/pages/VolunteersObjectPage'
    ],
    function(JourneyRunner, opaJourney, VolunteersList, VolunteersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ehbact/volunteers/volunteers') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheVolunteersList: VolunteersList,
					onTheVolunteersObjectPage: VolunteersObjectPage
                }
            },
            opaJourney.run
        );
    }
);