trap 'kill %1' SIGINT
bundle exec jekyll serve --config _config.yml,_config_dev.yml & sleep 5s; browser-sync start --proxy="127.0.0.1:4000" --files="_site/*.*"