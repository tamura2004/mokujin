MONTHS = 12.times.map { _1.months.after.beginning_of_month } 

10.times do |id|
  Group.seed do |s|
    s.id = id
    s.name = "group_#{id}"
  end

  Job.seed do |s|
    s.id = id
    s.name = "job_#{id}"
    s.rank = id
  end

  Member.seed do |s|
    s.id = id
    s.group_id = id
    s.job_id = id
    s.number = "member_number_#{id}"
    s.name = "member_name_#{id}"
  end
  
  Project.seed do |s|
    s.id = id
    s.number = "project_number_#{id}"
    s.name = "project_name_#{id}"
  end

  Assign.seed do |s|
    s.id = id
    s.member_id = 0
    s.project_id = id
  end

  MONTHS.each_with_index do |month, i|
    next if rand < 0.5
    next if id == 5
    Alloc.seed do |s|
      s.id = id * 100 + i
      s.month = month
      s.assign_id = id
      s.cost = rand(1..100) / 10.0
    end
  end
end






