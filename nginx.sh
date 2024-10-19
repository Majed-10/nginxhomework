#!/bin/bash



    sudo apt update
    sudo apt install nginx

    user_data = base64encode(file("nginx.sh"))



    



