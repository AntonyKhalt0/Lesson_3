class Station
  attr_reader :name
  attr_reader :trains_list

  def initialize(name)
    @name = name
    @trains_list = []
  end

  def add_train(train)
    @train_list.push(train)
  end

  def send_train(train) 
    @trains_list.delete(train) if @trains_list.include? train
  end

  def show_trains_on_station_by_type(type)
    @trains_list.select { |train| train.type == type }
  end

end

class Route
  attr_reader :stations

  def intialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(previous_station, new_station)
    @stations.insert(@stations.index(previous_station) + 1, new_station)
  end

  def delete_station(selected_station)
    @stations.delete(selected_station)
  end

  def show_stations
    @stations.each { |station| "Станция: #{station.name}" }
  end

end

class Train
  attr_reader :number, :type, :wagons, :route
  attr_accessor :speed

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def speed_dial(boost)
    self.speed += boost
  end

  def reduse_speed
    self.speed = 0
  end

  def attach_wagons
    @wagons += 1 if self.speed == 0
  end

  def unpin_wagons
    @wagons -= 1 if self.speed == 0
  end

  def train_route(route)
    @route = route
    @staion_with_train = route.stations.fisrt
  end

  def previous_station
    @route.stations[@route.stations.index(@station_with_train) - 1]
  end

  def next_station
    @route.stations[@route.stations.index(@station_with_train) + 1]
  end

  def moving_back
    @staion_with_train = previous_station
  end

  def moving_forward
    @staion_with_train = next_station
  end

end
