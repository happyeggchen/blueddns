blueddns
A ddns script in fish for cloudflare
========
# usage
  ./app.fish serve
  and if things work nice it will update your record each hour
# Things to do before hung up
 ```
 1.mofidy config file in "/etc/blueddns.conf"
 2.a systemd service in "/etc/systemd/system" like this
    [Unit]
    Description=blueddns
    After=network.target
    StartLimitIntervalSec=60s
    [Service]
    User=root
    WorkingDirectory=/root
    ExecStart=blueddns serve
    StandardOutput=syslog
    StandardError=syslog
    SyslogIdentifier=blueddns
    Restart=on-failure
    RestartSec=1
    [Install]
    WantedBy=multi-user.target
 3. modify the script file to meet your needs
 ```
