package ru.job4j.cars.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.util.function.Function;

public class CarsRun implements AutoCloseable {
    private final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
            .configure().build();
    private final SessionFactory factory = new MetadataSources(registry)
            .buildMetadata().buildSessionFactory();

    private <T> T tx(final Function<Session, T> command) {
        final Session session = factory.openSession();
        final Transaction tx = session.beginTransaction();
        try {
            T rsl = command.apply(session);
            tx.commit();
            return rsl;
        } catch (final Exception e) {
            session.getTransaction().rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    public Post add(Post post) {
        return this.tx(
                session -> {
                    session.save(post);
                    return post;
                }
        );
    }

    @Override
    public void close() throws Exception {
        StandardServiceRegistryBuilder.destroy(registry);
    }

    public static void main(String[] args) {
        CarsRun run = new CarsRun();
        User user = User.of("Иван Иванов", "mail@mail.ru", "123");
        Car car = Car.of("Toyota Runner", "Toyota", "pickup");
        Post post = Post.of("Продаю машину Toyota Runner б/у. 2003", car, user);

        User user1 = User.of("Сергей Сидоров", "mail1@mail.ru", "123");
        Car car1 = Car.of("X1", "BMW", "hatchback");
        Post post1 = Post.of("Продаю машину BMW X1 б/у. 2020", car1, user1);
        post1.setPhoto(true);

        User user2 = User.of("Степан Петров", "mail2@mail.ru", "123");
        Car car2 = Car.of("ВАЗ-2101", "Жигули", "hatchback");
        Post post2 = Post.of("Продаю машину ВАЗ-2101 б/у. 1980", car2, user2);
        post2.setPhoto(true);

        run.add(post);
        run.add(post1);
        run.add(post2);
    }
}
