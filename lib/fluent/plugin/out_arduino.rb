
require "serialport"

module Fluent
  class ArduinoOutput < Fluent::Output
    Fluent::Plugin.register_output('arduino', self)

    PIN_NUMBER = {
      "0"  => "A",
      "1"  => "B",
      "2"  => "C",
      "3"  => "D",
      "4"  => "E",
      "5"  => "F",
      "6"  => "G",
      "7"  => "H",
      "8"  => "I",
      "9"  => "J",
      "10" => "K",
      "11" => "L",
      "12" => "M",
      "13" => "N"
    }

    DATA_BITS = 8
    STOP_BITS = 1
    PARITY = SerialPort::NONE

    config_param :device_type, :string, default: "led"
    config_param :pin, :string, default: "13"
    config_param :key, :string, default: nil
    config_param :value, :string, default: nil

    config_param :baud_rate, :string, default: 9600
    config_param :port, :string, default: nil

    def configure(conf)
      super

      if @device_type != "led"
        raise Fluent::ConfigError, "this use type is led only"
      end

      @sw = true
      @serial = SerialPort.new(@port, @baud_rate, DATA_BITS, STOP_BITS, PARITY)
    end

    def start
      super
    end

    def shutdown
      super
    end

    def emit(tag, es, chain)
      es.each do |time, record|
        v = record[@key].strip
        if v == @value and @sw == true
          @serial.write(PIN_NUMBER[@pin.to_s].downcase)
          @sw = !@sw
        elsif v == @value and @sw == false
          @serial.write(PIN_NUMBER[@pin.to_s].upcase)
          @sw = !@sw
        end
      end
      chain.next
    end

  end
end
