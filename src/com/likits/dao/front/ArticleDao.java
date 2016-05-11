package com.likits.dao.front;

import java.util.List;
import com.likits.dao.Dao;
import com.likits.entity.front.Article;

public interface ArticleDao extends Dao<Article, Integer>{
	
	List<Article> getArticleInfo(int start, int end);
	
	Article getArticlebyId(int articleId);
	
	int getArticleCount();
	
	List<Article> getRecommendArticle();
}
