describe('Home Page', () => {
  it('should visit the home page', () => {
    cy.visit('/');
    // Add assertions or additional test steps as needed
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

});