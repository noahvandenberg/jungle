require 'rails_helper'

RSpec.feature "Visitor navigates to product page page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click on a product" do
    visit products_path

    within first('article.product') do
      within first('footer.actions') do    
        first('button').click
      end
    end

    sleep 5

    save_screenshot
  end

end