When /^I make a new (.+)$/ do |model|
  redirect_to("#{model}#new")
end

