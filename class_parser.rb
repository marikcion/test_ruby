require 'nokogiri'
require './class_save.rb'



class Parser

    def object(html)
        @soup = Nokogiri::XML(html)
        @content_arr = []
    end

    def parser()
        url_domen = 'https://oz.by'
        @soup.xpath("//div[@class='item-type-card__item']").each do |element|
            if element.at(".//a[@class='item-type-card__link']//@href")
                link = url_domen + element.at(".//a[@class='item-type-card__link']//@href").to_s
            else
                link = 'xpath не работает'
            end
            if element.at(".//p[@class='item-type-card__title']")
                title = element.at(".//p[@class='item-type-card__title']") 
            else
                title = 'xpath не работает'
            end
            if element.at(".//span[@class='product-label product-label_chance']")
                promo = element.at(".//span[@class='product-label product-label_chance']").content  
            else
                promo = '-'
            end
            if element.at(".//p[@class='item-type-card__info']")
                brend = element.at(".//p[@class='item-type-card__info']")
            else
                brend = 'xpath не работает'
            end
            if element.at(".//span[@class='item-type-card__btn']")
                price = element.at(".//span[@class='item-type-card__btn']")
            else
                price = 'xpath не работает'
            end
            if element.at(".//img[@class='viewer-type-list__img']//@src")
                url_img = element.at(".//img[@class='viewer-type-list__img']//@src")
            else
                url_img = 'xpath не работает'
            end
            @content_arr.push({    
                link: link,
                title: title.text.strip,
                promo: promo, 
                brend: brend.text.strip,
                url_img: url_img.to_s,
                price: price.text.strip
            })
        end

    end

    def breadcrumbs()
        res = @soup.xpath("//div[@class='breadcrumbs__inner']")
        puts res
    end

    def chek()
        url_domen = 'https://oz.by'
        if @soup.at(".//a[@class='g-pagination__list__item']//@href")
            return  url_domen + @soup.at(".//a[@class='g-pagination__list__item']//@href").to_s
        else
            puts 'no pagination on the page'
        end
    end
end