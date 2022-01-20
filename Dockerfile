FROM debian
ARG domain example.com


ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y postfix dovecot-core dovecot-pop3d rsyslog


ADD postfix /etc/postfix/
ADD dovecot /etc/dovecot/
ADD users /users/


RUN sed -i "s/CHANGEME_DOMAIN/$domain/" /etc/postfix/main.cf
RUN sed -i "s/CHANGEME_DOMAIN/$domain/" /etc/postfix/master.cf
RUN postmap /etc/postfix/sasl_passwd

RUN while read user; do useradd -m $user; sed -i "s/$user//" /etc/shadow; done < users/list
RUN cat /users/shadow >> /etc/shadow


ADD daemon /daemon
CMD /daemon
