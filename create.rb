700.times{|i|
u = User.new
u.email = "swaero#{i}@mehub4u.com"
u.password = "swaero123"
u.password_confirmation = "swaero123"
u.save
u.add_role :student
}
