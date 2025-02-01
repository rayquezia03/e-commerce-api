namespace :db do
  namespace :populate do
    desc "Populate products"
    task products: :environment do 
      
      products = [
        { name: "Smartphone", description: "Smartphone com câmera de 12MP, 128GB de armazenamento.", price: 1999.99, stock_quantity: 50, image: "https://a-static.mlcdn.com.br/800x560/smartphone-samsung-galaxy-s24-62-galaxy-ai-128gb-preto-5g-8gb-ram-cam-tripla-50mp-selfie-12mp-bateria-4000mah-dual-chip/magazineluiza/238095100/7a9bbc219abcfaeb467a52274b1a0d5a.jpg", section: "Eletrônicos" },
        { name: "Laptop", description: "Laptop ultrafino com processador i7 e 16GB de RAM.", price: 4999.99, stock_quantity: 30, image: "https://m.media-amazon.com/images/I/51qYgtqNzYL.__AC_SX300_SY300_QL70_ML2_.jpg", section: "Eletrônicos" },
        { name: "Fone de Ouvido Bluetooth", description: "Fones de ouvido sem fio com cancelamento de ruído.", price: 399.99, stock_quantity: 100, image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSPYJJKKGOTUFmlRBU3L-VvFDJQv9Xejy7RfkZR-FI0nhieE-B-MJR1oZZu4UdMNaLpq-xlQJL1BHsRcne3pGax02DH-xTLmReIe8pamtY1HE0ypi-V8e-yfA_eazI6sNgzH4m0JuoHN2g&usqp=CAc", section: "Eletrônicos" },
        { name: "Relógio Inteligente", description: "Relógio inteligente com monitoramento de saúde e notificações.", price: 799.99, stock_quantity: 75, image: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSJyz3aG-6Xcty34OXuXkeqVlxqUboQ4HNI4lYeNIHgXDYRKQ-AbBMGXmlnceCMZ5Q44uxeukhiBUCITbgpbImKmCbVbvpCRsSBcYqZOUku93Ief1tcgyglzUcALk-3rRw6Ue3wKhhE5BI&usqp=CAc", section: "Eletrônicos" },
        { name: "Câmera Digital", description: "Câmera DSLR com lente de 18-55mm e 24MP.", price: 2500.00, stock_quantity: 20, image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRBNPiBw4uJU-Q9cWVRuIgU8M1LnspP_ldxeWAHzRaFvXZRHcLj0g7_07bw_0WzAvMf4SBP6dZoTqWsO3nB2AdUuNHKp41K5nWDfItzBUzmHLDx_uzwx6wSDQ&usqp=CAE", section: "Eletrônicos" },
        { name: "Monitor 4K", description: "Monitor LED 4K com tela de 32 polegadas.", price: 1500.00, stock_quantity: 40, image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRYmpJPd5444JECU1w04Oa9SZKcYUKiJEVia2GWfJP5H7DXrjJmr1j0CQ0bUuRiF8UTHsU_CywXRlUe1NbMUxCLqRpX6CbHKbk8An8rR3tAcelqoRUY6hli1sQxykCk-14M4gApIro&usqp=CAc", section: "Eletrônicos" },
        { name: "Teclado Mecânico", description: "Teclado mecânico com switches vermelhos e retroiluminação RGB.", price: 350.00, stock_quantity: 60, image: "hhttps://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRZtA_LTHoNNxrsSTi6SET2IYhp-aPynnLBGBtmutSaiFOsLoytBTaPN0tLr7P5c8R2TPPGj5wGqTU6Vx0cbFu-M8U-BQclOTcgASmcRqFT5fB_dRgnypccCS9kaWi6a6JhimcjzXI&usqp=CAc", section: "Eletrônicos" },
        { name: "Mouse Gamer", description: "Mouse ergonômico para jogos com 16000 DPI.", price: 150.00, stock_quantity: 80, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSHgRCIEB3Zw6roXWfGQsdjpHIWdIpbSn7w1dqlWVOnNK2lVm3OXH_adDFR1qVVJI4LaumCo9klGIlr50fvt13DKG0lWEqxs5kvEsWLSbOmeIRh1uKpEERJLBjdiJwGhyMkaTd6CdU&usqp=CAc", section: "Eletrônicos" },
        { name: "Cadeira Gamer", description: "Cadeira ergonômica para gamers com apoio de braço ajustável.", price: 999.99, stock_quantity: 15, image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRkstSM6H41Wg1xw5jnhV5zyXgZ3jkHJJAYNCZM9kQBh5kKnTS5RE1wQXO7DTM1ZU1xpB0xiK9dRwSQDgMI3Sd7F7S0pqMfSgKjnCgSY1rv26T2JRPeo8BudjiuYorz&usqp=CAc", section: "Eletrônicos" },
        { name: "Cafeteira", description: "Cafeteira elétrica com capacidade para 12 xícaras.", price: 299.99, stock_quantity: 100, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSPVEZ07Cr5-4ObMO4oR094Q1pir0Wivzxl7ebDL_JsJ1vrJ-O6PGNmr1HzOS-sfuVb837PBEWfcHOA0yvRCUeN_lxkYXZd4hor7PRZEGPzSWltwOm1jMlkASIAfE5vBzMT_V0Ul6qs2g&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Aspirador de Pó", description: "Aspirador de pó vertical sem fio com alta potência.", price: 499.99, stock_quantity: 45, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSu1_E_mGxjXE8ZO7fuc2xZQaWegc5NYqySnalnpYYchNPzgfVsyHlRncUtGK_KSW6XZJCFWEyVySJy3iQtIYHZY_r9KmgEa83DB9LDfoju5YtOIZHctTXKCw&usqp=CAE", section: "Eletrodomésticos" },
        { name: "Air Fryer", description: "Air fryer com 4L de capacidade e controle de temperatura.", price: 399.00, stock_quantity: 55, image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRRHr2HO8OYb-76HkN07J_ORkxWdHhzRrqrZ0oaUspAK8FTimusiTl3u_mJ1oId78rAKE6B24riG-zvuIfsClpNUAxPfOIYN8jOs8AF5duQiej7PlvvLiwYXa9yY327Yw6NzAHsNmk&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Fogão 4 Bocas", description: "Fogão a gás com 4 bocas e mesa de vidro temperado.", price: 799.00, stock_quantity: 20, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQVf1LaGiai0jYq-HP11mMX4OcWBU4oKLP2WIo2bHyoBWfA4d48hy5M5tuLzEQIubR7YzITpK2TKdVAoVILghr2iRt5IAEHhQBLHV4T2boxLD1LFmCfF0vEOYYLAT7UiorZQS-cTlJm&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Geladeira Inox", description: "Geladeira inox com 400L de capacidade e tecnologia frost free.", price: 3500.00, stock_quantity: 10, image: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRuq3-tU7158S_4nJlrGqG7PNUvfSyEELlad9C04i7er0KZkhStoIMdILyLL3JG1VPRaw9RotYC_o0sm-XwFLp2J0FiGAKO9w8_bV6A5fyTbkN5AR6KmlTeCw&usqp=CAE", section: "Eletrodomésticos" },
        { name: "Micro-ondas", description: "Micro-ondas com função grill e 20L de capacidade.", price: 450.00, stock_quantity: 60, image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTmzLrAKaTenC5HyOX1Krp08b3M9DEVJxNJfVO1wipKi2BBGAVpnyFhKdbqmDa5H-ysVgSatYgDOd2jDoWIzzDH4SLKGl5ER47c1Gdgomiayf6Dly5I9vch910JKDAxmnt-EROgczR8Tic&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Máquina de Lavar", description: "Máquina de lavar com 15kg de capacidade e função econômica.", price: 1200.00, stock_quantity: 25, image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRN2k5GDXaYAqptT_AxS3SSU5KfRL5WYeEtnII37_n28sAAdXdS-N3Mn-Ew-tP53kHr39hKCveQv7ViQVLTHskNEbS5TlX-Nyq37DVoeMuFniHSoK_xnxdQZkiWmyV-9YLme-w--WqcGXk&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Secador de Cabelo", description: "Secador de cabelo com 3 temperaturas e 2 velocidades.", price: 120.00, stock_quantity: 90, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTvwAXFeKYgnf1kYCJOy34McJofB_EpbyRo4k7c5UfEOJ82lwspb4mCVUJjkLvtE0cDq3Xlbxoeotthm0vjrBXbObV0q8BmoJN9VdaLNVlw42-NY4Hu2RHnucIlFbubfZSEInr4FtUAEQ&usqp=CAc", section: "Beleza" },
        { name: "Chuveiro Elétrico", description: "Chuveiro elétrico com 3 temperaturas e design moderno.", price: 159.00, stock_quantity: 70, image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTwj_LBTyDmlZoEknVDO18mplXoZxsm9PmJMObQE-yePjJQxXDb3TzAbp4V5cAWnx_7okXCm_HVPzC7Z4ZS8hw0qTNsQ2PEAm-qOttP_uppyPa3ZsB8qu3yYkL-T7VHJLabERnMH8uc5A&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Ventilador", description: "Ventilador de mesa com 3 velocidades e design compactado.", price: 79.00, stock_quantity: 150, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQPxWsm6jd3dglBOdE8MZnmR3Cvc4cpdGXolzleRgU7nBKr1PHQqPd3YUzYF0uOYksM-HZq3UMVFV21FmyUkZ9WkZWfz9lpdTKGtAMHiFNSByySCYp5MO0k&usqp=CAE", section: "Eletrodomésticos" },
        { name: "Climatizador", description: "Climatizador de ar com controle remoto e 3 modos de ventilação.", price: 250.00, stock_quantity: 40, image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQA6gO-WwqJFu70FyasX9jbu4F8lUkwGV6lR_MQXXvFG-X438wCWrE6nKuDc4z5_CpLdSyK3blih8SmFHS6_qNAPQFqbgwRWd50-4Je_DdqDc5EqHyUez3_yZfwaNYghaYIAviPfbM&usqp=CAc", section: "Eletrodomésticos" },
        { name: "Câmera de Segurança", description: "Câmera de segurança com visão noturna e conexão Wi-Fi.", price: 300.00, stock_quantity: 50, image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRTcxBmH5n-jee1-k370pE9OROTplVJeHjOhjyWI-lBjW-n9tkjQJU6rVOqHg-5VjPgebiPGD3WvTWPvvq7qYabztBziYM7_mVVaWMW8Q-lLT8PcypzU_arlABWSGd0kZCQR8TLUE0&usqp=CAc", section: "Segurança" },
        { name: "Aquecedor Elétrico", description: "Aquecedor elétrico com 2 níveis de temperatura.", price: 220.00, stock_quantity: 65, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTozxQl0fTVyRLSo0Z6LR20HFcl7dNdYzqMsg&s", section: "Eletrodomésticos" },
        { name: "Cinto de Segurança", description: "Cinto de segurança automotivo com fecho de alta resistência.", price: 60.00, stock_quantity: 200, image: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTyQZA45KM8suux7C6yLSpxqyMaD345Ei8ocN7lMUpbcEMmYSOsqQABsgTF7t2Wi7TUClE2C8tn1nuHYNWgl9iTCSv7QyXq17E59-2_t5rs6jTySbi_NhJrwg&usqp=CAE", section: "Automotivo" },
        { name: "Kit de Ferramentas", description: "Kit completo de ferramentas manuais com 150 peças.", price: 199.99, stock_quantity: 120, image: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQLZwalX51gi0B9khChG22Lm_-RiL5iPpmIF2CsB-FttKa2FlRH4ZTfznFXpg0u0Tftw-Jyy1eBnuqgPhzEBDGDMc75MFCQg_LcTxIL7L3MqJFiP169jhEKjw&usqp=CAE", section: "Ferramentas" },
        { name: "Mochila de Camping", description: "Mochila de camping com compartimentos impermeáveis e alças ajustáveis.", price: 350.00, stock_quantity: 30, image: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR4nNPtTqtr8dWhXlKCUJLHwoHCNtbPlq8vjfR2d7m_IXTm_hWGklfz5FrrzF0fWkNwyOcFVMzA6fL5xdH4LOeeLp-Affmet3UKyMt-8FhdsgzfHTqqbgnJLg&usqp=CAE", section: "Camping" },
        { name: "Cadeira de Camping", description: "Cadeira dobrável para camping com suporte para cooler.", price: 120.00, stock_quantity: 75, image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRO-u18HFwYevPKUQ3W4BEWNY7SMXjd9CzRvYVOP_DPp6c6dZAGEY8iEfIEdjxEH3UbRbdb2GsH-I9XcyI0sYb2smK9BjHE-1Ek6okG2fMzkiLtSi3vmCZq&usqp=CAE", section: "Camping" },
        { name: "Barraca de Camping", description: "Barraca para 4 pessoas com estrutura reforçada.", price: 600.00, stock_quantity: 25, image: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR73yFywjwqNdgTadRzHTbry-6DcjxK55HBwt_HLjPqlWUVpizKSP0vD1GDFdWy6wky811hckTI8lK3YFKTthO_Zpd8Da2vqFQYOjMhiMjl4eGKCbuivQA0q7uqFxv2P0nHz3JVufc&usqp=CAc", section: "Camping" },
        { name: "Bicicleta", description: "Bicicleta com 21 marchas e estrutura de alumínio.", price: 999.99, stock_quantity: 40, image: "https://images.tcdn.com.br/img/img_prod/394779/bicicleta_29_gts_m1_freio_a_disco_21_marchas_tsi_ride_new_1959_variacao_7641_1_098f2942af262fdc319f116844f43f05.jpg", section: "Esportes" }
    ]         
      
    products.each do |product|
      begin
        image = URI.open("#{product[:image]}?v=#{Time.now.to_i}")

        product_record = Product.find_or_create_by!(name: product[:name]) do |p|
          p.description = product[:description]
          p.price = product[:price]
          p.stock_quantity = product[:stock_quantity]
          p.section = product[:section]
          p.created_at = Time.now
          p.updated_at = Time.now
        end

        product_record.image.attach(io: image, filename: "#{product[:name].downcase.parameterize}.jpg", content_type: "image/jpeg")

        puts "Product #{product[:name]} populated successfully with image."

      rescue OpenURI::HTTPError => e
        puts "Failed to download image for product #{product[:name]}: #{e.message}"
      rescue => e
        puts "Error processing product #{product[:name]}: #{e.message}"
      ensure
        image.close if image.respond_to?(:close)
      end
    end
      
      puts "T======================= POPULATED ============================="
    end
  end
end