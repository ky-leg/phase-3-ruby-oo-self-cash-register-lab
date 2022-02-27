require "pry"
class CashRegister
    
    attr_accessor :total, :discount, :items, :txn_price

    def initialize(discount=0)
        @total=0
        @discount=discount.to_f
        @items=[]
        @txn_price=0
    end

    def add_item(title, price, quantity=1)
        # binding.pry
        if quantity==1
        @items << title
        @txn_price = price
        @total+=price
        elsif quantity>1
            @txn_price = price*quantity
            while quantity >=1 do 
                # binding.pry
                @items << title
                
                @total+=price
                quantity -=1
            end
        end
    end

    def apply_discount
        @total=(@total*(1-(@discount/100))).to_i
        if @discount != 0
        "After the discount, the total comes to $#{@total}." if @discount != 0
        else
        "There is no discount to apply."
        end 
    end

    def void_last_transaction
        binding.pry
        @total = @total - @txn_price
    end

end

kyle = CashRegister.new(20)
kyle.add_item "cheerios", 2.40, 3
kyle.void_last_transaction
