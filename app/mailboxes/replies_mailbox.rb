class RepliesMailbox < ApplicationMailbox
  MATCHER = /reply-(.+)@reply.example.com/i

  def process
    # byebug
    return if user.nil?
    discussion.comments.create(
      user: user,
      body: mail.decode
    )
  end

  def user 
    @user ||= User.find_by(email: mail.from)
  end 

  def discussion 
    byebug
    @discussion ||= Discussion.find(discussion_id)
  end  
  
  def discussion_id
    recipient = mail.recipients.find{ |r| MATCHER.match?(r)}
    recipient[MATCHER, 1]
  end
end
