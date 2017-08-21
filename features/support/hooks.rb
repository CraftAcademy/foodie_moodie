Before '@stripe' do
  WebMock.disable_net_connect!(allow_localhost: true)
  StripeMock.start
end

After '@stripe' do
  WebMock.allow_net_connect!
  StripeMock.stop
end
