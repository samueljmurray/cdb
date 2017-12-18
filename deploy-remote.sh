#!/bin/sh

cd ~/cdb
git pull
cp ~/dev.secret.exs ~/cdb/config/dev.secret.exs
cp ~/prod.secret.exs ~/cdb/config/prod.secret.exs
mix deps.get
cd assets && npm install && cd ..
cd assets && ./node_modules/brunch/bin/brunch b -p && cd ..
MIX_ENV=prod mix phx.digest
MIX_ENV=prod mix release
mkdir ~/cdb-LIVE_new
tar -xzf ~/cdb/_build/prod/rel/cdb/releases/0.0.1/cdb.tar.gz -C ~/cdb-LIVE_new
[ -e ~/cdb-LIVE/bin/cdb/_build ] && rm ~/cdb/_build
[ -e ~/cdb-LIVE/bin/cdb ] && sudo ~/cdb-LIVE/bin/cdb stop
sudo rm -rf ~/cdb-LIVE
mv ~/cdb-LIVE_new ~/cdb-LIVE
~/cdb-LIVE/bin/cdb migrate
sudo PORT=80 ~/cdb-LIVE/bin/cdb start