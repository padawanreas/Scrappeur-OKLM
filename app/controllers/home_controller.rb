class HomeController < ApplicationController
  def index

    CryptoDb.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('crypto_dbs')
    @crypto_scrap = StartScrap.new
    @crypto_scrap.perform
    @crypto_scrap.save
    @crypto_database = CryptoDb.all
    @crypto_database_name = CryptoDb.all.pluck(:money)
    @name_from_form = params[:crypto]
  end
end
