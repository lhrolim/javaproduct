package br.com.amlabs.pilaoec.web.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import br.com.amlabs.pilaoec.util.MySqlPaginationUtil;

@Component
public class UserDAO extends JdbcDaoSupport {

	@Autowired
	private DataSource datasource;

	private static final String InsertUserQuery = "INSERT INTO sec_user (login,password,amlabs_id,nature,remarks,normalprice,expressprice,normalleadtime,expressleadtime,minimumrequest,admin) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

	private static final String UpdateUserQuery = "update sec_user set login=?,password = ?,amlabs_id =?, nature=?, remarks = ?,normalprice =? ,expressprice =? ,normalleadtime =? ,expressleadtime = ?,minimumrequest = ? where id = ? ";

	private static final String UpdateUserNoPasswordQuery = "update sec_user set login=?,amlabs_id =?,nature=?, remarks = ?,normalprice =? ,expressprice =? ,normalleadtime =? ,expressleadtime = ?,minimumrequest = ? where id = ? ";

	String TABLE_NAME = "tableName";
	String GENERATED_KEY = "generatedKey";

	@PostConstruct
	private void initialize() {
		setDataSource(datasource);
	}

	public User Find(String login) {

		String sql = "SELECT * FROM sec_user where login = ?";

		List<User> user = (List<User>) getJdbcTemplate().query(sql, new Object[] { login }, new BeanPropertyRowMapper<User>(User.class));

		if (user.size() == 0) {
			return null;
		}
		return user.get(0);

	}

	public List<User> FindAllClients(int page, int pageSize) {

		String sql = "SELECT * FROM sec_user where admin = false " + MySqlPaginationUtil.getPaginationUtil(page, pageSize);

		List<User> users = (List<User>) getJdbcTemplate().query(sql, new BeanPropertyRowMapper<User>(User.class));

		return users;

	}

	public Integer CountAll(int page, int pageSize) {

		String sql = "SELECT count(*) FROM sec_user " + MySqlPaginationUtil.getPaginationUtil(page, pageSize);

		return getJdbcTemplate().queryForObject(sql, Integer.class);

	}

	@Transactional
	public Boolean CreateAdminIfAbsent() {
		User admin = Find("admin");
		if (admin != null) {
			return false;
		}
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(512);
		getJdbcTemplate().update("INSERT INTO sec_user (login,password,admin) VALUES (?,?,?)", "admin", encoder.encodePassword("admin", null), true);
		return true;
	}

	@Transactional
	public Boolean deleteClient(Integer id) {
		return getJdbcTemplate().update("delete from sec_user where id=?", id) == 1;
	}

	@Transactional
	public User SaveClient(final User user, final String password) {
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		if (user.getId() == null) {
			KeyHolder keyHolder = new GeneratedKeyHolder();

			jdbcTemplate.update(new PreparedStatementCreator() {

				@Override
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String encodedPassword = new ShaPasswordEncoder(512).encodePassword(password, null);
					PreparedStatement ps = connection.prepareStatement(InsertUserQuery, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, user.getLogin());
					ps.setString(2, encodedPassword);
					ps.setString(3, user.getAmlabs_id());
					ps.setInt(4, user.getNature());
					ps.setString(5, user.getRemarks());
					ps.setDouble(6, user.getNormalPrice());
					ps.setDouble(7, user.getExpressPrice());
					ps.setDouble(8, user.getNormalLeadTime());
					ps.setDouble(9, user.getExpressLeadTime());
					ps.setInt(10, user.getMinimumrequest());
					ps.setBoolean(11, false);
					return ps;
				}
			}, keyHolder);
			int id = keyHolder.getKey().intValue();
			user.setId(id);
		} else {

			if (StringUtils.isEmpty(password)) {
				jdbcTemplate.update(UpdateUserNoPasswordQuery, user.getLogin(), user.getAmlabs_id(), user.getNature(), user.getRemarks(), user.getNormalPrice(), user.getExpressPrice(), user.getNormalLeadTime(), user.getExpressLeadTime(), user.getMinimumrequest(), user.getId());
			} else {
				String encodedPassword = new ShaPasswordEncoder(512).encodePassword(password, null);
				jdbcTemplate.update(UpdateUserQuery, user.getLogin(), encodedPassword, user.getAmlabs_id(), user.getNature(), user.getRemarks(), user.getNormalPrice(), user.getExpressPrice(), user.getNormalLeadTime(), user.getExpressLeadTime(), user.getMinimumrequest(), user.getId());
			}

		}
		return user;

	}

}
