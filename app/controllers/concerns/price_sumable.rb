module PriceSumable
  def project_current_total(project_id)
    @sum_of_project = Project.find(project_id).current_total
  end
  
  def percentage_of_currency
    @percentage = ((@sum_of_project.to_f / @project.amount_target).round(2) * 100).to_i
  end
end