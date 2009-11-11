Factory.define(:user) do |u|
  u.sequence(:email) { |n| "john#{n}@doe.com" }
  u.password "testing"
  u.password_confirmation "testing"
  u.confirmed_at Time.now
end
