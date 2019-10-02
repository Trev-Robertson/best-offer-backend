class Message < ApplicationRecord
    
    




    def self.return_task_and_bid_amount(body, contractor)
          arr = body.split(',')
          task_id = arr[0].tr('^A-Za-z0-9', '').to_i
          bid_amount = arr[1].tr('^A-Za-z0-9', '').to_i
            if (Task.find(task_id) && bid_amount > 0)
              
              task = Task.find(task_id)
              user = User.find(task.user_id)
           
              bid = task.bids.find {|b| b.contractor_id == contractor.id }
              bid.update(price: bid_amount)
              return [task, bid, user]
            end
          return false
    end










end