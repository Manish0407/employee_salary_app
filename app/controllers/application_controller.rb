class ApplicationController < ActionController::Base
	# protect_from_forgery unless: -> { request.format.json? }
	protect_from_forgery with: :null_session

	def format_activerecord_errors(errors)
    result = []
    errors.each do |attribute, error|
      result << { attribute => error }
    end
    result
  end
end
