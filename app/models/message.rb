class Message < ApplicationRecord
    
    




    def return_task_and_bid_amount(body, contractor)
          arr = body.split(',')
          task_id = arr[0].to_i
          bid_amount = arr[1].to_i
        task = Task.find(task_id)
        bid = task.bids.find {|b| b.contractor_id == contractor.id }
        bid.update(price: bid_amount)
    end










end