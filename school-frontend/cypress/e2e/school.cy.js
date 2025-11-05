describe('School App', () => {
  it('can add a student', () => {
    cy.visit('http://localhost:3000/');


    cy.contains('Add Student').click();


    cy.get('input[placeholder="Student name"]').type('Test Öğrenci');
    


    cy.contains('Add Student').click();


    cy.contains('Test Öğrenci');
  });
});
