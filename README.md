# Cassette-Transformer for Leen
Reduce a Leen cassette to the first three items and get it ready for testing

To transform a cassette simply run: `ruby transform_leen_cassette.rb <input_file_path>`

The files must include the `.yml` extension.

To see the Ruby hash you wish to test against printed in the terminal, make sure this line is uncommented:
`puts "First Object : \n#{parsed_json['items'][0]}"` 
