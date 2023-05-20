describe('Add to Cart', () => {
  it('should visit the home page', () => {
    cy.visit('/');
    // Add assertions or additional test steps as needed
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('should increase the cart count when adding a product', () => {
    // Get the initial cart count
    cy.get('.nav-link')
      .contains('My Cart')
      .then(($cartLink) => {
        const initialCount = parseInt($cartLink.text().match(/\d+/)[0], 10);
  
        // Click the 'Add' button for a product on the home page
        cy.get('article')
          .first()
          .find('.btn')
          .contains('Add') // Target the button by its text content
          .click({ force: true }); // Forcefully click the button
  
        // Wait for the page to load and navigate to the product detail page
        cy.wait(1000); // Adjust the delay as needed
  
        // Confirm that the cart count increases by one
        cy.get('.nav-link')
          .contains('My Cart')
          .should(($newCartLink) => {
            const newCount = parseInt($newCartLink.text().match(/\d+/)[0], 10);
            expect(newCount).to.eq(initialCount + 1);
          });
      });
  });
  
  
});