require 'time_error'

RSpec.describe TimeError do
  it "returns the time difference in seconds between the server time and this computer" do
    requester_dbl = double :requester 
    expect(requester_dbl).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"BST","client_ip":"2a02:c7c:36ad:e100:c583:37ea:6af2:74d1","datetime":"2022-07-01T10:00:53.729074+01:00","day_of_week":5,"day_of_year":182,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1656666053,"utc_datetime":"2022-07-01T09:00:53.729074+00:00","utc_offset":"+01:00","week_number":26}')
    
    time = Time.new(2022, 7, 1, 10, 00, 52)
    time_error = TimeError.new(requester_dbl)
    result = time_error.error(time)
    expect(result).to eq 1.729074
  end
end