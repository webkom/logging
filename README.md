# logging

Run Fluentd inside a container, mount the /var/log directory and send logs to
Elasticsearch.

Mount a fluentd config file at `/etc/td-agent/td-agent.conf` or use the
default for container log collection.

## Environment Variables

* ELASTICSEARCH_HOSTS

## Docker Example
```bash
$ docker run -v '/var/log/:/var/log/' -e 'ELASTICSEARCH_HOSTS=https://username:password@elasticsearch.abakus.no' -d --restart=always -t abakus/logging:<version>
```
