# check if any pending state changes present for input directory with v0.12.26

cd "$1" || exit
cwd=${PWD##*/}
printf 'cwd: %s\n' "${cwd}"
alias tf=terraform
alias tg=terragrunt

asdf local terraform 0.12.26
# tf --version
# tg --version

plan_output=$(tg plan)

if [[ $plan_output == *"No changes. Infrastructure is up-to-date."* ]]; then
  echo 'no changes'
elif [[ $plan_output =~ "Plan" ]]; then
  echo "$plan_output" | grep Plan
else
  echo "In else block"
  echo "$plan_output"
fi

cd ../
