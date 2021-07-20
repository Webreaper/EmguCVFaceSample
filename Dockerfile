# Use the bazel-android image
# FROM emgu/bazel-android:dotnet-5.0-bazel-4.0
FROM ubuntu:20.04

RUN apt update

#Add basic packages required to install bazel and dotnet repo
RUN apt -y install wget 
# RUN apt -y install curl gnupg apt-transport-https

#Add dotnet repo
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt update
RUN apt -y upgrade
RUN apt -y install dotnet-sdk-5.0 aspnetcore-runtime-5.0

# Emgu CV dependencies
RUN apt -y install libgtk-3-dev libgstreamer1.0-dev libavcodec-dev libswscale-dev libavformat-dev libdc1394-22-dev libv4l-dev cmake-curses-gui ocl-icd-dev freeglut3-dev libgeotiff-dev libusb-1.0-0-dev
RUN apt -y install build-essential cmake git protobuf-compiler libprotobuf-dev

#Create a new folder for our project
RUN mkdir -p /emgu

#Change work dir
WORKDIR "/emgu"

#Create a new console program
RUN dotnet new console

#COPY the source code to the docker image
COPY Program.cs "/emgu/Program.cs"
COPY emgu.csproj "/emgu/emgu.csproj"
COPY Oscars.jpeg "/emgu/Oscars.jpeg"
COPY haarcascade_frontalface_default.xml "/emgu/haarcascade_frontalface_default.xml"

#Restore nuget packages
RUN dotnet restore

#Compile the program
RUN dotnet build

#run the program
ENTRYPOINT ["dotnet", "run"]
