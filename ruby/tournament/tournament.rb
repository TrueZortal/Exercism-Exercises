class Tournament

  def self.table_generate
    table = String.new("Team                           | MP |  W |  D |  L |  P\n")
    index = 0
    while index < $individual_results.length
      spaces = 31 - $individual_results[index][:name].length
      name = "#{$individual_results[index][:name]}#{' ' * spaces}"
      table = table +"#{name}|  #{$individual_results[index][:MP]} |  #{$individual_results[index][:W]} |  #{$individual_results[index][:D]} |  #{$individual_results[index][:L]} |  #{$individual_results[index][:P]}\n"
      index += 1
    end
    table
  end

  def self.tally(input)
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
  end

  def self.split_input_into_hashes
  $individual_results = []
  index = 0
  while index < @input.length
    x = @input[index].split(/[;]/)
    if x[2] == 'win'
      $individual_results << {name: x[0], MP: 1,W: 1, D: 0, L: 0, P: 3}
      $individual_results << {name: x[1], MP: 1,W: 0, D: 0, L: 1, P: 0}
    index += 1
    elsif x[2] == 'draw'
      $individual_results << {name: x[0], MP: 1,W: 0, D: 1, L: 0, P: 1}
      $individual_results << {name: x[1], MP: 1,W: 0, D: 1, L: 0, P: 1}
      index += 1
    elsif x[2] == 'loss'
      $individual_results << {name: x[0], MP: 1,W: 0, D: 0, L: 1, P: 0}
      $individual_results << {name: x[1], MP: 1,W: 1, D: 0, L: 0, P: 3}
      index += 1
    else
      puts "Team                           | MP |  W |  D |  L |  P\n"
      index += 1
    end
  end
  end
end

