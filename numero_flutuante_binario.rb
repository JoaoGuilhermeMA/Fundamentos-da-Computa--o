def converter_parte_inteira(numero_inteiro)
  parte_inteira = (numero_inteiro / 2).to_i
  resto = (numero_inteiro % 2).to_i
  numero_binario = ''
  numero_binario << resto.to_s
  while parte_inteira > 1
    resto = parte_inteira % 2
    parte_inteira /= 2
    numero_binario << resto.to_s
  end
  numero_binario << parte_inteira.to_s
  numero_binario = numero_binario.reverse
end

def converte_parte_fracionaria(numero, _numero_inteiro)
  parte_decimal = numero.to_s.split('.')
  numero_fracionario = "0.#{parte_decimal[1]}"
  numero_fracionario = numero_fracionario.to_f
  fracionario_binario = ''
  for i in 1..5 do
    numero_auxiliar = numero_fracionario.to_f * 2
    fracionario_binario << numero_auxiliar.to_i.to_s
    parte_decimal = numero_auxiliar.to_s.split('.')
    numero_fracionario = "0.#{parte_decimal[1]}"
    numero_fracionario = numero_fracionario.to_f
  end
  fracionario_binario
end

puts 'Digite um numero em decimal'
numero = gets
numero_inteiro = numero.to_i
puts "o numero inteiro e #{numero_inteiro}"
numero_binario = converter_parte_inteira numero_inteiro
puts
puts "A parte inteira do numero binario e #{numero_binario}"
puts
fracionario_binario = converte_parte_fracionaria numero, numero_inteiro
puts "A parte fracionaria do numero binario e #{fracionario_binario}"
