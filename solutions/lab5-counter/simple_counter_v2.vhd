-------------------------------------------------
--! @brief N-bit binary counter
--! @version 1.3
--! @copyright (c) 2019-2024 Tomas Fryza, MIT license
--!
--! Implementation of N-bit up counter. Number of bits is
--! set by `N` generic and counting is enabled by `en` input.
--!
--! Developed using TerosHDL, Vivado 2023.2, and EDA Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all; -- Package for incrementing std_logic_vectors

-------------------------------------------------

entity simple_counter is
    generic (
        N : integer := 3 --! Default number of counter bits
    );
    port (
        clk   : in    std_logic;                       --! Main clock
        rst   : in    std_logic;                       --! High-active synchronous reset
        en    : in    std_logic;                       --! Clock enable input
        count : out   std_logic_vector(N - 1 downto 0) --! Counter value
    );
end entity simple_counter;

-------------------------------------------------

architecture behavioral of simple_counter is
    --! Local counter
    signal sig_count : std_logic_vector(N - 1 downto 0);
begin

    --! Clocked process with synchronous reset which implements
    --! N-bit up counter.
    p_simple_counter : process (clk) is
    begin

        if (rising_edge(clk)) then
            if (rst = '1') then                    -- Synchronous reset
                sig_count <= (others => '0');

            -- Clock enable activated
            elsif (en = '1') then
                sig_count <= sig_count + 1;
            end if;                                -- Each `if` must end by `end if`
        end if;

    end process p_simple_counter;

    -- Assign internal register to output
    count <= sig_count;

end architecture behavioral;
