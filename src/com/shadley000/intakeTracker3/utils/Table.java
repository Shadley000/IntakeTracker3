package com.shadley000.intakeTracker3.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Table {

	private List<String[]> rows = new ArrayList<String[]>();
	private String[] headers;

	public Table() {

	}

	public void setHeaders(String[] headers) {
		this.headers = headers;
	}

	public void addRow(String[] row) {
		rows.add(row);
	}

	public String getCell(int row, int column) {
		return rows.get(row)[column];
	}

	public String getHeader(int column) {
		return headers[column];
	}

	public void load(ResultSet rs) throws SQLException {

		ResultSetMetaData rsmd = rs.getMetaData();

		String header[] = new String[rsmd.getColumnCount()];

		for (int i = 0; i < header.length; i++)
			header[i] = rsmd.getColumnLabel(i+1);

		setHeaders(header);

		while (rs.next()) {
			String data[] = new String[rsmd.getColumnCount()];
			for (int i = 0; i < data.length; i++)
				data[i] = rs.getString(i+1);

			rows.add(data);
		}

	}

}
