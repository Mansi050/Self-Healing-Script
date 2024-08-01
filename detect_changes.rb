require_relative 'common_methods'

# Method to load the initial state from a JSON file
def load_initial_state
  JSON.parse(File.read('initial_state.json')) # Read and parse the JSON file
end

# Method to detect changes between the initial and current state
def detect_changes(url)
  puts "Detecting chnages...."
  initial_state = load_initial_state # Load the initial state
  current_state = capture_state(url) # Capture the current state using the shared method

  changes = {} # Initialize a hash to store changes
  # Iterate through the current state elements
  current_state.each do |id, current_element|
    if initial_state[id] # If the element exists in the initial state
      initial_element = initial_state[id]
      if current_element != initial_element # If the element has changed
        # Store the changes in the hash
        changes[id] = { 'initial' => initial_element, 'current' => current_element }
      end
    else # If the element is new
      # Store the new element in the hash
      changes[id] = { 'initial' => nil, 'current' => current_element }
    end
  end

  # Write the changes hash to a JSON file
  File.write('changes.json', JSON.pretty_generate(changes))
end

# Call the method with the desired URL
detect_changes('https://mansi050.github.io/Self-Healing-Script/')
