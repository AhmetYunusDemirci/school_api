const { Given, When, Then } = require("@badeball/cypress-cucumber-preprocessor");

Given("I am on the homepage", () => {
  cy.visit("http://localhost:3000/");
});

When("I add a new student named {string}", (studentName) => {
  cy.get('input[placeholder="Student name"]').clear().type(studentName);
  cy.contains("Add Student").click();
});

Then("I should see {string} in the student list", (studentName) => {
  cy.contains(studentName).should("exist");
});
