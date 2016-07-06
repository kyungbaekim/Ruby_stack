# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{first_name: 'Hello', last_name: 'World'},
                    {first_name: 'Kyungbae', last_name: 'Kim'},
                    {first_name: 'Junkyu', last_name: 'Yi'},
                    {first_name: 'Mattew', last_name: 'Yang'},
                    {first_name: 'Junho', last_name: 'Park'},
                    {first_name: 'Sangyoon', last_name: 'Lee'},
                    {first_name: 'Hongil', last_name: 'Kim'},
                    {first_name: 'Kihoon', last_name: 'Hong'},
                    {first_name: 'Tyler', last_name: 'Nguyen'}])
