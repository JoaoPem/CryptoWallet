namespace :dev do
    desc "Configurando ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        show_spinner("Apagando BD...") { %x(rails db:drop) }
        show_spinner("Criando BD...") { %x(rails db:create) }
        show_spinner("Migrando BD...") { %x(rails db:migrate) }
        show_spinner("Populando BD...") { %x(rails db:seed) }
        %x(rails dev:add_mining_types)
        %x(rails dev:add_coins)
      else
        puts "Você não está no modo Desenvolvimento!"
      end
    end
  
    desc "Cadastra Moedas"
    task add_coins: :environment do
      show_spinner("Cadastrando Moedas...") do
        coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://static.vecteezy.com/system/resources/previews/008/822/061/original/3d-design-bitcoin-cryptocurrency-white-background-free-png.png",
            mining_type: MiningType.first
          },
         {
           description: "Ethereum",
           acronym: "ETH",
           url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png",
           mining_type: MiningType.find_by(acronym: "PoS")
          },
         {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png",
            mining_type: MiningType.where(acronym: "PoW" ).first
         },
        {
            description: "Iota",
            acronym: "IOT",
            url_image: "https://seeklogo.com/images/I/iota-miota-logo-637A80FF6E-seeklogo.com.png",
            mining_type: MiningType.find_by(acronym: "PoC")
         },
         {
            description: "Zcash",
            acronym: "ZEC",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png",
            mining_type: MiningType.all.sample
          }
        ]
        coins.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end
    end
  
    desc "Cadastra Tipos de Mineração"
    task add_mining_types: :environment do
      show_spinner("Cadastrando Tipos...") do
        mining_types = [
          { description: "Proof of Work", acronym: "PoW" },
          { description: "Proof of Stake", acronym: "PoS" },
          { description: "Proof of Capacity", acronym: "PoC" }
        ]
        mining_types.each do |type|
          MiningType.find_or_create_by!(type)
        end
      end
    end
  
    def show_spinner(msg_start, msg_end = "Done!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
  end
  