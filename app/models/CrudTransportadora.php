<?php
/**
 * Created by PhpStorm.
 * User: aluno
 * Date: 13/08/2018
 * Time: 13:45
 */
 require_once "conexao.php";

 require_once "Transportadora.php";

//DAQUI PARA BAIXO, POR ENQUANTO, ESTÁ COPIADO DO CrudCaminhoneiro

class Crudusuario{

    private $conexao;
    public  $Transportadora;

    //CONEXÃO COM O BANCO
    public function __construct(){
        $this->conexao = Conexao::getConexao();
    }

    //Cadastra o usuario
    public function salvar(usuario $Transportadora){

        $sql = "INSERT INTO transportadora (nome, email, telefone, senha, razao_social, cnpj); 
                VALUES ({$Transportadora->nome}, {$Transportadora->email}, {$Transportadora->telefone}, {$Transportadora->senha}, {$Transportadora->razao_social}, {$Transportadora->cnpj}";

        $this->conexao->exec($sql);
    }


    //Busca
    public function getusuario(int $cod_usuario)
    {
        $consultausuarios->conexao->query("SELECT * FROM transportadora WHERE cod_usuario = $cod_usuario");
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC); //SEMELHANTES JSON ENCODE E DECODE

        return new usuario($usuario['nome'], $usuario['email'], $usuario['telefone'], $usuario['senha'], $usuario['razao_social'], $usuario['cnpj'];
    }

    public function getusuarios(){
        $consulta = $this->conexao->query("SELECT * FROM transportadora");
        $arrayusuarios = $consulta->fetchAll($this->transportadoraTCH_ASSOC);

        //Fabrica de caminhoneiro
        $listausuario = [];
        foreach ($arrayusuarios as $usuarusuario  $listausuario[] = new usuario($usuarios['nome'], $usuarios['sobrenome'], $usuarios['email'],$usuarios['quantidade_telefone'], $usuarios['cod_usuario']){
        }
        return $this->transportadora;
    }

    //Exclui o usuario
    public function excluirusuario(int $x)
    {
        $this->conexao->exec("DELETE from transportadora where cod_usuario = $x"usuario}

    //Edita as informações do usuario
    public function editar($id, $nome, $email, $telefone)
    {
        $this->conexao->exec("UPDATE transportadora SET nome = $nome, email = $email, sobrenome =usuarionome, telefone = $telefone WHERE usuario.cod_usuario = $id; ");
    }

    public function login($usuario, $senha){
        $consultausuarios->conexao->query("SELECT * FROM usuario WHERE cod_usuario = $cod_usuario");
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC); //SEMELHANTES JSON ENCODE E DECODE
        return new usuario($usuario['nome'], $usuario['email'], $usuario['cod_usuario']);

    }

}