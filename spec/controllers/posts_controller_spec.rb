require 'rails_helper'

FactoryBot.define do
    factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "user#{n}" }
    sequence(:password) { |n| "1233456#{n}" }
    sequence(:password_confirmation) { |n| "1233456#{n}" }
    # password_confirmation '123456'
    # confirmed_at Date.today
    end
end

RSpec.describe PostsController, type: :controller do
  describe 'Post controller request specs' do
    login_user

    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end
  end

end
