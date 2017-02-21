require 'watir-webdriver'
require 'cucumber'
require 'selenium-webdriver'
require 'minitest/autorun'


Given(/^i am on rightmove home page$/) do
  driver = Watir::Browser.new :firefox
  @browser = driver
  @browser.goto "http://www.rightmove.co.uk/"
end

And(/^i seacrh for "([^"]*)"$/) do |city|
  @browser.text_field(:id, "searchLocation").set city
end

When(/^i click the buy button$/) do
  @browser.button(:id, "buy").click
end

Then(/^i should be on the additional option page$/) do
  sleep 5
  assert @browser.select_list(:id,"radius").exists? == true
end


And(/^i search for "([^"]*)"$/) do |range|
  @browser.select_list(:id,"radius").when_present.select range
end

When(/^i click the find properties button$/) do
  @browser.button(:id,"submit").click
end

Then(/^i should be on the result page$/) do
  @browser.div(:class,"propertyCard-img").wait_until_present
  assert @browser.div(:id,"staticMap").exists? == true
end
And(/^I close the browser$/) do
  @browser.close
end

Given(/^i search for "([^"]*)" bedroom "([^"]*)" in "([^"]*)" "([^"]*)" between "([^"]*)" and "([^"]*)" price range$/) do |bedrooms, property_type, city, radius, min, max |
steps %Q{
 And i seacrh for "#{city}"
When i click the buy button
And i search for "#{radius}"
      }

@browser.select_list(:id,"minBedrooms").select bedrooms
 @browser.select_list(:id,"displayPropertyType").select property_type
 #@browser.select_list(:id, "locationIdentifier").select city.capitalize
  @browser.select_list(:id,"minPrice").select min
@browser.select_list(:id,"maxPrice").select max

end

And(/^i click "([^"]*)" button with id$/) do |button_id|
  @browser.button(:id, button_id).when_present.click
end

Then(/^i should see "([^"]*)"case sensitive message in the browser$/) do |message_text|
sleep 5
 assert /#{message_text}/.match(@browser.text)!=nil

end

And(/^i click on a link with id "([^"]*)"$/) do |link_id|
  @browser.link(:id, link_id).when_present.click
end