After '@javascript' do
  Capybara.send('session_pool').each do |_, session|
    next unless session.driver.is_a?(Capybara::Poltergeist::Driver)
    session.driver.restart
  end
end

Before '@stripe' do
  WebMock.disable_net_connect!(allow_localhost: true)
  StripeMock.start
end

After '@stripe' do
  WebMock.allow_net_connect!
  StripeMock.stop
end
