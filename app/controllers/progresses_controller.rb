class ProgressesController < ApplicationController


def index
end

def passed_redirect
p = Progress.find(params["progress_id"])
@auth.text_result(@auth, p)
binding.pry
redirect_to root_path
end

def create

  @interview = Interview.find(params[:interview_id])

 @question = Question.find(params[:question_id])
  #
  @progress = Progress.find(params[:progress_id])
  @correct = @progress.check(params[:answer_ids])

 if @progress.total && @progress.passing
    @interview.passing += 1
    @interview.save
  elsif @progress.total
    @interview.failing +=1
    @interview.save
  end

end


def text_result(phone)
    # a = Message.where("category" => type).sample.message
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+1 917-284-6078', :to => @user.phone, :body => 'a' )
  end


end
