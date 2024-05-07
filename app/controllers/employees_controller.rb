# frozen_string_literal: true

class EmployeesController < ApplicationController
  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: { data: employee }
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def employee_detail
    employee = Employee.find(params[:id])
    render json: { data: EmployeeSerializer.new(employee),
                   message: 'Details of current financial year(April 2024 to March 2025)' }
  end

  private

  def employee_params
    params.require(:data).permit(:employee_id, :first_name, :last_name, :email, :phone_number, :doj, :salary)
  end
end
