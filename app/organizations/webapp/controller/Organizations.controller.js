sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("organizations.controller.Organizations", {
        onInit: function () {
            // Any initialization logic can go here
        },

        onOrganizationPress: function (oEvent) {
            const oItem = oEvent.getSource();
            const sPath = oItem.getBindingContext().getPath();
            const sOrganizationId = sPath.split("/").pop(); // Extract ID from the path

            const oRouter = this.getOwnerComponent().getRouter();
            oRouter.navTo("Activities", { key: sOrganizationId });
        }
    });
});
