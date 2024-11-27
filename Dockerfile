# Используем официальный образ Drupal
FROM drupal:9.5-apache

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    sqlite3 git unzip && \
    rm -rf /var/lib/apt/lists/*

# Указываем рабочую директорию
WORKDIR /var/www/html

# Настраиваем SQLite как базу данных по умолчанию
RUN echo '<?php\n$databases["default"]["default"] = [\n"type" => "sqlite",\n"database" => "/var/www/html/sites/default/files/.ht.sqlite",\n];\n$settings["hash_salt"] = "demo_salt";' > /var/www/html/sites/default/settings.php