require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4), 
        image: open_asset('apparel1.jpg'),
        quantity: 10, 
        price: 64.99
      )
    end 
  end
  
  scenario "They add product to cart" do 
    visit root_path
    first("article.product").find('button', text: 'Add').hover.click
    
    visit '/cart'
    
    expect(page.find('a', text: 'My Cart (1)')).to be_present

  end



end
