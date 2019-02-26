require 'capybara'
require 'capybara/apparition'
require 'csv'
require 'pry'

Capybara.javascript_driver = :apparition

session = Capybara::Session.new(:apparition)

# Log in
puts "Logging in..."
session.visit("https://mimic.stukent.com")
session.fill_in "email", with: "mo.zhu.th@dartmouth.edu"
session.fill_in "password", with: "cy+snzYovP9WjpH@HjJ9"
session.find("button").click

# Stukent Enrollments Page
puts "Landing on Enrollments Page..."
session.visit("https://home.stukent.com/student/enrollments")
session.click_on "Go to Mimic Pro"

# Simulation Overview Page
puts "Landing on Overview Page..."
session.click_on "Get Started"

# Research Keywords page
puts "Visiting Keywords Research Page..."
session.visit("https://mimic.stukent.com/simulation/7932/ed/practice/research-keywords")

# Do the scraping
puts "Saving keyword data..."
CSV.open("keywords.csv", "w") do |csv|
  csv << ["Selected", "Keyword", "Avg Monthly Searches", "Competition", "Suggested Bid"]

  55.times do |n|
    puts "\t Saving Page #{n + 1}..."
    page = Nokogiri(session.body)
    body = page.css("body")
    table = body.css("table")
    data_rows = table.css("tbody tr")
    data_rows.each do |row|
      csv << row.children.map(&:text)
    end
    session.click_on "Next"
  end
end

puts "Done!"
