sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("organizations.controller.Activities", {
        onInit: function () {
            const oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("Activities").attachPatternMatched(this._onObjectMatched, this);
        },

        _onObjectMatched: function (oEvent) {
            const sOrganizationId = oEvent.getParameter("arguments").key; // Organization ID
            const oModel = this.getView().getModel();

            // Apply filter to fetch activities for the organization
            const oFilter = new sap.ui.model.Filter("organization_ID", sap.ui.model.FilterOperator.EQ, sOrganizationId);
            const oBinding = this.getView().byId("activitiesList").getBinding("items");
            oBinding.filter([oFilter]);
        }
    });
});
