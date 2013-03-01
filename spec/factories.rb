FactoryGirl.define do
  factory :project do
  	title               "Example project"
  	description 		"Example description"
  end
  
  factory :type do
  	name				"bug"
  end	

  factory :status do
  	name				"new"
  end

  factory :task do
  	title				"Example task"
  	description			"exmple descr"
    position       123
  	association 		:project
  	association 		:type
  	association 		:status
  end
end
