FROM mcr.microsoft.com/dotnet/aspnet:7.0.19

RUN apt-get update && apt-get install -y libgdiplus libc6-dev && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
RUN apt-get update && apt-get install -y fontconfig
