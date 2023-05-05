include Math

def converte_inteira_decimal(numero_binario)
  numero_binario = numero_binario.split('.')
  numero_binario = numero_binario[0]
  qntd_tabela = numero_binario.size
  numero_decimal = 0

  numero_binario = numero_binario.reverse
  for i in 0..qntd_tabela do
    numero_decimal += 2**i if numero_binario[i] == '1'
  end
  numero_decimal
end

def converte_fracionario_decimal(numero)
  parte_fracionaria = numero.split('.')
  numero_fracionario = "#{parte_fracionaria[1]}"
  numero_decimal_fracionario = 0.0
  qntd_tabela = numero_fracionario.size

  for j in 0..qntd_tabela do
    numero_decimal_fracionario += 2**((j + 1) * -1) if numero_fracionario[j] == '1'
  end
  numero_decimal_fracionario
end

puts 'Digite um numero binario: '
numero_binario = gets

numero_inteiro = converte_inteira_decimal numero_binario

numero_fracionario = converte_fracionario_decimal(numero_binario)

numero_decimal = numero_inteiro + numero_fracionario

puts numero_decimal
