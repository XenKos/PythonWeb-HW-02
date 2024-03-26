FROM python:3.12.1

# Переміщення у робочий каталог контейнера
WORKDIR /app

# Копіювання файлу pyproject.toml в контейнер
COPY pyproject.toml .

# Встановлення Poetry та виконання команди install для встановлення залежностей
ENV PATH="/root/.local/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python - && \
    poetry install --no-root --no-interaction

# Копіювання всіх файлів з проекту в контейнер
COPY . .

# Команда для запуску додатку
CMD ["poetry", "run", "python", "HW.py", "classes.py"]
