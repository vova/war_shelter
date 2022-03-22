class UpdateCountriesWithTumeZone < ActiveRecord::Migration[6.1]
  def change
    Country.all.map { |country| country.update(time_zone: ::TimeZoneHelper.country_time_zone(country)) }
  end
end
