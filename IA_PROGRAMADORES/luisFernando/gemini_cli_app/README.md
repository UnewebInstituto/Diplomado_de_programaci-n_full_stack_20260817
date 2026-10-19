# Gemini CLI App

Aplicación en Node.js para consultar Google Gemini desde la consola.

## Requisitos

- Node.js 18 o superior
- Una API key válida de Google Gemini

## Instalación

```bash
npm install
```

## Configurar la API key

En Windows, desde Command Prompt:

```cmd
set GEMINI_API_KEY=tu_clave_aqui
node app.js
```

También puedes copiar `.env.example` a `.env` y cargarlo con tu entorno de desarrollo si lo prefieres.

## Uso

Ejecuta:

```bash
npm start
```

Luego escribe preguntas en la consola. Escribe `salir` para terminar.

El proyecto usa el modelo `gemini-3.5-flash-lite`, que es el modelo solicitado para la aplicación.
