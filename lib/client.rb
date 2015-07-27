class Client
    attr_accessor :name, :id, :address, :phone

    def initialize(name, id, address, phone)
        @name = name
        @id = id
        @address = address
        @phone = phone
    end

    def to_s
        @name
    end
end