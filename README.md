# platform-infra

Infrastructure as code for services, apps and more

## Local Development Setup

- Clone this repository
- Install IDEA plugin for Terraform
- Install [asdf](https://asdf-vm.com/#/core-manage-asdf), a version manager to install terraform, terragrunt
- Install [pre-commit](https://pre-commit.com/#installation)
- Run the below snippet in root of this repo to setup `asdf`
    - Adds plugins for terraform & terragrunt
    - Install terraform & terragrunt
    - Set current(global) versions for both

```shell
asdf plugin add terraform
asdf plugin add terragrunt
asdf install terraform 0.14.6
asdf install terragrunt 0.28.2
asdf global terraform 0.14.6
asdf global terragrunt 0.28.2
pre-commit install
```

It would be worthwhile for you to add aliases in your profile for terragrunt & terraform

```shell
alias tf=terraform
alias tg=terragrunt
```

## Deployment to dev environment - Atlantis

We use atlantis to plan and apply any changes on dev environment.

- [Atlantis](https://www.runatlantis.io/) will comment
  with [plan](https://www.terraform.io/intro/index.html#execution-plans) output for the directories it detects changes.
- The configuration for Atlantis in [atlantis.yaml](./atlantis.yaml)


## Deployment to higher environments

- All changes to higher environments are planned and applied using AWS Codepipeline
- After a pull request is planned and applied using [Atlantis](#atlantis) merged into `master` branch, a Codepipeline is triggered to plan changes for test env.
- Check out [this Confluence page](https://medlypharmacy.atlassian.net/wiki/spaces/PLAT/pages/1454211086/WIP+Codepipeline+for+Infrastructure) for more info on how this works

## Terraform State

[Learn more about Terraform State here](https://www.terraform.io/docs/language/state/index.html)

For each account/env, the `medly-<env>-terraform-state` bucket is used to store terraform state for all the infra across
Medly

- S3 Location: `medly-<env>-terraform-state/global/`
- This is managed in the [accounts/medly-{environment}/terragrunt.hcl](./accounts/medly-dev/terragrunt.hcl) file

### Medly Confluence

- [DevOps Onboarding](https://medlypharmacy.atlassian.net/wiki/spaces/PLAT/pages/1163788326/DevOps+SRE+onboarding)
- [CIDR & Subnet ranges for environments](https://medlypharmacy.atlassian.net/wiki/spaces/PLAT/pages/669220865/CIDR+blocks+for+AWS+Accounts)
- [Codepipeline for Infra](https://medlypharmacy.atlassian.net/wiki/spaces/PLAT/pages/1454211086/WIP+Codepipeline+for+Infrastructure)
