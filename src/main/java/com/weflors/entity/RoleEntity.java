package com.weflors.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "role", schema = "flowershop", catalog = "postgres")
public class RoleEntity {
    private int roleId;
    private String roleName;
    private Collection<UserRoleMapEntity> userRoleMapsByRoleId;
    
    

    public RoleEntity(int roleId, String roleName) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id", nullable = false)
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "role_name", nullable = false, length = 50)
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RoleEntity that = (RoleEntity) o;

        if (roleId != that.roleId) return false;
        if (roleName != null ? !roleName.equals(that.roleName) : that.roleName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "roleByRoleId")
    public Collection<UserRoleMapEntity> getUserRoleMapsByRoleId() {
        return userRoleMapsByRoleId;
    }

    public void setUserRoleMapsByRoleId(Collection<UserRoleMapEntity> userRoleMapsByRoleId) {
        this.userRoleMapsByRoleId = userRoleMapsByRoleId;
    }
}
