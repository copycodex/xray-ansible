# Xray Ansible Setup

## 1. Покупаем сервер
Берём VPS (рекомендуется Ubuntu 22.04/24.04).

Проверяем, что открыты порты:
- `22` — SSH
- `80` — HTTP
- `443` — HTTPS

Добавляем 
---

## 2. Настраиваем домен
- Регистрируем бесплатный домен на [DuckDNS](https://www.duckdns.org/).
- Прописываем A-запись на IP вашего сервера  
  (например: `copycodex.duckdns.org → xx.xxx.xx.xx`).

---

## 3. Ставим Ansible себе на комп
```bash
sudo apt update && sudo apt install -y ansible
ansible --version
```

---

## 4. Создаём и заполняем .env `.env.example` → `.env`:
Заходим в корень проекта и делаем или просто копируем руками
```bash
cp .env.example .env
```
В .env вписываем:

- IP и данные root для первого входа
- данные нового пользователя (SSH порт, логин, ключ, sudo-пароль)
- домен (например: copycodex.duckdns.org)

Каждый раз перед использованием Ansible загружаем переменные:

```bash
set -a; source .env; set +a
```

5. Разворачиваем инфраструктуру

Вариант А — всё сразу. Полный цикл: bootstrap → traefik → xray:

```bash
make all
```

