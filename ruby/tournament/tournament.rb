class Tournament

  def self.table_generate
    table = String.new("Team                           | MP |  W |  D |  L |  P\n")
    puts table
    index = 0
    while index < $individual_results.length
      spaces = 31 - $individual_results[index][:name].length
      name = "#{$individual_results[index][:name]}#{' ' * spaces}"
      puts "#{name}| #{$individual_results[index][:MP]}  |  #{$individual_results[index][:W]} |  #{$individual_results[index][:D]} |  #{$individual_results[index][:L]} |  #{$individual_results[index][:P]}\n"
      index += 1
    end
  end



  def self.tally(input = nil)
    @input = input.lines(chomp: true)
    self.split_input_into_hashes
    self.mergeall
    self.sort_P_desc_name_asc
    self.table_generate
  end

  def self.sort_P_desc_name_asc
    $individual_results.sort!{ |a, b| [-a[:P], a[:name]] <=> [-b[:P], b[:name]] }
  end

  def self.mergeresults_for_single_team(index, reiterator)
    @index = index
    @reiterator = reiterator
      while @reiterator < $individual_results.length
        if $individual_results[@index][:name] == $individual_results[@reiterator][:name]
          # puts $individual_results[index][:name] == $individual_results[@reiterator][:name]
          $individual_results[@index][:MP] =  $individual_results[@index][:MP].to_i + $individual_results[@reiterator][:MP].to_i
          $individual_results[@index][:W] =  $individual_results[@index][:W].to_i + $individual_results[@reiterator][:W].to_i
          $individual_results[@index][:D] =  $individual_results[@index][:D].to_i + $individual_results[@reiterator][:D].to_i
          $individual_results[@index][:L] =  $individual_results[@index][:L].to_i + $individual_results[@reiterator][:L].to_i
          $individual_results[@index][:P] =  $individual_results[@index][:P].to_i + $individual_results[@reiterator][:P].to_i
          $individual_results.delete_at(@reiterator)
        elsif $individual_results[@index][:name] != $individual_results[@reiterator][:name]
          @reiterator += 1
        end
      end
    end

  def self.mergeall
    index = 0
    while index < $individual_results.length
    self.mergeresults_for_single_team(index.to_i, index.to_i+1)
    index +=1
    end
    # puts $individual_results
  end

  def self.split_input_into_hashes
  $individual_results = []
  index = 0
  while index < @input.length
    x = @input[index].split(/[;]/)
    if x[2] == 'win'
      $individual_results << {name: x[0], MP: 1,W: 1, D: 0, L: 0, P: 3}
      $individual_results << {name: x[1], MP: 1,W: 0, D: 0, L: 1, P: 0}
      # puts results.class
      # puts results
    index += 1
    elsif x[2] == 'draw'
      $individual_results << {name: x[0], MP: 1,W: 0, D: 1, L: 0, P: 1}
      $individual_results << {name: x[1], MP: 1,W: 0, D: 1, L: 0, P: 1}
      # puts results.class
      # puts results
      index += 1
    elsif x[2] == 'loss'
      $individual_results << {name: x[0], MP: 1,W: 0, D: 0, L: 1, P: 0}
      $individual_results << {name: x[1], MP: 1,W: 1, D: 0, L: 0, P: 3}
      # puts results.class
      # puts results
      index += 1
    else
      raise ArgumentError
    end
  end
  # puts $individual_results
  # $individual_results
  end
end



input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Courageous Californians;draw
      Devastating Donkeys;Allegoric Alaskans;win
      Courageous Californians;Blithering Badgers;loss
      Blithering Badgers;Devastating Donkeys;loss
      Allegoric Alaskans;Courageous Californians;win
    INPUT

    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
    TALLY

    Tournament.tally(input)

    # index = 1
    # while index < $individual_results.length do
    #   $individual_results[index-1].has_value?($individual_results[index][:name])
    #   index += 1
    # end
