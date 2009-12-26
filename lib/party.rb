def participants(*args)
  @participants ||= args.flatten
end

def bought(name,item, price)
  list[name] << item if item
  money[name] += price
end

alias  bought2 bought
# monkey-patches String class to have a buys method
def fancy_mode
  # some minor modifications to the String class ;) 
  String.class_eval do
    define_method(:bought) do |*args|
      bought2(self,*args)
    end
  end
  
end

def summarize(rounding=2)
  print_bill
  puts
  print_money_due(rounding)
end

private

def print_money_due(rounding)
  puts "Final balance:"
  participants.each do |par|
    diff = cost_per_participant - money[par]
    print par
    if diff > 0
      print " needs to pay "
    else
      print " has to receive "
    end
    puts "#{diff.abs.round(rounding)} euro"
  end
end

def print_bill
  puts "---Bill---"
  money.keys.each do |par|
    puts "#{par}:\t#{money[par]}\tspend on: #{list[par] * ',' }"
  end
  puts "----------"
  puts "total:\t#{total_cost}"
end

def cost_per_participant
  total_cost.to_f/participants.size
end

def total_cost
  money.values.inject(&:+) 
end

def money
  @@money_hash ||= Hash.new(0)
end

def list
  @@list_hash ||= Hash.new() {|h,k| h[k] = []}
end