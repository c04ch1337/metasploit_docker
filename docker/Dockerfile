FROM kalilinux/kali-rolling

LABEL maintainer="C04CH"

RUN apt-get update && \
    apt-get install -y metasploit-framework curl git nmap python3 \
    && apt-get clean

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
