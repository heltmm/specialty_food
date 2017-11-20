require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do

    Product.create!(name: "Paprika", cost: 40, img: "http://lorempixel.com/300/300", country_of_origin: "mexico")
    visit products_path
    click_on "Edit"
    fill_in 'Name' , :with => 'Allspice'
    click_on 'Update Product'

    expect(page).to have_content 'Allspice'
  end

  it "gives error when no name is entered" do
    Product.create!(name: "Paprika", cost: 40, img: "http://lorempixel.com/300/300", country_of_origin: "mexico")
    visit products_path
    click_on "Edit"
    fill_in 'Name' , :with => ''
    click_on 'Update Product'

    expect(page).to have_content 'errors'
  end

end
