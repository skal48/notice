package com.gdu.myapp;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gdu.myapp.dao.NoticeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml")
public class ServiceTest {
  
  @Autowired
  private NoticeMapper noticeMapper;
  
  @Test
  public void test01_갯수테스트() {
    int fiveResult = noticeMapper.countSelect();
    assertEquals(6, fiveResult);
  }

}
