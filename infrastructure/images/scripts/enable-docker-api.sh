#!/bin/bash -ex

sudo sed -i '/ExecStart/c\ExecStart=\/usr\/bin\/dockerd -H fd:\/\/ -H tcp:\/\/0.0.0.0:2376' /lib/systemd/system/docker.service
sudo cat /lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo service docker restart

curl http://localhost:2376/version