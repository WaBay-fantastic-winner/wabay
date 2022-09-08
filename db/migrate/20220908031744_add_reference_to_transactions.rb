class AddReferenceToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :project, index: true
  end
end
