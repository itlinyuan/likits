package com.likits.service.front.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.likits.dao.front.ArticleDao;
import com.likits.entity.front.Article;
import com.likits.service.front.RecommendService;
import com.likits.util.PageUtil;

public class RecommendServiceImpl implements RecommendService {
	
	private ArticleDao articleDao;
	
	@Override
	public List<Map<String, Object>> getRecommendUser() {
		List<Map<String, Object>> result = new ArrayList<>();
		Map<String, Object> userInfo = null;
		/*
		 * TODO: 计算推荐用户
		 * 此处mock
		 * 随机选取5个用户
		 */
		
		for(int i = 0; i < 5; i++) {
			userInfo = new HashMap<>();
			userInfo.put("userName", "周煜瑶");
			userInfo.put("userAvatar", "assets/images/img2/img5.jpg");
			userInfo.put("userSignature", "今天，看了一场球赛...");
			result.add(userInfo);
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getRecommendArticle() {
		List<Map<String, Object>> result = new ArrayList<>();
		Map<String, Object> articleInfo = null;
		/*
		 * TODO:计算推荐内容
		 * 此处mock数据
		 * 随机选取5个内容
		 */
		
		List<Article> articles = articleDao.getRecommendArticle();
		
		for(int i = 0; i < 5; i++) {
			articleInfo = new HashMap<>();
			Article article = articles.get(i); 
			articleInfo.put("newsId", article.getId());
			articleInfo.put("newsTitle", article.getTitle().substring(0, 5));
			articleInfo.put("newsDesc", article.getContent().substring(0, 10));
			articleInfo.put("newsImage", String.format("assets/images/%07d/1.jpg", article.getId()));
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
