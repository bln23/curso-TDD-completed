require_relative './sensor'

class Alarm

  attr_reader :alarm_on

  def initialize(sensor: Sensor.new)
    @sensor = sensor
    @alarm_on = false
  end

  def check
    pressure = @sensor.pop_next_pressure_psi_value

    unless pressure.between?(LOW_PRESSURE, HIGH_PRESSURE)
      @alarm_on = true
    end
  end

  private

  LOW_PRESSURE = 17
  HIGH_PRESSURE = 21
end