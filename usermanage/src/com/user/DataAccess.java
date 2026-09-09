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

    // 1.a Insert a user into the database.
    public void insertUser(User user) {
        // Open a Hibernate session.
        Session session = sessionFactory.openSession();

        try {
            // Save the User object into the database.
            session.beginTransaction();
            // Save the User object into the database.
            session.persist(user);
            // Commit the transaction.
            session.getTransaction().commit();
        } finally {
            // Close the Hibernate session.
            session.close();
        }
    }

    // 1.b Insert an address into the database.
    public int insertAddress(Address address) {
        Session session = sessionFactory.openSession();

        try {
            session.beginTransaction();
            session.persist(address);
            session.getTransaction().commit();
            return address.getId();

        } finally {
            session.close();
        }
    }


    // 2.a Update a user and the user's home and office addresses.
    public void updateUser(User user) {
        Session session = sessionFactory.openSession();

        try {
            session.beginTransaction();
            session.merge(user);
            /*if (user.getHomeAddress() != null) {
                session.merge(user.getHomeAddress());
            }
            if (user.getOfficeAddress() != null) {
                session.merge(user.getOfficeAddress());
            }*/
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }


    // 2.b Update an address in the database.
    public void updateAddress(Address address) {

        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.merge(address);
            session.getTransaction().commit();

        } finally {
            session.close();
        }
    }


    // 3.a Delete a user from the database.
    public void deleteUser(User user) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.remove(user);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    //3.b Delete an address from the database.
    public void deleteAddress(Address address) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.remove(address);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }




    // 4. List all users with home and office addresses.
    public List<User> listAllUsers() {
        Session session = sessionFactory.openSession();
        try {
            // Fetch all User records.
            List<User> users = session.createQuery("FROM User", User.class).getResultList();

            // Fetch the home and office addresses for each user.
            for (User user : users) {
                user.setHomeAddress(session.find(Address.class, user.getHomeAddressId()));
                user.setOfficeAddress(session.find(Address.class, user.getOfficeAddressId()));
            }

            return users;
        } finally {
            session.close();
        }
    }




    //5.a Find a user from the database using the user ID.
    public User findUser(int userId) {
        Session session = sessionFactory.openSession();
        try {
            return session.find(User.class, userId);
        } finally {
            session.close();
        }
    }
    //5.b Find an address from the database using the address ID.
    public Address findAddress(int addressId) {
        Session session = sessionFactory.openSession();
        try {
            return session.find(Address.class, addressId);
        } finally {
            session.close();
        }
    }
}