class StaticPagesController < ApplicationController
  def home
    @companies = Company.all
  end
end
