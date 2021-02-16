package web.beans;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name = "Task")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int taskId;

    private String title;

    private String description;

    private Date startDate;

    private Date endDate;

    private String state;

    private String category;

    ///////////////////////////////////// Relationships ///////////////////////////////////////////////

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "ownerId")
    private User taskOwner;
    
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "activeWorker")
    private User activeWorker;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "teamId")
    private Team sourceTeam;

    ///////////////////////////////// Getters Setters Constructors //////////////////////////////////////////

    public Task() {
        super();
    }

    public Task(int taskId, String title, String description, Date startDate, Date endDate, String state,
                String category, User taskOwner, User activeWorker, Team sourceTeam) {
        super();
        this.taskId = taskId;
        this.title = title;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.state = state;
        this.category = category;
        this.taskOwner = taskOwner;
        this.activeWorker = activeWorker;
        this.sourceTeam = sourceTeam;
    }

    
    
    public User getActiveWorker() {
		return activeWorker;
	}

	public void setActiveWorker(User activeWorker) {
		this.activeWorker = activeWorker;
	}

	public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public User getTaskOwner() {
        return taskOwner;
    }

    public void setTaskOwner(User taskOwner) {
        this.taskOwner = taskOwner;
    }

    public Team getSourceTeam() {
        return sourceTeam;
    }

    public void setSourceTeam(Team sourceTeam) {
        this.sourceTeam = sourceTeam;
    }

}
