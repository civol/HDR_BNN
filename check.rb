# size = 784
size = 10

w = 0b0000101001
i = 0b1110010110

xors = (w ^ i)

count = xors.to_s(2).rjust(size,"0").count("0")

puts "count=#{count}, res=#{count-size/2}"

w2 = w.to_s(2).rjust(size,"0").each_char.map {|c| c == "0" ? -1 : 1 }
i2 = i.to_s(2).rjust(size,"0").each_char.map {|c| c == "0" ? -1 : 1 }
count2 = w2.zip(i2).map{|a,b| a*b }.reduce(&:+)

puts "count2=#{count2}"



# [1.0], [-1.0], [1.0], [-1.0], [1.0], [-1.0], [1.0], [-1.0], [-1.0], [1.0]
# 
# [1.0, 1.0, -1.0, 1.0, -1.0, -1.0, -1.0, 1.0, 1.0, -1.0]



