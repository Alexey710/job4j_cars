package ru.job4j.cars.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;
import ru.job4j.cars.model.Model;
import ru.job4j.cars.model.Post;
import ru.job4j.cars.model.Trademark;
import ru.job4j.cars.model.User;

import java.util.ArrayList;
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
    
    public User addUser(User user) {
                return this.tx(
                session -> {
                   
                    session.save(user);
                    return user;
                }
        );
    }
    
    public User findByCredential(String email, String password) {
        return this.tx(
                session -> {
                
                    Query queryObject = session.createQuery(
                            "from ru.job4j.cars.model.User where "
                                    + "email" + "= :value1" + " and " + "password" + "= :value2");
                    queryObject.setParameter("value1", email);
                    queryObject.setParameter("value2", password);
                    List<User> list = queryObject.list();
                     return list.isEmpty() ? null : list.get(0);                  
                });
    }
    
    public Post add(Post post) {
        return this.tx(
                session -> {
                    session.save(post);
                    return post;
                }
        );
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
          
            query.setParameter("date1", today);
            query.setParameter("date2", tomorrow);

            return query.list();
        });
    }

    public List<Post> showAllAds() {
        return tx(session -> {
            Query query = session.createQuery("from Post p where p.status = :stPost");
            query.setParameter("stPost", false);
            List<Post> posts = query.list();
            return posts;
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
    
    public Post findPostById(int id) {
        return tx(session -> {
            Query query = session.createQuery("from Post p where p.id = :key");
            query.setParameter("key", id);
            List<Post> posts = query.list();
            return posts.get(0);
        });
    }
    
    public List<Post> findPostByUser(User user) {
        return tx(session -> {
            Query query = session.createQuery("from Post p where p.user = :key");
            query.setParameter("key", user);
            return query.list();
        });
    }

    public boolean deletePost(String id) {
        return tx(session -> {
            Post post = new Post();
            post.setId(Integer.parseInt(id));
            session.delete(post);
            return true;
        }); 
    }
    
    public List<Trademark> getAllMarks() {
        return tx(session -> {
            Query query = session.createQuery("from Trademark");
            List<Trademark> marks = query.list();
         
            return marks;
        });
    }

    @Override
    public void close() throws Exception {
        StandardServiceRegistryBuilder.destroy(registry);
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
