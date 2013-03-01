namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    #Rake::Task['db:reset'].invoke
    #make_projects
    #make_types
    #make_statuses
    make_tasks
 
  end
end

def make_projects
  
  50.times do |n|
    title  = Faker::Name.title
    description = Faker::Lorem.sentences(3)
    Project.create!(:title => title,:description => description)
  end
end


def make_tasks

  Project.all.each do |project|
    50.times do |n|
      title  = "task number #{n+1}"
      descr = Faker::Lorem.sentences(5)
      project.tasks.create!(:title => title, :description => descr,:status_id => [1,2,3,4,5].sample, :type_id => [1,2].sample)
    end
  end
end


