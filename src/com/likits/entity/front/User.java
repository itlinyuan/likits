/**
 * author:林源
 * date:20160121
 */
package com.likits.entity.front;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "likits_users")
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	
	@Column(length = 100,name="username")
	private String username;
	
	@Column(length = 100,name="password")
	private String password;
	
	@Column(length = 100,name="email")
	private String email;
	
	@Column(length = 4,name="sex")
	private int sex;
	
	@Column(length = 200,name="personSignature")
	private String personSignature;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="createDate")
	private Date createDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="recentDate")
	private Date recentDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="birthday")
	private Date birthday;
	
	@ManyToOne
	@JoinColumn(name = "team")
	private Team team;
	
	@Column(length = 10,name="level")
	private int level;
	
	@Column(length = 11,name="score")
	private int score;
	
	@Column(length = 11,name="otherLoginWay")
	private int otherLoginWay;
	
	@Column(length = 500,name="image")
	private String image;

	@Column(length = 4,name="isActive")
	private int isActive;
	
	@Column(length = 30,name="registerId")
	private String registerId;
	
	@Column(length = 11,name="restrictNumber")
	private int restrictNumber;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="unLockTime")
	private Date unLockTime;
	
	//--------getter&setter---------
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPersonSignature() {
		return personSignature;
	}

	public void setPersonSignature(String personSignature) {
		this.personSignature = personSignature;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getRecentDate() {
		return recentDate;
	}

	public void setRecentDate(Date recentDate) {
		this.recentDate = recentDate;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getOtherLoginWay() {
		return otherLoginWay;
	}

	public void setOtherLoginWay(int otherLoginWay) {
		this.otherLoginWay = otherLoginWay;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getIsActive() {
		return isActive;
	}

	public String getRegisterId() {
		return registerId;
	}

	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public int getRestrictNumber() {
		return restrictNumber;
	}

	public void setRestrictNumber(int restrictNumber) {
		this.restrictNumber = restrictNumber;
	}

	public Date getUnLockTime() {
		return unLockTime;
	}

	public void setUnLockTime(Date unLockTime) {
		this.unLockTime = unLockTime;
	}

}
