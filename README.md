# UsStatesData
UsStatesData is a Ruby gem designed to simplify working with US state data. Whether you're building a geographic application, conducting data analysis, or enhancing your project with location-based features, UsStatesData provides a comprehensive set of methods to streamline your workflow.

Features
State Information: Retrieve detailed information about US states, including lists of counties and zip codes.
Zip Code Validation: Validate zip codes to ensure data accuracy and reliability.
Installation
Add this line to your Gemfile and run bundle install:
`gem 'us_states_data'`

Or install it directly using:
`gem install us_states_data`

### Usage
After bundling add this line to your ruby file
`require 'us_states_data'`

List of methods:
- Retrieve a list of states
- Retrieve state's information (abbreviation, counties, region, division, and, zip codes)
- Retrieve state abbreviation
- Retrieve a list of counties for a specific state
- Retrieve a list of zipcodes for a specific state
- Sort states by region
- Sort states by division
- Retrieve state from specific region
- Retrieve state from division
- Check for a county within a specific state
- Check for a zipcode within a specific state

  
### Retrieve a list of states
```
states = UsStatesData.states
puts "States: #{states}"
```
This will return an array of every state. 

### Retrieve state's information
```
ohio = UsStatesData.state_information('Ohio')
```
This will return a Hash with the state's abbreviation, zipcodes, region, division, and county.

### Retrieve state abbreviation
```
delaware_abbreviation = UsStatesData.state_abbreviation('Delaware')
=> 'DE'
```

### Retrieve counties for a specific state
```
counties = UsStatesData.counties_for_state('Texas')
puts "Counties in Texas: #{counties}"
```
This will return an array of every county in the state of Texas, the county name to be passed as an argument can is not case-sensitive so 'State, 'state, 'sTATe' will all be accepted arguments as long as the state exists.


### Retrieve zip codes for a specific state
```
zip_codes = UsStatesData.zip_codes_for_state('California')
puts "Zip codes in California: #{zip_codes}"
```
This will return an array of every zip code in the state, again, the argument is not case-sensitive. 


### Sort states by region
```
UsStatesData.sort_by_region
```

### Sort states by division
```
UsStatesData.sort_by_division
```

The previous two methods don't require any arguments and will just return an array with the states sorted by the region i.e: South, Midwest. And by the division, i.e: New England, Mountain.

If you would like to fetch the states from a specific region, you can use the following method:
```
UsStatesData.states_from_region("South")
=> ["Alabama",
 "Arkansas",
 "Delaware",
 "District of Columbia",
 "Florida",
...]
```
In the scenario of using a non-existing region, you will trigger the following error: `Region 'foo' doesn't exist. Available regions are: South, West, Northeast, Midwest`

The usage for sorting by division is the same as above;
```
UsStatesData.states_from_division("New England")
=> ["Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"]
```
In the case of sending a non-existing division you will trigger the following message; `Division 'test' doesn't exist. Available divisions are: East South Central, Pacific, Mountain, West South Central, New England, South Atlantic, East North Central, West North Central, Middle Atlantic`
Neither of the arguments from the previous methods are case-sensitive.

## IMPORTANT NOTE!
For the methods; `is_county_in_state?` and `is_zip_code_in_state?` which take two arguments, is important that the `state_name` is passed in as the second argument. Here are a few examples;

### Check if a county exists in a state
Successful request:
```
UsStatesData.is_county_in_state?('Orange', 'California')
=> [true, 200]
```

Unsuccessful request:
```
UsStatesData.is_county_in_state?('fizzbuzz', 'Maryland')
=> [=> [false, 404, "County 'fizzbuzz' not found in state 'Maryland'."]
```

For when there's an error in the state name:
```
UsStatesData.is_county_in_state?('Ocala', 'new state')
ArgumentError: State 'new state' not found.
```

### Check if a zip code exists in a state
Successful request:
```
UsStatesData.is_zip_code_in_state?('90210', 'California')
=> [true, 200]
```

Zipcode can also be an integer and state is not case-sensitive:
```
UsStatesData.is_zip_code_in_state?(33134, 'florida')
=> [true, 200]
```

Unsuccessful request:
```
UsStatesData.is_zip_code_in_state?('12345', 'California')
=> [false, 404, "Zip code '12345' not found in state 'California'."]
```

Sending an invalid zip code format will trigger an `ArgumentError`:
```
UsStatesData.is_zip_code_in_state?('1234', 'California')
ArgumentError: Invalid zip code format.
```


### Contributing
Contributions are welcome! If you'd like to contribute to UsStatesData, please fork the repository, make your changes, and submit a pull request. Before submitting a pull request, make sure to run the tests using bundle exec rspec and ensure that your changes pass all tests.

License
The gem is available as open source under the terms of the [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt).
