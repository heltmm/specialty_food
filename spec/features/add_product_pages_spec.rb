require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit new_product_path
    fill_in 'Name', :with => 'Paprika'
    fill_in 'Cost', :with => '40'
    fill_in 'Img', :with => 'http://lorempixel.com/300/300'
    fill_in 'Country of origin', :with => 'Mexico'
    click_on 'Create Product'
    expect(page).to have_content 'Paprika'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end

end
