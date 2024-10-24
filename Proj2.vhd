LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Proj2 IS
    PORT (
        CLK, INI, VA, VB: IN STD_LOGIC;  -- Entradas
        L: OUT STD_LOGIC;                -- Saída
        ESTADO_FSM: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)  -- Saída do estado
    );
END Proj2;

ARCHITECTURE BEHAVIOR OF Proj2 IS
    TYPE type_state IS (E0, E2, E4, E6, E8, E10); -- Definição dos estados
    SIGNAL Estado: type_state;                   -- Sinal para armazenar o estado atual
    SIGNAL Entradas: STD_LOGIC_VECTOR (2 DOWNTO 1); -- Concatenação das entradas VA e VB
BEGIN

    Entradas <= VA & VB; -- Concatena os sinais de entrada VA e VB

    PROCESS (CLK, INI)
    BEGIN
        IF (INI = '0') THEN
            Estado <= E0;  -- Estado inicial ao resetar
        ELSIF (CLK'EVENT AND CLK = '1' AND INI = '1') THEN -- Detecção de borda de subida do clock
            CASE Estado IS
                WHEN E0 =>
                    ESTADO_FSM <= "00000001";  -- Atribuindo valor binário ao estado E0
                    IF Entradas = "01" THEN 
                        Estado <= E2;  -- Transição de E0 para E2
                    ELSIF Entradas = "10" THEN 
                        Estado <= E6;  -- Transição de E0 para E6
                    ELSE 
                        Estado <= E0;
                    END IF;
                    
                WHEN E2 =>
                    ESTADO_FSM <= "00000010";  -- Atribuindo valor binário ao estado E2
                    IF Entradas = "01" THEN 
                        Estado <= E4;  -- Transição de E2 para E4
                    ELSIF Entradas = "10" THEN 
                        Estado <= E8;  -- Transição de E2 para E8
                    ELSE 
                        Estado <= E2;
                    END IF;
                    
                WHEN E4 =>
                    ESTADO_FSM <= "00000100";  -- Atribuindo valor binário ao estado E4
                    IF Entradas = "01" THEN 
                        Estado <= E6;  -- Transição de E4 para E6
                    ELSIF Entradas = "10" THEN 
                        Estado <= E10; -- Transição de E4 para E10
                    ELSE 
                        Estado <= E4;
                    END IF;
                    
                WHEN E6 =>
                    ESTADO_FSM <= "00001000";  -- Atribuindo valor binário ao estado E6
                    IF Entradas = "01" THEN 
                        Estado <= E8;  -- Transição de E6 para E8
                    ELSIF Entradas = "10" THEN 
                        Estado <= E10; -- Transição de E6 para E10
                    ELSE 
                        Estado <= E6;
                    END IF;
                    
                WHEN E8 =>
                    ESTADO_FSM <= "00010000";  -- Atribuindo valor binário ao estado E8
                    IF Entradas = "01" THEN 
                        Estado <= E10; -- Transição de E8 para E10
                    ELSIF Entradas = "10" THEN 
                        Estado <= E10; -- Transição de E8 para E10
                    ELSE 
                        Estado <= E8;
                    END IF;
                    
                WHEN E10 =>
                    ESTADO_FSM <= "00100000";  -- Atribuindo valor binário ao estado E10
                    -- Não há transição adicional para E10 no código original
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;