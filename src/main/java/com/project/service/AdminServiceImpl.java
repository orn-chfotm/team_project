package com.project.service;

import org.springframework.stereotype.Service;

import com.project.domain.AdminDeleteDTO;
import com.project.domain.AdminPageDTO;
import com.project.domain.Criteria;
import com.project.domain.MemberVO;
import com.project.domain.TypeDTO;
import com.project.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	AdminMapper adminMapper;
	
	@Override  
	public AdminPageDTO getUser(Criteria cri) {
		return new AdminPageDTO(adminMapper.getUser(cri));
	}

	@Override
	public int getTotal() {
		return adminMapper.getTotal();
	}
	
	@Override
	public TypeDTO countType() {
		return adminMapper.getType();
	}

	@Override
	public int deleteUser(AdminDeleteDTO userids) {
		int result = 1; 
		for(String user_id : userids.getUser_id()) {
			result *= adminMapper.deleteUser(user_id);
		}
		return result;
	}

	@Override
	public AdminPageDTO getAdmin() {
		return new AdminPageDTO(adminMapper.getAdmin());
	}

	@Override
	public int insertAdmin(MemberVO adminvo) {
		return adminMapper.insertAdmin(adminvo);
	}

	@Override
	public int deleteAdmin(AdminDeleteDTO adminids) {
		int result = 1; 
		for(String user_id : adminids.getUser_id()) {
			result *= adminMapper.deleteAdmin(user_id);
		}
		return result;
	}

	@Override
	public int updateAdmin(MemberVO adminvo) {
		return adminMapper.updateAdmin(adminvo);
	}

}
