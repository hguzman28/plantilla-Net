# Etapa de construcción
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["MiPrimerMicroservicio.csproj", "./"]
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app

# Etapa de producción
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
COPY --from=build /app .
RUN apt-get update && apt-get install -y curl

ENTRYPOINT ["dotnet", "MiPrimerMicroservicio.dll"]