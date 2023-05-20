describe('Product Details', () => {
  it('should visit the home page', () => {
    cy.visit('/');
    // Add assertions or additional test steps as needed
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('should navigate to the product detail page when clicking on a product', () => {
    cy.get('article').first().find('a').click();
    cy.url().should('include', '/products/');
  });

  
});