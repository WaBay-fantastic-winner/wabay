module PriceSumable
  def project(id)
    Project.find(id)
  end

  def project_current_total(id)
    project(id).current_total
  end

  def percentage_of_currency(id)
    @percentage = ((project_current_total(id).to_f / project(id).amount_target).round(2) * 100).to_i
  end
end
