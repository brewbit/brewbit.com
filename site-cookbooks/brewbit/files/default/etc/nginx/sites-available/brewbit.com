	upstream brewbit.com {
  # fail_timeout=0 means we always retry an upstream even if it failed
  # to return a good HTTP response (in case the Unicorn master nukes a
  # single worker for timing out).
  server unix:/tmp/brewbit.com.socket fail_timeout=0;
}

server {
  # if you're running multiple servers, instead of "default" you should
  # put your main domain name here
  listen 80 default;
  listen 443 ssl;

  ssl_certificate /etc/ssl/certs/brewbit.com.crt;
  ssl_certificate_key /etc/ssl/private/brewbit.com.key;

  # you could put a list of other domain names this application answers
  server_name brewbit.com;

  root /home/spree/brewbit.com/current/public;
  access_log /var/log/nginx/brewbit.com_access.log;
  rewrite_log on;

  location / {
    #all requests are sent to the UNIX socket
    proxy_pass http://brewbit.com;
    proxy_redirect off;

    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;

    client_max_body_size 10m;
    client_body_buffer_size 128k;

    proxy_connect_timeout 90;
    proxy_send_timeout 90;
    proxy_read_timeout 90;

    proxy_buffer_size 4k;
    proxy_buffers 4 32k;
    proxy_busy_buffers_size 64k;
    proxy_temp_file_write_size 64k;
  }

  # if the request is for a static resource, nginx should serve it directly
  # and add a far future expires header to it, making the browser
  # cache the resource and navigate faster over the website
  location ~ ^/(system|assets|spree)/  {
    root /var/www/brewbit.com/current/public;
    expires max;
    break;
  }
}