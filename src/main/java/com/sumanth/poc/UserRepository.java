package com.sumanth.poc;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;

@Component
public interface UserRepository extends JpaRepository<User, Long> {
    @Transactional
    @Modifying
    @Query("update User set password=?1 where username=?2")
    void change(String password,String username);
    User findByUsername(String username);
}
