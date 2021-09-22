package com.project.service;

import com.project.domain.AdminDeleteDTO;
import com.project.domain.AdminPageDTO;
import com.project.domain.Criteria;
import com.project.domain.MemberVO;
import com.project.domain.TypeDTO;
 
public interface AdminService {
	
	public AdminPageDTO getUser(Criteria cri);
	
	public int getTotal();
	
	public TypeDTO countType();
	
	public int deleteUser(AdminDeleteDTO userids);
	
	public AdminPageDTO getAdmin();
	
	public int insertAdmin(MemberVO adminvo);
	
	public int deleteAdmin(AdminDeleteDTO adminids);
	
	public int updateAdmin(MemberVO adminvo);
}
