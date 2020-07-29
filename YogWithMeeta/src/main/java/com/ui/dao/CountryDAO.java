package com.ui.dao;

import java.util.List;

import com.ui.model.Country;
import com.ui.model.State;

public interface CountryDAO {
	public List<Country> getAllCountry();

	public List<State> getRelatedState(long countryId);

}
