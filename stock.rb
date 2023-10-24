require 'selenium-webdriver'

url1 = 'https://app.jubelio.com/login'
url2 = 'https://app.jubelio.com/home/inventory'

driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

driver.navigate.to url1

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

driver.navigate.to url2

begin
  wait = Selenium::WebDriver::Wait.new(timeout: 5)
  element = wait.until { driver.find_element(xpath: "//button[@class='ladda-button btn btn-primary m-l-xs' and span[text() = 'Penyesuaian Persediaan']]") }
  element.click

  wait.until { driver.find_element(class: 'page-editor') }
  puts 'Berhasil masuk ke Halaman Persediaan'
end

driver.quit