FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /projects
COPY . ./dotnetcore
WORKDIR /projects/dotnetcore
#RUN dotnet restore *.csproj
#RUN dotnet build *.csproj
RUN dotnet publish -c Release -o /myApp dotnetcoresample.csproj
#RUN ls /myApp
CMD ["ls","/myApp"]

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS RUN
WORKDIR /deploy
EXPOSE 80
EXPOSE 443
COPY --from=build /myApp ./
CMD ["dotnet","dotnetcoresample.dll"]

