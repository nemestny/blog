namespace :random do

  desc 'Добавляет указанное количество пользователей'
  task :add_users, [:num] => [:environment] do |_t,arg|
    arg[:num].to_i.times do |n|
      user = User.new
      user.name = SecureRandom.hex(5)
      user.email = SecureRandom.hex(2)+'@'+SecureRandom.hex(2)
      user.save if user.valid?
      p user
    end
  end

  desc 'Добавляет указанное количество постов'
  task :add_posts, [:num] => [:environment] do |_t,arg|
    arg[:num].to_i.times do |n|
      post = Post.new
      post.title = SecureRandom.hex(8)
      post.body = SecureRandom.hex(20)
      post.user_id = User.order("RANDOM()").first.id
      post.save if post.valid?
      p post
    end
  end

  desc 'Добавляет указанное количество комментариев'
  task :add_comments, [:num] => [:environment] do |_t,arg|
    arg[:num].to_i.times do |n|
      comment = Comment.new
      comment.body = SecureRandom.hex(10)
      comment.post_id = Post.order("RANDOM()").first.id
      comment.user_id = User.order("RANDOM()").first.id
      comment.save if comment.valid?
      p comment
    end
  end

end
