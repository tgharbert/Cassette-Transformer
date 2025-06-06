require 'yaml'
require 'json'

input_file, output_file = ARGV

data = YAML.load_file(input_file)

# Keep only the first http_interaction
data['http_interactions'] = [data['http_interactions'].first]

# (Optional) Also modify the response body string as before
first_interaction = data['http_interactions'].first
json_str = first_interaction['response']['body']['string']
first_interaction['']
parsed_json = JSON.parse(json_str)
parsed_json["next_cursor"] = nil

limit_count = 3
parsed_json['items'] = parsed_json['items'].first(limit_count)

# this can be used to extract Ruby hash for the spec file test of item[0]
# grab this value from the console output and use it in the spec file
# puts "Parsed JSON: #{parsed_json['items'][0]}"

first_interaction['response']['body']['string'] = JSON.generate(parsed_json)
# puts first_interaction['response']['body']['string']

# File.write(output_file, data.to_yaml)
File.write(output_file, data.to_yaml(line_width: -1))

