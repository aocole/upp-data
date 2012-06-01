class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def convert_date(hash, date_symbol_or_string)
    attribute = date_symbol_or_string.to_s
    return DateTime.civil(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i, hash[attribute + '(4i)'].to_i, hash[attribute + '(5i)'].to_i)
  end
end
