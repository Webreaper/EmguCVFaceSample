#!/bin/bash
set -e

# echo "Increasing inotify watch limit..."
# echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p    

echo "Dotnet Run:"
dotnet run

echo "Run Compiled:"
./emgu/bin/Release/net5.0/linux-x64/emgu

echo "Run Published:"
./emgu/bin/Release/net5.0/linux-x64/publish/emgu
