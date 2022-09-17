module ProjectPriceSum
  def project_current_total(project_id)
    @sum = Project.find(project_id).current_total
  end
  
  def percentage_of_currency(project_id)
    @percentage = ((Project.find(project_id).current_total.to_f / @project.amount_target).round(2) * 100).to_i
  end
end