FROM versed/ruby:latest

USER root

# Configure app installation paths
ENV APPLICATION versed
RUN mkdir /opt/$APPLICATION
RUN chown -R versed:versed /opt

# Download latest version of application
USER versed
WORKDIR /opt/$APPLICATION
RUN git clone -b master https://github.com/versedapp/versed-poc.git current
WORKDIR /opt/$APPLICATION/current
RUN bash -l -c 'bundle install'

USER root
# Configure entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chown versed:versed /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER versed
EXPOSE 3000
