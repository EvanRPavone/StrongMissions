class AddAnotherSuperadmin < ActiveRecord::Migration[6.0]
  def change
    User.create! do |u|
      u.email     = 'evanrpavone@test.com'
      u.password  = 'password'
      u.superadmin_role = true
    end
  end
end
