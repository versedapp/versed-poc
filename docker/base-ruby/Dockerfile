FROM versed/debian

# Add a versed user                                                                                            
RUN useradd -d /home/versed -s /bin/bash -m versed
RUN echo "versed:versed2017" | chpasswd  

######################
# RBENV INSTALLATION #
######################
USER versed

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Add rbenv to the bashrc and profile
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

RUN chown -R versed:versed /home/versed

# Run as versed user
USER versed

# Install ruby and bundler
# If need to build portable ruby (relative load path)
# RUBY_CONFIGURE_OPTS="--enable-load-relative" rbenv install 2.4.1
RUN bash -l -c "rbenv install 2.4.1"
RUN bash -l -c "rbenv global 2.4.1"
RUN bash -l -c "gem install bundler"

# Set user back to root
USER root
