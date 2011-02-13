(1..5).each do |i|
  Place.create(:title => "loop#{i}", :description => "test", :location => "me", :rating => 0, :absolute_rank => 0)
end
