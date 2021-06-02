package web.beans;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="Achievement")
public class Achievement {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int achievementId;

    @Column(unique = true)
    private String title;

    private String description;

    private String icon;



    @ManyToMany(mappedBy = "achievements" , fetch= FetchType.LAZY)
    private Collection<User> holders;


    ///////////////////////////////// Getters Setters Constructors //////////////////////////////////////////


    public Achievement() {
    }

    public Achievement(String title, String description, String icon) {
		super();
		this.title = title;
		this.description = description;
		this.icon = icon;
		}

    public Achievement(String title, String description, String icon,
                       Collection<User> holders) {
        super();
        this.title = title;
        this.description = description;
        this.icon = icon;
        this.holders = holders;
    }


    public int getAchievementId() {
        return achievementId;
    }

    public void setAchievementId(int achievementId) {
        this.achievementId = achievementId;
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



    public String getIcon() {
		return icon;
	}



	public void setIcon(String icon) {
		this.icon = icon;
	}



	public Collection<User> getHolders() {
        return holders;
    }



    public void setHolders(Collection<User> holders) {
        this.holders = holders;
    }



}
