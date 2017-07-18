module FormHelpers
  def fill_in_form(data, form, submit)
    within(form) do
      data.each do |fild, val|
        fill_in fild, :with => val
      end
    end

    first(submit).click
  end

  def sing_in user
    visit new_user_session_path

    filds = {'user_email' => user.email,'user_password' => user.password}
    fill_in_form filds, ".simple_form", 'button[type="submit"]'
  end
end
