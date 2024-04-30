require 'rails_helper'

RSpec.describe "home/index", type: :view do
  it 'renders the page' do
    render
    expect(rendered).to include('Create Room')
  end
end
