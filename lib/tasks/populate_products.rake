namespace :db do
    namespace :populate do
      desc "Populate products"
      task products: :environment do 
        
        products = [
          { name: "Smartphone", description: "Smartphone com câmera de 12MP, 128GB de armazenamento.", price: 1999.99, stock_quantity: 50, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Laptop", description: "Laptop ultrafino com processador i7 e 16GB de RAM.", price: 4999.99, stock_quantity: 30, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Fone de Ouvido Bluetooth", description: "Fones de ouvido sem fio com cancelamento de ruído.", price: 399.99, stock_quantity: 100, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Relógio Inteligente", description: "Relógio inteligente com monitoramento de saúde e notificações.", price: 799.99, stock_quantity: 75, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Câmera Digital", description: "Câmera DSLR com lente de 18-55mm e 24MP.", price: 2500.00, stock_quantity: 20, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Monitor 4K", description: "Monitor LED 4K com tela de 32 polegadas.", price: 1500.00, stock_quantity: 40, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Teclado Mecânico", description: "Teclado mecânico com switches vermelhos e retroiluminação RGB.", price: 350.00, stock_quantity: 60, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Mouse Gamer", description: "Mouse ergonômico para jogos com 16000 DPI.", price: 150.00, stock_quantity: 80, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Cadeira Gamer", description: "Cadeira ergonômica para gamers com apoio de braço ajustável.", price: 999.99, stock_quantity: 15, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrônicos" },
          { name: "Cafeteira", description: "Cafeteira elétrica com capacidade para 12 xícaras.", price: 299.99, stock_quantity: 100, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Aspirador de Pó", description: "Aspirador de pó vertical sem fio com alta potência.", price: 499.99, stock_quantity: 45, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Air Fryer", description: "Air fryer com 4L de capacidade e controle de temperatura.", price: 399.00, stock_quantity: 55, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Fogão 4 Bocas", description: "Fogão a gás com 4 bocas e mesa de vidro temperado.", price: 799.00, stock_quantity: 20, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Geladeira Inox", description: "Geladeira inox com 400L de capacidade e tecnologia frost free.", price: 3500.00, stock_quantity: 10, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Micro-ondas", description: "Micro-ondas com função grill e 20L de capacidade.", price: 450.00, stock_quantity: 60, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Máquina de Lavar", description: "Máquina de lavar com 15kg de capacidade e função econômica.", price: 1200.00, stock_quantity: 25, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Secador de Cabelo", description: "Secador de cabelo com 3 temperaturas e 2 velocidades.", price: 120.00, stock_quantity: 90, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Beleza" },
          { name: "Chuveiro Elétrico", description: "Chuveiro elétrico com 3 temperaturas e design moderno.", price: 159.00, stock_quantity: 70, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Ventilador", description: "Ventilador de mesa com 3 velocidades e design compactado.", price: 79.00, stock_quantity: 150, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Climatizador", description: "Climatizador de ar com controle remoto e 3 modos de ventilação.", price: 250.00, stock_quantity: 40, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Câmera de Segurança", description: "Câmera de segurança com visão noturna e conexão Wi-Fi.", price: 300.00, stock_quantity: 50, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Segurança" },
          { name: "Aquecedor Elétrico", description: "Aquecedor elétrico com 2 níveis de temperatura.", price: 220.00, stock_quantity: 65, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Eletrodomésticos" },
          { name: "Cinto de Segurança", description: "Cinto de segurança automotivo com fecho de alta resistência.", price: 60.00, stock_quantity: 200, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Automotivo" },
          { name: "Kit de Ferramentas", description: "Kit completo de ferramentas manuais com 150 peças.", price: 199.99, stock_quantity: 120, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Ferramentas" },
          { name: "Mochila de Camping", description: "Mochila de camping com compartimentos impermeáveis e alças ajustáveis.", price: 350.00, stock_quantity: 30, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Camping" },
          { name: "Cadeira de Camping", description: "Cadeira dobrável para camping com suporte para cooler.", price: 120.00, stock_quantity: 75, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Camping" },
          { name: "Barraca de Camping", description: "Barraca para 4 pessoas com estrutura reforçada.", price: 600.00, stock_quantity: 25, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Camping" },
          { name: "Bicicleta", description: "Bicicleta com 21 marchas e estrutura de alumínio.", price: 999.99, stock_quantity: 40, image: "https://cdn.awsli.com.br/2500x2500/1965/1965063/produto/17840338592397ef767.jpg", section: "Esportes" }
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
  