import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("the user is on the bank transfer page", () => {
  cy.visit("/bank_transfer");
});

Given("the user is connected as {string}", (user) => {
  cy.get('input[name="user"]').type(user);
});

Given("the user enter the beneficiary name with {string}", (name) => {
  cy.get('input[name="beneficiaryName"]').type(name);
});

Given("the user enter the IBAN with {string}", (iban) => {
  cy.get('input[name="iban"]').type(iban);
});

Given("the user enter the label with {string}", (label) => {
  cy.get('input[name="label"]').type(label);
});

Given("the user enter the amount with {string}", (amount) => {
  cy.get('input[name="amount"]').type(amount);
});

Given("the user select the transfer mode {string}", (transferMode) => {
  cy.get('select[name="transfer_mode"]').select(transferMode);
});

Given("the user select the transfer date {string}", (transferDate) => {
  if (transferDate !== "empty") {
    cy.get('input[name="transfer_date"]').type(transferDate);
  }
});

When("the user clicks the transfer button", () => {
  cy.get('button[type="submit"]').click();
});

Then("the user should see the message {string}", (resultMessage) => {
  cy.contains(resultMessage).should("be.visible");
});
