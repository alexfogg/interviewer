class ProgressesController < ApplicationController


def index
end

def create
  
end


def text_result(phone)
    # a = Message.where("category" => type).sample.message
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+1 917-284-6078', :to => @user.phone, :body => 'a' )
  end


end
