class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    build_resource(registration_params)
    if resource.persisted?
      render json: {
        status: { code: 200,
                  message: 'Signed up successfully',
                  data: resource }
      }, status: :ok
    else
      render json: {
        status: {
          code: 500,
          message: 'User could not be Created successfully',
          error: resource.errors.full_messages
        }
      }, status: :unprocessable_entity
    end
  end

  def registration_params
    params.require(:user).permit(:email, :name, :password)
  end
end
