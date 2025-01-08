sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("organizations.controller.Organizations", {
        onInit: function () {
            // Any initialization logic can go here
        },

        onOrganizationPress: function (oEvent) {
            var sOrgId = oEvent.getSource().getBindingContext().getProperty("ID");
            this.getOwnerComponent().getRouter().navTo("ActivitiesList", { organizationID: sOrgId });
        }
    });
});
