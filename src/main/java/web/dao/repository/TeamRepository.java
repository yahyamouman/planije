package web.dao.repository;

import web.beans.Team;

public interface TeamRepository {

    void addTeam(Team team);
    void updateTeam(int teamId, String title, String description);
    void deleteTeam(Team team);
    Team getTeamById(int teamId);
    Team getTeamByCode(String code);

    boolean joinTeam(int userId, String code);
    void leaveTeam(int userId, int teamId);
}
