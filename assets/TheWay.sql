-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 11-Maio-2018 às 14:36
-- Versão do servidor: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TheWay`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `caminhao`
--

CREATE TABLE `caminhao` (
  `cod_caminhao` int(11) NOT NULL,
  `ano_modelo` year(4) DEFAULT NULL,
  `ano_fabricacao` year(4) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `cod_modelo` int(11) DEFAULT NULL,
  `cod_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caminhoneiro`
--

CREATE TABLE `caminhoneiro` (
  `rg` int(11) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `num_antt` int(11) DEFAULT NULL,
  `num_cnh` int(11) DEFAULT NULL,
  `categoria_cnh` varchar(15) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carreta`
--

CREATE TABLE `carreta` (
  `cod_carreta` int(11) NOT NULL,
  `ano_fabricacao` year(4) DEFAULT NULL,
  `ano_modelo` year(4) DEFAULT NULL,
  `cod_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `nome` varchar(30) DEFAULT NULL,
  `cod_cidade` int(11) NOT NULL,
  `cod_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `nome` varchar(30) DEFAULT NULL,
  `siglauf` char(2) DEFAULT NULL,
  `cod_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `cod_servico` int(11) DEFAULT NULL,
  `data_insc` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `cod_modelo` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cod_montadora` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `montadora`
--

CREATE TABLE `montadora` (
  `cod_montadora` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `numero_seguro` int(11) DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `cod_servico` int(11) NOT NULL,
  `data_cadastro` date DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `data_retirada` date DEFAULT NULL,
  `data_retirada_prev` date DEFAULT NULL,
  `data_entrega_prev` date DEFAULT NULL,
  `cod_status` int(11) DEFAULT NULL,
  `cod_cidade` int(11) DEFAULT NULL,
  `cod_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_servico`
--

CREATE TABLE `status_servico` (
  `cod_status` int(11) NOT NULL,
  `desc_status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_caminhao`
--

CREATE TABLE `tipo_caminhao` (
  `cod_tipo` int(11) NOT NULL,
  `descricao` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_produto`
--

CREATE TABLE `tipo_produto` (
  `cod_produto` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadora`
--

CREATE TABLE `transportadora` (
  `cnpj` int(11) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `CEP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caminhao`
--
ALTER TABLE `caminhao`
  ADD PRIMARY KEY (`cod_caminhao`),
  ADD KEY `cod_tipo` (`cod_tipo`),
  ADD KEY `cod_modelo` (`cod_modelo`);

--
-- Indexes for table `caminhoneiro`
--
ALTER TABLE `caminhoneiro`
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indexes for table `carreta`
--
ALTER TABLE `carreta`
  ADD PRIMARY KEY (`cod_carreta`),
  ADD KEY `cod_produto` (`cod_produto`);

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`cod_cidade`),
  ADD KEY `cod_estado` (`cod_estado`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cod_estado`);

--
-- Indexes for table `inscricao`
--
ALTER TABLE `inscricao`
  ADD KEY `cod_servico` (`cod_servico`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`cod_modelo`),
  ADD KEY `cod_montadora` (`cod_montadora`);

--
-- Indexes for table `montadora`
--
ALTER TABLE `montadora`
  ADD PRIMARY KEY (`cod_montadora`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`cod_servico`),
  ADD KEY `cod_status` (`cod_status`),
  ADD KEY `cod_cidade` (`cod_cidade`),
  ADD KEY `cod_produto` (`cod_produto`);

--
-- Indexes for table `status_servico`
--
ALTER TABLE `status_servico`
  ADD PRIMARY KEY (`cod_status`);

--
-- Indexes for table `tipo_caminhao`
--
ALTER TABLE `tipo_caminhao`
  ADD PRIMARY KEY (`cod_tipo`);

--
-- Indexes for table `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Indexes for table `transportadora`
--
ALTER TABLE `transportadora`
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`),
  ADD KEY `cod_cidade` (`CEP`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `caminhao`
--
ALTER TABLE `caminhao`
  ADD CONSTRAINT `caminhao_ibfk_1` FOREIGN KEY (`cod_tipo`) REFERENCES `tipo_caminhao` (`cod_tipo`),
  ADD CONSTRAINT `caminhao_ibfk_2` FOREIGN KEY (`cod_modelo`) REFERENCES `modelo` (`cod_modelo`);

--
-- Limitadores para a tabela `caminhoneiro`
--
ALTER TABLE `caminhoneiro`
  ADD CONSTRAINT `caminhoneiro_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`);

--
-- Limitadores para a tabela `carreta`
--
ALTER TABLE `carreta`
  ADD CONSTRAINT `carreta_ibfk_1` FOREIGN KEY (`cod_produto`) REFERENCES `tipo_produto` (`cod_produto`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estado` (`cod_estado`);

--
-- Limitadores para a tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`cod_servico`) REFERENCES `servico` (`cod_servico`);

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`cod_montadora`) REFERENCES `montadora` (`cod_montadora`);

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `servico_ibfk_1` FOREIGN KEY (`cod_status`) REFERENCES `status_servico` (`cod_status`),
  ADD CONSTRAINT `servico_ibfk_2` FOREIGN KEY (`cod_cidade`) REFERENCES `cidade` (`cod_cidade`),
  ADD CONSTRAINT `servico_ibfk_3` FOREIGN KEY (`cod_produto`) REFERENCES `tipo_produto` (`cod_produto`);

--
-- Limitadores para a tabela `transportadora`
--
ALTER TABLE `transportadora`
  ADD CONSTRAINT `transportadora_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`CEP`) REFERENCES `cidade` (`cod_cidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
