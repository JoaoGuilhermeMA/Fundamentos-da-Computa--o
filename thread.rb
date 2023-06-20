$tem_tempo = true
$resultados_certos = []
$operacoes_feitas = []
$tempo_limite = 10
$resposta_digitada = []

puts "Bem-vindo ao jogo de matemática!"
puts "Responda o máximo de perguntas que puder em #{$tempo_limite} segundos."
puts "-------------------------------"

    def mostrar_tempo(segundos)
        print "\rTempo restante: #{segundos} segundo(s): "
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
        a = rand(1..100)
        b = rand(1..100)
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
    end

    def jogo
        while $tem_tempo
            if $tem_tempo
                puts "\r Digite o resultado da opercao: #{gerar_operacao[0]}"
                res = gets 
                $resposta_digitada << res
            end
        end
    end

    t = Thread.new do 
        temporizador
        puts "\n"
    end

    t2 = Thread.new do
        jogo
    end 
    t.join
    t2.join

jogo

$resposta_digitada.each do |i|
    puts i
end
