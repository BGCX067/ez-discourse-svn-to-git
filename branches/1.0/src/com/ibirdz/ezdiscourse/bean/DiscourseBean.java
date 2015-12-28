package com.ibirdz.ezdiscourse.bean;

public class DiscourseBean {
	
	private String url;
	private String text;
	private String font;
	private String color;
	private int imageWidth, imageHeight;
	private int posX, posY;
	private int fontSize;
	
	public int getPosX() {
		return posX;
	}


	public void setPosX(int posX) {
		this.posX = posX;
	}


	public int getPosY() {
		return posY;
	}


	public void setPosY(int posY) {
		this.posY = posY;
	}


	public int getFontSize() {
		return fontSize;
	}


	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public int getImageWidth() {
		return imageWidth;
	}


	public void setImageWidth(int imageWidth) {
		this.imageWidth = imageWidth;
	}


	public int getImageHeight() {
		return imageHeight;
	}


	public void setImageHeight(int imageHeight) {
		this.imageHeight = imageHeight;
	}


	public DiscourseBean() {
		
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getFont() {
		return font;
	}


	public void setFont(String font) {
		this.font = font;
	}
	
}
