puts 'Digite um numero em decimal'
numero_decimal = gets.to_i

parte_inteira = (numero_decimal / 2).to_i  ## 255/2 = 127
resto = (numero_decimal % 2).to_i
numero_binario = ''
numero_binario << resto.to_s
while parte_inteira > 1
  resto = parte_inteira % 2
  parte_inteira /= 2
  numero_binario << resto.to_s
end
numero_binario << parte_inteira.to_s
numero_binario = numero_binario.reverse
puts numero_binario
