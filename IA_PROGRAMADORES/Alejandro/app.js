'use strict';

const { spawn } = require('node:child_process');
const path = require('node:path');

const projectDir = path.join(__dirname, 'gemini-cli-app');

const env = { ...process.env };

if (!env.GEMINI_API_KEY) {
  console.error('❌ No se encontró GEMINI_API_KEY.');
  console.error('Ejecuta esto antes de correr el programa:');
  console.error('  $env:GEMINI_API_KEY="TU_API_KEY"');
  process.exit(1);
}

const child = spawn(process.execPath, ['app.js'], {
  cwd: projectDir,
  env,
  stdio: 'inherit',
});

child.on('exit', (code) => {
  process.exit(code ?? 0);
});

child.on('error', (err) => {
  console.error('Error al iniciar la app:', err.message);
  process.exit(1);
});
