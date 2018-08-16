<?php

require_once "conexao.php";

require_once "transportadora.php";

class Crudtransportadora{

    private $conexao;
    public  $transportadora;

    //CONEXÃO COM O BANCO
    public function __construct(){
        $this->conexao = Conexao::getConexao();
    }

    //Cadastra o usuario transportadora
    public function salvar ($transportadora){

        $sql = "INSERT INTO transportadora (razao_socail, cnpj, cod_usuario) 
                VALUES ({$transportadora->razao}, {$transportadora->cnpj})";

        $this->conexao->exec($sql);
    }

    //Busca usuario transportadora
    public function getusuario (int $cod_usuario){

        $consultausuario->conexao->query("SELECT * FROM transportadora WHERE cod_usuario = $cod_usuario");
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC); //SEMELHANTES JSON ENCODE E DECODE

        return new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['rg'], $usuario['cpf'], $usuario['num_cnh']);
    }

    public function getusuarios (){

        $consulta = $this->conexao->query("SELECT * FROM transportadora");
        $arrayusuarios = $consulta->fetchAll($this->transportadora);

        //Fabrica de transportadora
        $listausuario = [];

        foreach ($arrayusuarios as $usuario ){

            $listausuario[] = new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['rg'], $usuario['cpf'], $usuario['num_cnh']);

        }

        return $this->transportadora;
    }

    //Exclui o usuario
    public function excluirusuario ($x){

        $this->conexao->exec("DELETE from transportadora where cod_usuario = $x");
    }

    //Edita as informações do usuario
    public function editar ($nome, $email, $telefone, $senha, $rg, $cpf, $num_cnh){

        $this->conexao->exec("UPDATE transportadora SET nome = $nome, email = $email, telefone = $telefone, senha = $senha, rg = $rg, cpf = $cpf, num_cnh = $num_cnh WHERE transportadora.cod_usuario = $id; ");
    }

    //login
    public function login ($usuario, $senha, $cod_usuario){

        $consultausuarios->conexao->query("SELECT * FROM transportadora WHERE cod_usuario = $cod_usuario");
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC); //SEMELHANTES JSON ENCODE E DECODE

        return new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['rg'], $usuario['cpf'], $usuario['num_cnh']);

    }

}
