#!/bin/bash
docker stop spark
docker rm spark
docker build -t tanxinzheng/spark .
#docker run -d -t --name spark tanxinzheng/spark /bin/bash
#docker-compose down
#docker-compose up