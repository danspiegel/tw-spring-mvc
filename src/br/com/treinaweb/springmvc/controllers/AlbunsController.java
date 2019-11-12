package br.com.treinaweb.springmvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.treinaweb.springmvc.dominios.Album;
import br.com.treinaweb.springmvc.repositorios.AlbumRepositorio;

@Controller
@RequestMapping("/albuns")
public class AlbunsController {
	
	@Autowired
	private AlbumRepositorio albumRepositorio;
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public String listar(Model model) {
		List<Album> albuns = albumRepositorio.findAll();
		model.addAttribute("albuns", albuns);
		return "album.listar.tiles";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public String adicionar(Model model) {
		model.addAttribute("album", new Album());
		return "album.adicionar.tiles";
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("album") @Valid Album novoAlbum, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "album.adicionar.tiles";
		}
		
		albumRepositorio.save(novoAlbum);
		return "redirect:/albuns/listar";
	}
	
	@RequestMapping(value = "/alterar/{id}", method = RequestMethod.GET)
	public String alterar(@PathVariable("id") Long id, Model model) {
		Album album = albumRepositorio.findOne(id);
		model.addAttribute("album", album);
		return "album.alterar.tiles";
	}
	
	@RequestMapping(value = "/alterar", method = RequestMethod.POST)
	public String alterar(@ModelAttribute("album") @Valid Album album, BindingResult result) {
		if (result.hasErrors()) {
			return "album.alterar.tiles";
		}
		Album albumOriginal = albumRepositorio.findOne(album.getId());
		album.setMusicas(albumOriginal.getMusicas());
		albumRepositorio.save(album);
		return "redirect:/albuns/listar";
	}
	
	@RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Long id) {
		albumRepositorio.delete(id);
		return "redirect:/albuns/listar";
	}
	
	@RequestMapping(value = "/porNome", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Album> pesquisarPorNome(@RequestParam(name = "nome", defaultValue = "") String nomeAlbum) {
        return albumRepositorio.findByNome(nomeAlbum);
	}

}
