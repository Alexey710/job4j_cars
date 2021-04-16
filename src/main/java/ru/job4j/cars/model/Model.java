package ru.job4j.cars.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "models")
public class Model {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @ManyToOne (fetch = FetchType.EAGER)
    private Trademark trademark;

    public static Model of(String name) {
        Model model = new Model();
        model.name = name;
        return model;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Model model = (Model) o;
        return id == model.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Model{" + "id=" + id + ", name='" + name + '\'' + '}';
    }

    public static void main(String[] args) {
        List<Trademark> list = new ArrayList<>();
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure().build();
        SessionFactory sf = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        try {

            Session session = sf.openSession();
            session.beginTransaction();

            Model model1 = Model.of("LandCruiserPrado");
            Model model2 = Model.of("LandCruiser 200");
            Model model3 = Model.of("Corolla");
            Model model4 = Model.of("Camry");
            Model model5 = Model.of("Highlander");

            Trademark trademark1 = Trademark.of("Toyota");
            trademark1.getModels().add(model1);
            trademark1.getModels().add(model2);
            trademark1.getModels().add(model3);
            trademark1.getModels().add(model4);
            trademark1.getModels().add(model5);

            session.save(trademark1);

            session.getTransaction().commit();
            session.close();
        }  catch (Exception e) {
            e.printStackTrace();
        }

        try {

            Session session = sf.openSession();
            session.beginTransaction();

            Model model10 = Model.of("2101");
            Model model20 = Model.of("2107");
            Model model30 = Model.of("2109");
            Model model40 = Model.of("Priora");
            Model model50 = Model.of("Vesta");

            Trademark trademark2 = Trademark.of("VAZ");
            trademark2.getModels().add(model10);
            trademark2.getModels().add(model20);
            trademark2.getModels().add(model30);
            trademark2.getModels().add(model40);
            trademark2.getModels().add(model50);

            session.save(trademark2);

            session.getTransaction().commit();
            session.close();
        }  catch (Exception e) {
            e.printStackTrace();
        }

        try {

            Session session = sf.openSession();
            session.beginTransaction();

            Model model10 = Model.of("X1");
            Model model20 = Model.of("X2");
            Model model30 = Model.of("X5");
            Model model40 = Model.of("3 series");
            Model model50 = Model.of("5 series");

            Trademark trademark2 = Trademark.of("BMW");
            trademark2.getModels().add(model10);
            trademark2.getModels().add(model20);
            trademark2.getModels().add(model30);
            trademark2.getModels().add(model40);
            trademark2.getModels().add(model50);

            session.save(trademark2);

            session.getTransaction().commit();
            session.close();
        }  catch (Exception e) {
            e.printStackTrace();
        }

        try {
            Session session = sf.openSession();
            session.beginTransaction();
            list = session.createQuery("from Trademark").list();
            System.out.println(list);
            for (Trademark trademark : list) {
                for (Model model : trademark.getModels()) {
                    System.out.println(model);
                }
            }
            session.getTransaction().commit();
            session.close();
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
}
