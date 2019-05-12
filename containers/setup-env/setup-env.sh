#!/bin/sh
VENDOR_DIR="vendor"
ENV_FILE=".env"
if [ ! -d "$VENDOR_DIR" ]; then
  echo "Initializing dependencies: composer install"
  composer install

  echo "Initializing autoload: composer dump-autoload"
  composer dump-autoload

  if [ ! -f "$ENV_FILE" ]; then
    echo "Initializing $ENV_FILE file"
    cp ".env.example" "$ENV_FILE"
  fi
  
  echo "Updating $ENV_FILE"
  sed -i -e '/DB_HOST=/s/=.*/=wt03-db/' "$ENV_FILE"
  sed -i -e '/DB_DATABASE=/s/=.*/=wt03-dashboard/' "$ENV_FILE"
  sed -i -e '/DB_USERNAME=/s/=.*/=wt03-dashboard/' "$ENV_FILE"
  sed -i -e '/DB_PASSWORD=/s/=.*/=wt03-dashboard/' "$ENV_FILE"

  echo "Initializing key: php artisan key:generate"
  php artisan key:generate

  echo "Initializing database: php artisan migrate"
  php artisan migrate --force
fi

echo "Clearing caches: php artisan cache:clear"
php artisan cache:clear

echo "Caching config: php artisan config:cache"
php artisan config:cache
