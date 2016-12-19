module ProductsHelper

  def convert_rate vat_type
    case vat_type
    when "zero"
      tax = "0%"
    when "reduce"
      tax = "5%"
    else
      tax = "20%"
    end
  end
 

  def tax_fees vat_type, amount
    case vat_type
    when "zero"
      total = "0"
    when "reduce"
      total = "#{(amount * 0.05)}"
    else
      total = "#{(amount * 0.20)}"
    end
  end 

end
