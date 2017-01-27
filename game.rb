class Fixnum
	def p
		format("%+d", self)
	end
end

def tries p
	res = 0
	res += 1 while rand < p
	res
end

def rndEvent
	e = []
	scale = 5 * 1.26 ** tries(0.8) 
	2.times do
		e << [
			((rand-0.5)*scale).round,
			((rand-0.5)*scale).round
		]
	end
	e
end

na = "Ammunition"
ns = "Survivability"

puts "hi"
a = 10
s = 10
e = rndEvent
while true do
	puts "#{na}: #{a}"
	puts "#{ns}: #{s}"
	puts "1. #{e[0][0].p} #{na}, #{e[0][1].p} #{ns}"
	puts "2. #{e[1][0].p} #{na}, #{e[1][1].p} #{ns}"
	c = gets[0]
	break if c == 'e'
	if c == '1' then
		a += e[0][0]
		s += e[0][1]
		e = rndEvent
	elsif c == '2' then
		a += e[1][0]
		s += e[1][1]
		e = rndEvent
	else
		puts 'please enter "1", "2" or "e"'
	end
	if a < 0 || s < 0 then
		puts "fail"
		break
	end
end
puts "bye"