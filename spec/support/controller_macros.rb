module ControllerMacros
def login_user
    before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.confirm! #only if account is confirmable
    sign_in user
    end
end
end