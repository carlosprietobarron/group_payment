require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :name => "MyString",
      :description => "MyText",
      :price => "",
      :price => ""
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[name]"

      assert_select "textarea[name=?]", "transaction[description]"

      assert_select "input[name=?]", "transaction[price]"

      assert_select "input[name=?]", "transaction[price]"
    end
  end
end
