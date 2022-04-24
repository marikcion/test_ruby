require './class_get.rb'
require './class_parser.rb'

url = ARGV[0]

zapros = Zapros.new
pars = Parser.new
saver = Save.new


2.times do
    html = zapros.get_requsts(url)
    arr, url, name = pars.go(html.body_str)
    if url.nil?
        saver.save(arr, name) 
        break
    end
    if arr.length > 150
        saver.save(arr, name)
        break
    end
end