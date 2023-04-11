# renovate-config

![Validate](https://github.com/cognitedata/renovate-config-public/workflows/Validate/badge.svg)

[Renovate config presets](https://docs.renovatebot.com/config-presets/)
for Cognite.

[Renovate](https://docs.renovatebot.com/) is a tool that automates the process
of keeping dependencies up-to-date, and gives better visibility into
available dependency updates.

See [Configuration Options](https://docs.renovatebot.com/configuration-options/)
for a complete list of possible options.

## Using Renovate in a repository

In order to start using Renovate Bot in your repository:

1. The Renovate GitHub App is enabled for all repositories in the
   `cognitedata` organization. Renovate will automatically create an
   onboarding PR that extends the [default.json](./default.json)
   config preset in this repo. If Renovate is not enabled for your repo,
   or you are unable to find the onboarding PR, you can ask for help
   from `@security-shield` in `#help-security` on Slack.

1. Make any manual changes to the config if you'd like.

   If you have a lot of updates it might makes sense to
   [whitelist updates](https://docs.renovatebot.com/configuration-options/#dependencydashboardapproval)
   (through Dependency Dashboard, see next bullet) before having lots of PRs.
   This can be done by adding the following to `renovate.json`:

   ```json
   {
     "dependencyDashboardApproval": true
   }
   ```

1. Merge the PR. Renovate will then create a special "Dependency Dashboard"
   issue that gives visibility into dependencies state, and will start
   create PRs for suggesting updates.

## Dashboard with bot logs

See https://app.renovatebot.com/dashboard

## Useful tips

- Renovate can be configured with [regex matches](https://docs.renovatebot.com/modules/manager/regex/)
  to update custom version references such as env tags in Dockerfile
  or custom scripts.

## Contributing

The preset files can be checked locally before pushing:

```bash
npm ci
./validate.sh
```
