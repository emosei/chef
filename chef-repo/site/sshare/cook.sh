if [ "$1" = "" ]
then
  echo "Host名を指定してください。例) sh ./cook.sh develop"
  exit
fi
bundle exec knife solo cook "$1"
