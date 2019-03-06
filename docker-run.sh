#!/bin/bash
docker run -p 19132:19132/udp -d --rm --name bedrock bedrock_server:1.9.0.15
