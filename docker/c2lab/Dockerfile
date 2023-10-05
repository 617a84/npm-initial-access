FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
	 apt-transport-https \
	 curl \
	 ca-certificates \
	 dnsutils \
	 lsb-release \
	 netcat \
	 php \
	 postgresql \
	 ruby-full \
	 software-properties-common \
	 tmux \
	 vim && \
	 curl -fsSL https://apt.metasploit.com/metasploit-framework.gpg.key | gpg --dearmor | tee /usr/share/keyrings/metasploit.gpg > /dev/null && \
	 echo "deb [signed-by=/usr/share/keyrings/metasploit.gpg] http://downloads.metasploit.com/data/releases/metasploit-framework/apt lucid main" |\
	 tee /etc/apt/sources.list.d/metasploit.list && \
	 apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
	 metasploit-framework \
	 && rm -rf /var/lib/apt/lists/*

FROM builder
COPY . /root/c2/
WORKDIR "/root/c2"
# ENTRYPOINT exec tmux new-session -d -s c2 'bash setup_and_run_remote.sh'
# ENTRYPOINT bash ./setup_and_run_remote.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/bash"]