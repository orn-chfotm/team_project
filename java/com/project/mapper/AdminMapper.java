package com.project.mapper;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.MemberVO;
import com.project.domain.TypeDTO;

public interface AdminMapper {
	
	public List<MemberVO> getUser(Criteria cri);
	
	public int getTotal();
	
	public TypeDTO getType();
	
	public int deleteUser(String user_id); 
	
	public List<MemberVO> getAdmin();
	
	public int insertAdmin(MemberVO adminvo);
	
	public int deleteAdmin(String admin_id);
	
	public int updateAdmin(MemberVO adminvo);
}
