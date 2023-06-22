$tem_tempo = true
$resultados_certos = []
$operacoes_feitas = []
$tempo_limite = 10
$range = 1..10
$resposta_digitada = []

def mostrar_tempo(segundos)
    print "\rTempo restante: #{segundos} segundo(s)| Digite o resultado da opercao: #{$valores}: "
    sleep 1
end

def temporizador
    (1..$tempo_limite).reverse_each do |i|
        mostrar_tempo i
        calcular
    end
    $tem_tempo = false
end  

def gerar_operacao
    a = rand($range)
    b = rand($range)
    operadores = ['+', '-', '/','*']
    op = operadores.sample
    ["#{a} #{op} #{b}", [a,b,op]]
end

def calcular
    a = gerar_operacao[1][0]
    b = gerar_operacao[1][1]
    op = gerar_operacao[1][2]
    resultado =0
    case op
    when '+'
    resultado = a + b
    when '-'
        resultado = a - b
    when '*'
        resultado = a * b
        resultado = a / b
    end
    $operacoes_feitas << gerar_operacao[0]
    $resultados_certos << resultado.to_i
end

def jogo
    $valores = gerar_operacao[0]
    while $tem_tempo
        if $tem_tempo
            res = gets.to_i
            $valores = gerar_operacao[0]
            $resposta_digitada << res
        end
    end
end

puts "Bem-vindo ao jogo de matemática!"
puts "Responda o máximo de perguntas que puder em #{$tempo_limite} segundos."
puts "Deseja inicia-lo?"
resposta = gets 
puts "-------------------------------"

if resposta
    t = Thread.new do 
        temporizador
    end
    jogo
    t.join
end


#puts "\e[H\e[2J"

$resposta_digitada.zip($resultados_certos).each do |i, j|
    puts "acertou #{i}, #{j}"
end
