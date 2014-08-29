#
# Go runtime Dockerfile
#
# https://github.com/dockerfile/go-runtime
#

# Pull base image.
FROM dockerfile/go

# Add scripts.
ADD bin/go-build /usr/local/bin/go-build
ADD bin/go-run /usr/local/bin/go-run

# Add executable permission to scripts.
RUN chmod +x /usr/local/bin/go-*

# Set instructions on build.
ONBUILD ADD . /gopath/src/app/
ONBUILD RUN go-build

# Define default command.
CMD ["go-run"]

# Expose port.
EXPOSE 8080
