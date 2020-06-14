-- MySQL Script generated by MySQL Workbench
-- Sun Jun 14 16:23:20 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db-equipe54
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db-equipe54
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db-equipe54` DEFAULT CHARACTER SET utf8 ;
USE `db-equipe54` ;

-- -----------------------------------------------------
-- Table `db-equipe54`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `estadoEndereco` VARCHAR(45) NOT NULL,
  `cidadeEndereco` VARCHAR(100) NOT NULL,
  `logradouroEndereco` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Pessoa` (
  `idPessoa` INT NOT NULL AUTO_INCREMENT,
  `idEndereco` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idPessoa`),
  INDEX `idEnderecoPes_idx` (`idEndereco` ASC) VISIBLE,
  CONSTRAINT `idEnderecoPes`
    FOREIGN KEY (`idEndereco`)
    REFERENCES `db-equipe54`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Nivel` (
  `idNivel` INT NOT NULL AUTO_INCREMENT,
  `funcao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  `idNivel` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `idPessoaUs_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `idNivelUs_idx` (`idNivel` ASC) VISIBLE,
  CONSTRAINT `idPessoaUs`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `db-equipe54`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idNivelUs`
    FOREIGN KEY (`idNivel`)
    REFERENCES `db-equipe54`.`Nivel` (`idNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curriculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curriculo` (
  `idCurriculo` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCurriculo`),
  INDEX `idUsuarioCur_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuarioCur`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `db-equipe54`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curso_Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curso_Tipo` (
  `idCurso_Tipo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso_Tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curso` (
  `idCurso` INT NOT NULL,
  `idCurso_Tipo` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `idCursoTip_idx` (`idCurso_Tipo` ASC) VISIBLE,
  CONSTRAINT `idCursoTip`
    FOREIGN KEY (`idCurso_Tipo`)
    REFERENCES `db-equipe54`.`Curso_Tipo` (`idCurso_Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curriculo_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curriculo_Curso` (
  `idCurriculo_Curso` INT NOT NULL AUTO_INCREMENT,
  `idCurriculo` INT NOT NULL,
  `idCurso` INT NOT NULL,
  PRIMARY KEY (`idCurriculo_Curso`),
  INDEX `idCurriculoC_idx` (`idCurriculo` ASC) VISIBLE,
  INDEX `idCursoC_idx` (`idCurso` ASC) VISIBLE,
  CONSTRAINT `idCurriculoC`
    FOREIGN KEY (`idCurriculo`)
    REFERENCES `db-equipe54`.`Curriculo` (`idCurriculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCursoC`
    FOREIGN KEY (`idCurso`)
    REFERENCES `db-equipe54`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curriculo_Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curriculo_Idioma` (
  `idCurriculo_Idioma` INT NOT NULL AUTO_INCREMENT,
  `idCurriculo` INT NOT NULL,
  `idCurso` INT NOT NULL,
  `tempo` INT NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`idCurriculo_Idioma`),
  INDEX `idCurriculoId_idx` (`idCurriculo` ASC) VISIBLE,
  INDEX `idCursoId_idx` (`idCurso` ASC) VISIBLE,
  CONSTRAINT `idCurriculoId`
    FOREIGN KEY (`idCurriculo`)
    REFERENCES `db-equipe54`.`Curriculo` (`idCurriculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCursoId`
    FOREIGN KEY (`idCurso`)
    REFERENCES `db-equipe54`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Categoria_Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Categoria_Cargo` (
  `idCategoria_Cargo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria_Cargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idCategoria_Cargo` INT NOT NULL,
  PRIMARY KEY (`idCargo`),
  INDEX `idCategoriaCargoCarg_idx` (`idCategoria_Cargo` ASC) VISIBLE,
  CONSTRAINT `idCategoriaCargoCarg`
    FOREIGN KEY (`idCategoria_Cargo`)
    REFERENCES `db-equipe54`.`Categoria_Cargo` (`idCategoria_Cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `idCargo` INT NOT NULL,
  `tempo` INT NOT NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`idExperiencia`),
  INDEX `idCargo_idx` (`idCargo` ASC) VISIBLE,
  CONSTRAINT `idCargoEx`
    FOREIGN KEY (`idCargo`)
    REFERENCES `db-equipe54`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curriculo_Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curriculo_Experiencia` (
  `idCurriculo_Experiencia` INT NOT NULL AUTO_INCREMENT,
  `idCurriculo` INT NOT NULL,
  `idExperiencia` INT NOT NULL,
  PRIMARY KEY (`idCurriculo_Experiencia`),
  INDEX `idCurriculoExp_idx` (`idCurriculo` ASC) VISIBLE,
  INDEX `idExperienciaExp_idx` (`idExperiencia` ASC) VISIBLE,
  CONSTRAINT `idCurriculoExp`
    FOREIGN KEY (`idCurriculo`)
    REFERENCES `db-equipe54`.`Curriculo` (`idCurriculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idExperienciaExp`
    FOREIGN KEY (`idExperiencia`)
    REFERENCES `db-equipe54`.`Experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Localidade` (
  `idLocalidade` INT NOT NULL AUTO_INCREMENT,
  `nomeLocalidade` VARCHAR(45) NOT NULL,
  `idRegiao` INT NOT NULL,
  `idMacrorregiao` INT NOT NULL,
  `idMicrorregiao` INT NOT NULL,
  PRIMARY KEY (`idLocalidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Curriculo_Localidade_Interesse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Curriculo_Localidade_Interesse` (
  `idCurriculo_Regiao` INT NOT NULL AUTO_INCREMENT,
  `idCurriculo` INT NOT NULL,
  `idLocalidade` INT NOT NULL,
  PRIMARY KEY (`idCurriculo_Regiao`),
  INDEX `idCurricloLi_idx` (`idCurriculo` ASC) VISIBLE,
  INDEX `idLocalidade_idx` (`idLocalidade` ASC) VISIBLE,
  CONSTRAINT `idCurricloLi`
    FOREIGN KEY (`idCurriculo`)
    REFERENCES `db-equipe54`.`Curriculo` (`idCurriculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLocalidade`
    FOREIGN KEY (`idLocalidade`)
    REFERENCES `db-equipe54`.`Localidade` (`idLocalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Deficiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Deficiencia` (
  `idDeficiencia` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idDeficiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Pessoa_Deficiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Pessoa_Deficiencia` (
  `idPessoa_Deficiencia` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  `idDeficiencia` INT NOT NULL,
  PRIMARY KEY (`idPessoa_Deficiencia`),
  INDEX `idDeficienciaPd_idx` (`idDeficiencia` ASC) VISIBLE,
  INDEX `idPessoaPd_idx` (`idPessoa` ASC) VISIBLE,
  CONSTRAINT `idDeficienciaPd`
    FOREIGN KEY (`idDeficiencia`)
    REFERENCES `db-equipe54`.`Deficiencia` (`idDeficiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPessoaPd`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `db-equipe54`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`CNH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`CNH` (
  `idCNH` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCNH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-equipe54`.`Pessoa_CNH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-equipe54`.`Pessoa_CNH` (
  `idPessoa_CNH` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NULL,
  `idCNH` INT NULL,
  PRIMARY KEY (`idPessoa_CNH`),
  INDEX `idPessoaCN_idx` (`idPessoa` ASC) VISIBLE,
  INDEX `idCnhPn_idx` (`idCNH` ASC) VISIBLE,
  CONSTRAINT `idPessoaCN`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `db-equipe54`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCnhPn`
    FOREIGN KEY (`idCNH`)
    REFERENCES `db-equipe54`.`CNH` (`idCNH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
