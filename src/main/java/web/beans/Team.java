package web.beans;

import java.sql.Date;
import java.util.Collection;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.NaturalId;

@Entity
@Table(name = "Team")
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int teamId;

    private String title;
    private String description;

    @CreationTimestamp
    private Date creationDate;

    private String code;

    ///////////////////////////////////// Relationships ///////////////////////////////////////////////

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "teamOwner")
    private User teamOwner;

    @ManyToMany(mappedBy = "teams", fetch= FetchType.LAZY)
    private Collection<User> members;
    
	public void addMember(User user) {
		members.add(user);
	}

    @OneToMany(mappedBy = "sourceTeam", fetch= FetchType.LAZY)
    private Collection<Task> tasks;

    ///////////////////////////////// Getters Setters Constructors //////////////////////////////////////////

    @Transient
    public int todoTask;
    @Transient
    public int doingTask;
    @Transient
    public int doneTask;


    public Team(int teamId, String title, String description, Date creationDate, String code, User teamOwner,
                Collection<User> members, Collection<Task> tasks) {
        super();
        this.teamId = teamId;
        this.title = title;
        this.description = description;
        this.creationDate = creationDate;
        this.code = code;
        this.teamOwner = teamOwner;
        this.members = members;
        this.tasks = tasks;
    }

    public Team() {
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode() {
        this.code = Integer.toString(title.hashCode() + Integer.toString(teamId).hashCode());
    }

    public User getTeamOwner() {
        return teamOwner;
    }

    public void setTeamOwner(User teamOwner) {
        this.teamOwner = teamOwner;
    }

    public Collection<User> getMembers() {
        return members;
    }

    public void setMembers(Collection<User> members) {
        this.members = members;
    }

    public Collection<Task> getTasks() {
        return tasks;
    }

    public void setTasks(Collection<Task> tasks) {
        this.tasks = tasks;
    }

	public int getTodoTask() {
		return todoTask;
	}

	public void setTodoTask(int todoTask) {
		this.todoTask = todoTask;
	}

	public int getDoingTask() {
		return doingTask;
	}

	public void setDoingTask(int doingTask) {
		this.doingTask = doingTask;
	}

	public int getDoneTask() {
		return doneTask;
	}

	public void setDoneTask(int doneTask) {
		this.doneTask = doneTask;
	}




}
