#Está no dev:setup (lib/tas/dev.rake)
=begin
spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
    spinner.auto_spin

coins = [
    {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://static.vecteezy.com/system/resources/previews/008/822/061/original/3d-design-bitcoin-cryptocurrency-white-background-free-png.png"
    },
    {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"
    },
    {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png"
    },
    {
    description: "Iota",
    acronym: "IOT",
    url_image: "https://seeklogo.com/images/I/iota-miota-logo-637A80FF6E-seeklogo.com.png"
    },
    {
    description: "Zcash",
    acronym: "ZEC",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"
    }
]
coins.each do |coin|
    Coin.find_or_create_by!(coin)
end


    =begin
    Coin.create!(
        [
            {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://static.vecteezy.com/system/resources/previews/008/822/061/original/3d-design-bitcoin-cryptocurrency-white-background-free-png.png"
            },
            {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"
            },
            {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png"
            },
            {
            description: "Iota",
            acronym: "IOT",
            url_image: "https://seeklogo.com/images/I/iota-miota-logo-637A80FF6E-seeklogo.com.png"
            },
            {
            description: "Zcash",
            acronym: "ZEC",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"
            }
        ]
    )
    =end
spinner.success("(CONCLUÍDO!)")
=end

