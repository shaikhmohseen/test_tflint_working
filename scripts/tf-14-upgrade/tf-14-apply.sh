cwd=${PWD##*/}
printf 'cwd: %s\n' "${cwd}"
alias tf=terraform
alias tg=terragrunt

echo applying changes with terraform 0.12.26
sed -i '' -e $'/required_version=/c\\\nrequired_version=">= 0.12.26"\n' ../terragrunt.hcl
sed -i '' -e $'/aws=/c\\\naws="=2.60.0"\n' ../terragrunt.hcl
asdf local terraform 0.12.26
tg init -reconfigure
tg apply || exit

# shellcheck disable=SC2162
read -p "update modules used in ${cwd} to use v1.1.0, press any key to proceed" -n1 -s
echo
echo upgrading to terraform 0.13.5
sed -i '' -e $'/required_version=/c\\\nrequired_version=">= 0.13"\n' ../terragrunt.hcl
sed -i '' -e $'/aws="=/c\\\naws={version="=3.26.0", source="hashicorp/aws"}\n' ../terragrunt.hcl
asdf local terraform 0.13.5
tg 0.13upgrade -yes || exit
tg init -reconfigure
tg apply || exit

echo applying with terraform 0.14.6
asdf local terraform 0.14.6
tg init -reconfigure
tg apply
