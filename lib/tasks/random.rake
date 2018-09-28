namespace :random do

  def random_text length=2 
    rand(36**length).to_s(36)
  end

  desc 'Добавляет указанное количество пользователей'
  task :add_users, [:num] => [:environment] do |_t,arg|
    arg[:num].to_i.times do |n|
      user = User.new
      user.name = random_text(10)
      user.email = random_text(5)+'@'+random_text(5)
      user.save if user.valid?
      p user
    end
  end

  desc 'Добавляет указанное количество постов'
  task :add_posts, [:num] => [:environment] do |_t,arg|
    arg[:num].to_i.times do |n|
      post = Post.new
      post.title = random_text(10)
      post.body = random_text(50)
      post.user_id = rand(User.last.id)
      post.save if post.valid?
      p post
    end
  end

  desc 'Добавляет указанное количество комментариев'
  task :add_comments, [:num] => [:environment] do |_t,arg|
    arg[:num].to_i.times do |n|
      comment = Comment.new
      comment.body = random_text(20)
      comment.post_id = rand(Post.last.id)
      comment.user_id = rand(User.last.id)
      comment.save if comment.valid?
      p comment
    end
  end

end
