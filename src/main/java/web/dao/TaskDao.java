package web.dao;

import web.dao.repository.TaskRepository;
import web.beans.Task;
import web.beans.User;
import web.utility.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

public class TaskDao implements TaskRepository {
    @Override
    public int addTask(Task task) {
    	int id;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        id = (int) session.save(task);
        transaction.commit();
        session.close();
        return id;
    }

    @Override
    public void updateTask(int taskId, String title, String description, Date startDate, Date endDate, String category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Task task = (Task) session.find(Task.class, taskId);

        // Update task properties
        task.setTitle(title); //Update HttpSession
        task.setDescription(description);
        task.setStartDate(startDate);
        task.setEndDate(endDate);
        task.setCategory(category);

        session.update(task);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteTask(Task task) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(task);
        transaction.commit();
        session.close();
    }

    @Override
    public Task getTaskById(int taskId) {
        Transaction transaction = null;
        Task task = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            task = (Task) session.load(Task.class, Integer.valueOf(taskId));
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return task;
    }

    //revised : avoids lazyInitialisation error
    @Override
    public Collection<Task> getPersonalTasks(int userId) {
        Collection<Task> filteredTasks = new ArrayList<>();
        
        //open session
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        //because session.load takes a serializable Id and not just a primitive type like int
        User user = session.load(User.class, Integer.valueOf(userId) );
        
        //now that we have the user loaded with the session we can access the lazy loaded attributes
        for (Task task:user.getOwnedTasks()) {
            if (task.getSourceTeam() == null){
                filteredTasks.add(task);
            }
        }
        session.close();
        return filteredTasks;
    }

    
    @Override
    public Collection<Task> filterTasksByState(ArrayList<Task> tasks, String state) {
        Collection<Task> filteredTasks = new ArrayList<>();
        for (Task task:tasks) {
            if (task.getState().equals(state)){
                filteredTasks.add(task);
            }
        }
        return filteredTasks;
    }

    @Override
    public Collection<Task> filterTasksByCategory(ArrayList<Task> tasks, String category) {
        Collection<Task> filteredTasks = new ArrayList<>();
        for (Task task:tasks) {
            if (task.getCategory().equals(category)){
                filteredTasks.add(task);
            }
        }
        return filteredTasks;
    }

    @Override
    public Collection<Task> filterTasksDueIn(ArrayList<Task> tasks, int numberOfDays) {
        //initialize result list
        Collection<Task> filteredTasks = new ArrayList<>();

        //get Current date
        long millis=System.currentTimeMillis();
        Date currentDate=new java.sql.Date(millis);

        //Add numberOfDays into currentDate to get resultDate
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        c.add(Calendar.DATE, numberOfDays);
        Date resultDate = new Date(c.getTimeInMillis());

        //Compare endDate with resultDate
        for (Task task:tasks) {
            if (task.getEndDate().compareTo(resultDate)<=0){
                filteredTasks.add(task);
            }
        }
        return filteredTasks;
    }

    //tells you how many days are left for the deadline
    public int daysLeft(Task task){
        //get Current date
        long millis=System.currentTimeMillis();
        long deadLine=task.getEndDate().getTime();
        
        Date currentDate=new java.sql.Date(millis);
        int days = (int) ((deadLine-millis) / (1000*60*60*24));
        //int days = task.getEndDate().compareTo(currentDate);
        return days;
    }
}
