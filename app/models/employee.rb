# frozen_string_literal: true

require 'date'

class Employee < ApplicationRecord
  self.table_name = 'employees'

  validates :email, presence: true, uniqueness: true
  validates :employee_id, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name, :phone_number, :doj, :salary
  validates :phone_number, numericality: { only_numeric: true }

  def tax_amount
    income = yearly_salary

    if income <= 250_000
      0
    elsif income <= 500_000
      (income - 250_000) * 0.05
    elsif income <= 1_000_000
      (250_000 * 0.05) + ((income - 500_000) * 0.10)
    else
      (250_000 * 0.05) + (500_000 * 0.10) + ((income - 1_000_000) * 0.20)
    end
  end

  def cess_amount
    income = yearly_salary
    return unless income > 2_500_000

    (income - 2_500_000) * 0.02
  end

  def yearly_salary
    @yearly_salary ||= salary_calculation
  end

  def salary_calculation
    fiscal_month = 12
    joining_day = doj.day
    joining_month = (doj.month + 9) % 12
    joining_month = 12 if joining_month.zero?
    months_since_joining = fiscal_month - joining_month + 1
    join_month_salary = (salary / 30) * (joining_day - 1)
    (months_since_joining * salary) - join_month_salary
  end
end
