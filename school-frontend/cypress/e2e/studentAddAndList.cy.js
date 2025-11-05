describe('Student Add & List', () => {
  it('can add a student via frontend and check in the list', () => {

    cy.visit('http://localhost:3000/');


    cy.contains('Add Student').click();


    cy.get('input[placeholder="Student name"]').type('Test Öğrenci');
-

    cy.contains('Add Student').click();


    cy.contains('Test Öğrenci');
  });

  it('can add a student directly via API and check response', () => {
    cy.request('POST', 'http://localhost:3001/students', {
      name: 'API Öğrenci',
      email: 'api@ogrenci.com',
      age: 20
    }).then((res) => {
      expect(res.status).to.eq(201);
      expect(res.body.name).to.eq('API Öğrenci');
      expect(res.body.email).to.eq('api@ogrenci.com');
    });
  });

  it('checks if API-added student appears on frontend list', () => {
    cy.visit('http://localhost:3000/');
    cy.contains('API Öğrenci');
  });
});
