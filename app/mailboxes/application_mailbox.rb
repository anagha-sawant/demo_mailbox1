class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing RepliesMailbox::Matcher => :replies
end
