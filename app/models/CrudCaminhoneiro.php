<?php

 require_once "conexao.php";

 require_once "caminhoneiro.php";

class Crudcaminhoneiro{

    private $conexao;
    public  $caminhoneiro;

    //CONEXÃO COM O BANCO
    public function __construct(){
        $this->conexao = Conexao::getConexao();
    }

    //Cadastra o usuario caminhoneiro
    public function salvar ($caminhoneiro){

        $sql = "INSERT INTO caminhoneiro (nome, email, telefone, senha, rg, cpf, num_antt, num_cnh, categoria_cnh, cod_usuario) 
                VALUES ({$caminhoneiro->nome}, {$caminhoneiro->email}, {$caminhoneiro->telefone}, {$caminhoneiro->senha}, {$caminhoneiro->rg}, {$caminhoneiro->cpf}, {$caminhoneiro->num_antt}, {$caminhoneiro->num_cnh}, {$caminhoneiro->categoria_cnh})";

        $this->conexao->exec($sql);
    }

    //Busca usuario caminhoneiro
    public function getusuario (int $cod_usuario){

        $consultausuario->conexao->query("SELECT * FROM caminhoneiro WHERE cod_usuario = $cod_usuario");
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC); //SEMELHANTES JSON ENCODE E DECODE

        return new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['rg'], $usuario['cpf'], $usuario['num_cnh']);
    }

    public function getusuarios (){

        $consulta = $this->conexao->query("SELECT * FROM caminhoneiro");
        $arrayusuarios = $consulta->fetchAll($this->caminhoneiro);

    //Fabrica de caminhoneiro
        $listausuario = [];

        foreach ($arrayusuarios as $usuario ){

            $listausuario[] = new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['rg'], $usuario['cpf'], $usuario['num_cnh']);

        }

        return $this->caminhoneiro;
    }

    //Exclui o usuario
    public function excluirusuario ($x){

        $this->conexao->exec("DELETE from caminhoneiro where cod_usuario = $x");
}

    //Edita as informações do usuario
    public function editar ($nome, $email, $telefone, $senha, $rg, $cpf, $num_cnh){

        $this->conexao->exec("UPDATE caminhoneiro SET nome = $nome, email = $email, telefone = $telefone, senha = $senha, rg = $rg, cpf = $cpf, num_cnh = $num_cnh WHERE caminhoneiro.cod_usuario = $id; ");
    }

    //login
    public function login ($usuario, $senha, $cod_usuario){

        $consultausuarios->conexao->query("SELECT * FROM caminhoneiro WHERE cod_usuario = $cod_usuario");
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC); //SEMELHANTES JSON ENCODE E DECODE

        return new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['rg'], $usuario['cpf'], $usuario['num_cnh']);

    }

}
