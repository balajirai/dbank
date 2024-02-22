import { dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener("load", async function(){
  // console.log("Finished Loading");
  update();
});

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();
  // console.log("Submitted");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);    // disable the submit button while topUp function is excecuting

  // To avoid error when input field is empty (for topUp)
  if (document.getElementById("input-amount").value.length != 0){
    await dbank_backend.topUp(inputAmount);
  }

  // To avoid error when input field is empty (for withdraw)
  if (document.getElementById("withdrawal-amount").value.length != 0){
    await dbank_backend.withdraw(outputAmount);
  }

  // compount interest 
  await dbank_backend.compound();

  // updated Balance
  update();

  document.getElementById("input-amount").value = "";   // setting the input field empty once submission is done

  button.removeAttribute("disabled");       // re-enable the submit button after topUp function is excecuted

});

async function update(){
  const currentAmount = await dbank_backend.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}