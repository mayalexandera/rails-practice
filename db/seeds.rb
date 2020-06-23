10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "sdfsdflsdf"
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )

  puts "5 skills created"

  puts "9 portfoloio items created" 

  9.times do |portfolio_item|
    Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}" ,
      subtitle: "My greate service" ,
      body: "latin latin latin",
      main_image: "http://placehold.it/600x400",
      thumb_image: "http://placehold.it/350x200" 
    )
  end
end'