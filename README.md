# .Net Core Builder on Docker Container

Docker Builder for .Net Core Projects

This Image allow you build, run sonnarscanner and generate unit tests coverage and reports.

## This Image is using

| Type                                                 | Name          | Version         |
| ---------------------------------------------------- |:-------------:| ---------------:|
| Docker OS                                            | Debian        |   Bullseye (11) |
| .NET SDK                                             | .NET Core SDK | 3.1   (3.1.415) |
| .NET SDK                                             | .NET Core SDK | 5.0   (5.0.403) |
| .NET SDK                                             | .NET Core SDK | 6.0   (6.0.100) |
| GitVersion.Tool                   (DotNet Core Tool) | CLI           | 5.8    (5.8.1 ) |
| dotnet-sonarscanner               (DotNet Core Tool) | CLI           | 5.4     (5.4.0) |
| dotnet-reportgenerator-globaltool (DotNet Core Tool) | CLI           | 5.0     (5.0.0) |
| coverlet.console                  (DotNet Core Tool) | CLI           | 3.1   (3.1.0.0) |
| trx2junit                         (DotNet Core Tool) | CLI           | 2.0     (2.0.0) |

## Latest Tools references

* [Latest Debian](https://www.debian.org/releases/stable/)
* [Latest .Net SDK](https://www.microsoft.com/net/download/all)
* [Latest GitVersion.Tool Version](https://www.nuget.org/packages/GitVersion.Tool)
* [Latest SonnarScanner Version](https://www.nuget.org/packages/dotnet-sonarscanner)
* [Latest Coverlet Console Version](https://www.nuget.org/packages/coverlet.console)
* [Latest Report Generator GlobalTool Version](https://www.nuget.org/packages/dotnet-reportgenerator-globaltool)
* [Latest trx2junit Version](https://www.nuget.org/packages/trx2junit)

## Using Example

And then you need .Net Core project. If you haven't one, run this codes;

```(bash)
mkdir ConsoleApplication1
cd ConsoleApplication1

dotnet new console
dotnet new sln
dotnet sln ConsoleApplication1.sln add ConsoleApplication1.csproj
git init

dotnet build
```

Executing your code in docker container:

```(bash)
docker run --name builder -it --rm -v $(pwd):/app dotnet-docker-builder:latest
```
