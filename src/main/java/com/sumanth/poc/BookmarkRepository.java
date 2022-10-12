package com.sumanth.poc;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface BookmarkRepository extends JpaRepository<Bookmark, Long> {
    @Transactional
    @Modifying
    @Query("update Bookmark set title=?1, link=?2 where id=?3")
    void change(String title,String link, Long id);
    List<Bookmark> findByUsername(String username);

    Bookmark findByLink(String link);
}
