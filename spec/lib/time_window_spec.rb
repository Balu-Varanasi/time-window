require 'spec_helper'

describe TimeWindow do
  it "Test Window - 1: ['Mon-Fri 0800-1700', '0800-1700']" do
    time_window = TimeWindow.new(['Mon-Fri 0800-1700', '0800-1700'])
    expect(time_window.include?('2015-06-29 11:58:47')).to be_truthy
  end

  it "Test Window - 2: ['Sat-Sun', 'Mon-Sun 0600-0700']" do
    time_window = TimeWindow.new(['Sat-Sun', 'Mon-Sun 0600-0700'])
    expect(time_window.include?('2015-06-27 06:20:07 ')).to be_truthy
  end

  it 'Test Window - 3: []' do
    time_window = TimeWindow.new([])
    expect(time_window.include?('2015-05-07 20:10:40')).to be_truthy
  end

  it "Test Window - 4: ['Mon-Fri 0800-1700']" do
    time_window = TimeWindow.new(['Mon-Fri 0800-1700'])
    expect(time_window.include?('2015-10-31 11:58:47')).to be_falsy
  end

  it "Test Window - 5: ['Mon']" do
    time_window = TimeWindow.new(['Mon'])
    expect(time_window.include?('2015-10-31 11:58:47')).to be_falsy
  end

  it "Test Window - 6: ['Mon']" do
    time_window = TimeWindow.new(['Sat'])
    expect(time_window.include?('2015-10-31 11:58:47')).to be_truthy
  end

  it "Test Window - 7: ['0800-1700']" do
    time_window = TimeWindow.new(['0800-1700'])
    expect(time_window.include?('2015-10-31 11:58:47')).to be_truthy
  end

  it "Test Window - 8: ['0800-1700']" do
    time_window = TimeWindow.new(['0800-1700'])
    expect(time_window.include?('2015-10-31 19:58:47')).to be_falsy
  end

  it "Test Window - 9: ['0800']" do
    time_window = TimeWindow.new(['0800'])
    expect(time_window.include?('2015-10-31 08:00:00')).to be_truthy
  end

  it "Test Window - 10: ['0800']" do
    time_window = TimeWindow.new(['0800'])
    expect(time_window.include?('2015-10-31 08:00:01')).to be_truthy
  end
end
