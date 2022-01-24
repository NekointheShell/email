FROM debian
ARG domain example.com
ARG sendgrid fail


ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y postfix dovecot-core dovecot-pop3d rsyslog


ADD postfix /etc/postfix/
ADD dovecot /etc/dovecot/


ADD daemon /daemon
CMD /daemon
