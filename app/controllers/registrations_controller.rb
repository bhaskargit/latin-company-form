class RegistrationsController < Devise::RegistrationsController
  def update
    role = params[:user][:role]
    params[:user] =  params[:user].reject { |h| params[:user].include? h['role'] }
     account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(params[:id])
    if @user.update_attributes(account_update_params)
      flash[:notice] = 'User details updated successfully'
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      @user.roles.clear
      @user.add_role role
      redirect_to (users_admin_path(@user.id))
    else
      flash[:notice] = "Password, password confirmation size should be > 4 and must match."
      redirect_to (edit_users_admin_path(@user.id))
    end
  end
end