include Math

puts 'Digite um numero binario: '
numero_binario = gets.to_s
qntd_tabela = numero_binario.size - 1
numero_decimal = 0

numero_binario = numero_binario.reverse
for i in 1..qntd_tabela do
  numero_decimal += 2**(i - 1) if numero_binario[i] == '1'
end

puts numero_decimal
