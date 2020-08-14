class Assign < ApplicationRecord
  has_many :allocs
  belongs_to :member
  belongs_to :project
  has_one :job, through: :member
  has_one :group, through: :member

  scope :view, -> {
    select("groups.id as group_id")
    .select("groups.name as group_name")
    .select("jobs.id as job_id")
    .select("jobs.name as job_name")
    .select("jobs.rank as job_rank")
    .select("members.id as member_id")
    .select("members.number as member_number")
    .select("members.name as member_name")
    .select("projects.id as project_id")
    .select("projects.number as project_number")
    .select("projects.name as project_name")
    .select("assigns.id as assign_id")
    .select("allocs.id as alloc_id")
    .select("allocs.month as month")
    .select("allocs.cost as cost")
    .left_outer_joins(:allocs)
    .joins(:member)
    .joins(:project)
    .joins(:job)
    .joins(:group)
  }
end
