package com.app.university.user;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "user", uniqueConstraints={@UniqueConstraint(columnNames={"username"})})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank
    private String username;
    
    @NotBlank
    private String password;
    
    @Column(name="user_type")
    private String userType;
    
    @Column(name="user_id")
    private int userId;

    @Transient
    private String passwordConfirm;

    @ManyToMany
    private Set<Role> roles;
    
    @Column(name="created_timestamp" , nullable = false , updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTimestamp;
	
	@Column(name="last_update_timestamp" , nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdatedTimestamp;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}

	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}

	public Date getLastUpdatedTimestamp() {
		return lastUpdatedTimestamp;
	}

	public void setLastUpdatedTimestamp(Date lastUpdatedTimestamp) {
		this.lastUpdatedTimestamp = lastUpdatedTimestamp;
	}
    
}