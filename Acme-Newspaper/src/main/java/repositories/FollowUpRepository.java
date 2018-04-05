
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.FollowUp;

@Repository
public interface FollowUpRepository extends JpaRepository<FollowUp, Integer> {

	@Query("select f from Followup f where f.article.id = ?1")
	Collection<FollowUp> findFollowUpsByArticle(int articleId);
}
