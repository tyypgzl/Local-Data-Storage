import 'package:floor/floor.dart';
import 'package:local_strorage/floor/model/employee_model.dart';

@dao
abstract class EmployeeDao {
  @Query('SELECT * FROM Employee WHERE id= :id')
  Future<Employee?> findEmployee(int id);

  @Query('SELECT * FROM Employee')
  Future<List<Employee>?> findAllEmployee();

  @insert
  Future<void> insertEmployee(Employee employee);

  @insert
  Future<void> insertEmployees(List<Employee> employees);

  @update
  Future<void> updateEmployee(Employee employee);

  @delete
  Future<void> deleteEmployee(Employee employee);

  @delete
  Future<void> deleteEmployees(List<Employee> employees);

  @Query('DELETE FROM Employee')
  Future<void> deleteAllEmployee();
}
