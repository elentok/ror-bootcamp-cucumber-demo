Given /^the task list page$/ do
  visit root_path
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, with: value
end

When /^I click on "(.*?)"$/ do |button|
  click_on button
end

Then /^I see "(.*?)"$/ do |content|
  page.should have_content(content)
end

Then /^the database has a task titled "(.*?)"$/ do |title|
  Task.find_by_title(title).should_not be_nil
end
