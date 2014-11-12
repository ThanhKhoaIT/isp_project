class City < ActiveRecord::Base  
  COUNTRIES = [["Afghanistan", "AF"], ["Albania", "AL"], ["Algeria", "DZ"], ["Andorra", "AD"], ["Angola", "AO"], ["Antigua and Barbuda", "AG"], ["Argentina", "AR"], ["Armenia", "AM"], ["Australia", "AU"], ["Austria", "AT"], ["Azerbaijan", "AZ"], ["Bahamas", "BS"], ["Bahrain", "BH"], ["Bangladesh", "BD"], ["Barbados", "BB"], ["Belarus", "BY"], ["Belgium", "BE"], ["Belize", "BZ"], ["Benin", "BJ"], ["Bhutan", "BT"], ["Bolivia", "BO"], ["Bosnia and Herz.", "BA"], ["Botswana", "BW"], ["Brazil", "BR"], ["Brunei", "BN"], ["Bulgaria", "BG"], ["Burkina Faso", "BF"], ["Burundi", "BI"], ["Cambodia", "KH"], ["Cameroon", "CM"], ["Canada", "CA"], ["Cape Verde", "CV"], ["Central African Rep.", "CF"], ["Chad", "TD"], ["Chile", "CL"], ["China", "CN"], ["Colombia", "CO"], ["Comoros", "KM"], ["Congo, The Democr. Rep. of the", "CD"], ["Costa Rica", "CR"], ["Cote d'Ivoire", "CI"], ["Croatia", "HR"], ["Cuba", "CU"], ["Cyprus", "CY"], ["Czech Republic", "CZ"], ["Denmark", "DK"], ["Djibouti", "DJ"], ["Dominica", "DM"], ["Dominican Republic", "DO"], ["East Timor", "TP"], ["Ecuador", "EC"], ["Egypt", "EG"], ["El Salvador", "SV"], ["Equatorial Guinea", "GQ"], ["Eritrea", "ER"], ["Estonia", "EE"], ["Ethiopia", "ET"], ["Fiji", "FJ"], ["Finland", "FI"], ["France", "FR"], ["French Polynesia", "PF"], ["Gabon", "GA"], ["Gambia, The", "GM"], ["Georgia", "GE"], ["Germany", "DE"], ["Ghana", "GH"], ["Gibraltar", "GI"], ["Greece", "GR"], ["Greenland", "GL"], ["Grenada", "GD"], ["Guadeloupe", "GP"], ["Guatemala", "GT"], ["Guinea", "GN"], ["Guinea-Bissau", "GW"], ["Guyana", "GY"], ["Haiti", "HT"], ["Honduras", "HN"], ["Hong Kong SAR", "HK"], ["Hungary", "HU"], ["Iceland", "IS"], ["India", "IN"], ["Indonesia", "ID"], ["Iran", "IR"], ["Iraq", "IQ"], ["Ireland", "IE"], ["Israel", "IL"], ["Italy", "IT"], ["Jamaica", "JM"], ["Japan", "JP"], ["Jordan", "JO"], ["Kazakhstan", "KZ"], ["Kenya", "KE"], ["Kiribati", "KI"], ["Korea, North", "KP"], ["Korea, South", "KR"], ["Kuwait", "KW"], ["Kyrgyzstan", "KG"], ["Laos", "LA"], ["Latvia", "LV"], ["Lebanon", "LB"], ["Lesotho", "LS"], ["Liberia", "LR"], ["Libya", "LY"], ["Liechtenstein", "LI"], ["Lithuania", "LT"], ["Luxembourg", "LU"], ["Macau SAR", "MO"], ["Macedonia", "MK"], ["Madagascar", "MG"], ["Malawi", "MW"], ["Malaysia", "MY"], ["Maldives", "MV"], ["Mali", "ML"], ["Malta", "MT"], ["Marshall Islands", "MH"], ["Martinique", "MQ"], ["Mauritania", "MR"], ["Mauritius", "MU"], ["Mexico", "MX"], ["Micronesia, Fed. States of", "FM"], ["Moldova", "MD"], ["Monaco", "MC"], ["Mongolia", "MN"], ["Montenegro", "ME"], ["Morocco", "MA"], ["Mozambique", "MZ"], ["Myanmar", "MM"], ["Namibia", "NA"], ["Nauru", "NR"], ["Nepal", "NP"], ["Netherlands", "NL"], ["New Caledonia", "NC"], ["New Zealand", "NZ"], ["Nicaragua", "NI"], ["Niger", "NE"], ["Nigeria", "NG"], ["Northern Mariana Islands", "MP"], ["Norway", "NO"], ["Oman", "OM"], ["Pakistan", "PK"], ["Palau", "PW"], ["Palestinian Territories", "PS"], ["Panama", "PA"], ["Papua New Guinea", "PG"], ["Paraguay", "PY"], ["Peru", "PE"], ["Philippines", "PH"], ["Poland", "PL"], ["Portugal", "PT"], ["Puerto Rico", "PR"], ["Qatar", "QA"], ["Runion", "RE"], ["Romania", "RO"], ["Russian Federation", "RU"], ["Rwanda", "RW"], ["Saint Kitts and Nevis", "KN"], ["Saint Lucia", "LC"], ["Samoa", "WS"], ["San Marino", "SM"], ["Sao Tome and Princ.", "ST"], ["Saudi Arabia", "SA"], ["Senegal", "SN"], ["Serbia", "RS"], ["Seychelles", "SC"], ["Sierra Leone", "SL"], ["Singapore", "SG"], ["Slovakia", "SK"], ["Slovenia", "SI"], ["Solomon Islands", "SB"], ["Somalia", "SO"], ["South Africa", "ZA"], ["Spain", "ES"], ["Sri Lanka", "LK"], ["St Vincent and Gren.", "VC"], ["Sudan", "SD"], ["Suriname", "SR"], ["Swaziland", "SZ"], ["Sweden", "SE"], ["Switzerland", "CH"], ["Syria", "SY"], ["Taiwan", "TW"], ["Tajikistan", "TJ"], ["Tanzania", "TZ"], ["Thailand", "TH"], ["Togo", "TG"], ["Tonga", "TO"], ["Trinidad and Tobago", "TT"], ["Tunisia", "TN"], ["Turkey", "TR"], ["Turkmenistan", "TM"], ["Tuvalu", "TV"], ["Uganda", "UG"], ["Ukraine", "UA"], ["United Arab Emirates", "AE"], ["United Kingdom", "GB"], ["United States", "US"], ["Uruguay", "UY"], ["Uzbekistan", "UZ"], ["Vanuatu", "VU"], ["Vatican City", "VA"], ["Venezuela", "VE"], ["Vietnam", "VN"], ["Virgin Islands, British", "VG"], ["Virgin Islands, U.S.", "VI"], ["Western Sahara", "EH"], ["Yemen", "YE"], ["Zambia", "ZM"], ["Zimbabwe", "ZW"]]
  
  has_many :flights_in, class_name: "Flight", foreign_key: "city_to_id"
  has_many :flights_out, class_name: "Flight", foreign_key: "city_from_id"
  
  has_and_belongs_to_many :packages
  
  def cities_allow_to
    self.flights_out.collect{|f| f.to_city.to_json }
  end
  
  def to_json
    return {
      id: self.id,
      name: self.name,
      position: {
        x: self.position_x,
        y: self.position_y
      },
      country_name: self.country_name
    }
  end

end
