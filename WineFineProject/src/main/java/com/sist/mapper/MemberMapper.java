package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberMapper {
	// 회원 아이디 확인
	@Select("SELECT COUNT(*) FROM member WHERE id=#{id}")
    public int memberCountId(String id);
		
	// 회원 비밀번호 찾기
	@Select("SELECT pwd FROM member WHERE id=#{id}")
	public String memberGetPwd(String id);
	
	// 회원 목록 조회
    @Select("SELECT * FROM member ORDER BY regdate DESC")
    public List<MemberVO> memberList();

    // 회원 삭제
    @Delete("DELETE FROM member WHERE id=#{id}")
    public void deleteMember(String id);

    // 회원 상세 조회
    @Select("SELECT * FROM member WHERE id=#{id}")
    public MemberVO memberDetail(String id);

    // 회원 정보 수정
    @Update("UPDATE member SET nickname=#{nickname}, name=#{name}, phone=#{phone}," 
            +"addr1=#{addr1}, addr2=#{addr2}, email=#{email} WHERE id=#{id}")
    public void updateMember(MemberVO member);
}