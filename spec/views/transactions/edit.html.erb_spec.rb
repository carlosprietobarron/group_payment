require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :name => "MyString",
      :description => "MyText",
      :price => "",
      :price => ""
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[name]"

      assert_select "textarea[name=?]", "transaction[description]"

      assert_select "input[name=?]", "transaction[price]"

      assert_select "input[name=?]", "transaction[price]"
    end
  end
end
