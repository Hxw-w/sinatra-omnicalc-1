require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** (1.0/2)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("users_apr").to_f
  @years = params.fetch("users_years").to_f
  @principal = params.fetch("users_principal").to_f

  monthly_rate = (@apr * 0.01) / 12
  total_payments = @years * 12

  raw_payment = @principal * (monthly_rate * (1 + monthly_rate) ** total_payments) /
                             ((1 + monthly_rate) ** total_payments - 1)
  @payment = raw_payment.to_fs(:currency)

  @principal_display = @principal.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do 
  @min = params.fetch("users_min").to_f
  @max = params.fetch("users_max").to_f

  @random_result = rand(@min..@max)
  erb(:random_results)
end
