# URL Shortener (Сервис сокращения ссылок)

Простой и эффективный микросервис для сокращения длинных URL-адресов.

## Клонорирование
```bash
   git clone git@github.com:romreign/URL-shortener.git
```

## Функциональность
- **Сокращение URL**: Преобразование длинных ссылок в короткие алиасы
- **Редирект**: Автоматическое перенаправление по коротким ссылкам
- **Автогенерация алиасов**: Автоматическое создание уникальных алиасов (6 символов)
- **Кастомные алиасы**: Возможность указать свой алиас для ссылки
- **Валидация URL**: Проверка корректности вводимых ссылок
- **Базовая аутентификация**: Защита API endpoints
- **Логирование**: Детальное логирование всех операций
- **SQLite хранилище**: Хранение данных

## Технологии
- **Язык**: Go 1.21+
- **Фреймворк**: Chi Router
- **База данных**: SQLite3
- **Валидация**: Go Playground Validator
- **Логирование**: slog
- **Конфигурация**: cleanenv
- **Тестирование**: testify, httpexpect


## API Endpoints
### Сокращение URL (POST /url)

```bash
curl -X POST http://localhost:8080/url \
  -H "Content-Type: application/json" \
  -u testuser:testpass \
  -d '{
    "url": "https://example.com/very-long-url",
    "alias": "my-alias"
  }'
```
response:
```json
{
    "status": "OK",
    "alias": "my-alias"
}
```
### Редирект по алиасу (GET /{alias})
```bash
curl -I http://localhost:8080/my-alias
```

## Использование
```bash
## Стандартная сборка (в bin/)
make build
```
```bash
# Запуск
make run
```
```bash
# Тесты
make test
```
```bash
# Очистка
make clean
```
```bash
# Кроссплатформенная сборка
make build-all
```
```bash
# Сборка только под Linux
make build-linux
```
