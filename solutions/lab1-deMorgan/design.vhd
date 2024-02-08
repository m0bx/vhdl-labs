-------------------------------------------------
--! @brief Example to demonstrate De Morgan's Laws.
--! @version 1.3
--! @copyright (c) 2019 Tomas Fryza, MIT license
--!
--! This example implements the original logic
--! function and its modified versions using De
--! Morgan's Laws. By comparing the output signals
--! for the expressions, the verification of the
--! laws is confirmed.
-------------------------------------------------

library ieee; -- Standard library
  -- Package for data type and logic operations
  use ieee.std_logic_1164.all;

-------------------------------------------------

entity morgan is
  port (
    c      : in    std_logic;
    b      : in    std_logic;
    a      : in    std_logic;
    f_orig : out   std_logic; --! Original function
    f_nand : out   std_logic; --! (N)AND version
    f_nor  : out   std_logic  --! (N)OR version
  );
end entity morgan;

-------------------------------------------------

architecture behavioral of morgan is

begin

  -- Original logic function
  f_orig <= not(c and b) or (not(b) and a);

  -- Use DeMorgans laws and modify the function

  f_nand <= not((c and b) and not(not(b) and a));
  f_nor  <= (not(c) or not(b)) or not(b or not(a));

end architecture behavioral;
