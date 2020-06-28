package egovframework.com.user.dao;

/**
 * @title : 사용자 관리 입출력 Vo
 * @package : egovframework.com.user.dao
 * @filename : UserVo.java
 * @author : "egov"
 * @since : 2020. 6. 12.
 * @version : 1.0
 * @desc : 사용자 관리 입출력 항목
 * 
 *  ======= 변경이력 =======
 * 
 * 날자                       변경자                  설명
 * ----------         -------           ------------------------------------
 * 2020. 6. 12.         "egov"           최초 생성(ver 1.0)
 * 
 */
public class UserVo {

	private String usrId;
	private String usrNm;
	
	private String password;
	private String passwordHint;
	private String passwordCnsr;
	private String sexdstnCode;
	private String areaNo;
	private String middleTelno;
	private String endTelno;
	private String usrFxnum;
	private String moblphonNo;
	private String usrEmailAdres;
	private String zip;
	private String adres;
	private String detailAdres;
	private String usrSttus;
	
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordHint() {
		return passwordHint;
	}
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	public String getSexdstnCode() {
		return sexdstnCode;
	}
	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	public String getMiddleTelno() {
		return middleTelno;
	}
	public void setMiddleTelno(String middleTelno) {
		this.middleTelno = middleTelno;
	}
	public String getEndTelno() {
		return endTelno;
	}
	public void setEndTelno(String endTelno) {
		this.endTelno = endTelno;
	}
	public String getUsrFxnum() {
		return usrFxnum;
	}
	public void setUsrFxnum(String usrFxnum) {
		this.usrFxnum = usrFxnum;
	}
	public String getMoblphonNo() {
		return moblphonNo;
	}
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}
	public String getUsrEmailAdres() {
		return usrEmailAdres;
	}
	public void setUsrEmailAdres(String usrEmailAdres) {
		this.usrEmailAdres = usrEmailAdres;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getDetailAdres() {
		return detailAdres;
	}
	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}
	public String getUsrSttus() {
		return usrSttus;
	}
	public void setUsrSttus(String usrSttus) {
		this.usrSttus = usrSttus;
	}
	
}
