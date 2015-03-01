package br.com.amlabs.pilaoec.util;

public class MySqlPaginationUtil {

	public static String getPaginationUtil(Integer page, Integer pageSize) {

		String limitQuery = " limit ";
		if (page > 1) {
			limitQuery += (page * pageSize + "," + pageSize);
		} else {
			limitQuery += pageSize.toString();
		}

		return limitQuery;
	}

}
