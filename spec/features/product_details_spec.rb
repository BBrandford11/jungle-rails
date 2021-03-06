require 'rails_helper'

RSpec.feature "Product details", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "click on a product" do
    visit root_path

     # ACT
     puts page.html

     page.find(".product > header").click
    expect(page).to have_css('.products-show')

    save_screenshot

  end

end
