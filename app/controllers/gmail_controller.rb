class GmailController < ApplicationController
  def index
    # @gmail = Gmail.connect("zhou.hongyu8976@gmail.com", "19890706")
    # @email = @gmail.inbox.find(:unread).first
    # binding.pry
    # @email.attachments[0].save_to_file("/attachment")
    Mail.defaults do
      retriever_method :pop3, :address    => "pop.gmail.com",
                              :port       => 995,
                              :user_name  => 'Slips@rocketdrop.com',
                              :password   => 'Rocketdrop123@',
                              :enable_ssl => true
    end
    @first = Mail.last
    @last = Mail.last
    @first.attachments.each do | attachment |

      if (attachment.content_type.start_with?('application/'))
        filename = attachment.filename
        begin
          File.open("pdf/" + filename, "w+b", 0644) {|f| f.write attachment.body.decoded}
          @reader = PDF::Reader.new("pdf/" + filename)
          @content = @reader.pages[0].text
          @content.scan(/\d{20}/)
        rescue => e
          puts "Unable to save data for #{filename} because #{e.message}"
        end
      end
    end

  end

  def show
  end

  def create
  end

  def destroy
  end
end
