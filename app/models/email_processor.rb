class EmailProcessor
  def self.process(email)
    Gmail.create!({ email: email.body, name: email.from })
  end
end