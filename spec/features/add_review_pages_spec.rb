require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do

    User.create!(email: "test@gmail.com", password: "password")
    Product.create!(name: "Paprika", cost: 40, img: "http://lorempixel.com/300/300", country_of_origin: "mexico")
    Review.create!(user_id: 1, product_id: 1, content_body: "jjjdddsssfffddssjdjdksjdjfkdjdkfjdkdfjdkfkdjkfdjfkdjfkdjfkdjkkdkdkdkdkdkkkkkk", rating: 5)

    # sign in to add review
    visit new_user_session_path
    fill_in 'Email', :with => 'test@gmail.com'
    fill_in 'Password', :with => 'password'
    within(".actions") do
      click_on 'Log in'
    end
    first('.row').click_on('View')
    click_on "Add a review"
    fill_in 'Content body' , :with => 'This is the best spice ever I love it, aboslutely delicious.  Will buy again.'
    select('5', :from => 'Rating')
    click_on 'Create Review'

    expect(page).to have_content 'This is the best spice ever I love it, aboslutely delicious.  Will buy again.'
  end

  # it "gives error when no name is entered" do
  #   visit new_product_path
  #   click_on 'Create Product'
  #   expect(page).to have_content 'errors'
  # end

end
