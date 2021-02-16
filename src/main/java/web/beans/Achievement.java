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

    private int value;

    private byte[] icon;



    @ManyToMany(mappedBy = "achievements" , fetch= FetchType.LAZY)
    private Collection<User> holders;


    ///////////////////////////////// Getters Setters Constructors //////////////////////////////////////////


    public Achievement() {
    }



    public Achievement(int achievementId, String title, String description, int value, byte[] icon,
                       Collection<User> holders) {
        super();
        this.achievementId = achievementId;
        this.title = title;
        this.description = description;
        this.value = value;
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



    public int getValue() {
        return value;
    }



    public void setValue(int value) {
        this.value = value;
    }



    public byte[] getIcon() {
        return icon;
    }



    public void setIcon(byte[] icon) {
        this.icon = icon;
    }



    public Collection<User> getHolders() {
        return holders;
    }



    public void setHolders(Collection<User> holders) {
        this.holders = holders;
    }



}
