require 'yaml'

module UsStatesData
  STATES = YAML.load_file(File.join(__dir__, 'us_states_data.yml'))

  def self.states
    STATES.keys
  end

  def self.counties_for_state(state_name)
    STATES[state_name.capitalize]["counties"]
  end

  def self.zip_codes_for_state(state_name)
    STATES[state_name.capitalize]["zip_codes"]
  end

  def self.is_county_in_state?(state_name, county_name)
    state = STATES[state_name.capitalize]
    if state.nil?
      raise ArgumentError, "State '#{state_name}' not found."
    elsif state["counties"].map(&:downcase).include?(county_name.downcase)
      return true
    else
      raise ArgumentError, "County '#{county_name}' not found in state '#{state_name}'."
      return false
    end
  end


  def self.is_zip_code_in_state?(zip_code, state_name)
    unless STATES[state_name.capitalize]
      raise ArgumentError, "State '#{state_name}' not found."
    end

    if !valid_zip_code?(zip_code)
      raise ArgumentError, "Invalid zip code format."
    elsif STATES[state_name.capitalize]["zip_codes"].include?(zip_code.to_s)
      return true
    else
      raise ArgumentError, "Zip code '#{zip_code}' not found in state '#{state_name}'."
      return false
    end
  end

  def self.valid_zip_code?(zip_code)
    zip_code.to_s.match?(/\A\d{5}\z/)
  end

  def self.states_from_region(region_name)
    region_name_downcase = region_name.downcase
    matching_states = STATES.select { |_, data| data["region"].casecmp(region_name_downcase).zero? }.keys
    if matching_states.empty?
      available_regions = STATES.values.map { |data| data["region"] }.uniq.join(", ")
      raise "Region '#{region_name}' doesn't exist. Available regions are: #{available_regions}"
    else
      matching_states
    end
  end

  def self.states_from_division(division_name)
    division_name_downcase = division_name.downcase
    matching_states = STATES.select { |_, data| data["division"].casecmp(division_name_downcase).zero? }.keys
    if matching_states.empty?
      available_divisions = STATES.values.map { |data| data["division"] }.uniq.join(", ")
      raise "Division '#{division_name}' doesn't exist. Available divisions are: #{available_divisions}"
    else
      matching_states
    end
  end

  def self.sort_by_region
    STATES.keys.sort_by { |state| STATES[state]["region"].downcase }
  end

  def self.sort_by_division
    STATES.keys.sort_by { |state| STATES[state]["division"].downcase }
  end
end
