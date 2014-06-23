#!/usr/bin/ruby

require 'easy-gtalk-bot'
require 'whenever'

bot = GTalk::Bot.new(:email => "coachfaraday@gmail.com", :password => 'let\'shavefun')
bot.get_online
bot.message "lixulehigh@gmail.com", "hello world!"


bot.on_invitation do |inviter|
  puts "I have been invited by #{inviter}. Yay!"

  # do something useful

  bot.accept_invitation(inviter)
  bot.message(inviter, "Hello there! Thanks for invitation!")
end

bot.on_message do |from, text|
  #puts "I got message from #{from}: '#{text}'"
  # do something useful
  time1 = Time.new
  if ( text =~ /time(.*)/ )
    bot.message from, "hi, current time: " + time1.inspect
  end
  #bot.message from, "I heard that!"
end





# Don't be confused with the name of this method.
# We actually keep the current (main) thread alive while letting listener thread to do its job.
# So we have no need to set up an any infinite loop.
Thread.stop
