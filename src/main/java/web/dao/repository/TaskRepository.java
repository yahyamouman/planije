package web.dao.repository;

import web.beans.Task;
import web.beans.User;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

public interface TaskRepository {

    //CRUD
    int addTask(Task task);
    void updateTask(int taskId, String title, String Description, Date startDate, Date endDate, String category);
    void deleteTask(Task task);
    Task getTaskById(int taskId);

    //Filtering
    Collection<Task> filterTasksByState(ArrayList<Task> tasks, String state);
    Collection<Task> filterTasksByCategory(ArrayList<Task> tasks, String category);

    /**
     * Generates a list of all personal tasks (tasks the user created that doesn't belong to any team)
     * @param user the instance of the User we want to inquire about personal tasks
     * @return Collection of personal tasks
     */
    Collection<Task> getPersonalTasks(int userId);

    /**
     * This method filters a task list and returns the ones that are due in before the set numberOfDays
     * aka : task.endDate lessThan currentDate+numberOfDays
     * @param tasks List of tasks to filter
     * @param numberOfDays Number of days until the deadline
     * @return tasks due before numberOfDays
     */
    Collection<Task> filterTasksDueIn(ArrayList<Task> tasks, int numberOfDays);

    //Utility
    /**
     * This method takes a task and returns how many days left until deadline
     * @param task Task object to inquire about deadline
     * @return x isPositive means there's still x days until deadline x isNegative means it's been x days since the deadline
     */
    int daysLeft(Task task);
}
