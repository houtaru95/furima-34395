function chargeCalc() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const chargeRate = 0.1
    const chargeCost = parseInt(inputValue * chargeRate)
    const getProfit = document.getElementById("profit")
    const itemProfit = inputValue - chargeCost
    addTaxDom.innerHTML = `${chargeCost}`
    getProfit.innerHTML = `${itemProfit}`
  });
};

window.addEventListener('load', chargeCalc)