package egovframework;

import java.sql.Connection;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import egovframework.com.cmm.ComUtil;

@Component
public class DataRunner implements ApplicationRunner {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        try(Connection connection = dataSource.getConnection()){
			String sstime= ComUtil.getTime("yyyyMMddHHmmss");
//			String URL = connection.getMetaData().getURL();
//			String User = connection.getMetaData().getUserName();

            Statement statement = connection.createStatement();
            StringBuffer comtnUserMng = new StringBuffer();
            comtnUserMng.append("\n CREATE TABLE COMTNUSERMNG                       ");
            comtnUserMng.append("\n (                                               ");
            comtnUserMng.append("\n 	USR_ID               		VARCHAR(20) NOT NULL, ");
            comtnUserMng.append("\n 	PASSWORD              VARCHAR(200) NOT NULL,  ");
            comtnUserMng.append("\n 	PASSWORD_HINT      VARCHAR(100) ,             ");
            comtnUserMng.append("\n 	PASSWORD_CNSR     VARCHAR(100) ,              ");
            comtnUserMng.append("\n 	USR_NM               	VARCHAR(50) ,           ");
            comtnUserMng.append("\n 	ZIP                   		VARCHAR(6) ,        ");
            comtnUserMng.append("\n 	ADRES                 	VARCHAR(100) ,        ");
            comtnUserMng.append("\n 	AREA_NO               	VARCHAR(4) ,          ");
            comtnUserMng.append("\n 	USR_STTUS           	VARCHAR(15) ,           ");
            comtnUserMng.append("\n 	DETAIL_ADRES         VARCHAR(100) ,           ");
            comtnUserMng.append("\n 	END_TELNO             	VARCHAR(4)  ,         ");
            comtnUserMng.append("\n 	MBTLNUM               	VARCHAR(20)  ,        ");
            comtnUserMng.append("\n 	USR_FXNUM           	VARCHAR(20) ,           ");
            comtnUserMng.append("\n 	USR_EMAIL_ADRES  	VARCHAR(50) ,               ");
            comtnUserMng.append("\n 	MIDDLE_TELNO         VARCHAR(4) ,             ");
            comtnUserMng.append("\n 	SBSCRB_DE             	DATETIME ,            ");
            comtnUserMng.append("\n 	SEXDSTN_CODE      	VARCHAR(1) ,                 ");
            comtnUserMng.append("\n 	ESNTL_ID              	VARCHAR(20) ,            ");
            comtnUserMng.append("\n 	LOCK_AT               	VARCHAR(1) ,             ");
            comtnUserMng.append("\n 	LOCK_CNT              	NUMERIC(3) ,          ");
            comtnUserMng.append("\n 	LOCK_LAST_PNTTM   DATETIME ,                  ");
            comtnUserMng.append("\n 	CHANGE_DT					VARCHAR(14) ,               ");
            comtnUserMng.append("\n 	 PRIMARY KEY (USR_ID)                         ");
            comtnUserMng.append("\n )                                               ");
            statement.executeUpdate(comtnUserMng.toString());
    		String comtnUserMngQry = "INSERT INTO COMTNUSERMNG ( USR_ID , PASSWORD , PASSWORD_HINT , PASSWORD_CNSR , USR_NM , ZIP , ADRES , AREA_NO , USR_STTUS , DETAIL_ADRES , END_TELNO , MBTLNUM , USR_FXNUM , USR_EMAIL_ADRES , MIDDLE_TELNO , SBSCRB_DE , SEXDSTN_CODE , ESNTL_ID , LOCK_AT , LOCK_CNT , CHANGE_DT )";  
    		comtnUserMngQry = comtnUserMngQry +" VALUES ( 'TESTUSER' , '473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8' , 'P02' , 'P0002' , '홍길동' , '23121' , 'adres' , '112' , 'A' , '111-335' , '6432' , '010-0000-3333' , '02-332-3332' , 'test@egov.go.kr' , '2332' , null , 'M' , null , 'N' , 0 , '"+sstime+"' ) ";
			jdbcTemplate.execute("INSERT INTO COMTNUSERMNG (USR_ID,PASSWORD,PASSWORD_HINT,PASSWORD_CNSR,USR_NM,ZIP,ADRES,AREA_NO,USR_STTUS,DETAIL_ADRES,END_TELNO,MBTLNUM,USR_FXNUM,USR_EMAIL_ADRES,MIDDLE_TELNO,SBSCRB_DE,SEXDSTN_CODE,ESNTL_ID, CHANGE_DT) values ('USER','473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8','P01','전자정부표준프레임워크센터','일반회원','100775','서울 중구 무교동 한국정보화진흥원','02','P','전자정부표준프레임워크센터','2059','1566-2059','1566-2059','egovframesupport@gmail.com','1566',SYSDATE(),'F','USRCNFRM_00000000001', '"+sstime+"');");
			jdbcTemplate.execute(comtnUserMngQry);
			
			
            StringBuffer comtnGroupInfo = new StringBuffer();
            comtnGroupInfo.append("\n CREATE TABLE COMTNGROUPINFO                     ");
            comtnGroupInfo.append("\n (                                               ");
            comtnGroupInfo.append("\n 	 GROUP_ID                VARCHAR(20) NOT NULL,   ");
            comtnGroupInfo.append("\n 	 GROUP_NM               VARCHAR(60),          ");
            comtnGroupInfo.append("\n 	 GROUP_CREAT_DE     VARCHAR(14),                 ");
            comtnGroupInfo.append("\n 	 GROUP_DC               VARCHAR(100),         ");
            comtnGroupInfo.append("\n 	 CHANGE_DT				 VARCHAR(14) ,              ");
            comtnGroupInfo.append("\n 	 PRIMARY KEY (GROUP_ID)                       ");
            comtnGroupInfo.append("\n )                                               ");
            statement.executeUpdate(comtnGroupInfo.toString());
            String comtnGroupInfoQry = "INSERT INTO COMTNGROUPINFO (GROUP_ID, GROUP_NM, GROUP_CREAT_DE, GROUP_DC, CHANGE_DT) VALUES ('USRGRP001','사용자그룹_001','"+sstime+"','테스트를 위한 기본 사용자 그룹','"+sstime+"')";
        	jdbcTemplate.execute(comtnGroupInfoQry);
        	
            
            StringBuffer comtnGroupUsr = new StringBuffer();
            comtnGroupUsr.append("\n CREATE TABLE COMTNGROUPUSR                 ");
            comtnGroupUsr.append("\n (                                          ");
            comtnGroupUsr.append("\n 	 GROUP_ID      VARCHAR(20) NOT NULL,         ");
            comtnGroupUsr.append("\n 	 USR_ID          VARCHAR(20) NOT NULL,    ");
            comtnGroupUsr.append("\n 	 ADD_DT         VARCHAR(14),                 ");
            comtnGroupUsr.append("\n 	 PRIMARY KEY (GROUP_ID,USR_ID)            ");
            comtnGroupUsr.append("\n )                                          ");
            statement.executeUpdate(comtnGroupUsr.toString());            
            String comtnGroupUsrQry = "INSERT INTO COMTNGROUPUSR (GROUP_ID, USR_ID, ADD_DT) VALUES ('USRGRP001','TESTUSER','"+sstime+"')";
        	jdbcTemplate.execute(comtnGroupUsrQry);
            
        }
    }
}
