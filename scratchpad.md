## TODO

* Configure a job in groovy with an office365 connector
  - Where should the connector URL be pulled from?
    * Secret storage? (just to be safe)
* Can the office365 connector Webhook URLs be fetched automatically and used in job init groovy?

## Notes

[Plugin code](https://github.com/jenkinsci/office-365-connector-plugin)
[Plugin page](https://plugins.jenkins.io/Office-365-Connector)

Connectors are created manually __ONCE__ within Office365 and assigned to either an
  * Outlook group?
  * MSTeams teams

Once a connector is created, it provides a static URL which tools/scripts can __POST__ to.
  * This URL won't change?

If the URL won't change, then it can be stored somewhere as a static artifact.
