FROM qfortier/poetry as base

RUN poetry self update

WORKDIR /server

COPY poetry.lock pyproject.toml ./

RUN poetry install --no-root

FROM base as mtgscan

ENV PYTHONUNBUFFERED=1

COPY . .

EXPOSE 5000

RUN poetry env use 3.10

CMD ["poetry", "run", "python", "app.py"]
