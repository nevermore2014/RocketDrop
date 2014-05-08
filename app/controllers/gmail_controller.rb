class GmailController < ApplicationController
  def index
    @gmail = Gmail.connect("slips@rocketdrop.com", "Rocketdrop123@")
    binding.pry
  end

  def show
  end

  def create
  end

  def destroy
  end
end
