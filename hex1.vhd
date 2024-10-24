
--*****************************************************************************
-- CENTRO UNIVERSITARIO FEI
-- Sistemas Digitais II  -  Projeto 1  - 2o Semestre de 2024
-- Prof. Dr. Valter F. Avelino - 07/2024
-- Componente VHDL: Decodificador Hexadecimal / 7 Segmentos => DEC_HEX.vhd
-- Rev. 0
-- Especificacoes: Entradas: Q[3..0]
-- 				    Saidas:   D[6..0]
-- Esse codigo eh um exemplo de descricao VHDL de um decodificador de codigos
-- hexadecimais em codigo para ativacao de display de 7 segmentos da disciplina
-- de Laboratorio de Sistemas Digitais II do Centro Universitario FEI.
--****************************************************************************
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY hex1 IS 			  			-- declaracao da entidade DEC_HEX
	PORT 
	(	L 	: IN  STD_LOGIC_VECTOR(5 downto 0); 	-- vetor de entrada L[6..0]
		DD  : OUT STD_LOGIC_VECTOR(6 downto 0)); 	-- vetor de saida D[6..0]
END hex1;

ARCHITECTURE SELETOR OF hex1 IS      	
BEGIN
	WITH L SELECT
		DD     <=	"1111110" WHEN "000000",	-- display 0
					"1111011" WHEN "000001",	-- display 1
					"1111101" WHEN "000010",	-- display 2
					"0110000" WHEN "000011",	-- display 3 NAO USA
					"1011111" WHEN "000100",	-- display 4 
					"1110111" WHEN "000101",	-- display 5
					"0000010" WHEN "000110",	-- display 6 NAO SUA
					"1101111" WHEN "000111",	-- display 7
					"0000000" WHEN "001000",	-- display 8 NAO USA
					"0010000" WHEN "001001",	-- display 9 NAO USA
					"0001000" WHEN "001010",	-- display A
					"0000011" WHEN "001011",	-- display b
					"1000110" WHEN "001100",	-- display C
					"0100001" WHEN "001101",	-- display d
					"0000110" WHEN "001110",	-- display E
					"0001110" WHEN "001111",	-- display F
					"1111111" WHEN OTHERS;	-- display Apagado
END SELETOR;
