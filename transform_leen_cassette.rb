require 'yaml'
require 'json'

input_file = ARGV[0]

data = YAML.load_file(input_file)

# Keep only the first http_interaction
data['http_interactions'] = [data['http_interactions'].first]

# Grabs only the first response - no pagination with nillifying the next_cursor
first_interaction = data['http_interactions'].first
json_str = first_interaction['response']['body']['string']
first_interaction['']
parsed_json = JSON.parse(json_str)

parsed_json["next_cursor"] = nil

# How many items we want to keep in the parsed JSON for the truncated cassette
item_limit = 3
parsed_json['items'] = parsed_json['items'].first(item_limit)

# # NOTE: this can be used to extract Ruby hash for the spec file test of item[0]
# # Uncomment the below and grab printed ruby hash from the console output and use it in the spec file
# puts "First Object : \n#{parsed_json['items'][0]}"

first_interaction['response']['body']['string'] = JSON.generate(parsed_json)
# puts first_interaction['response']['body']['string']

# line_width: -1 is used to avoid wrapping long lines in the YAML output - puts it on a single line
File.write(input_file, data.to_yaml(line_width: -1))
