package egovframework.com.cmm.ntt;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Data;

@Data
@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class COMTNGROUPINFO implements Serializable {
	/***************************************
		  CREATE TABLE COMTNGROUPINFO
		 (
		 	 GROUP_ID          VARCHAR(20) NOT NULL,
		 	 GROUP_NM          VARCHAR(60),
		 	 GROUP_CREAT_DE    VARCHAR(14),
		 	 GROUP_DC          VARCHAR(100),
		 	 CHANGE_DT				 VARCHAR(14) ,
		 	 PRIMARY KEY (GROUP_ID)
		 );
	 ***************************************/
    @Id
    @Column(columnDefinition = "varchar(10) not null comment '그룹ID'")
    private String GROUP_ID;

    @Column(columnDefinition = "varchar(60) comment '그룹명'")
    private String GROUP_NM;

    @Column(columnDefinition = "varchar(14) comment '그룹생성일'")
//    private String GROUP_CREAT_DE;
    private String group_creat_de; //GROUP_CREAT_DE;

    @Column(columnDefinition = "varchar(100) comment '그룹설명'")
    private String GROUP_DC;

    @Column(columnDefinition = "varchar(14) comment '그룹변경일시'")
    private String CHANGE_DT;

}
