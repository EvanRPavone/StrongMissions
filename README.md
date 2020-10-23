# README

This application/website is used to plan a trip for strong missions, the strong missions admin can view the trip and contact the user who planned the trip via email with more information regarding their trip. The user can log in and see their own planned trips but they cannot see anyone elses trip unless they are admin.

# INSTALLATION

1. run `bundle install` in your terminal

2. after bundle, run `rake db:migrate`
    - If your get an error like, "error Couldn't find an integrity file", run this in your terminal, 'yarn install --check-files', then do rake db:migrate.

3. If you are using a localhost, run `rails s` and open your browser and type `localhost:3000` and you should open up the website home page.
    - sometimes running 'rails s' will give you some errors, just rerun it until it doesn't, usually the second time works

4. Enjoy

# HOW TO USE ADMIN PANEL

1. Click "Sign up" in the navigation bar and make an account.

2. In ability.rb in your models foler, add this line of code and refresh the page. This will let any user access the admin panel.

    `user ||= User.new # guest user (not logged in)
    can :manage, :all <-------- ADD THIS!!
    if user.superadmin_role?
        (...)
    end`

3. To add yourself to the admin role in the admin panel
    - Click Admin Panel in the navigation bar, make sure you are logged in, and then click users.
    - You should see the email you used, on the right hand side of the table where all the users show, click edit and click the checkbox for superadmin role.
    - Make sure you save at the bottom of the page.

4. With the superadmin role, you can access every users trip information and create, read, update, and delete trips and users.
    - This is where an admin can see a users planned trip and reach out to them to give them more information.

5. Once you have added your superadmin role, you can go back to ability.rb and remove the line you added.
    - This gives admin panel to all users, since you added the superadmin role to your user you can remove that line and you will still have access to that admin panel.

# AUTHOR INFORMATION

Created By: Evan Pavone, https://github.com/EvanRPavone
