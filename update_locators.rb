require 'json' # Import the JSON library for handling JSON files

# Method to load the changes from a JSON file
def load_changes
  JSON.parse(File.read('changes.json')) # Read and parse the JSON file
end

# Method to update locators based on detected changes
def update_locators
  changes = load_changes # Load the changes

  # Iterate through the changes
  changes.each do |id, change|
    if change['initial'] && change['current'] # If the element has changed
      # Print out the update details
      puts "Update locator for element with ID #{id}:"
      puts "  Initial: #{change['initial']}"
      puts "  Current: #{change['current']}"
    elsif change['initial'].nil? # If the element is new
      # Print out the new element details
      puts "New element detected with ID #{id}: #{change['current']}"
    else # If the element was removed
      # Print out the removed element details
      puts "Element removed with ID #{id}: #{change['initial']}"
    end
  end
end

# Call the method to update locators
update_locators
