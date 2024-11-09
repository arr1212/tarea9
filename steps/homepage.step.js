const { Given, When, Then, Before, After, setDefaultTimeout } = require("@cucumber/cucumber");

const { chromium, expect } = require("@playwright/test");

const { Page } = require("playwright");

setDefaultTimeout(60 * 1000);

let page, browser;

Before(async function () {

browser = await chromium.launch({ headless: false });

const context = await browser.newContext();

page = await context.newPage();

});

Given('cuando el usuario entra a esta pagina de login {string}', async function (url) {
  // Navegar a la página de login
  await page.goto(url);
});

When('el usuario ingresa {string} en el campo {string}', async function (valor, campoId) {
  // Completar el campo especificado con el valor proporcionado
  // Si el valor es "vacío", dejamos el campo en blanco
  if (valor === "vacío") {
    await page.fill(`#${campoId}`, '');
  } else {
    await page.fill(`#${campoId}`, valor);
  }
});

When('el usuario ingresa vacío en el campo {string}', async function (cd) {
  // Completar el campo especificado con el valor proporcionado
  // Si el valor es "vacío", dejamos el campo en blanco
    await page.fill(`#${cd}`, '');
});

When('el usuario hace click en el botón {string}', async function (textoBoton) {
  // Hacer clic en el botón que contiene el texto especificado
  await page.click(`button:has-text("${textoBoton}")`);
});

Then('debería redireccionar a la pagina {string}', async function (urlEsperada) {
  // Verificar que la URL actual sea la esperada
  await expect(page).toHaveURL(urlEsperada);
});

Then('Verificar que la página nueva contenga el texto esperado {string}', async function (mensaje) {
  // Verificar que el mensaje esperado esté presente en el elemento con id "estado"
  //await expect(page.locator('body')).toContainText(mensaje);
  const componente = await page.locator('h3');
  await expect(componente).toHaveText(mensaje);
});

Then('debería ver el mensaje {string}', async function (mensajeEsperado) {
  // Verificar que el mensaje esperado esté presente en el elemento con id "estado"
  const estado = await page.locator('#estado');
  await expect(estado).toHaveText(mensajeEsperado);
});

After(async function () {

await browser.close();

})