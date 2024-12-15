let slider = document.querySelector('input');
let valuePlace = document.querySelector('p');
console.log(slider);
console.log(valuePlace);
valuePlace.textContent = slider.vale;

slider.addEventListener('change', (event) => {
  console.log(slider.value);
  valuePlace.textContent = slider.vale;
});
