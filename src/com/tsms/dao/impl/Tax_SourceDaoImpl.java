package com.tsms.dao.impl;

import java.util.List;
import java.util.Map;

import com.tsms.dao.Tax_SourceDao;
import com.tsms.entity.Tax_Source;
import com.tsms.util.DBUtil;
import com.tsms.util.StringUtil;

public class Tax_SourceDaoImpl implements Tax_SourceDao {

	private DBUtil db = DBUtil.getInstance();
	@Override
	public List<Map<String, String>> getAllTax_Sources(int pageNo, int pageSize,String payerCode,String payerName,int subOrganId,int industryId) {
		
		List<Map<String, String>> list1 = db.query("select * from  tb_tax_source s, tb_tax_payer p, tb_tax_organ o, tb_industry i where s.payerId=p.id and p.industryId=i.id and p.taxOrganId=o.id and s.removeState=0 and p.payerCode=? limit ?,?", payerCode,(pageNo - 1)*pageSize,pageSize);
		List<Map<String, String>> list2 = db.query("select * from  tb_tax_source s, tb_tax_payer p, tb_tax_organ o, tb_industry i where s.payerId=p.id and p.industryId=i.id and p.taxOrganId=o.id and s.removeState=0 and p.payerName=? limit ?,?", payerName,(pageNo - 1)*pageSize,pageSize);
		List<Map<String, String>> list3 = db.query("select * from  tb_tax_source s, tb_tax_payer p, tb_tax_organ o, tb_industry i where s.payerId=p.id and p.industryId=i.id and p.taxOrganId=o.id and s.removeState=0 and s.subOrganId=? limit ?,?", subOrganId,(pageNo - 1)*pageSize,pageSize);
		List<Map<String, String>> list4 = db.query("select * from  tb_tax_source s, tb_tax_payer p, tb_tax_organ o, tb_industry i where s.payerId=p.id and p.industryId=i.id and p.taxOrganId=o.id and s.removeState=0 and p.industryId=? limit ?,?", industryId,(pageNo - 1)*pageSize,pageSize);
		List<Map<String, String>> list5 = db.query("select * from  tb_tax_source s, tb_tax_payer p, tb_tax_organ o, tb_industry i where s.payerId=p.id and p.industryId=i.id and p.taxOrganId=o.id and s.removeState=0 limit ?,?", (pageNo - 1)*pageSize,pageSize);
		
		if(StringUtil.isNotBlank(payerCode)){
			return list1;
		}else if(StringUtil.isNotBlank(payerName)){
			return list2;
		}else if(subOrganId != -1){
			return list3;
		}else if(industryId != -1){
			return list4;
		}
		return list5;
		
		
	}
	@Override
	public int getAllTax_SourceByCount() {
		List<Map<String, String>> list = db.query("select count(*) cou from tb_tax_payer p, tb_tax_organ o, tb_industry i, tb_tax_source s where p.taxOrganId=o.id and p.industryId=i.id and s.payerId=p.id and s.removeState=0;");
		return Integer.parseInt(list.get(0).get("cou"));
	}
	@Override
	public List<Map<String, String>> getTax_SourceById(int id) {
		String sql = "select s.id,s.payerId,o.id as oid,i.id as iid,s.taskName,o.organName,t.taxerName,ta.taxerName as tatn,s.executeTime,s.taskState,p.payerCode,p.payerName,p.bizAddress,org.organName as orgon,i.industryName,p.bizScope,p.invoiceType,p.legalPerson,p.legalIdCard,p.finaceName,p.finaceIdCard,p.taxerName as ptn,p.recordDate,u.username from tb_tax_source s, tb_tax_payer p, tb_tax_organ o, tb_tax_organ org, tb_user u, tb_industry i, tb_taxer t, tb_taxer ta where s.payerId=p.id and s.subOrganId=o.id and p.taxOrganId=org.id and s.approverId=t.id and s.executeId=ta.id and s.recordUserId=u.id and p.industryId=i.id and s.id=?";
		List<Map<String, String>> list = db.query(sql, id);
		return list;
	}
	@Override
	public boolean updateTax_SourceById(Tax_Source ts) {
		boolean b = db.update("update tb_tax_source set subOrganId=?,approverId=?,executeId=?,executeTime=?,taskState=? where id=?", ts.getSubOrganId(),ts.getApproverId(),ts.getExecuteId(),ts.getExecuteTime(),ts.getTaskState(),ts.getId());
		return b;
	}
	@Override
	public boolean deleteTax_SourceById(int id) {
		boolean b = db.update("update tb_tax_source set removeState=1 where id=?", id);
		return b;
	}
	@Override
	public List<Map<String, String>> getTax_SourceByPayerCode(String payerCode) {
		List<Map<String, String>> list = db.query("select p.id,p.payerCode,p.payerName,p.bizAddress,p.taxOrganId,o.organName,p.industryId,i.industryName,p.bizScope,p.invoiceType,p.legalPerson,p.legalIdCard,p.finaceName,p.finaceIdCard,p.recordDate,u.username from tb_tax_payer p,tb_tax_organ o,tb_industry i, tb_user u where p.taxOrganId=o.id and p.industryId=i.id and p.userId=u.id and p.payerCode=?", payerCode);
		return list;
	}
	@Override
	public List<Map<String, String>> getNotInTax_Source(int pageNo, int pageSize) {
		List<Map<String, String>> list = db.query("select * from tb_tax_payer p,tb_tax_organ o,tb_industry i where p.id not in (select s.payerId from tb_tax_source s ) and p.industryId=i.id and p.taxOrganId=o.id and p.removeState =0 limit ?,?", (pageNo - 1)*pageSize,pageSize);
		return list;
	}
	@Override
	public int getNotInTax_SourceByCount() {
		List<Map<String, String>> list = db.query("select count(*) cou from tb_tax_payer p,tb_tax_organ o,tb_industry i where p.id not in (select s.payerId from tb_tax_source s ) and p.industryId=i.id and p.taxOrganId=o.id and p.removeState =0");
		return Integer.parseInt(list.get(0).get("cou"));
	}
	@Override
	public boolean addTax_Source(Tax_Source ts) {
		String sql = "insert into tb_tax_source(payerId,taskName,subOrganId,approverId,executeId,executeTime,taskState,recordUserId) values (?,?,?,?,?,?,?,?)";
		boolean b = db.update(sql, ts.getPayerId(),ts.getTaskName(),ts.getSubOrganId(),ts.getApproverId(),ts.getExecuteId(),ts.getExecuteTime(),ts.getTaskState(),ts.getRecordUserId());
		return b;
	}

}
