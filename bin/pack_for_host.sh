dir=oh-my-env-1

time=$(date +'%Y%m%d-%H%M%S')
dist=tmp/zhangbu-$time.tar.gz
current_dir=$(dirname $0)
deploy_dir=/workspaces/$dir/zhangbu_deploy

yes | rm tmp/zhangbu-*.tar.gz;
yes | rm $deploy_dir/zhangbu-*.tar.gz;

tar --exclude="tmp/cache/*" -czv -f $dist *
mkdir -p $deploy_dir
cp $current_dir/../config/host.Dockerfile $deploy_dir/Dockerfile
cp $current_dir/setup_host.sh $deploy_dir/
mv $dist $deploy_dir
echo $time > $deploy_dir/version
echo 'Happy package done!'