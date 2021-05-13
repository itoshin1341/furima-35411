const { clearCache } = require("turbolinks");

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const addProfit = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(priceInput.value * 0.1));
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = (Math.floor(priceInput.value - addTaxDom.innerHTML));
  });
});

