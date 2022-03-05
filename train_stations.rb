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
    @current_station = route.stations.fisrt
  end

  def previous_station
    @route.stations[current_stations_index.pred] unless @current_station.fisrt 
  end

  def next_station
    @route.stations[current_stations_index.next] unless @current_station.last
  end

  def moving_back
    @current_station = previous_station if previous_station
  end

  def moving_forward
    @current_station = next_station if next_station
  end

  private

  def current_stations_index
    @route.stations.index(@current_station)
  end

end
