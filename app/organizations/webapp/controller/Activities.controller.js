sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("organizations.controller.Activities", {
        onInit: function () {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("ActivitiesList").attachPatternMatched(this._onObjectMatched, this);
        },

        _onObjectMatched: function (oEvent) {
            var sOrgId = oEvent.getParameter("arguments").organizationID;
            var oFilter = new sap.ui.model.Filter("organization_ID", sap.ui.model.FilterOperator.EQ, sOrgId);
            this.byId("activitiesList").getBinding("items").filter([oFilter]);
        }
    });
});
