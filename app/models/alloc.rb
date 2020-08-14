class Alloc < ApplicationRecord
  belongs_to :assign
  has_one :member, through: :assign
  has_one :job, through: :member
  has_one :group, through: :member
  has_one :project, through: :assign

  scope :view, -> {
    select("*")
    .select("allocs.id as alloc_id")
    .select("members.number as member_number")
    .select("members.name as member_name")
    .select("projects.number as project_number")
    .select("projects.name as project_name")
    .select("jobs.name as job_name")
    .select("groups.name as group_name")
    .joins(:member)
    .joins(:project)
    .joins(:job)
    .joins(:group)
  }

end
