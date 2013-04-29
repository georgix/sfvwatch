sfvwatch
========

a ruby script to watch the sporadically released silver fern visa quota. 
once the quota is out you'll receive an email.

you may run it on a headless linux server with firefox, xvfb, ruby, watir, 
watir-webdriver and headless installed.

if you run it on aws ec2 you may need to use screen to keep it running on
the background.

good luck!

usage: ruby sfv.rb [your login name to immigration website] [pwd] [your email addr]
