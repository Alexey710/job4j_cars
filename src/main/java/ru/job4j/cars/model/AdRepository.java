package ru.job4j.cars.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.function.Function;

public class AdRepository implements AutoCloseable {
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

    public List<Post> showLastDayAds() {
        return tx(session -> {
            java.sql.Date current = new java.sql.Date(new Date().getTime());
            Calendar instance = Calendar.getInstance();
            instance.setTime(current);

            instance.set(Calendar.HOUR_OF_DAY, 0);
            instance.set(Calendar.MINUTE, 0);
            instance.set(Calendar.SECOND, 0);
            instance.set(Calendar.MILLISECOND, 0);
            Date today = instance.getTime();

            instance.add(Calendar.DAY_OF_MONTH, 1);
            Date tomorrow = instance.getTime();
            Query query = session.createQuery(
                    "from Post p where p.created >= :date1 AND p.created < :date2");
            System.out.println(today);
            System.out.println(tomorrow);
            query.setParameter("date1", today);
            query.setParameter("date2", tomorrow);

            return query.list();
        });
    }

    public List<Post> showAdsWithPhoto() {
        return tx(session -> {
            Query query = session.createQuery("from Post p where p.photo = :phPost");
            query.setParameter("phPost", true);
            List<Post> posts = query.list();
            return posts;
        });
    }

    public List<Post> showAdsOfMark(String mark) {
        return tx(session -> {
            Query query = session.createQuery("from Post p where p.car.mark = :mCar");
            query.setParameter("mCar", mark);
            List<Post> posts = query.list();
            return posts;
        });
    }

    @Override
    public void close() throws Exception {
        StandardServiceRegistryBuilder.destroy(registry);
    }

    public static void main(String[] args) {
        AdRepository rep = new AdRepository();
        System.out.println(rep.showAdsOfMark("Жигули"));
        System.out.println(rep.showAdsWithPhoto());
        System.out.println(rep.showLastDayAds());
    }

}
