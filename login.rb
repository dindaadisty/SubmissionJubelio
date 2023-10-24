require 'selenium-webdriver'

url = 'https://app.jubelio.com/login'

driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

driver.navigate.to url

email = 'qa.rakamin.jubelio@gmail.com'
password = 'Jubelio123!'

begin
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  email_input = wait.until { driver.find_element(name: 'email') }
  password_input = wait.until { driver.find_element(name: 'password') }

  email_input.send_keys(email)
  password_input.send_keys(password)
  password_input.send_keys(:return)

  wait.until { driver.find_element(class: 'col-xs-10') }
  puts 'Login berhasil'
end

driver.quit