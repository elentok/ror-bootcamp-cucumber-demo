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

Then /^the task list now has a task titled "(.*?)"$/ do |title|
  find('#task-list').should have_content(title)
end

Then /^the "(.*?)" field is blank$/ do |field|
  find_field(field).value.should be_empty
end

Given /^the following tasks:$/ do |table|
  table.hashes.each do |task|
    Task.create!(title: task['title'])
  end
end

Then /^I see the following tasks:$/ do |table|
  actual = all('.task').map do |task_el|
    { 'title' => task_el.find('.title').text }
  end
  actual.should == table.hashes
end
