package com.user;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.user.model.Address;
import com.user.model.User;

public class DataAccess {

    private static final SessionFactory sessionFactory =
            new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(Address.class)
                .buildSessionFactory();

    // 1Insert a user and address into the database.
    public void insertUser(User user) {

        Session session = sessionFactory.openSession();

        try {

            session.beginTransaction();

            // Hibernate inserts the User.
            // CascadeType.PERSIST automatically inserts
            // the home and office Address objects.
            session.persist(user);

            session.getTransaction().commit();

        } finally {

            session.close();
        }
    }

    // 2 Update a user and the user's home and office addresses.
    public void updateUser(User user) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.merge(user);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }


    // 3 Delete a user and address related from the database.
    public void deleteUser(User user) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            // Hibernate deletes the user.
            // Because User has CascadeType.REMOVE,
            // Hibernate also deletes homeAddress and officeAddress.
            session.remove(user);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }

    // 4. List all users with home and office addresses.
    public List<User> listAllUsers() {
        Session session = sessionFactory.openSession();
        try {
            // Fetch all users.
            List<User> users =session.createQuery("FROM User", User.class).getResultList();
            return users;

        } finally {
            session.close();
        }
    }

    // 5. Find a user and adress from the database using the user ID.
    public User findUser(int userId) {
        Session session = sessionFactory.openSession();
        try {
            return session.find(User.class, userId);
        } finally {
            session.close();
        }
    }
}

