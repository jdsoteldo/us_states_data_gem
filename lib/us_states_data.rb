require 'yaml'

module UsStatesData
  STATES = YAML.load_file(File.join(__dir__, 'us_states_data.yml'))

  def self.counties_for_state(state_name)
    STATES[state_name]["counties"]
  end

  def self.is_county_in_state?(state_name, county_name)
    STATES[state_name]["counties"].include?(county_name)
  end

  def self.zip_codes_for_state(state_name)
    STATES[state_name]["zip_codes"]
  end

  def self.valid_zip_code?(zip_code)
    zip_code.match?(/\A\d{5}\z/)
  end
end

