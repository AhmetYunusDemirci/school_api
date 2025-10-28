class ApplicationController < ActionController::API
	include ExceptionHandler
	include JsonWebToken

	private

	def authenticate_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		raise ExceptionHandler::AuthenticationError, 'Missing token' unless header

		decoded = JsonWebToken.decode(header)
		@current_teacher = Teacher.find(decoded[:teacher_id])
	rescue ActiveRecord::RecordNotFound => e
		raise ExceptionHandler::AuthenticationError, e.message
	end

	def current_teacher
		@current_teacher
	end
end
