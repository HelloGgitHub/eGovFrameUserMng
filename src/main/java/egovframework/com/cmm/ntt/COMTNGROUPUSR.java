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
public class COMTNGROUPUSR implements Serializable {
	/***************************************
		 CREATE TABLE COMTNGROUPUSR
		 (
		 	 GROUP_ID      VARCHAR(20) NOT NULL COMMENT '그룹ID',
		 	 USR_ID          VARCHAR(20) NOT NULL COMMENT '사용자ID',
		 	 ADD_DT         VARCHAR(14) COMMENT '등록일시',
		 	 PRIMARY KEY (GROUP_ID,USR_ID)
		 );
	 ***************************************/
    @Id
    @Column(columnDefinition = "VARCHAR(20) NOT NULL COMMENT '그룹ID'")
    private String GROUP_ID;
    
    @Id
    @Column(columnDefinition = "VARCHAR(20) NOT NULL COMMENT '사용자ID'")
    private String USR_ID;

    @Column(columnDefinition = "VARCHAR(14) COMMENT '등록일시'")
    private String ADD_DT;

}
