FROM node:4.1

### hubot setup ###
# add user
ENV HUBOT_HOME_DIR /home/hubot
RUN useradd -d $HUBOT_HOME_DIR -m hubot

# permission to /usr/local
#  -> because `npm install` puts the global modules to `/usr/local/lib`.
#  -> and, user have to access there
RUN chown -R hubot /usr/local

# su
USER hubot
WORKDIR $HUBOT_HOME_DIR

# install yeoman and generator
RUN npm install -g yo generator-hubot

# Setup hubot (without heroke-keepalive)
RUN mkdir ws && cd ws \
  && yo hubot --adapter=slack --defaults

# Optional (if you don't need heroke-keepalive)
#RUN cd ws \
#  && npm uninstall hubot-heroku-keepalive --save \
#  && sed -i -e "/hubot-heroku-keepalive/d" external-scripts.json
  

# Add jenkins integration script
ADD https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/jenkins.coffee ws/scripts/


ENTRYPOINT ["$HUBOT_HOME_DIR/ws/bin/hubot", "-a", "slack"]

