FROM lancope/java:trusty_8

RUN wget -q -O - http://jruby.org.s3.amazonaws.com/downloads/1.7.13/jruby-bin-1.7.13.tar.gz | tar -C /usr/local -xzf -
RUN echo "export PATH=\$PATH:/usr/local/jruby-1.7.13/bin" > /etc/profile.d/jruby.sh
RUN /usr/local/jruby-1.7.13/bin/jruby -S gem install puma geminabox

ADD config.ru /
VOLUME /var/lib/geminabox
EXPOSE 80
CMD /usr/local/jruby-1.7.13/bin/jruby -S puma -p 80 /config.ru
