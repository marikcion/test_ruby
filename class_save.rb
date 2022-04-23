require 'securerandom'

class Save
    def save_file(html)
        name = SecureRandom.hex(10)         
        File.open("./save_file/#{name}.html", "w") do |file|
            file.write(html)
        end
    end
end