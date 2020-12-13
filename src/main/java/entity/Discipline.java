package entity;

import java.util.ArrayList;
import java.util.Objects;

public class Discipline {
    private int id;
    private String discipline;
    private int status;
    private ArrayList<Mark> marks = new ArrayList<>();

    public Discipline() {
    }

    public Discipline(int id, String discipline, int status, ArrayList<Mark> marks) {
        this.id = id;
        this.discipline = discipline;
        this.status = status;
        this.marks = marks;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ArrayList<Mark> getMarks() {
        return marks;
    }

    public void setMarks(ArrayList<Mark> marks) {
        this.marks = marks;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Discipline that = (Discipline) o;
        return id == that.id &&
                status == that.status &&
                Objects.equals(discipline, that.discipline) &&
                Objects.equals(marks, that.marks);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, discipline, status, marks);
    }

    @Override
    public String toString() {
        return "Discipline{" +
                "id=" + id +
                ", discipline='" + discipline + '\'' +
                ", status=" + status +
                ", marks=" + marks +
                '}';
    }
}
