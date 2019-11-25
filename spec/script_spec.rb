require 'spec_helper'

RSpec.describe 'script.rb' do
  context 'for correct file name' do
    it 'displays ordered data' do
      expect(`./script.rb webserver.log`).to eq(<<~MESSAGE
          /about/2 90 visits
          /contact 89 visits
          /index 82 visits
          /about 81 visits
          /help_page/1 80 visits
          /home 78 visits
          /index 23 unique views
          /home 23 unique views
          /contact 23 unique views
          /help_page/1 23 unique views
          /about/2 22 unique views
          /about 21 unique views
        MESSAGE
      )
    end
  end

  context 'for incorrect file name' do
    it 'shows error message' do
      expect(`./script.rb void.log`.chomp).to eq("File void.log not found")
    end
  end
end
