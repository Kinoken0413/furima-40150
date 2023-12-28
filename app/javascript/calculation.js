function calculation (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () => {
    const itemPriceValue = parseFloat(itemPrice.value);

    if (isNaN(itemPriceValue)) {
      // 入力が数字でない場合、0を表示
      addTaxPrice.textContent = "0";
      profit.textContent = "0";
    } else {
      const taxPriceValue = Math.max(Math.floor(itemPriceValue * 0.1), 0);
      const profitValue = itemPriceValue - taxPriceValue;

      addTaxPrice.textContent = taxPriceValue.toLocaleString();
      profit.textContent = profitValue.toLocaleString();
    }
  });
};

window.addEventListener('turbo:load', calculation);
window.addEventListener('turbo:render', calculation);