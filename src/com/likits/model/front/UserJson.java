package com.likits.model.front;

import java.util.Date;

import com.likits.entity.front.Team;
import com.likits.model.ReturnBaseJsonObject;

public class UserJson extends ReturnBaseJsonObject{

		private String username;
		private String email;
		private int sex;
		private String personSignature;
		private Date recentDate;
		private Date birthday;
		private Team team;
		private int level;
		private int score;
		private String image;
		private boolean isLogin;
		
		//--------getter&setter---------

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
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

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}

		public boolean isLogin() {
			return isLogin;
		}

		public void setLogin(boolean isLogin) {
			this.isLogin = isLogin;
		}

	
}
