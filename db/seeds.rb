if User.count == 0
  User.create({email: "thanhkhoait@gmail.com", password: "password", active: true, role: "admin"})
end