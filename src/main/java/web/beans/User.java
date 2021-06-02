package web.beans;

import java.util.Collection;

import javax.persistence.*;

import jakarta.validation.constraints.Email;

@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int userId;

    @Email
    @Column(unique = true)
    private String email;

    private String password;

    private String phone;

    @Column(unique = true)
    private String username;

    private String firstName;

    private String lastName;

    private String roles;
    
    private int exp;

    ///////////////////////////////////// Relationships ///////////////////////////////////////////////

    @OneToMany(mappedBy = "teamOwner", fetch = FetchType.LAZY)
    private Collection<Team> ownedTeams;

	public void addToOwnedTeams(Team team) {
		ownedTeams.add(team);
		team.setTeamOwner(this);
	}
    
    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
    @JoinTable(
            name = "Adhesion",
            joinColumns = { @JoinColumn(name = "userId") },
            inverseJoinColumns = { @JoinColumn(name = "teamId") }
    )
    private Collection<Team> teams;

    public void removeFromTeams(Team team){
        teams.remove(team);
        team.getMembers().remove(this);
    }

    public void addToTeams(Team team){
        this.teams.add(team);
        team.addMember(this);
    }

    @OneToMany(mappedBy = "taskOwner", fetch= FetchType.LAZY)
    private Collection<Task> ownedTasks;
    
    @OneToMany(mappedBy = "activeWorker", fetch= FetchType.LAZY)
    private Collection<Task> activeTasks;

    @ManyToMany(cascade = { CascadeType.ALL }, fetch= FetchType.LAZY)
    @JoinTable(
            name = "Possession",
            joinColumns = { @JoinColumn(name = "userId") },
            inverseJoinColumns = { @JoinColumn(name = "achievementId") }
    )
    private Collection<Achievement> achievements;


    ///////////////////////////////// Getters Setters Constructors //////////////////////////////////////////


    public User() {
    }

    public User(int userId, @Email String email, String password, String phone, String username, String firstName, String lastName, String roles, Collection<Team> ownedTeams, Collection<Team> teams, Collection<Task> ownedTasks, Collection<Task> activeTasks, Collection<Achievement> achievements) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.roles = roles;
        this.ownedTeams = ownedTeams;
        this.teams = teams;
        this.ownedTasks = ownedTasks;
        this.activeTasks = activeTasks;
        this.achievements = achievements;
    }

    
    public Collection<Task> getActiveTasks() {
		return activeTasks;
	}

	public void setActiveTasks(Collection<Task> activeTasks) {
		this.activeTasks = activeTasks;
	}

	public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        if(roles.equals(null))
        this.roles = "USER";
        else{
            this.roles = roles;
        }
    }

    public Collection<Team> getOwnedTeams() {
        return ownedTeams;
    }

    public void setOwnedTeams(Collection<Team> ownedTeams) {
        this.ownedTeams = ownedTeams;
    }

    public Collection<Team> getTeams() {
        return teams;
    }

    public void setTeams(Collection<Team> teams) {
        this.teams = teams;
    }

    public Collection<Task> getOwnedTasks() {
        return ownedTasks;
    }

    public void setOwnedTasks(Collection<Task> ownedTasks) {
        this.ownedTasks = ownedTasks;
    }

    public Collection<Achievement> getAchievements() {
        return achievements;
    }

    public void setAchievements(Collection<Achievement> achievements) {
        this.achievements = achievements;
    }

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}
	
	public void addExp(int exp) {
		this.exp += exp;
	}
    
    


}
