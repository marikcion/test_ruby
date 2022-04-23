require './class_get.rb'
require './class_parser.rb'

url = ARGV[0]


response1 = Zapros.new()
pars = Parser.new()


html = response1.get_requsts(url).body_str
pars.object(html)
pars.parser()
pars.breadcrumbs()

url_2 = pars.chek()
if url_2 == 'https://oz.by/chocolate/?page=2'
    html_2 = response1.get_requsts(url_2).body_str
    pars.object(html_2)
    pars.parser()
    puts 'parser ok....'
else
    puts 'parser ok....'
end
