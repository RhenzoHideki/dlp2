--=============================
-- Listing 9.2
--=============================

entity mod10_counter is
    port(
    clk, reset: in std_logic;
     q: out std_logic_vector(3 downto 0)
     );
end mod10_counter;


architecture two_seg_arch of mod10_counter is
    signal r_reg: unsigned(3 downto 0);
    signal r_next: unsigned(3 downto 0);

    begin
-- register
    process(clk,reset)
    begin
        if (reset='1') then
            r_reg <= (others=>'0');
        elsif (clk'event and clk='1') then
            r_reg <= r_next;
        end if;
    end process;
    -- next-state logic
    r_next <= (others=>'0') when r_reg=9 else
    r_reg + 1;
    -- output logic
    q <= std_logic_vector(r_reg);
end two_seg_arch;