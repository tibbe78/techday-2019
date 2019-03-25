docker container stop cp_api01 cp_api02
docker container rm cp_api01 cp_api02
docker build --tag=cp_api_img ./docker/
docker network list | grep -q "mgt_net" || docker network create "mgt_net"
docker run -d -P --network='mgt_net' --network-alias mgt --name cp_api01 cp_api_img
ansible-playbook -i inventory.ini playbook.yml
docker ps -s --format "table {{.Names}}: {{.Size}}: {{.RunningFor}}"
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
