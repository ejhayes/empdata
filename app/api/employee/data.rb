module Employee
  class Data < Grape::API
 
    resource :employee_data do
      desc "List all Employee"
      get do
        EmpDatum.all
      end

      desc "create new employee"
      params do
      	requires :name, type: String
      	requires :address, type: String
      	requires :age, type:Integer
      end
 	    post do
        EmpDatum.create!({
          name: params[:name],
          address: params[:address],
          age: params[:age]
        })
      end

      desc 'delete an emp'
      params do
        requires :id, type: String
      end
      delete ':id' do
         EmpDatum.find(params[:id]).destroy!
      end

      desc "update an employee address"
      params do
        requires :id, type: String
        requires :address, type:String
      end
      put ':id' do
        EmpDatum.find(params[:id]).update({
          address:params[:address]
        })
      end

    end
 
  end
end