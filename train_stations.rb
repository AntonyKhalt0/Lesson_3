class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = { cargo: [], passenger: [] }
  end

  def add_train(train)
    @train_list[:cargo] << train if train.type == 'cargo'
    @train_list[:passenger] << train if train.type == 'passenger'
  end

  def send_train(train)
    @train_list.each do |trains| 
      trains.dig(:cargo).delete(train) if trains.dig(:cargo).include? train
      trains.dig(:passenger).delete(train) if trains.dig(:passenger).include? train
    end
  end

  def show_trains_on_station
    puts "Поезда на станции: "
    @train_list.each do |trains|
      trains.dig(:cargo).each { |train| puts "#{train.number}, #{train.wagons}" }
      trains.dig(:passenger).each { |train| puts train }
    end
  end

  def show_trains_on_station_by_type(type)
    puts "#{type} поезда: "
    @train_list.dig(type.to_sym).each { |trains| puts "Номер поезда: #{train.number}, \
                                                 количество вагонов: #{train.wagons}" }
    end
  end

end

class Route

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
  attr_reader :number
  attr_reader :type
  attr_reader :wagons
  attr_reader :route
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
    @staion_with_train = route.fisrt
  end

  def moving_train(orientation)
    @staion_with_train = @route[@route.index(@station_with_train) - 1] if orientation == "Назад"
    @staion_with_train = @route[@route.index(@station_with_train) + 1] if orientation == "Вперед"
  end

  def adjacent_stations
    "Предыдущая станция: #{@route[@route.index(@station_with_train) - 1].name}, \
     текущая станция: #{@station_with_train.name} \
     следующая станция: #{@route[@route.index(@station_with_train) + 1].name}" 
  end

end
