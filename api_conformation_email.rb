      json_should_not_contain 'confirmation_token'
      end

      it 'sends confirmation email to new user' do
        ActionMailer::Base.deliveries.count.should == 1
        message = ActionMailer::Base.deliveries.first

        message.to.should == [@email]
        message.from.should == [ENV['SENDER_EMAIL_ADDRESS']]
        message.subject.should == 'Confirmation instructions'
        message.body.raw_source.should include('http://testhost/users/confirmation/')
      end
      include_examples 'sends confirmation email'

      it 'sets user password blank' do
        user(@email).encrypted_password.should be_blank
