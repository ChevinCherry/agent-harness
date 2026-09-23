FROM node:20-trixie-slim

RUN apt-get update

RUN apt-get install -y git curl ca-certificates build-essential && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /usr/share/keyrings/githubcli-archive-keyring.gpg

RUN chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" > /etc/apt/sources.list.d/github-cli.list

RUN apt-get update

RUN apt-get install -y gh && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN npm install -g @anthropic-ai/claude-code

WORKDIR /workspace

COPY run-agent.sh /user/local/bin/run-agent
RUN chmod +x /user/local/bin/run-agent

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["sleep", "infinity"]

