# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
 Type.create(name: 'bug')
 Type.create(name: 'task')

 Status.create(name: 'new')
 Status.create(name: 'active')
 Status.create(name: 'inactive')
 Status.create(name: 'resolved')
 Status.create(name: 'completed')
#   Mayor.create(name: 'Emanuel', city: cities.first)
