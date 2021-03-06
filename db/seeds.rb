  3.times do |topic|
    Topic.create!(
      title: "Topic #{topic}"
    )
  end

puts "3 topics created"

  10.times do |blog|
    Blog.create!(
      title: "My Blog Post #{blog}",
      body: "sdfsdflsdf",
      topic_id: Topic.last.id
    )
  end

puts "10 blog posts created"

  5.times do |skill|
    Skill.create!(
      title: "Rails #{skill}",
      percent_utilized: 15
    )
  end

  8.times do |portfolio_item|
    Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}" ,
      subtitle: "Ruby on Rails" ,
      body: "latin latin latin",
      main_image: "http://placehold.it/600x400",
      thumb_image: "http://placehold.it/350x200" 
    )
  end

  2.times do |portfolio_item|
    Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}" ,
      subtitle: "Angular" ,
      body: "latin latin latin",
      main_image: "http://placehold.it/600x400",
      thumb_image: "http://placehold.it/350x200" 
    )
  end

  3.times do |technology|
    Portfolio.last.technologies.create!(
      name: "tech #{technology}"
    )
  end