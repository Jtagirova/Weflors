package com.weflors.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class UserRoleMapEntityPK implements Serializable {
    private int userId;
    private int roleId;

    @Column(name = "user_id", nullable = false, insertable = false, updatable = false)
    @Id
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Column(name = "role_id", nullable = false,  insertable = false, updatable = false)
    @Id
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserRoleMapEntityPK that = (UserRoleMapEntityPK) o;

        if (userId != that.userId) return false;
        if (roleId != that.roleId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + roleId;
        return result;
    }
}
