CountrySelect::FORMATS[:with_alpha2] = lambda do |country|
    "#{country.name} (#{country.alpha2})"
  end
  
  # Return an array to customize <option> text, `value` and other HTML attributes
  CountrySelect::FORMATS[:with_data_attrs] = lambda do |country|
    [
      country.name,
      country.alpha2,
      {
        'data-country-code' => country.country_code,
        'data-alpha3' => country.alpha3
      }
    ]
  end