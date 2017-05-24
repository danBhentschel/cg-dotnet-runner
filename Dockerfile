FROM techio/dotnet-runner:latest
COPY entrypoint.sh /entrypoint.sh
COPY parse_build_out.pl /parse_build_out.pl
COPY desanitize_project.pl /desanitize_project.pl
COPY test.sh /test.sh
COPY build /project/build
ENTRYPOINT ["/entrypoint.sh"]
