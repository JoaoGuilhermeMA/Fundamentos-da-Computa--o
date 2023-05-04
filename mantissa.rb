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

def pega_mantissa(_numero_binario, _fracionario_binario)
  numero = '10000.10101'
  acha_o_um = numero.index('1')
  acha_o_ponto = numero.index('.', acha_o_um + 1)
  posicao_antiga = acha_o_ponto
  numero = numero[0..acha_o_ponto - 1] + numero[acha_o_ponto + 1..-1] if acha_o_ponto
  numero.insert(acha_o_um + 1, '.')
  numero << '0' while numero.size < 25
  numero_sem_ponto = numero[2..-1]
  [numero, posicao_antiga, numero_sem_ponto, numero_sem_ponto]
end

def pega_expoente(numero_binario, fracionario_binario, numero)
  posicao_antiga = pega_mantissa(numero_binario, fracionario_binario)
  expoente = posicao_antiga[1] - 1
  sinal = verifica_sinal(numero)
  if sinal
    expoente += 127
  else
    expoente -= 127
  end
  expoente_binario = converter_parte_inteira expoente
end

def verifica_sinal(numero)
  sinal = true
  sinal = false if numero.to_i < 0
  sinal
end

puts 'Digite um numero em decimal'
numero = gets
numero_inteiro = numero.to_i
numero_binario = converter_parte_inteira numero_inteiro
fracionario_binario = converte_parte_fracionaria numero, numero_inteiro
n = pega_mantissa numero_binario, fracionario_binario
mantissa = n[0]
mantissa_sem_ponto = n[2]
expoente = pega_expoente numero_binario, fracionario_binario, numero
sinal = verifica_sinal numero
puts '======================================================'
puts "A parte inteira do numero binario e #{numero_binario}"
puts '======================================================'
puts "A parte fracionaria do numero binario e #{fracionario_binario}"
puts '======================================================'
puts "A mantissa do numero e #{mantissa}"
puts '======================================================'
puts "o expoente do numero e #{expoente}"
puts '======================================================'
puts 'O numero na representação IEEE754 - prescisão simples é: '
if sinal
  puts "0#{expoente}#{mantissa_sem_ponto}"
else
  puts "1#{expoente}#{mantissa_sem_ponto}"
end
