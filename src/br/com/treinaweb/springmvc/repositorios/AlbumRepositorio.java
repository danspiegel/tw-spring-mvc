package br.com.treinaweb.springmvc.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.treinaweb.springmvc.dominios.Album;

public interface AlbumRepositorio extends JpaRepository<Album, Long> {

	@Query("select a from Album a where a.nome like %:nome%")
	List<Album> findByNome(@Param("nome") String nome);
	
}
