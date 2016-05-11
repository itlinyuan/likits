package com.likits.service.front.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.likits.dao.front.ArticleDao;
import com.likits.service.front.ArticleService;
public class ArticleServiceImpl implements ArticleService{

	private ArticleDao articleDao;
	
	@Override
	public List<Map<String, Object>> getArticlePaged() {
		List<Map<String, Object>> result = new ArrayList<>();
		Map<String, Object> articleInfo = null;
		/**
		 * TODO:加入分页
		 * 此处mock数据
		 */
		for(int i = 0; i < 8; i++) {
			articleInfo = new HashMap<>();
			articleInfo.put("newsId", i);
			articleInfo.put("newsTitle", "苏格兰代表队2017赛季主客场球服预赏");
			articleInfo.put("newsDesc", "现在一个球队有三套球衣，主场，客场，第三球衣（备用球衣）主场作战的球队穿主场球衣。这是最大前提...");
			articleInfo.put("newsUser", "爱足球的猫");
			articleInfo.put("newsUserAvatar", "assets/images/img2/img2.jpg");
			articleInfo.put("newsWatch", 11);
			articleInfo.put("newsLike", 20);
			articleInfo.put("newsDate", "12-25 09:01");
			articleInfo.put("newsImage", "assets/images/ex-img/ex1.jpg");
			result.add(articleInfo);
		}
		return result;
	}

	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

}
