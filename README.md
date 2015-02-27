# ablarg / krecipec


krecipec is a [Sinatra] / [Unicorn] / [Rdiscount] web-based recipe tracker forked from [rcrowley/krecipec]. 
This fork exists to provide a version of the app suitable for deployment.
  - Ruby dependencies are bundled via ruby [Bundler] tool
  - A defined ruby environment is provided via the Google [ruby-runtime] [Docker] container

  [rcrowley/krecipec]:https://github.com/rcrowley/krecipec
  [ruby-runtime]:https://registry.hub.docker.com/u/dockerfile/ruby-runtime/
  [Docker]:https://www.docker.com
  [Bundler]:http://bundler.io/v1.3/gemfile.html
  [Sinatra]:http://www.sinatrarb.com
  [Unicorn]:http://unicorn.bogomips.org
  [Rdiscount]:https://github.com/davidfstr/rdiscount

Prerequistes:
* Docker installed locally to build the image

  
Usage:
``` sh
git clone https://github.com/ablarg/krecipec
sh build.sh
```
if all went well, you should now have a running docker container hosting krecipe.

Issues
* Can't get my docker host to allow me access to the containerized app, although I can verify the app is running.