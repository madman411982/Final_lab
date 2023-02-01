FROM rabbitmq:3.10.7-management

# ADD definitions.json /etc/rabbitmq
ADD rabbitmq.conf /etc/rabbitmq
ADD docker_certs /etc/pki/tls/
ADD .erlang.cookie /var/lib/rabbitmq/
ADD --chown=rabbitmq .erlang.cookie /var/lib/rabbitmq/
RUN rabbitmq-plugins enable rabbitmq_auth_mechanism_ssl
RUN rabbitmq-plugins enable rabbitmq_shovel
RUN rabbitmq-plugins enable rabbitmq_shovel_management