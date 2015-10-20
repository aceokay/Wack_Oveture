FactoryGirl.define do
  factory(:user) do
    name('Sam')
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password("cheese")
  end
end
