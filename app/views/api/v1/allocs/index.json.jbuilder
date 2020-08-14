# dataおよびcolumnsはHandsontableのオプション名

json.columns do
  json.child! do
    json.title "project_id"
    json.data "project_id"
  end
  json.child! do
    json.title "案件"
    json.data "project"
  end
  json.array! @months do |month|
    json.title month
    json.data month + ".cost"
    json.type "numeric"
    json.numericFormat do
      json.pattern "0.0"
    end
  end
end

json.data do
  json.array! @allocs.group_by(&:project_name) do |project_name, allocs|
    json.project_id allocs[0].project_id
    json.project project_name
    allocs.each do |alloc|
      json.set! alloc.month.strftime("%m月") do
        json.id alloc.alloc_id
        json.cost alloc.cost
      end
    end
  end
end

