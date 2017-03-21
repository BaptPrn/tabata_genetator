class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :workout ]

  def home
  end
end
