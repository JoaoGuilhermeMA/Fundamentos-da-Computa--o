puts 'Deseja converter de numero para simbolo(1)'
puts 'ou de simbolo para numero(2)'
opcao = gets.to_i

case opcao
when 1
  puts 'Digite o numero de uma letra na tabela ascii'
  numero = gets.to_i
  simbolo = numero.chr
  puts "O numero convertido em simbolo fica: #{simbolo}"
when 2
  puts 'Digite um simbolo'
  simb = gets
  num = simb.ord
  puts "O numero do simbolo e #{num}"
end
