# To change this template, choose Tools | Templates
# and open the template in the editor.

Order.transaction do
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}" , :address => "#{i} Main Street" ,
      :email => "customer-#{i}@example.com" , :pay_type => "Check" )
  end
end