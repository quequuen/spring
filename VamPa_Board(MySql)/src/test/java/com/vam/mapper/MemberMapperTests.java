package com.vam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.mapper.MemberMapper;
import com.vam.model.MemberVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper;
	
	@Test
	public void memberJoin() throws Exception{
		MemberVO member = new MemberVO();
		
		member.setMemberId("test1");
		member.setMemberPw("test1");
		member.setMemberName("test1");
		member.setMemberMail("test1");
		member.setMemberAddr1("test1");
		member.setMemberAddr2("test1");
		member.setMemberAddr3("test1");
		
		membermapper.memberJoin(member);
	}
	
	@Test
	public void memberIdChk() throws Exception{
		String id = "admin";
		String id2 = "test123";
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}
	

    /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void memberLogin() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        member.setMemberId("test1");
        member.setMemberPw("test1");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        //member.setMemberId("test1123");
        //member.setMemberPw("test1321321");
        
        membermapper.memberLogin(member);
        System.out.println("결과 값 : " + membermapper.memberLogin(member));
        
    }
	


}
