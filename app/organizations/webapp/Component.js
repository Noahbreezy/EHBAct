sap.ui.define(
    ["sap/fe/core/AppComponent"],
    function (Component) {
        "use strict";

        return Component.extend("ehbact.organizations.organizations.Component", {
            metadata: {
                manifest: "json"
            },

            init: function () {
                Component.prototype.init.apply(this, arguments);
                this.getRouter().initialize();
                this.getRouter().attachBeforeRouteMatched(this._onBeforeRouteMatched, this);
            },

            _onBeforeRouteMatched: function (oEvent) {
                var oParameters = oEvent.getParameters();
                console.log("Route parameters:", oParameters); // Debugging statement

                // Handle relevant object pages
                if (
                    oParameters.name === "OrganizationsObjectPage" ||
                    oParameters.name === "OrganizationsObjectPageDraft" ||
                    oParameters.name === "ActivitiesObjectPage" ||
                    oParameters.name === "ActivitiesObjectPageDraft" ||
                    oParameters.name === "PositionsObjectPage" ||
                    oParameters.name === "PositionsObjectPageDraft" ||
                    oParameters.name === "RegistrationsObjectPage" ||
                    oParameters.name === "RegistrationsObjectPageDraft"
                ) {
                    var oArguments = oParameters.arguments;
                    for (var key in oArguments) {
                        if (oArguments.hasOwnProperty(key) && key.includes("key")) {
                            var match = oArguments[key].match(/ID=([^,]+),IsActiveEntity=(true|false)/);
                            if (match) {
                                var id = match[1];
                                var isActiveEntity = match[2];

                                // Only add single quotes if they are missing
                                if (!id.startsWith("'") && !id.endsWith("'")) {
                                    id = `'${id}'`;
                                }

                                // Rebuild the argument in correct OData format
                                oArguments[key] = `ID=${id},IsActiveEntity=${isActiveEntity}`;
                                console.log("Modified argument:", oArguments[key]); // Debugging statement
                            }
                        }
                    }
                }
            }

        });
    }
);