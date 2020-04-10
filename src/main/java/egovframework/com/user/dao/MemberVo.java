package egovframework.com.user.dao;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVo {

	@Value("abcd")
	private String memberId;
	private String mberNm;
	
	@Value("password1")
	private String password;
	private String passwordHint;
	private String passwordCnsr;
	private String sexdstnCode;
	private String areaNo;
	private String middleTelno;
	private String endTelno;
	private String mberFxnum;
	private String moblphonNo;
	private String mberEmailAdres;
	private String zip;
	private String adres;
	private String detailAdres;
	private String mberSttus;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMberNm() {
		return mberNm;
	}
	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
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
	public String getMberFxnum() {
		return mberFxnum;
	}
	public void setMberFxnum(String mberFxnum) {
		this.mberFxnum = mberFxnum;
	}
	public String getMoblphonNo() {
		return moblphonNo;
	}
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}
	public String getMberEmailAdres() {
		return mberEmailAdres;
	}
	public void setMberEmailAdres(String mberEmailAdres) {
		this.mberEmailAdres = mberEmailAdres;
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
	public String getMberSttus() {
		return mberSttus;
	}
	public void setMberSttus(String mberSttus) {
		this.mberSttus = mberSttus;
	}
	
	
	
}
