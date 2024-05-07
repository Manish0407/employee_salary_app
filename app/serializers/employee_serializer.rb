class EmployeeSerializer
  def initialize(employee)
    @employee = employee
  end

  def serializable_hash
    {
    	id: @employee.id,
      employee_code: @employee.employee_id,
      first_name: @employee.first_name,
      last_name: @employee.last_name,
      email: @employee.email,
      phone_number: @employee.phone_number,
      doj: @employee.doj,
      salary: @employee.salary,
      yearly_salary: @employee.yearly_salary,
      tax_amount: @employee.tax_amount,
      cess_amount: @employee.cess_amount
    }
  end

  def as_json(*)
    serializable_hash.as_json
  end
end
