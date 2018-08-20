class ApplicationController < ActionController::Base
	include UrlHelper
	protect_from_forgery with: :exception


end
