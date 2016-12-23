
// the prefix that is used for each Grafana panel URL
SMARTHOME_GRAFANA_DEFAULTS["urlPrefix"] = "https://";

// use "false" so actual pages are loaded (or comment the line)
SMARTHOME_GRAFANA_DEFAULTS["debug"] = "true";

// use "default" for the default Eclipse SmartHome sitemap (or comment the line)
SMARTHOME_GRAFANA_DEFAULTS["sitemap"] = "Hausverwaltung";

if (SMARTHOME_GRAFANA_DEFAULTS["debug"] === "true") {
    console.log("Using SMARTHOME_GRAFANA_DEFAULTS = " + JSON.stringify(SMARTHOME_GRAFANA_DEFAULTS));
}
