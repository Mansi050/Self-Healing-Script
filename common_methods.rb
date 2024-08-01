require 'selenium-webdriver'
require 'nokogiri'
require 'json'

# Method to capture the state of the web page
def capture_state(url)
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  driver = Selenium::WebDriver.for :chrome, options: options

  driver.navigate.to url
  page_source = driver.page_source

  # Parse the HTML with Nokogiri
  doc = Nokogiri::HTML(page_source)

  elements = {}
  doc.css('*[id]').each do |element|
    elements[element['id']] = { 'tag_name' => element.name, 'class' => element['class'], 'text' => element.text.strip }
  end

  driver.quit
  elements
end
