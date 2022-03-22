# frozen_string_literal: true

# Helper retrives time zone in format 'UTC + 02.00' from Time.zone
module TimeZoneHelper
  def self.country_time_zone(country)
    region = TZInfo::Country.get(country[:code].to_s.upcase).zone_identifiers
    utc_time = Time.now.in_time_zone(region.first).formatted_offset
    "UTC #{utc_time}"
  end
end
