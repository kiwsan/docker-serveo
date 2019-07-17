FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
  openssh-client \
&& rm -rf /var/lib/apt/lists/*

ENV LOCAL_HOST 0.0.0.0
ENV LOCAL_PORT 8082
ENV REMOTE_PORT 80
ENV REMOTE_HOST kiwsan

#ssh -R kiwsan:80:localhost:8082 serveo.net
CMD ["sh", "-c", "ssh -R $REMOTE_HOST:$REMOTE_PORT:$LOCAL_HOST:$LOCAL_PORT serveo.net"]
