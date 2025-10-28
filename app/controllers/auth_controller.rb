class AuthController < ApplicationController
  # POST /auth/login
  def login
    @teacher = Teacher.find_by(email: params[:email])
    if @teacher&.authenticate(params[:password])
      token = JsonWebToken.encode(teacher_id: @teacher.id)
      render json: { token: token, teacher: @teacher }, status: :created
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
