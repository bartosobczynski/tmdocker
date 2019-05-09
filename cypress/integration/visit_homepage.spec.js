describe('Visit homepage', function() {
    it('Contains "Yay! You’re on Rails!"', function() {
        cy.visit('http://0.0.0.0:3900')
        cy.get('h1').contains('Yay! You’re on Rails!')
    })
})