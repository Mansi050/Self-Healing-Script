require_relative 'common_methods'

def capture_initial_state(url)
  elements = capture_state(url) # Capture the state using the shared method

  # Write the elements hash to a JSON file
  File.write('initial_state.json', JSON.pretty_generate(elements))
end

# Call the method with the desired URL
capture_initial_state('https://mansi050.github.io/Self-Healing-Script/')
