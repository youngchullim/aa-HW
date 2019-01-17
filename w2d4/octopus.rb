def sluggish(fish_arr)
  longest = nil
  fish_arr.each_with_index do |fish, i|
    j = 0
    while j < fish_arr.length
      if fish.length > fish_arr[j].length
        longest = fish
      else
        longest = fish_arr[j]
      end
      j += 1
    end
  end
  longest
end

def merge_sort(&prc)
  prc ||= Proc.new {|a,b| a <=> b }
  return self if self.length <= 1

  mid = self.length / 2
  left = self[0...mid].merge_sort(&prc)
  right = self[mid..-1].merge_sort(&prc)

  Array.merge(left, right, &prc)
end

def self.merge(left, right, &prc)
  result = []

  until left.empty? || right.empty?
    if prc.call(left.first, right.first) == -1
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

def dominant(fish_arr)
  prc = Proc.new {|a,b| a.length > b.length }
  fish_arr.merge_sort(&prc)[0]
end

def clever(fish_arr)
  biggest = fish_arr[0]

  fish_arr.each do |fish|
    if fish.length > biggest.length
      biggest = fish
    end
  end
  biggest
end

def slow_dance(dir, tiles_arr)
  tiles_arr.each_with_index do |tile, i|
    if tile == dir
      return i
    end
  end
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1, 
  "right" => 2, 
  "right-down" => 3, 
  "down" => 4, 
  "left-down" => 5, 
  "left" => 6, 
  "left-up" => 7 
}

def constant_dance(dir, tiles_arr)
  tiles_hash[dir]
end