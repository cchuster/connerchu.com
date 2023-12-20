job "connerchu.com" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "connerchu.com" {
    count = 2

    network {
      port "http" {
        to = 8000
      }
    }

    task "webserver" {
      driver = "docker"

      env {
        // Hack to force Nomad to re-deploy the service
        // instead of ignoring it
        COMMIT_SHA = "${DRONE_COMMIT_SHA}"
      }

      config {
        image   = "gitea.elara.ws/elara6331/webserver:latest"
        ports   = ["http"]
        volumes = ["local/site/public:/html:ro"]
      }

      artifact {
        source      = "https://api.minio.elara.ws/connerchu.com/site.tar.gz"
        destination = "local/site"
      }

      service {
        name = "connerchu.com"
        port = "http"

        tags = [
          "traefik.enable=true",

          "traefik.http.middlewares.connerchu-redir.redirectRegex.regex=^https://connerchu\\.com",
          "traefik.http.middlewares.connerchu-redir.redirectRegex.replacement=https://www.connerchu.com",
          "traefik.http.middlewares.connerchu-redir.redirectRegex.permanent=true",

          "traefik.http.routers.connerchu.rule=Host(`connerchu.com`) || Host(`www.connerchu.com`)",
          "traefik.http.routers.connerchu.middlewares=site-redir",
          "traefik.http.routers.connerchu.tls.certResolver=letsencrypt",
        ]
      }
    }
  }
}

