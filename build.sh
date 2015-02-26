# Usage: sh (-x) build.sh (-x for debug)
# build krecipec sinatra app for a production environment
# author: Mark Axelrod, based on work by google, docker,  and richard crowley

# kill all previously running docker containers
docker rm -f $(docker ps -a -q)

#
# build the docker image leveraging google's ruby runtime docker container
# see https://registry.hub.docker.com/u/dockerfile/ruby-runtime/
# this command downloads the docker container referenced , and utilizes the BUILD directive specified in the 
# ruby-runtime docker container to import and execute ./app/Dockerfile 
# ./app/Dockerfile creates our deliverable, a docker image containing our krecipe sinatra app.
docker build -t="krecipe-deploy" app

# now we have our deliverable, lets instantiate it:

# set host and container ports for container 
HOSTPORT=8080
CONTAINERPORT=8080
HOSTIP=127.0.0.1

# start our docker with specifed port values and capture its id for use later
container_id=$(docker run -d -p ${HOSTIP}:${HOSTPORT}:${CONTAINERPORT} krecipe-deploy)

# show all running dockers
echo "$(docker ps)"

# show logs of our app
echo "$(docker logs ${container_id})"

# wait for our docker to come up
sleep 2

# talk to our app from inside the docker container
echo "$(docker exec -it ${container_id} curl http://localhost:8080)"

# talk to our app from the host (not working)
#echo "$(curl http://{HOSTIP}:$HOSTPORT)"

# view krecipec app logs
echo "$(docker logs ${container_id})"

# get a shell in our running docker container so we can inspect it 
#PID=$(docker inspect --format {{.State.Pid}} ${container_id})
#sudo nsenter --target $PID --mount --uts --ipc --net --pid
