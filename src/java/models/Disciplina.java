/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.ArrayList;
import java.util.Arrays;
import java.sql.*;
import listeners.DbListener;
import static listeners.DbListener.getConnection;

/**
 *
 * @author user
 */
public class Disciplina {
    
    private String nome;
    private double nota;
    
    public Disciplina(String nome, double nota) {
        this.nome = nome;
        this.nota = nota;
    }
    
    public String getNome() {
        return this.nome;
    }
    public double getNota() {
        return this.nota;
    }
    
    public void setNome(String novoNome) {
        this.nome = novoNome;
    }
    public void setNota(double novaNota) {
        this.nota = novaNota;
    }
    
    public static ArrayList getList() {
        Connection con = null;
        Statement stmt = null;
        ArrayList disciplinas = new ArrayList();
        
        try {
            con = getConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM disciplina");
            
            while(rs.next()) {
                disciplinas.add(
                    new Disciplina(rs.getString("nome"),
                    rs.getDouble("nota")
                ));
            }
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        
        return disciplinas;
    }
    
    public void create() {
        Connection con = null;
        PreparedStatement stmt = null;
        
        try {
            con = getConnection();
            stmt = con.prepareStatement("INSERT INTO disciplina(nome, nota) VALUES(?, ?)");
            stmt.setString(1, this.nome);
            stmt.setDouble(2, this.nota);
            stmt.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static String getTableStatement() {
        return "CREATE TABLE IF NOT EXISTS disciplina("
                + "nome VARCHAR(25) NOT NULL,"
                + "nota REAL NOT NULL"
                + ")";
    }
}
