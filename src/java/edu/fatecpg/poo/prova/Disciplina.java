/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fatecpg.poo.prova;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author user
 */
public class Disciplina {
    private static ArrayList<Disciplina> matriculadas = new ArrayList<Disciplina>(
            Arrays.asList(
                    new Disciplina("Banco de Dados", 4),
                    new Disciplina("Engenharia de Software III", 4),
                    new Disciplina("Programação Orientada a Objetos", 4),
                    new Disciplina("Linguagem de Programação IV - INTERNET", 4),
                    new Disciplina("Segurança da Informação", 4),
                    new Disciplina("Sistemas Operacionais II", 4),
                    new Disciplina("Metodologia da Pesquisa Científico-Tecnológica", 4)
            )
    );
    
    private String nome;
    private String ementa;
    private int ciclo;
    private double nota;
    
    public Disciplina(String nome, String ementa, int ciclo) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
    }
    
    public Disciplina(String nome, int ciclo) {
        this.nome = nome;
        this.ciclo = ciclo;
    }
    
    public String getNome() {
        return this.nome;
    }
    public String getEmenta() {
        return this.ementa;
    }
    public int getCiclo() {
        return this.ciclo;
    }
    public double getNota() {
        return this.nota;
    }
    
    public void setNome(String novoNome) {
        this.nome = novoNome;
    }
    public void setEmenta(String novaEmenta) {
        this.ementa = novaEmenta;
    }
    public void setCiclo(int novoCiclo) {
        this.ciclo = novoCiclo;
    }
    public void setNota(double novaNota) {
        this.nota = novaNota;
    }
    
    public static ArrayList<Disciplina> getList() {
        return matriculadas;
    }
}
