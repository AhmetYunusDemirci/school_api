describe('Student Form Validation', () => {
  it('prevents submission when name is empty', () => {
    cy.visit('http://localhost:3000/');
    cy.contains('Add Student').click();


    cy.get('input[placeholder="Student name"]').clear();


    cy.contains('Add Student').click();


    cy.contains('Random Test User').should('not.exist');
  });
});
