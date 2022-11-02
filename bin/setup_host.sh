container_name=zhangbu-prod-1

version=$(cat zhangbu_deploy/version)

echo 'docker build ...'
docker build zhangbu_deploy -t zhangbu:$version
if [ "$(docker ps -aq -f name=^zhangbu-prod-1$)" ]; then
  echo 'docker rm ...'
  docker rm -f $container_name
fi
echo 'docker run ...'
#docker run -d -p 3000:3000 --name $container_name -e DB_PASSWORD=$DB_PASSWORD --network=network1 zhangbu:$version
docker run -e DB_HOST=$DB_HOST -e RAILS_MASTER_KEY=$RAILS_MASTER_KEY -d -p 3000:3000 --network=network1  -e DB_PASSWORD=$DB_PASSWORD --name=$container_name zhangbu:$version

#echo 'docker exec ...'
#docker exec -it $container_name bin/rails db:create db:migrate

echo 'Happy setup done!'