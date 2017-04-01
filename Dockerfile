FROM codingame/dotnet-runner:latest
COPY entrypoint.sh /entrypoint.sh
COPY parse_build_out.pl /parse_build_out.pl
COPY test.sh /test.sh
ENTRYPOINT ["/entrypoint.sh"]
