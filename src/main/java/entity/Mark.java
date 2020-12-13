package entity;

import java.util.Objects;

public class Mark {
    private int id;
    private int student_id;
    private int term_discipline_id;
    private int mark;

    public Mark() {
    }

    public Mark(int id, int student_id, int term_discipline_id, int mark) {
        this.id = id;
        this.student_id = student_id;
        this.term_discipline_id = term_discipline_id;
        this.mark = mark;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getTerm_discipline_id() {
        return term_discipline_id;
    }

    public void setTerm_discipline_id(int term_discipline_id) {
        this.term_discipline_id = term_discipline_id;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Mark mark1 = (Mark) o;
        return id == mark1.id &&
                student_id == mark1.student_id &&
                term_discipline_id == mark1.term_discipline_id &&
                mark == mark1.mark;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, student_id, term_discipline_id, mark);
    }

    @Override
    public String toString() {
        return "Mark{" +
                "id=" + id +
                ", student_id=" + student_id +
                ", term_discipline_id=" + term_discipline_id +
                ", mark=" + mark +
                '}';
    }
}
