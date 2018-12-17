package com.atai.micro.generic.interfaces;

import java.io.Serializable;

public interface Model<ID extends Serializable> {
	public ID getId();
	public void setId(ID id);
}
