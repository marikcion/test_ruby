require 'csv'

class Save
    def save(file, name)
        CSV.open("./#{name}.csv", 'a', write_headers: true, headers: file.first.keys) do |csv|
           file.each do |item|
               csv << item.values
           end 
        end
    end
end