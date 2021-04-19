require_relative '../lib/alarm'
require "minitest/autorun"

class AlarmTest < Minitest::Test
  def test_should_be_active_if_the_pressure_is_too_low
    sensor = Sensor.stubs(:pop_next_pressure_psi_value).returns(15)
    alarm = Alarm.new(sensor: sensor)

    alarm.expects(:alarm_on).returns(true)

    alarm.check
  end
#
#   it 'should be active if the pressure is too high' do
#     sensor = FakeSensor.new(22)
#     alarm = Alarm.new(sensor: sensor)
#     alarm.check
#     expect(alarm.alarm_on).to eq true
#   end
#
#   it 'should be inactive if the pressure is ok' do
#     sensor = FakeSensor.new(18)
#     alarm = Alarm.new(sensor: sensor)
#     alarm.check
#     expect(alarm.alarm_on).to eq false
#   end
#
#   it 'should be inactive if the pressure is in lower threshold' do
#     sensor = FakeSensor.new(17)
#     alarm = Alarm.new(sensor: sensor)
#     alarm.check
#     expect(alarm.alarm_on).to eq false
#   end
#
#   it 'should be inactive if the pressure is in upper threshold' do
#     sensor = FakeSensor.new(21)
#     alarm = Alarm.new(sensor: sensor)
#     alarm.check
#     expect(alarm.alarm_on).to eq false
#   end
end

class FakeSensor
  def initialize(value)
    @value = value
  end

  def pop_next_pressure_psi_value
    @value
  end
end