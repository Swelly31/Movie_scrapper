class HomeController < ApplicationController

  def index
  end

  def show
    toto = StartScrap.new
    toto.perform
    toto.save
  end

  def result

    toto = StartScrap.new
    titi = toto.perform

    if Crypto.find_by(currency: params[:post][:name]).nil?
      @crypto = "Pas de résultat..."

    else
      @crypto = Crypto.find_by(currency: params[:post][:name]).price
    end
  end

end
