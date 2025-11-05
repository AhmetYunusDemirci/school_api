describe('Student List', () => {
  it('displays the added student in the list', () => {

    cy.visit('http://localhost:3000/');

    cy.contains('Test Öğrenci');
  });
});
