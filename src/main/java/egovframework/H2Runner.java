package egovframework;

import java.sql.Connection;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class H2Runner implements ApplicationRunner {

    @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        try(Connection connection = dataSource.getConnection()){
            System.out.println(connection);
            String URL = connection.getMetaData().getURL();
            System.out.println(URL);
            String User = connection.getMetaData().getUserName();
            System.out.println(User);

            Statement statement = connection.createStatement();
            StringBuffer createUsrMng = new StringBuffer();
            createUsrMng.append("\n CREATE TABLE COMTNUSERMNG                       ");
            createUsrMng.append("\n (                                               ");
            createUsrMng.append("\n 	USR_ID               		VARCHAR(20) NOT NULL, ");
            createUsrMng.append("\n 	PASSWORD              VARCHAR(200) NOT NULL,  ");
            createUsrMng.append("\n 	PASSWORD_HINT      VARCHAR(100) ,             ");
            createUsrMng.append("\n 	PASSWORD_CNSR     VARCHAR(100) ,              ");
            createUsrMng.append("\n 	IHIDNUM               	VARCHAR(200) ,        ");
            createUsrMng.append("\n 	USR_NM               	VARCHAR(50) ,           ");
            createUsrMng.append("\n 	ZIP                   		VARCHAR(6) ,        ");
            createUsrMng.append("\n 	ADRES                 	VARCHAR(100) ,        ");
            createUsrMng.append("\n 	AREA_NO               	VARCHAR(4) ,          ");
            createUsrMng.append("\n 	USR_STTUS           	VARCHAR(15) ,           ");
            createUsrMng.append("\n 	DETAIL_ADRES         VARCHAR(100) ,           ");
            createUsrMng.append("\n 	END_TELNO             	VARCHAR(4)  ,         ");
            createUsrMng.append("\n 	MBTLNUM               	VARCHAR(20)  ,        ");
            createUsrMng.append("\n 	USR_FXNUM           	VARCHAR(20) ,           ");
            createUsrMng.append("\n 	USR_EMAIL_ADRES  	VARCHAR(50) ,               ");
            createUsrMng.append("\n 	MIDDLE_TELNO         VARCHAR(4) ,             ");
            createUsrMng.append("\n 	SBSCRB_DE             	DATETIME ,            ");
            createUsrMng.append("\n 	SEXDSTN_CODE      	CHAR(1) ,                 ");
            createUsrMng.append("\n 	ESNTL_ID              	CHAR(20) ,            ");
            createUsrMng.append("\n 	LOCK_AT               	CHAR(1) ,             ");
            createUsrMng.append("\n 	LOCK_CNT              	NUMERIC(3) ,          ");
            createUsrMng.append("\n 	LOCK_LAST_PNTTM   DATETIME ,                  ");
            createUsrMng.append("\n 	CHANGE_DT					VARCHAR(14) ,               ");
            createUsrMng.append("\n 	 PRIMARY KEY (USR_ID)                         ");
            createUsrMng.append("\n )                                               ");
            
            statement.executeUpdate(createUsrMng.toString());
        }
		String inData = "INSERT INTO COMTNUSERMNG ( USR_ID , PASSWORD , PASSWORD_HINT , PASSWORD_CNSR , IHIDNUM , USR_NM , ZIP , ADRES , AREA_NO , USR_STTUS , DETAIL_ADRES , END_TELNO , MBTLNUM , USR_FXNUM , USR_EMAIL_ADRES , MIDDLE_TELNO , SBSCRB_DE , SEXDSTN_CODE , ESNTL_ID , LOCK_AT , LOCK_CNT , CHANGE_DT )";  
				 inData = inData +" VALUES ( 'TESTUSER' , '473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8' , 'P02' , 'P0002' , null , '홍길동' , '23121' , 'adres' , '112' , 'A' , '111-335' , '6432' , '010-0000-3333' , '02-332-3332' , 'test@egov.go.kr' , '2332' , null , 'M' , null , 'N' , 0 , '20200629111021' ) ";
        jdbcTemplate.execute("INSERT INTO COMTNUSERMNG (USR_ID,PASSWORD,PASSWORD_HINT,PASSWORD_CNSR,IHIDNUM,USR_NM,ZIP,ADRES,AREA_NO,USR_STTUS,DETAIL_ADRES,END_TELNO,MBTLNUM,USR_FXNUM,USR_EMAIL_ADRES,MIDDLE_TELNO,SBSCRB_DE,SEXDSTN_CODE,ESNTL_ID) values ('USER','473287f8298dba7163a897908958f7c0eae733e25d2e027992ea2edc9bed2fa8','P01','전자정부표준프레임워크센터',null,'일반회원','100775','서울 중구 무교동 한국정보화진흥원','02','P','전자정부표준프레임워크센터','2059','1566-2059','1566-2059','egovframesupport@gmail.com','1566',SYSDATE(),'F','USRCNFRM_00000000001');");
        jdbcTemplate.execute(inData);
        
    }
}
