window.addEventListener('load', function(){


// 価格の入力欄の要素を取得
const priceInput = document.getElementById('item-price');


// 販売手数料の表示欄の要素を取得
const taxPriceElement = document.getElementById('add-tax-price');

// 販売利益の表示欄の要素を取得
const profitElement = document.getElementById('profit');

// 価格の入力欄の値が変更されたときのイベントリスナーを設定
priceInput.addEventListener('input', calculateProfit);



function calculateProfit() {
  // 価格の入力値を取得
  const price = parseInt(priceInput.value, 10);

  // 販売手数料を計算 (価格の10%)
  const taxPrice = Math.floor(price * 0.1);

  // 販売利益を計算 (価格から販売手数料を引いた値)
  const profit = price - taxPrice;

  // 販売手数料を表示
  taxPriceElement.textContent = taxPrice.toLocaleString();

  // 販売利益を表示
  profitElement.textContent = profit.toLocaleString();
}
})

