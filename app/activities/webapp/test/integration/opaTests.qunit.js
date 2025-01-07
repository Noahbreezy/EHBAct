sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ehbact/activities/activities/test/integration/FirstJourney',
		'ehbact/activities/activities/test/integration/pages/ActivitiesList',
		'ehbact/activities/activities/test/integration/pages/ActivitiesObjectPage'
    ],
    function(JourneyRunner, opaJourney, ActivitiesList, ActivitiesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ehbact/activities/activities') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheActivitiesList: ActivitiesList,
					onTheActivitiesObjectPage: ActivitiesObjectPage
                }
            },
            opaJourney.run
        );
    }
);