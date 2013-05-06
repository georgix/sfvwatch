require 'watir-webdriver'
require 'headless'

success_count = 0

headless = Headless.new
headless.start

while (1) do
	puts Time.now.inspect

	begin
		b = Watir::Browser.new
	
		b.goto 'https://www.immigration.govt.nz/secure/default.htm'
		b.text_field(:id => 'Footer_newFooter_loginControl_userNameTextBox').set ARGV[0]
		b.text_field(:id => 'Footer_newFooter_loginControl_passwordTextBox').set ARGV[1]
		b.button(:id => 'Footer_newFooter_loginControl_loginImageButton').click
	
		b.goto 'https://www.immigration.govt.nz/SilverFern/'
	
		if !(b.text.include? 'The quota for this year has already been filled')
			puts "\n!!!available!!!\n"
			success_count += 1
			if success_count >=2
				c = Watir::Browser.new :chrome
	
				c.goto 'http://twilightwap.com/sendemail.asp'
				c.text_field(:name => 'email2').set ARGV[2]
				c.text_field(:name => 'name2').set 'sfvalert'
				c.text_field(:name => 'email3').set 'sfv@alert.com'
				c.text_field(:name => 'subj').set 'sfv'
				c.textarea(:name => 'note').set 'apply now!'
				c.button(:value => 'Send').click
	
				puts "\ncheck now!!\n"
	
				success_count = 0
				sleep(60)
			end
		end
	
		File.open('result.log', 'a') do |f|
			f.syswrite 'No places at ' + Time.now.inspect + "\n"
			f.close
		end

		b.close
	rescue Error
		$stderr.print $!
		sleep(60)
	end

end

headless.destroy
