puts 'Digite um numero binario'
numero_binario = gets.to_s
valor = numero_binario[0].to_i

for i in 0..7
  valor ^= numero_binario[i + 1].to_i
end

puts "A paridade par e #{valor}"
