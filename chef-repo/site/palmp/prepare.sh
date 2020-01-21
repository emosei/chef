if [ "$1" = "" ]
then
  echo "Host名を指定してください。例) sh ./prepare.sh develop"
  exit 1
fi
bundle exec knife solo prepare "$1"
