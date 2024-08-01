FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR .
COPY . .
RUN 'dotnet restore dotnetcoresample'
RUN 'dotnet build dotnetcoresample'
RUN 'dotnet publish --config Release -o /myApp dotnetcoresample'
RUN 'ls /myApp'
