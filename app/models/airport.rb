class Airport < ApplicationRecord
  has_many :flights

  def self.truncated_codes(length)
    all.map { |airport| "#{airport.code}: #{airport.name.truncate length }"}
  end

  def to_s
    code
  end
  
  AIRPORT_LIST = [
      ["Vancouver International Airport","YVR"],
      ["Toronto Pearson International Airport","YYZ"],
      ["Halifax Stanfield International Airport","YHZ"],
      ["Montreal Pierre Elliott Trudeau International Airport","YUL"],
      ["Ottawa McDonald-Cartier International Airport","YOW"],
      ["Calgary International Airport","YYC"],
      ["Winnipeg James Armstrong Richardson International Airport","YWG"],
      ["Victoria International Airport","YYJ"],
      ["St. John’s International Airport","YYT"],
      ["Edmonton International Airport","YEG"],
      ["Montreal Saint-Hubert Airport","YHU"],
      ["Boundary Bay Airport","YDT"],
      ["Quebec City Jean Lesage International Airport","YQB"],
      ["Billy Bishop Toronto City Airport","YTZ"],
      ["Gander International Airport","YQX"],
      ["Greater Moncton Romeo LeBlanc International Airport","YQM"],
      ["Regina International Airport","YQR"],
      ["London International Airport","YXU"]
    ]
end
