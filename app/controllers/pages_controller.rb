class PagesController < ApplicationController
  def index
  	redirect_to books_path if signed_in?
  end
end