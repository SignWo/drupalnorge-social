composer --verbose install --no-dev
cd $TRAVIS_BUILD_DIR/html
chmod -R 777 sites/default
touch sites/default/settings.local.php
./../vendor/bin/drush site-install social --verbose --yes --db-url=mysql://root@127.0.0.1/test
./../vendor/bin/drush sql-cli < ../sanitized.db
cd $TRAVIS_BUILD_DIR
composer build
composer build
cd html
./../vendor/bin/drush cr
./../vendor/bin/drush runserver http://127.0.0.1:8888 &
sleep 3
cd $TRAVIS_BUILD_DIR
composer install
