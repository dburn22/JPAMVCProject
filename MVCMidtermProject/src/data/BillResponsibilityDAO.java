package data;

import entities.BillResponsibility;

public interface BillResponsibilityDAO {
	public BillResponsibility updateResponsibility(int id, BillResponsibility br);
	public BillResponsibility showResponsibility(int id);
	public BillResponsibility createResponsibility(BillResponsibility br);
}
