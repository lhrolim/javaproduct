package br.com.amlabs.pilaoec.util.jdbc;

import java.beans.PropertyDescriptor;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.BeanUtils;

public class JDBCQueryGenerator {

	public static String GenerateQuery(IBaseEntity ob) {
		StringBuilder sb = new StringBuilder();
		Integer id = ob.getId();
		JDBCEntity entity = ob.getClass().getAnnotation(JDBCEntity.class);
		if (entity ==null){
			throw new IllegalArgumentException(String.format("class {0} must be annottated with {1}",ob.getClass().getName(),JDBCEntity.class.getName()));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if (id == null) {
			sb.append("insert into ").append(entity.table()).append("(");

			for (PropertyDescriptor descriptor : BeanUtils.getPropertyDescriptors(ob.getClass())) {
				if (descriptor.getReadMethod().isAnnotationPresent(JDBCTransient.class)) {
					continue;
				}
				sb.append(descriptor.getName());
			}


		}else{
			
		}

		return "";
	}

}
