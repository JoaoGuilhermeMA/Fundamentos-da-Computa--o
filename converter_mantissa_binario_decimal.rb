include Math

def pegar_partes(numero_binario)
  numero_binario = numero_binario.to_s
  expoente = numero_binario[1..8]
  mantissa = numero_binario[9..32]
  sinal = numero_binario[0]
  [sinal, expoente, mantissa]
end

def calcular_mantissa(numero_binario)
  numero = pegar_partes numero_binario
  mantissa = numero[2]
  qntd_tabela = mantissa.size - 1
  f = 0.0
  for j in 0..qntd_tabela do
    f += 2**((j + 1) * -1) if mantissa[j] == '1'
  end
  f += 1
end

def calcular_expoente(numero_binario)
    numero = pegar_partes numero_binario
    expoente = numero[1]
    numero_decimal = 0
    qntd_tabela = expoente.size
    expoente = expoente.reverse
    for i in 0..qntd_tabela do
        numero_decimal += 2**(i) if expoente[i] == '1'
      end
    
    e = numero_decimal - 127
end

def calcular_sinal(numero_binario)
    numero = pegar_partes numero_binario
    sinal = numero[0]
end

def calcular_tudo(numero_binario)
    s = calcular_sinal numero_binario
    f = calcular_mantissa numero_binario
    e = calcular_expoente numero_binario

    numero_decimal = (-1)**s.to_i * f.to_f * 2**e.to_i
    if e == 1
        numero_decimal * -1
    end
    numero_decimal
end

puts 'Digite um numero binario em forma de mantissa:'
numero_binario = gets.to_s

numero_decimal = calcular_tudo numero_binario

puts numero_decimal

# n = (-1)^s * 1*f * 2^e
# 10000011
