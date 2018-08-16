<?php 
//requisição dos arquivos

require_once "../models/caminhoneiro.php";

require_once "../models/CrudCaminhoneiro.php";
//sessao
  if (!isset($_SESSION)){
      session_start();
}

  if (!isset($_GET['acao'])) {
      $_GET['acao'] = null;