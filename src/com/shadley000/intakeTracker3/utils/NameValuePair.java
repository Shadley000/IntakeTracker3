/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shadley000.intakeTracker3.utils;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

/**
 *
 * @author shadl
 */
public class NameValuePair implements Serializable, Comparable, ISelectable
{
    private String name;
    private String value;

    public NameValuePair(String name, String value)
    {
        this.name = name;
        this.value = value;
    }

    public NameValuePair(ResultSet rs) throws SQLException
    {
    	value = rs.getString(1);
    	name = rs.getString(2);
    }
    public String getName()
    {
        return name;
    }

    public String getValue()
    {
        return value;
    }
    
    
    @Override
    public boolean equals(Object o)
    {
        if (o instanceof NameValuePair)
        {
            NameValuePair other = (NameValuePair) o;
            return (name.equals(other.name) && value.equals(other.value ));
        }
        return false;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 23 * hash + Objects.hashCode(this.name);
        hash = 23 * hash + Objects.hashCode(this.value);
        return hash;
    }

    @Override
    public int compareTo(Object o)
    {
        if (o instanceof NameValuePair)
        {
            NameValuePair other = (NameValuePair) o;

            if (name.equals(other.name))
            {
               return value.compareTo(other.getValue());
            } else
            {
                return name.compareTo(other.getName());
            }
        } else
        {
            throw new UnsupportedOperationException();
        }

    }

    @Override
    public String getSelectableKey()
    {
        return getName();
    }

    @Override
    public String getSelectableLabel()
    {
        return getValue();
    }
}
