require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './../lib/department'
require_relative './../lib/employee'

class DepartmentTest < Minitest::Test
  def setup
    @customer_service = Department.new("Customer Service")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  def test_it_exists
    assert_instance_of Department, @customer_service
  end

  def test_it_has_attributes
    assert_equal [], @customer_service.employees
    assert_equal "Customer Service", @customer_service.name
  end

  def test_it_can_hire
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)

    assert @customer_service.employees.include?(@bobbi)
    assert @customer_service.employees.include?(@aaron)
    assert_equal 2, @customer_service.employees.length
  end

  def test_it_can_create_expenses
    @customer_service.expense(100)
    @customer_service.expense(25)
    assert_equal 125, @customer_service.expenses
  end
end
