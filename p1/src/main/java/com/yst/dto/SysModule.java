package com.yst.dto;

import java.util.List;

public class SysModule {
	
    private Integer id;

    private String name;

    private Integer level;

    private String url;

    private Integer parentId;

    private Integer sequence;
    
    private List<SysModule> sonList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

	public List<SysModule> getSonList() {
		return sonList;
	}

	public void setSonList(List<SysModule> sonList) {
		this.sonList = sonList;
	}
}