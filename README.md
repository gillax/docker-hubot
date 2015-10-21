# docker-hubot
hubot integrates with slack and jenkins

# Usage
Run the `docker run` command like this.

```
docker run -e HUBOT_SLACK_TOKEN=<slack-token> -e HUBOT_JENKINS_URL=<jenkins-url> -e HUBOT_JENKINS_AUTH=<jenkins-auth> -e REDIS_URL=<redis-url> gillax/hubot-slack-jenkins
```

+ HUBOT_SLACK_TOKEN (required)
+ HUBOT_JENKINS_URL (optional. if you wanna integrates with jenkins)
+ HUBOT_JENKINS_AUTH (optional. if you wanna integrates with jenkins)
+ REDIS_URL (optional. if you wanna integrates with redis)
