#!/bin/bash
set -e

# echo "Increasing inotify watch limit..."
# echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p    

echo "Dotnet Run:"
dotnet run

