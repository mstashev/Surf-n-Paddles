class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: 'mstashev@gmail.com', subject: "Welcome to Chirpy!")
  end

  def share(post, to)
    @post = Post.find_by(id: post)
    mail(to: to, subject: @post.title.to_s() +' was shared with you' )
  end

end
