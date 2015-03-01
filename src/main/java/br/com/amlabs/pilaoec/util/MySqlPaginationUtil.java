package br.com.amlabs.pilaoec.util;

public class MySqlPaginationUtil {

	public static String getPaginationUtil(int page, int pageSize) {

		String limitQuery = " limit {0}";
		if (page > 1) {
			limitQuery = String.format(limitQuery, page * pageSize + ","
					+ pageSize);
		} else {
			limitQuery = String.format(limitQuery, pageSize);
		}
		return limitQuery;
	}

}
