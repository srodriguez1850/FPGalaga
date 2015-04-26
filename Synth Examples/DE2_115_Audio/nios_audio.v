//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altpll_pll_slave_arbitrator (
                                     // inputs:
                                      altpll_pll_slave_readdata,
                                      clk,
                                      nios_audio_clock_1_out_address_to_slave,
                                      nios_audio_clock_1_out_read,
                                      nios_audio_clock_1_out_write,
                                      nios_audio_clock_1_out_writedata,
                                      reset_n,

                                     // outputs:
                                      altpll_pll_slave_address,
                                      altpll_pll_slave_read,
                                      altpll_pll_slave_readdata_from_sa,
                                      altpll_pll_slave_reset,
                                      altpll_pll_slave_write,
                                      altpll_pll_slave_writedata,
                                      d1_altpll_pll_slave_end_xfer,
                                      nios_audio_clock_1_out_granted_altpll_pll_slave,
                                      nios_audio_clock_1_out_qualified_request_altpll_pll_slave,
                                      nios_audio_clock_1_out_read_data_valid_altpll_pll_slave,
                                      nios_audio_clock_1_out_requests_altpll_pll_slave
                                   )
;

  output  [  1: 0] altpll_pll_slave_address;
  output           altpll_pll_slave_read;
  output  [ 31: 0] altpll_pll_slave_readdata_from_sa;
  output           altpll_pll_slave_reset;
  output           altpll_pll_slave_write;
  output  [ 31: 0] altpll_pll_slave_writedata;
  output           d1_altpll_pll_slave_end_xfer;
  output           nios_audio_clock_1_out_granted_altpll_pll_slave;
  output           nios_audio_clock_1_out_qualified_request_altpll_pll_slave;
  output           nios_audio_clock_1_out_read_data_valid_altpll_pll_slave;
  output           nios_audio_clock_1_out_requests_altpll_pll_slave;
  input   [ 31: 0] altpll_pll_slave_readdata;
  input            clk;
  input   [  3: 0] nios_audio_clock_1_out_address_to_slave;
  input            nios_audio_clock_1_out_read;
  input            nios_audio_clock_1_out_write;
  input   [ 31: 0] nios_audio_clock_1_out_writedata;
  input            reset_n;

  wire    [  1: 0] altpll_pll_slave_address;
  wire             altpll_pll_slave_allgrants;
  wire             altpll_pll_slave_allow_new_arb_cycle;
  wire             altpll_pll_slave_any_bursting_master_saved_grant;
  wire             altpll_pll_slave_any_continuerequest;
  wire             altpll_pll_slave_arb_counter_enable;
  reg              altpll_pll_slave_arb_share_counter;
  wire             altpll_pll_slave_arb_share_counter_next_value;
  wire             altpll_pll_slave_arb_share_set_values;
  wire             altpll_pll_slave_beginbursttransfer_internal;
  wire             altpll_pll_slave_begins_xfer;
  wire             altpll_pll_slave_end_xfer;
  wire             altpll_pll_slave_firsttransfer;
  wire             altpll_pll_slave_grant_vector;
  wire             altpll_pll_slave_in_a_read_cycle;
  wire             altpll_pll_slave_in_a_write_cycle;
  wire             altpll_pll_slave_master_qreq_vector;
  wire             altpll_pll_slave_non_bursting_master_requests;
  wire             altpll_pll_slave_read;
  wire    [ 31: 0] altpll_pll_slave_readdata_from_sa;
  reg              altpll_pll_slave_reg_firsttransfer;
  wire             altpll_pll_slave_reset;
  reg              altpll_pll_slave_slavearbiterlockenable;
  wire             altpll_pll_slave_slavearbiterlockenable2;
  wire             altpll_pll_slave_unreg_firsttransfer;
  wire             altpll_pll_slave_waits_for_read;
  wire             altpll_pll_slave_waits_for_write;
  wire             altpll_pll_slave_write;
  wire    [ 31: 0] altpll_pll_slave_writedata;
  reg              d1_altpll_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_altpll_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_audio_clock_1_out_arbiterlock;
  wire             nios_audio_clock_1_out_arbiterlock2;
  wire             nios_audio_clock_1_out_continuerequest;
  wire             nios_audio_clock_1_out_granted_altpll_pll_slave;
  wire             nios_audio_clock_1_out_qualified_request_altpll_pll_slave;
  wire             nios_audio_clock_1_out_read_data_valid_altpll_pll_slave;
  wire             nios_audio_clock_1_out_requests_altpll_pll_slave;
  wire             nios_audio_clock_1_out_saved_grant_altpll_pll_slave;
  wire    [  3: 0] shifted_address_to_altpll_pll_slave_from_nios_audio_clock_1_out;
  wire             wait_for_altpll_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~altpll_pll_slave_end_xfer;
    end


  assign altpll_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_audio_clock_1_out_qualified_request_altpll_pll_slave));
  //assign altpll_pll_slave_readdata_from_sa = altpll_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altpll_pll_slave_readdata_from_sa = altpll_pll_slave_readdata;

  assign nios_audio_clock_1_out_requests_altpll_pll_slave = (1) & (nios_audio_clock_1_out_read | nios_audio_clock_1_out_write);
  //altpll_pll_slave_arb_share_counter set values, which is an e_mux
  assign altpll_pll_slave_arb_share_set_values = 1;

  //altpll_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign altpll_pll_slave_non_bursting_master_requests = nios_audio_clock_1_out_requests_altpll_pll_slave;

  //altpll_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign altpll_pll_slave_any_bursting_master_saved_grant = 0;

  //altpll_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign altpll_pll_slave_arb_share_counter_next_value = altpll_pll_slave_firsttransfer ? (altpll_pll_slave_arb_share_set_values - 1) : |altpll_pll_slave_arb_share_counter ? (altpll_pll_slave_arb_share_counter - 1) : 0;

  //altpll_pll_slave_allgrants all slave grants, which is an e_mux
  assign altpll_pll_slave_allgrants = |altpll_pll_slave_grant_vector;

  //altpll_pll_slave_end_xfer assignment, which is an e_assign
  assign altpll_pll_slave_end_xfer = ~(altpll_pll_slave_waits_for_read | altpll_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_altpll_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_altpll_pll_slave = altpll_pll_slave_end_xfer & (~altpll_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //altpll_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign altpll_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_altpll_pll_slave & altpll_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_altpll_pll_slave & ~altpll_pll_slave_non_bursting_master_requests);

  //altpll_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_pll_slave_arb_share_counter <= 0;
      else if (altpll_pll_slave_arb_counter_enable)
          altpll_pll_slave_arb_share_counter <= altpll_pll_slave_arb_share_counter_next_value;
    end


  //altpll_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_pll_slave_slavearbiterlockenable <= 0;
      else if ((|altpll_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_altpll_pll_slave) | (end_xfer_arb_share_counter_term_altpll_pll_slave & ~altpll_pll_slave_non_bursting_master_requests))
          altpll_pll_slave_slavearbiterlockenable <= |altpll_pll_slave_arb_share_counter_next_value;
    end


  //nios_audio_clock_1/out altpll/pll_slave arbiterlock, which is an e_assign
  assign nios_audio_clock_1_out_arbiterlock = altpll_pll_slave_slavearbiterlockenable & nios_audio_clock_1_out_continuerequest;

  //altpll_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign altpll_pll_slave_slavearbiterlockenable2 = |altpll_pll_slave_arb_share_counter_next_value;

  //nios_audio_clock_1/out altpll/pll_slave arbiterlock2, which is an e_assign
  assign nios_audio_clock_1_out_arbiterlock2 = altpll_pll_slave_slavearbiterlockenable2 & nios_audio_clock_1_out_continuerequest;

  //altpll_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign altpll_pll_slave_any_continuerequest = 1;

  //nios_audio_clock_1_out_continuerequest continued request, which is an e_assign
  assign nios_audio_clock_1_out_continuerequest = 1;

  assign nios_audio_clock_1_out_qualified_request_altpll_pll_slave = nios_audio_clock_1_out_requests_altpll_pll_slave;
  //altpll_pll_slave_writedata mux, which is an e_mux
  assign altpll_pll_slave_writedata = nios_audio_clock_1_out_writedata;

  //master is always granted when requested
  assign nios_audio_clock_1_out_granted_altpll_pll_slave = nios_audio_clock_1_out_qualified_request_altpll_pll_slave;

  //nios_audio_clock_1/out saved-grant altpll/pll_slave, which is an e_assign
  assign nios_audio_clock_1_out_saved_grant_altpll_pll_slave = nios_audio_clock_1_out_requests_altpll_pll_slave;

  //allow new arb cycle for altpll/pll_slave, which is an e_assign
  assign altpll_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign altpll_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign altpll_pll_slave_master_qreq_vector = 1;

  //~altpll_pll_slave_reset assignment, which is an e_assign
  assign altpll_pll_slave_reset = ~reset_n;

  //altpll_pll_slave_firsttransfer first transaction, which is an e_assign
  assign altpll_pll_slave_firsttransfer = altpll_pll_slave_begins_xfer ? altpll_pll_slave_unreg_firsttransfer : altpll_pll_slave_reg_firsttransfer;

  //altpll_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign altpll_pll_slave_unreg_firsttransfer = ~(altpll_pll_slave_slavearbiterlockenable & altpll_pll_slave_any_continuerequest);

  //altpll_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_pll_slave_reg_firsttransfer <= 1'b1;
      else if (altpll_pll_slave_begins_xfer)
          altpll_pll_slave_reg_firsttransfer <= altpll_pll_slave_unreg_firsttransfer;
    end


  //altpll_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign altpll_pll_slave_beginbursttransfer_internal = altpll_pll_slave_begins_xfer;

  //altpll_pll_slave_read assignment, which is an e_mux
  assign altpll_pll_slave_read = nios_audio_clock_1_out_granted_altpll_pll_slave & nios_audio_clock_1_out_read;

  //altpll_pll_slave_write assignment, which is an e_mux
  assign altpll_pll_slave_write = nios_audio_clock_1_out_granted_altpll_pll_slave & nios_audio_clock_1_out_write;

  assign shifted_address_to_altpll_pll_slave_from_nios_audio_clock_1_out = nios_audio_clock_1_out_address_to_slave;
  //altpll_pll_slave_address mux, which is an e_mux
  assign altpll_pll_slave_address = shifted_address_to_altpll_pll_slave_from_nios_audio_clock_1_out >> 2;

  //d1_altpll_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_altpll_pll_slave_end_xfer <= 1;
      else 
        d1_altpll_pll_slave_end_xfer <= altpll_pll_slave_end_xfer;
    end


  //altpll_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign altpll_pll_slave_waits_for_read = altpll_pll_slave_in_a_read_cycle & 0;

  //altpll_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign altpll_pll_slave_in_a_read_cycle = nios_audio_clock_1_out_granted_altpll_pll_slave & nios_audio_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = altpll_pll_slave_in_a_read_cycle;

  //altpll_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign altpll_pll_slave_waits_for_write = altpll_pll_slave_in_a_write_cycle & 0;

  //altpll_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign altpll_pll_slave_in_a_write_cycle = nios_audio_clock_1_out_granted_altpll_pll_slave & nios_audio_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = altpll_pll_slave_in_a_write_cycle;

  assign wait_for_altpll_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altpll/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altpll_audio_pll_slave_arbitrator (
                                           // inputs:
                                            altpll_audio_pll_slave_readdata,
                                            clk,
                                            nios_audio_clock_0_out_address_to_slave,
                                            nios_audio_clock_0_out_read,
                                            nios_audio_clock_0_out_write,
                                            nios_audio_clock_0_out_writedata,
                                            reset_n,

                                           // outputs:
                                            altpll_audio_pll_slave_address,
                                            altpll_audio_pll_slave_read,
                                            altpll_audio_pll_slave_readdata_from_sa,
                                            altpll_audio_pll_slave_reset,
                                            altpll_audio_pll_slave_write,
                                            altpll_audio_pll_slave_writedata,
                                            d1_altpll_audio_pll_slave_end_xfer,
                                            nios_audio_clock_0_out_granted_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_requests_altpll_audio_pll_slave
                                         )
;

  output  [  1: 0] altpll_audio_pll_slave_address;
  output           altpll_audio_pll_slave_read;
  output  [ 31: 0] altpll_audio_pll_slave_readdata_from_sa;
  output           altpll_audio_pll_slave_reset;
  output           altpll_audio_pll_slave_write;
  output  [ 31: 0] altpll_audio_pll_slave_writedata;
  output           d1_altpll_audio_pll_slave_end_xfer;
  output           nios_audio_clock_0_out_granted_altpll_audio_pll_slave;
  output           nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave;
  output           nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave;
  output           nios_audio_clock_0_out_requests_altpll_audio_pll_slave;
  input   [ 31: 0] altpll_audio_pll_slave_readdata;
  input            clk;
  input   [  3: 0] nios_audio_clock_0_out_address_to_slave;
  input            nios_audio_clock_0_out_read;
  input            nios_audio_clock_0_out_write;
  input   [ 31: 0] nios_audio_clock_0_out_writedata;
  input            reset_n;

  wire    [  1: 0] altpll_audio_pll_slave_address;
  wire             altpll_audio_pll_slave_allgrants;
  wire             altpll_audio_pll_slave_allow_new_arb_cycle;
  wire             altpll_audio_pll_slave_any_bursting_master_saved_grant;
  wire             altpll_audio_pll_slave_any_continuerequest;
  wire             altpll_audio_pll_slave_arb_counter_enable;
  reg              altpll_audio_pll_slave_arb_share_counter;
  wire             altpll_audio_pll_slave_arb_share_counter_next_value;
  wire             altpll_audio_pll_slave_arb_share_set_values;
  wire             altpll_audio_pll_slave_beginbursttransfer_internal;
  wire             altpll_audio_pll_slave_begins_xfer;
  wire             altpll_audio_pll_slave_end_xfer;
  wire             altpll_audio_pll_slave_firsttransfer;
  wire             altpll_audio_pll_slave_grant_vector;
  wire             altpll_audio_pll_slave_in_a_read_cycle;
  wire             altpll_audio_pll_slave_in_a_write_cycle;
  wire             altpll_audio_pll_slave_master_qreq_vector;
  wire             altpll_audio_pll_slave_non_bursting_master_requests;
  wire             altpll_audio_pll_slave_read;
  wire    [ 31: 0] altpll_audio_pll_slave_readdata_from_sa;
  reg              altpll_audio_pll_slave_reg_firsttransfer;
  wire             altpll_audio_pll_slave_reset;
  reg              altpll_audio_pll_slave_slavearbiterlockenable;
  wire             altpll_audio_pll_slave_slavearbiterlockenable2;
  wire             altpll_audio_pll_slave_unreg_firsttransfer;
  wire             altpll_audio_pll_slave_waits_for_read;
  wire             altpll_audio_pll_slave_waits_for_write;
  wire             altpll_audio_pll_slave_write;
  wire    [ 31: 0] altpll_audio_pll_slave_writedata;
  reg              d1_altpll_audio_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_altpll_audio_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_audio_clock_0_out_arbiterlock;
  wire             nios_audio_clock_0_out_arbiterlock2;
  wire             nios_audio_clock_0_out_continuerequest;
  wire             nios_audio_clock_0_out_granted_altpll_audio_pll_slave;
  wire             nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave;
  wire             nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave;
  wire             nios_audio_clock_0_out_requests_altpll_audio_pll_slave;
  wire             nios_audio_clock_0_out_saved_grant_altpll_audio_pll_slave;
  wire    [  3: 0] shifted_address_to_altpll_audio_pll_slave_from_nios_audio_clock_0_out;
  wire             wait_for_altpll_audio_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~altpll_audio_pll_slave_end_xfer;
    end


  assign altpll_audio_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave));
  //assign altpll_audio_pll_slave_readdata_from_sa = altpll_audio_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altpll_audio_pll_slave_readdata_from_sa = altpll_audio_pll_slave_readdata;

  assign nios_audio_clock_0_out_requests_altpll_audio_pll_slave = (1) & (nios_audio_clock_0_out_read | nios_audio_clock_0_out_write);
  //altpll_audio_pll_slave_arb_share_counter set values, which is an e_mux
  assign altpll_audio_pll_slave_arb_share_set_values = 1;

  //altpll_audio_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign altpll_audio_pll_slave_non_bursting_master_requests = nios_audio_clock_0_out_requests_altpll_audio_pll_slave;

  //altpll_audio_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign altpll_audio_pll_slave_any_bursting_master_saved_grant = 0;

  //altpll_audio_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign altpll_audio_pll_slave_arb_share_counter_next_value = altpll_audio_pll_slave_firsttransfer ? (altpll_audio_pll_slave_arb_share_set_values - 1) : |altpll_audio_pll_slave_arb_share_counter ? (altpll_audio_pll_slave_arb_share_counter - 1) : 0;

  //altpll_audio_pll_slave_allgrants all slave grants, which is an e_mux
  assign altpll_audio_pll_slave_allgrants = |altpll_audio_pll_slave_grant_vector;

  //altpll_audio_pll_slave_end_xfer assignment, which is an e_assign
  assign altpll_audio_pll_slave_end_xfer = ~(altpll_audio_pll_slave_waits_for_read | altpll_audio_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_altpll_audio_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_altpll_audio_pll_slave = altpll_audio_pll_slave_end_xfer & (~altpll_audio_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //altpll_audio_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign altpll_audio_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_altpll_audio_pll_slave & altpll_audio_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_altpll_audio_pll_slave & ~altpll_audio_pll_slave_non_bursting_master_requests);

  //altpll_audio_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_audio_pll_slave_arb_share_counter <= 0;
      else if (altpll_audio_pll_slave_arb_counter_enable)
          altpll_audio_pll_slave_arb_share_counter <= altpll_audio_pll_slave_arb_share_counter_next_value;
    end


  //altpll_audio_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_audio_pll_slave_slavearbiterlockenable <= 0;
      else if ((|altpll_audio_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_altpll_audio_pll_slave) | (end_xfer_arb_share_counter_term_altpll_audio_pll_slave & ~altpll_audio_pll_slave_non_bursting_master_requests))
          altpll_audio_pll_slave_slavearbiterlockenable <= |altpll_audio_pll_slave_arb_share_counter_next_value;
    end


  //nios_audio_clock_0/out altpll_audio/pll_slave arbiterlock, which is an e_assign
  assign nios_audio_clock_0_out_arbiterlock = altpll_audio_pll_slave_slavearbiterlockenable & nios_audio_clock_0_out_continuerequest;

  //altpll_audio_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign altpll_audio_pll_slave_slavearbiterlockenable2 = |altpll_audio_pll_slave_arb_share_counter_next_value;

  //nios_audio_clock_0/out altpll_audio/pll_slave arbiterlock2, which is an e_assign
  assign nios_audio_clock_0_out_arbiterlock2 = altpll_audio_pll_slave_slavearbiterlockenable2 & nios_audio_clock_0_out_continuerequest;

  //altpll_audio_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign altpll_audio_pll_slave_any_continuerequest = 1;

  //nios_audio_clock_0_out_continuerequest continued request, which is an e_assign
  assign nios_audio_clock_0_out_continuerequest = 1;

  assign nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave = nios_audio_clock_0_out_requests_altpll_audio_pll_slave;
  //altpll_audio_pll_slave_writedata mux, which is an e_mux
  assign altpll_audio_pll_slave_writedata = nios_audio_clock_0_out_writedata;

  //master is always granted when requested
  assign nios_audio_clock_0_out_granted_altpll_audio_pll_slave = nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave;

  //nios_audio_clock_0/out saved-grant altpll_audio/pll_slave, which is an e_assign
  assign nios_audio_clock_0_out_saved_grant_altpll_audio_pll_slave = nios_audio_clock_0_out_requests_altpll_audio_pll_slave;

  //allow new arb cycle for altpll_audio/pll_slave, which is an e_assign
  assign altpll_audio_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign altpll_audio_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign altpll_audio_pll_slave_master_qreq_vector = 1;

  //~altpll_audio_pll_slave_reset assignment, which is an e_assign
  assign altpll_audio_pll_slave_reset = ~reset_n;

  //altpll_audio_pll_slave_firsttransfer first transaction, which is an e_assign
  assign altpll_audio_pll_slave_firsttransfer = altpll_audio_pll_slave_begins_xfer ? altpll_audio_pll_slave_unreg_firsttransfer : altpll_audio_pll_slave_reg_firsttransfer;

  //altpll_audio_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign altpll_audio_pll_slave_unreg_firsttransfer = ~(altpll_audio_pll_slave_slavearbiterlockenable & altpll_audio_pll_slave_any_continuerequest);

  //altpll_audio_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_audio_pll_slave_reg_firsttransfer <= 1'b1;
      else if (altpll_audio_pll_slave_begins_xfer)
          altpll_audio_pll_slave_reg_firsttransfer <= altpll_audio_pll_slave_unreg_firsttransfer;
    end


  //altpll_audio_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign altpll_audio_pll_slave_beginbursttransfer_internal = altpll_audio_pll_slave_begins_xfer;

  //altpll_audio_pll_slave_read assignment, which is an e_mux
  assign altpll_audio_pll_slave_read = nios_audio_clock_0_out_granted_altpll_audio_pll_slave & nios_audio_clock_0_out_read;

  //altpll_audio_pll_slave_write assignment, which is an e_mux
  assign altpll_audio_pll_slave_write = nios_audio_clock_0_out_granted_altpll_audio_pll_slave & nios_audio_clock_0_out_write;

  assign shifted_address_to_altpll_audio_pll_slave_from_nios_audio_clock_0_out = nios_audio_clock_0_out_address_to_slave;
  //altpll_audio_pll_slave_address mux, which is an e_mux
  assign altpll_audio_pll_slave_address = shifted_address_to_altpll_audio_pll_slave_from_nios_audio_clock_0_out >> 2;

  //d1_altpll_audio_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_altpll_audio_pll_slave_end_xfer <= 1;
      else 
        d1_altpll_audio_pll_slave_end_xfer <= altpll_audio_pll_slave_end_xfer;
    end


  //altpll_audio_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign altpll_audio_pll_slave_waits_for_read = altpll_audio_pll_slave_in_a_read_cycle & 0;

  //altpll_audio_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign altpll_audio_pll_slave_in_a_read_cycle = nios_audio_clock_0_out_granted_altpll_audio_pll_slave & nios_audio_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = altpll_audio_pll_slave_in_a_read_cycle;

  //altpll_audio_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign altpll_audio_pll_slave_waits_for_write = altpll_audio_pll_slave_in_a_write_cycle & 0;

  //altpll_audio_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign altpll_audio_pll_slave_in_a_write_cycle = nios_audio_clock_0_out_granted_altpll_audio_pll_slave & nios_audio_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = altpll_audio_pll_slave_in_a_write_cycle;

  assign wait_for_altpll_audio_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altpll_audio/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module audio_avalon_slave_arbitrator (
                                       // inputs:
                                        audio_avalon_slave_readdata,
                                        clk,
                                        nios_audio_clock_2_out_address_to_slave,
                                        nios_audio_clock_2_out_nativeaddress,
                                        nios_audio_clock_2_out_read,
                                        nios_audio_clock_2_out_write,
                                        nios_audio_clock_2_out_writedata,
                                        reset_n,

                                       // outputs:
                                        audio_avalon_slave_address,
                                        audio_avalon_slave_read,
                                        audio_avalon_slave_readdata_from_sa,
                                        audio_avalon_slave_reset,
                                        audio_avalon_slave_write,
                                        audio_avalon_slave_writedata,
                                        d1_audio_avalon_slave_end_xfer,
                                        nios_audio_clock_2_out_granted_audio_avalon_slave,
                                        nios_audio_clock_2_out_qualified_request_audio_avalon_slave,
                                        nios_audio_clock_2_out_read_data_valid_audio_avalon_slave,
                                        nios_audio_clock_2_out_requests_audio_avalon_slave
                                     )
;

  output  [  2: 0] audio_avalon_slave_address;
  output           audio_avalon_slave_read;
  output  [ 15: 0] audio_avalon_slave_readdata_from_sa;
  output           audio_avalon_slave_reset;
  output           audio_avalon_slave_write;
  output  [ 15: 0] audio_avalon_slave_writedata;
  output           d1_audio_avalon_slave_end_xfer;
  output           nios_audio_clock_2_out_granted_audio_avalon_slave;
  output           nios_audio_clock_2_out_qualified_request_audio_avalon_slave;
  output           nios_audio_clock_2_out_read_data_valid_audio_avalon_slave;
  output           nios_audio_clock_2_out_requests_audio_avalon_slave;
  input   [ 15: 0] audio_avalon_slave_readdata;
  input            clk;
  input   [  3: 0] nios_audio_clock_2_out_address_to_slave;
  input   [  2: 0] nios_audio_clock_2_out_nativeaddress;
  input            nios_audio_clock_2_out_read;
  input            nios_audio_clock_2_out_write;
  input   [ 15: 0] nios_audio_clock_2_out_writedata;
  input            reset_n;

  wire    [  2: 0] audio_avalon_slave_address;
  wire             audio_avalon_slave_allgrants;
  wire             audio_avalon_slave_allow_new_arb_cycle;
  wire             audio_avalon_slave_any_bursting_master_saved_grant;
  wire             audio_avalon_slave_any_continuerequest;
  wire             audio_avalon_slave_arb_counter_enable;
  reg              audio_avalon_slave_arb_share_counter;
  wire             audio_avalon_slave_arb_share_counter_next_value;
  wire             audio_avalon_slave_arb_share_set_values;
  wire             audio_avalon_slave_beginbursttransfer_internal;
  wire             audio_avalon_slave_begins_xfer;
  wire             audio_avalon_slave_end_xfer;
  wire             audio_avalon_slave_firsttransfer;
  wire             audio_avalon_slave_grant_vector;
  wire             audio_avalon_slave_in_a_read_cycle;
  wire             audio_avalon_slave_in_a_write_cycle;
  wire             audio_avalon_slave_master_qreq_vector;
  wire             audio_avalon_slave_non_bursting_master_requests;
  wire             audio_avalon_slave_read;
  wire    [ 15: 0] audio_avalon_slave_readdata_from_sa;
  reg              audio_avalon_slave_reg_firsttransfer;
  wire             audio_avalon_slave_reset;
  reg              audio_avalon_slave_slavearbiterlockenable;
  wire             audio_avalon_slave_slavearbiterlockenable2;
  wire             audio_avalon_slave_unreg_firsttransfer;
  wire             audio_avalon_slave_waits_for_read;
  wire             audio_avalon_slave_waits_for_write;
  wire             audio_avalon_slave_write;
  wire    [ 15: 0] audio_avalon_slave_writedata;
  reg              d1_audio_avalon_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_audio_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_audio_clock_2_out_arbiterlock;
  wire             nios_audio_clock_2_out_arbiterlock2;
  wire             nios_audio_clock_2_out_continuerequest;
  wire             nios_audio_clock_2_out_granted_audio_avalon_slave;
  wire             nios_audio_clock_2_out_qualified_request_audio_avalon_slave;
  wire             nios_audio_clock_2_out_read_data_valid_audio_avalon_slave;
  wire             nios_audio_clock_2_out_requests_audio_avalon_slave;
  wire             nios_audio_clock_2_out_saved_grant_audio_avalon_slave;
  wire             wait_for_audio_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~audio_avalon_slave_end_xfer;
    end


  assign audio_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_audio_clock_2_out_qualified_request_audio_avalon_slave));
  //assign audio_avalon_slave_readdata_from_sa = audio_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_avalon_slave_readdata_from_sa = audio_avalon_slave_readdata;

  assign nios_audio_clock_2_out_requests_audio_avalon_slave = (1) & (nios_audio_clock_2_out_read | nios_audio_clock_2_out_write);
  //audio_avalon_slave_arb_share_counter set values, which is an e_mux
  assign audio_avalon_slave_arb_share_set_values = 1;

  //audio_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign audio_avalon_slave_non_bursting_master_requests = nios_audio_clock_2_out_requests_audio_avalon_slave;

  //audio_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign audio_avalon_slave_any_bursting_master_saved_grant = 0;

  //audio_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign audio_avalon_slave_arb_share_counter_next_value = audio_avalon_slave_firsttransfer ? (audio_avalon_slave_arb_share_set_values - 1) : |audio_avalon_slave_arb_share_counter ? (audio_avalon_slave_arb_share_counter - 1) : 0;

  //audio_avalon_slave_allgrants all slave grants, which is an e_mux
  assign audio_avalon_slave_allgrants = |audio_avalon_slave_grant_vector;

  //audio_avalon_slave_end_xfer assignment, which is an e_assign
  assign audio_avalon_slave_end_xfer = ~(audio_avalon_slave_waits_for_read | audio_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_audio_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_audio_avalon_slave = audio_avalon_slave_end_xfer & (~audio_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //audio_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign audio_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_audio_avalon_slave & audio_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_audio_avalon_slave & ~audio_avalon_slave_non_bursting_master_requests);

  //audio_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_avalon_slave_arb_share_counter <= 0;
      else if (audio_avalon_slave_arb_counter_enable)
          audio_avalon_slave_arb_share_counter <= audio_avalon_slave_arb_share_counter_next_value;
    end


  //audio_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|audio_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_audio_avalon_slave) | (end_xfer_arb_share_counter_term_audio_avalon_slave & ~audio_avalon_slave_non_bursting_master_requests))
          audio_avalon_slave_slavearbiterlockenable <= |audio_avalon_slave_arb_share_counter_next_value;
    end


  //nios_audio_clock_2/out audio/avalon_slave arbiterlock, which is an e_assign
  assign nios_audio_clock_2_out_arbiterlock = audio_avalon_slave_slavearbiterlockenable & nios_audio_clock_2_out_continuerequest;

  //audio_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign audio_avalon_slave_slavearbiterlockenable2 = |audio_avalon_slave_arb_share_counter_next_value;

  //nios_audio_clock_2/out audio/avalon_slave arbiterlock2, which is an e_assign
  assign nios_audio_clock_2_out_arbiterlock2 = audio_avalon_slave_slavearbiterlockenable2 & nios_audio_clock_2_out_continuerequest;

  //audio_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign audio_avalon_slave_any_continuerequest = 1;

  //nios_audio_clock_2_out_continuerequest continued request, which is an e_assign
  assign nios_audio_clock_2_out_continuerequest = 1;

  assign nios_audio_clock_2_out_qualified_request_audio_avalon_slave = nios_audio_clock_2_out_requests_audio_avalon_slave;
  //audio_avalon_slave_writedata mux, which is an e_mux
  assign audio_avalon_slave_writedata = nios_audio_clock_2_out_writedata;

  //master is always granted when requested
  assign nios_audio_clock_2_out_granted_audio_avalon_slave = nios_audio_clock_2_out_qualified_request_audio_avalon_slave;

  //nios_audio_clock_2/out saved-grant audio/avalon_slave, which is an e_assign
  assign nios_audio_clock_2_out_saved_grant_audio_avalon_slave = nios_audio_clock_2_out_requests_audio_avalon_slave;

  //allow new arb cycle for audio/avalon_slave, which is an e_assign
  assign audio_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign audio_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign audio_avalon_slave_master_qreq_vector = 1;

  //~audio_avalon_slave_reset assignment, which is an e_assign
  assign audio_avalon_slave_reset = ~reset_n;

  //audio_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign audio_avalon_slave_firsttransfer = audio_avalon_slave_begins_xfer ? audio_avalon_slave_unreg_firsttransfer : audio_avalon_slave_reg_firsttransfer;

  //audio_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign audio_avalon_slave_unreg_firsttransfer = ~(audio_avalon_slave_slavearbiterlockenable & audio_avalon_slave_any_continuerequest);

  //audio_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (audio_avalon_slave_begins_xfer)
          audio_avalon_slave_reg_firsttransfer <= audio_avalon_slave_unreg_firsttransfer;
    end


  //audio_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign audio_avalon_slave_beginbursttransfer_internal = audio_avalon_slave_begins_xfer;

  //audio_avalon_slave_read assignment, which is an e_mux
  assign audio_avalon_slave_read = nios_audio_clock_2_out_granted_audio_avalon_slave & nios_audio_clock_2_out_read;

  //audio_avalon_slave_write assignment, which is an e_mux
  assign audio_avalon_slave_write = nios_audio_clock_2_out_granted_audio_avalon_slave & nios_audio_clock_2_out_write;

  //audio_avalon_slave_address mux, which is an e_mux
  assign audio_avalon_slave_address = nios_audio_clock_2_out_nativeaddress;

  //d1_audio_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_audio_avalon_slave_end_xfer <= 1;
      else 
        d1_audio_avalon_slave_end_xfer <= audio_avalon_slave_end_xfer;
    end


  //audio_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign audio_avalon_slave_waits_for_read = audio_avalon_slave_in_a_read_cycle & 0;

  //audio_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign audio_avalon_slave_in_a_read_cycle = nios_audio_clock_2_out_granted_audio_avalon_slave & nios_audio_clock_2_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = audio_avalon_slave_in_a_read_cycle;

  //audio_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign audio_avalon_slave_waits_for_write = audio_avalon_slave_in_a_write_cycle & 0;

  //audio_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign audio_avalon_slave_in_a_write_cycle = nios_audio_clock_2_out_granted_audio_avalon_slave & nios_audio_clock_2_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = audio_avalon_slave_in_a_write_cycle;

  assign wait_for_audio_avalon_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //audio/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h9000800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[27 : 11] , 11'b0} == 28'h9000800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module key_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                  // inputs:
                                                                   clk,
                                                                   data_in,
                                                                   reset_n,

                                                                  // outputs:
                                                                   data_out
                                                                )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sw_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                 // inputs:
                                                                  clk,
                                                                  data_in,
                                                                  reset_n,

                                                                 // outputs:
                                                                  data_out
                                                               )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                    // inputs:
                                                                     clk,
                                                                     data_in,
                                                                     reset_n,

                                                                    // outputs:
                                                                     data_out
                                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     altpll_sys,
                                     altpll_sys_reset_n,
                                     cfi_flash_s1_wait_counter_eq_0,
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_byteenable_cfi_flash_s1,
                                     cpu_data_master_byteenable_sram_avalon_slave,
                                     cpu_data_master_granted_cfi_flash_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_cpu_peripheral_bridge_s1,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_nios_audio_clock_0_in,
                                     cpu_data_master_granted_nios_audio_clock_1_in,
                                     cpu_data_master_granted_nios_audio_clock_2_in,
                                     cpu_data_master_granted_sdram_s1,
                                     cpu_data_master_granted_sram_avalon_slave,
                                     cpu_data_master_granted_usb_dc,
                                     cpu_data_master_granted_usb_hc,
                                     cpu_data_master_qualified_request_cfi_flash_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_cpu_peripheral_bridge_s1,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_nios_audio_clock_0_in,
                                     cpu_data_master_qualified_request_nios_audio_clock_1_in,
                                     cpu_data_master_qualified_request_nios_audio_clock_2_in,
                                     cpu_data_master_qualified_request_sdram_s1,
                                     cpu_data_master_qualified_request_sram_avalon_slave,
                                     cpu_data_master_qualified_request_usb_dc,
                                     cpu_data_master_qualified_request_usb_hc,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cfi_flash_s1,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1,
                                     cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_nios_audio_clock_0_in,
                                     cpu_data_master_read_data_valid_nios_audio_clock_1_in,
                                     cpu_data_master_read_data_valid_nios_audio_clock_2_in,
                                     cpu_data_master_read_data_valid_sdram_s1,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_read_data_valid_sram_avalon_slave,
                                     cpu_data_master_read_data_valid_usb_dc,
                                     cpu_data_master_read_data_valid_usb_hc,
                                     cpu_data_master_requests_cfi_flash_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_cpu_peripheral_bridge_s1,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_nios_audio_clock_0_in,
                                     cpu_data_master_requests_nios_audio_clock_1_in,
                                     cpu_data_master_requests_nios_audio_clock_2_in,
                                     cpu_data_master_requests_sdram_s1,
                                     cpu_data_master_requests_sram_avalon_slave,
                                     cpu_data_master_requests_usb_dc,
                                     cpu_data_master_requests_usb_hc,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     cpu_peripheral_bridge_s1_readdata_from_sa,
                                     cpu_peripheral_bridge_s1_waitrequest_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_cpu_peripheral_bridge_s1_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_nios_audio_clock_0_in_end_xfer,
                                     d1_nios_audio_clock_1_in_end_xfer,
                                     d1_nios_audio_clock_2_in_end_xfer,
                                     d1_sdram_s1_end_xfer,
                                     d1_sram_avalon_slave_end_xfer,
                                     d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                     d1_usb_dc_end_xfer,
                                     d1_usb_hc_end_xfer,
                                     incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     key_s1_irq_from_sa,
                                     nios_audio_clock_0_in_readdata_from_sa,
                                     nios_audio_clock_0_in_waitrequest_from_sa,
                                     nios_audio_clock_1_in_readdata_from_sa,
                                     nios_audio_clock_1_in_waitrequest_from_sa,
                                     nios_audio_clock_2_in_readdata_from_sa,
                                     nios_audio_clock_2_in_waitrequest_from_sa,
                                     reset_n,
                                     sdram_s1_readdata_from_sa,
                                     sdram_s1_waitrequest_from_sa,
                                     sram_avalon_slave_readdata_from_sa,
                                     sram_avalon_slave_wait_counter_eq_0,
                                     sw_s1_irq_from_sa,
                                     timer_s1_irq_from_sa,
                                     usb_dc_irq_n_from_sa,
                                     usb_dc_readdata_from_sa,
                                     usb_dc_wait_counter_eq_0,
                                     usb_hc_irq_n_from_sa,
                                     usb_hc_readdata_from_sa,
                                     usb_hc_wait_counter_eq_0,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_dbs_write_8,
                                     cpu_data_master_irq,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 27: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [  7: 0] cpu_data_master_dbs_write_8;
  output  [ 31: 0] cpu_data_master_irq;
  output  [  1: 0] cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input            altpll_sys;
  input            altpll_sys_reset_n;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 27: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_byteenable_cfi_flash_s1;
  input   [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  input            cpu_data_master_granted_cfi_flash_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_cpu_peripheral_bridge_s1;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_nios_audio_clock_0_in;
  input            cpu_data_master_granted_nios_audio_clock_1_in;
  input            cpu_data_master_granted_nios_audio_clock_2_in;
  input            cpu_data_master_granted_sdram_s1;
  input            cpu_data_master_granted_sram_avalon_slave;
  input            cpu_data_master_granted_usb_dc;
  input            cpu_data_master_granted_usb_hc;
  input            cpu_data_master_qualified_request_cfi_flash_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_cpu_peripheral_bridge_s1;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_nios_audio_clock_0_in;
  input            cpu_data_master_qualified_request_nios_audio_clock_1_in;
  input            cpu_data_master_qualified_request_nios_audio_clock_2_in;
  input            cpu_data_master_qualified_request_sdram_s1;
  input            cpu_data_master_qualified_request_sram_avalon_slave;
  input            cpu_data_master_qualified_request_usb_dc;
  input            cpu_data_master_qualified_request_usb_hc;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cfi_flash_s1;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_nios_audio_clock_0_in;
  input            cpu_data_master_read_data_valid_nios_audio_clock_1_in;
  input            cpu_data_master_read_data_valid_nios_audio_clock_2_in;
  input            cpu_data_master_read_data_valid_sdram_s1;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_read_data_valid_sram_avalon_slave;
  input            cpu_data_master_read_data_valid_usb_dc;
  input            cpu_data_master_read_data_valid_usb_hc;
  input            cpu_data_master_requests_cfi_flash_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_cpu_peripheral_bridge_s1;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_nios_audio_clock_0_in;
  input            cpu_data_master_requests_nios_audio_clock_1_in;
  input            cpu_data_master_requests_nios_audio_clock_2_in;
  input            cpu_data_master_requests_sdram_s1;
  input            cpu_data_master_requests_sram_avalon_slave;
  input            cpu_data_master_requests_usb_dc;
  input            cpu_data_master_requests_usb_hc;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input   [ 31: 0] cpu_peripheral_bridge_s1_readdata_from_sa;
  input            cpu_peripheral_bridge_s1_waitrequest_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_cpu_peripheral_bridge_s1_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_nios_audio_clock_0_in_end_xfer;
  input            d1_nios_audio_clock_1_in_end_xfer;
  input            d1_nios_audio_clock_2_in_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_sram_avalon_slave_end_xfer;
  input            d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  input            d1_usb_dc_end_xfer;
  input            d1_usb_hc_end_xfer;
  input   [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input            key_s1_irq_from_sa;
  input   [ 31: 0] nios_audio_clock_0_in_readdata_from_sa;
  input            nios_audio_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] nios_audio_clock_1_in_readdata_from_sa;
  input            nios_audio_clock_1_in_waitrequest_from_sa;
  input   [ 15: 0] nios_audio_clock_2_in_readdata_from_sa;
  input            nios_audio_clock_2_in_waitrequest_from_sa;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_avalon_slave_readdata_from_sa;
  input            sram_avalon_slave_wait_counter_eq_0;
  input            sw_s1_irq_from_sa;
  input            timer_s1_irq_from_sa;
  input            usb_dc_irq_n_from_sa;
  input   [ 15: 0] usb_dc_readdata_from_sa;
  input            usb_dc_wait_counter_eq_0;
  input            usb_hc_irq_n_from_sa;
  input   [ 15: 0] usb_hc_readdata_from_sa;
  input            usb_hc_wait_counter_eq_0;

  reg              active_and_waiting_last_time;
  wire             altpll_sys_key_s1_irq_from_sa;
  wire             altpll_sys_sw_s1_irq_from_sa;
  wire             altpll_sys_timer_s1_irq_from_sa;
  reg     [ 27: 0] cpu_data_master_address_last_time;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  reg     [  1: 0] cpu_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_is_granted_some_slave;
  reg     [  1: 0] cpu_data_master_latency_counter;
  wire    [  1: 0] cpu_data_master_next_dbs_rdv_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_cpu_peripheral_bridge_s1 | ~cpu_data_master_requests_cpu_peripheral_bridge_s1) & ((~cpu_data_master_qualified_request_cpu_peripheral_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~cpu_peripheral_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_cpu_peripheral_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~cpu_peripheral_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_data_master_qualified_request_nios_audio_clock_0_in | ~cpu_data_master_requests_nios_audio_clock_0_in) & ((~cpu_data_master_qualified_request_nios_audio_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_audio_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_nios_audio_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_audio_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_nios_audio_clock_1_in | ~cpu_data_master_requests_nios_audio_clock_1_in) & ((~cpu_data_master_qualified_request_nios_audio_clock_1_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_audio_clock_1_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_nios_audio_clock_1_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_audio_clock_1_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_nios_audio_clock_2_in | ~cpu_data_master_requests_nios_audio_clock_2_in) & ((~cpu_data_master_qualified_request_nios_audio_clock_2_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_audio_clock_2_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_nios_audio_clock_2_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_audio_clock_2_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_requests_sdram_s1) & ((~cpu_data_master_qualified_request_sdram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_sdram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sram_avalon_slave | (cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_slave & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sram_avalon_slave) & (cpu_data_master_granted_sram_avalon_slave | ~cpu_data_master_qualified_request_sram_avalon_slave) & ((~cpu_data_master_qualified_request_sram_avalon_slave | ~cpu_data_master_read | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sram_avalon_slave | ~cpu_data_master_write | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_write)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & ((cpu_data_master_qualified_request_cfi_flash_s1 | ((cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1 & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_cfi_flash_s1)) & (cpu_data_master_granted_cfi_flash_s1 | ~cpu_data_master_qualified_request_cfi_flash_s1) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_write | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_usb_dc | ~cpu_data_master_requests_usb_dc) & ((~cpu_data_master_qualified_request_usb_dc | ~cpu_data_master_read | (1 & ((usb_dc_wait_counter_eq_0 & ~d1_usb_dc_end_xfer)) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_usb_dc | ~cpu_data_master_write | (1 & ((usb_dc_wait_counter_eq_0 & ~d1_usb_dc_end_xfer)) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_usb_hc | ~cpu_data_master_requests_usb_hc) & ((~cpu_data_master_qualified_request_usb_hc | ~cpu_data_master_read | (1 & ((usb_hc_wait_counter_eq_0 & ~d1_usb_hc_end_xfer)) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_usb_hc | ~cpu_data_master_write | (1 & ((usb_hc_wait_counter_eq_0 & ~d1_usb_hc_end_xfer)) & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[27 : 0];

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_cpu_peripheral_bridge_s1 |
    cpu_data_master_granted_jtag_uart_avalon_jtag_slave |
    cpu_data_master_granted_nios_audio_clock_0_in |
    cpu_data_master_granted_nios_audio_clock_1_in |
    cpu_data_master_granted_nios_audio_clock_2_in |
    cpu_data_master_granted_sdram_s1 |
    cpu_data_master_granted_sram_avalon_slave |
    cpu_data_master_granted_cfi_flash_s1 |
    cpu_data_master_granted_usb_dc |
    cpu_data_master_granted_usb_hc;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1 |
    cpu_data_master_read_data_valid_sdram_s1 |
    (cpu_data_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_nios_audio_clock_0_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_nios_audio_clock_1_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_nios_audio_clock_2_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    (cpu_data_master_read_data_valid_sram_avalon_slave & dbs_counter_overflow) |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_usb_dc |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_usb_hc;

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1}} | cpu_peripheral_bridge_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave & cpu_data_master_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_nios_audio_clock_0_in & cpu_data_master_read)}} | nios_audio_clock_0_in_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_nios_audio_clock_1_in & cpu_data_master_read)}} | nios_audio_clock_1_in_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_nios_audio_clock_2_in & cpu_data_master_read)}} | nios_audio_clock_2_in_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_sdram_s1}} | sdram_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_sram_avalon_slave & cpu_data_master_read)}} | {sram_avalon_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_read_data_valid_cfi_flash_s1}} | {incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0}) &
    ({32 {~(cpu_data_master_qualified_request_usb_dc & cpu_data_master_read)}} | usb_dc_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_usb_hc & cpu_data_master_read)}} | usb_hc_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else 
        cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_data_master_requests_cfi_flash_s1}} & 2;

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    altpll_sys_sw_s1_irq_from_sa,
    altpll_sys_key_s1_irq_from_sa,
    altpll_sys_timer_s1_irq_from_sa,
    ~usb_dc_irq_n_from_sa,
    ~usb_hc_irq_n_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa};

  //key_s1_irq_from_sa from altpll_io to altpll_sys
  key_s1_irq_from_sa_clock_crossing_cpu_data_master_module key_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (altpll_sys),
      .data_in  (key_s1_irq_from_sa),
      .data_out (altpll_sys_key_s1_irq_from_sa),
      .reset_n  (altpll_sys_reset_n)
    );

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_data_master_requests_sram_avalon_slave & cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_slave)) |
    ((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    (((~0) & cpu_data_master_requests_cfi_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1)) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_avalon_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sram_avalon_slave)? 2 :
    (cpu_data_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //sw_s1_irq_from_sa from altpll_io to altpll_sys
  sw_s1_irq_from_sa_clock_crossing_cpu_data_master_module sw_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (altpll_sys),
      .data_in  (sw_s1_irq_from_sa),
      .data_out (altpll_sys_sw_s1_irq_from_sa),
      .reset_n  (altpll_sys_reset_n)
    );

  //timer_s1_irq_from_sa from altpll_io to altpll_sys
  timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module timer_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (altpll_sys),
      .data_in  (timer_s1_irq_from_sa),
      .data_out (altpll_sys_timer_s1_irq_from_sa),
      .reset_n  (altpll_sys_reset_n)
    );

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_data_master_dbs_write_8 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    cpu_data_master_writedata[31 : 24];

  //p1 dbs rdv counter, which is an e_assign
  assign cpu_data_master_next_dbs_rdv_counter = cpu_data_master_dbs_rdv_counter + cpu_data_master_dbs_rdv_counter_inc;

  //cpu_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_data_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_data_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_data_master_dbs_rdv_counter <= cpu_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_data_master_dbs_rdv_counter[1] & ~cpu_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else 
        cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else 
        cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else 
        cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else 
        cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else 
        cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            cfi_flash_s1_wait_counter_eq_0,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cfi_flash_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_sram_avalon_slave,
                                            cpu_instruction_master_qualified_request_cfi_flash_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_sram_avalon_slave,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_sram_avalon_slave,
                                            cpu_instruction_master_requests_cfi_flash_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_sram_avalon_slave,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_sram_avalon_slave_end_xfer,
                                            d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                            incoming_tri_state_bridge_flash_data,
                                            reset_n,
                                            sram_avalon_slave_readdata_from_sa,
                                            sram_avalon_slave_wait_counter_eq_0,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 27: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 27: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cfi_flash_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_sram_avalon_slave;
  input            cpu_instruction_master_qualified_request_cfi_flash_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_sram_avalon_slave;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cfi_flash_s1;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_sram_avalon_slave;
  input            cpu_instruction_master_requests_cfi_flash_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_sram_avalon_slave;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_sram_avalon_slave_end_xfer;
  input            d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  input   [  7: 0] incoming_tri_state_bridge_flash_data;
  input            reset_n;
  input   [ 15: 0] sram_avalon_slave_readdata_from_sa;
  input            sram_avalon_slave_wait_counter_eq_0;

  reg              active_and_waiting_last_time;
  reg     [ 27: 0] cpu_instruction_master_address_last_time;
  wire    [ 27: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_2 & r_3;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_sram_avalon_slave | ~cpu_instruction_master_requests_sram_avalon_slave) & (cpu_instruction_master_granted_sram_avalon_slave | ~cpu_instruction_master_qualified_request_sram_avalon_slave) & ((~cpu_instruction_master_qualified_request_sram_avalon_slave | ~cpu_instruction_master_read | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & (cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_requests_cfi_flash_s1) & (cpu_instruction_master_granted_cfi_flash_s1 | ~cpu_instruction_master_qualified_request_cfi_flash_s1) & ((~cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1] & cpu_instruction_master_dbs_address[0]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = {2'b10,
    cpu_instruction_master_address[25 : 0]};

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_sram_avalon_slave |
    cpu_instruction_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    (cpu_instruction_master_read_data_valid_sram_avalon_slave & dbs_counter_overflow) |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_instruction_master_qualified_request_sram_avalon_slave & cpu_instruction_master_read)}} | {sram_avalon_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_read_data_valid_cfi_flash_s1}} | {incoming_tri_state_bridge_flash_data[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_instruction_master_requests_cfi_flash_s1}} & 2;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_avalon_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sram_avalon_slave)? 2 :
    (cpu_instruction_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = ((cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    ((cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer})));

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_tri_state_bridge_flash_data;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_tri_state_bridge_flash_data;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_tri_state_bridge_flash_data;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_cpu_peripheral_bridge_s1_module (
                                                                         // inputs:
                                                                          clear_fifo,
                                                                          clk,
                                                                          data_in,
                                                                          read,
                                                                          reset_n,
                                                                          sync_reset,
                                                                          write,

                                                                         // outputs:
                                                                          data_out,
                                                                          empty,
                                                                          fifo_contains_ones_n,
                                                                          full
                                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  reg              full_48;
  reg              full_49;
  reg              full_5;
  reg              full_50;
  reg              full_51;
  reg              full_52;
  reg              full_53;
  reg              full_54;
  reg              full_55;
  reg              full_56;
  reg              full_57;
  reg              full_58;
  reg              full_59;
  reg              full_6;
  reg              full_60;
  reg              full_61;
  reg              full_62;
  reg              full_63;
  wire             full_64;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  7: 0] how_many_ones;
  wire    [  7: 0] one_count_minus_one;
  wire    [  7: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p48_full_48;
  wire             p48_stage_48;
  wire             p49_full_49;
  wire             p49_stage_49;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p50_full_50;
  wire             p50_stage_50;
  wire             p51_full_51;
  wire             p51_stage_51;
  wire             p52_full_52;
  wire             p52_stage_52;
  wire             p53_full_53;
  wire             p53_stage_53;
  wire             p54_full_54;
  wire             p54_stage_54;
  wire             p55_full_55;
  wire             p55_stage_55;
  wire             p56_full_56;
  wire             p56_stage_56;
  wire             p57_full_57;
  wire             p57_stage_57;
  wire             p58_full_58;
  wire             p58_stage_58;
  wire             p59_full_59;
  wire             p59_stage_59;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p60_full_60;
  wire             p60_stage_60;
  wire             p61_full_61;
  wire             p61_stage_61;
  wire             p62_full_62;
  wire             p62_stage_62;
  wire             p63_full_63;
  wire             p63_stage_63;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_48;
  reg              stage_49;
  reg              stage_5;
  reg              stage_50;
  reg              stage_51;
  reg              stage_52;
  reg              stage_53;
  reg              stage_54;
  reg              stage_55;
  reg              stage_56;
  reg              stage_57;
  reg              stage_58;
  reg              stage_59;
  reg              stage_6;
  reg              stage_60;
  reg              stage_61;
  reg              stage_62;
  reg              stage_63;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  7: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_63;
  assign empty = !full_0;
  assign full_64 = 0;
  //data_63, which is an e_mux
  assign p63_stage_63 = ((full_64 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_63, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_63 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_63))
          if (sync_reset & full_63 & !((full_64 == 0) & read & write))
              stage_63 <= 0;
          else 
            stage_63 <= p63_stage_63;
    end


  //control_63, which is an e_mux
  assign p63_full_63 = ((read & !write) == 0)? full_62 :
    0;

  //control_reg_63, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_63 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_63 <= 0;
          else 
            full_63 <= p63_full_63;
    end


  //data_62, which is an e_mux
  assign p62_stage_62 = ((full_63 & ~clear_fifo) == 0)? data_in :
    stage_63;

  //data_reg_62, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_62 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_62))
          if (sync_reset & full_62 & !((full_63 == 0) & read & write))
              stage_62 <= 0;
          else 
            stage_62 <= p62_stage_62;
    end


  //control_62, which is an e_mux
  assign p62_full_62 = ((read & !write) == 0)? full_61 :
    full_63;

  //control_reg_62, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_62 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_62 <= 0;
          else 
            full_62 <= p62_full_62;
    end


  //data_61, which is an e_mux
  assign p61_stage_61 = ((full_62 & ~clear_fifo) == 0)? data_in :
    stage_62;

  //data_reg_61, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_61 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_61))
          if (sync_reset & full_61 & !((full_62 == 0) & read & write))
              stage_61 <= 0;
          else 
            stage_61 <= p61_stage_61;
    end


  //control_61, which is an e_mux
  assign p61_full_61 = ((read & !write) == 0)? full_60 :
    full_62;

  //control_reg_61, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_61 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_61 <= 0;
          else 
            full_61 <= p61_full_61;
    end


  //data_60, which is an e_mux
  assign p60_stage_60 = ((full_61 & ~clear_fifo) == 0)? data_in :
    stage_61;

  //data_reg_60, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_60 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_60))
          if (sync_reset & full_60 & !((full_61 == 0) & read & write))
              stage_60 <= 0;
          else 
            stage_60 <= p60_stage_60;
    end


  //control_60, which is an e_mux
  assign p60_full_60 = ((read & !write) == 0)? full_59 :
    full_61;

  //control_reg_60, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_60 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_60 <= 0;
          else 
            full_60 <= p60_full_60;
    end


  //data_59, which is an e_mux
  assign p59_stage_59 = ((full_60 & ~clear_fifo) == 0)? data_in :
    stage_60;

  //data_reg_59, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_59 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_59))
          if (sync_reset & full_59 & !((full_60 == 0) & read & write))
              stage_59 <= 0;
          else 
            stage_59 <= p59_stage_59;
    end


  //control_59, which is an e_mux
  assign p59_full_59 = ((read & !write) == 0)? full_58 :
    full_60;

  //control_reg_59, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_59 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_59 <= 0;
          else 
            full_59 <= p59_full_59;
    end


  //data_58, which is an e_mux
  assign p58_stage_58 = ((full_59 & ~clear_fifo) == 0)? data_in :
    stage_59;

  //data_reg_58, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_58 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_58))
          if (sync_reset & full_58 & !((full_59 == 0) & read & write))
              stage_58 <= 0;
          else 
            stage_58 <= p58_stage_58;
    end


  //control_58, which is an e_mux
  assign p58_full_58 = ((read & !write) == 0)? full_57 :
    full_59;

  //control_reg_58, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_58 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_58 <= 0;
          else 
            full_58 <= p58_full_58;
    end


  //data_57, which is an e_mux
  assign p57_stage_57 = ((full_58 & ~clear_fifo) == 0)? data_in :
    stage_58;

  //data_reg_57, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_57 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_57))
          if (sync_reset & full_57 & !((full_58 == 0) & read & write))
              stage_57 <= 0;
          else 
            stage_57 <= p57_stage_57;
    end


  //control_57, which is an e_mux
  assign p57_full_57 = ((read & !write) == 0)? full_56 :
    full_58;

  //control_reg_57, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_57 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_57 <= 0;
          else 
            full_57 <= p57_full_57;
    end


  //data_56, which is an e_mux
  assign p56_stage_56 = ((full_57 & ~clear_fifo) == 0)? data_in :
    stage_57;

  //data_reg_56, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_56 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_56))
          if (sync_reset & full_56 & !((full_57 == 0) & read & write))
              stage_56 <= 0;
          else 
            stage_56 <= p56_stage_56;
    end


  //control_56, which is an e_mux
  assign p56_full_56 = ((read & !write) == 0)? full_55 :
    full_57;

  //control_reg_56, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_56 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_56 <= 0;
          else 
            full_56 <= p56_full_56;
    end


  //data_55, which is an e_mux
  assign p55_stage_55 = ((full_56 & ~clear_fifo) == 0)? data_in :
    stage_56;

  //data_reg_55, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_55 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_55))
          if (sync_reset & full_55 & !((full_56 == 0) & read & write))
              stage_55 <= 0;
          else 
            stage_55 <= p55_stage_55;
    end


  //control_55, which is an e_mux
  assign p55_full_55 = ((read & !write) == 0)? full_54 :
    full_56;

  //control_reg_55, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_55 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_55 <= 0;
          else 
            full_55 <= p55_full_55;
    end


  //data_54, which is an e_mux
  assign p54_stage_54 = ((full_55 & ~clear_fifo) == 0)? data_in :
    stage_55;

  //data_reg_54, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_54 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_54))
          if (sync_reset & full_54 & !((full_55 == 0) & read & write))
              stage_54 <= 0;
          else 
            stage_54 <= p54_stage_54;
    end


  //control_54, which is an e_mux
  assign p54_full_54 = ((read & !write) == 0)? full_53 :
    full_55;

  //control_reg_54, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_54 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_54 <= 0;
          else 
            full_54 <= p54_full_54;
    end


  //data_53, which is an e_mux
  assign p53_stage_53 = ((full_54 & ~clear_fifo) == 0)? data_in :
    stage_54;

  //data_reg_53, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_53 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_53))
          if (sync_reset & full_53 & !((full_54 == 0) & read & write))
              stage_53 <= 0;
          else 
            stage_53 <= p53_stage_53;
    end


  //control_53, which is an e_mux
  assign p53_full_53 = ((read & !write) == 0)? full_52 :
    full_54;

  //control_reg_53, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_53 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_53 <= 0;
          else 
            full_53 <= p53_full_53;
    end


  //data_52, which is an e_mux
  assign p52_stage_52 = ((full_53 & ~clear_fifo) == 0)? data_in :
    stage_53;

  //data_reg_52, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_52 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_52))
          if (sync_reset & full_52 & !((full_53 == 0) & read & write))
              stage_52 <= 0;
          else 
            stage_52 <= p52_stage_52;
    end


  //control_52, which is an e_mux
  assign p52_full_52 = ((read & !write) == 0)? full_51 :
    full_53;

  //control_reg_52, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_52 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_52 <= 0;
          else 
            full_52 <= p52_full_52;
    end


  //data_51, which is an e_mux
  assign p51_stage_51 = ((full_52 & ~clear_fifo) == 0)? data_in :
    stage_52;

  //data_reg_51, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_51 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_51))
          if (sync_reset & full_51 & !((full_52 == 0) & read & write))
              stage_51 <= 0;
          else 
            stage_51 <= p51_stage_51;
    end


  //control_51, which is an e_mux
  assign p51_full_51 = ((read & !write) == 0)? full_50 :
    full_52;

  //control_reg_51, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_51 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_51 <= 0;
          else 
            full_51 <= p51_full_51;
    end


  //data_50, which is an e_mux
  assign p50_stage_50 = ((full_51 & ~clear_fifo) == 0)? data_in :
    stage_51;

  //data_reg_50, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_50 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_50))
          if (sync_reset & full_50 & !((full_51 == 0) & read & write))
              stage_50 <= 0;
          else 
            stage_50 <= p50_stage_50;
    end


  //control_50, which is an e_mux
  assign p50_full_50 = ((read & !write) == 0)? full_49 :
    full_51;

  //control_reg_50, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_50 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_50 <= 0;
          else 
            full_50 <= p50_full_50;
    end


  //data_49, which is an e_mux
  assign p49_stage_49 = ((full_50 & ~clear_fifo) == 0)? data_in :
    stage_50;

  //data_reg_49, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_49 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_49))
          if (sync_reset & full_49 & !((full_50 == 0) & read & write))
              stage_49 <= 0;
          else 
            stage_49 <= p49_stage_49;
    end


  //control_49, which is an e_mux
  assign p49_full_49 = ((read & !write) == 0)? full_48 :
    full_50;

  //control_reg_49, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_49 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_49 <= 0;
          else 
            full_49 <= p49_full_49;
    end


  //data_48, which is an e_mux
  assign p48_stage_48 = ((full_49 & ~clear_fifo) == 0)? data_in :
    stage_49;

  //data_reg_48, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_48 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_48))
          if (sync_reset & full_48 & !((full_49 == 0) & read & write))
              stage_48 <= 0;
          else 
            stage_48 <= p48_stage_48;
    end


  //control_48, which is an e_mux
  assign p48_full_48 = ((read & !write) == 0)? full_47 :
    full_49;

  //control_reg_48, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_48 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_48 <= 0;
          else 
            full_48 <= p48_full_48;
    end


  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    stage_48;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    full_48;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_peripheral_bridge_s1_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_data_master_address_to_slave,
                                              cpu_data_master_byteenable,
                                              cpu_data_master_latency_counter,
                                              cpu_data_master_read,
                                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                              cpu_data_master_write,
                                              cpu_data_master_writedata,
                                              cpu_peripheral_bridge_s1_endofpacket,
                                              cpu_peripheral_bridge_s1_readdata,
                                              cpu_peripheral_bridge_s1_readdatavalid,
                                              cpu_peripheral_bridge_s1_waitrequest,
                                              reset_n,

                                             // outputs:
                                              cpu_data_master_granted_cpu_peripheral_bridge_s1,
                                              cpu_data_master_qualified_request_cpu_peripheral_bridge_s1,
                                              cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1,
                                              cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                              cpu_data_master_requests_cpu_peripheral_bridge_s1,
                                              cpu_peripheral_bridge_s1_address,
                                              cpu_peripheral_bridge_s1_byteenable,
                                              cpu_peripheral_bridge_s1_endofpacket_from_sa,
                                              cpu_peripheral_bridge_s1_nativeaddress,
                                              cpu_peripheral_bridge_s1_read,
                                              cpu_peripheral_bridge_s1_readdata_from_sa,
                                              cpu_peripheral_bridge_s1_reset_n,
                                              cpu_peripheral_bridge_s1_waitrequest_from_sa,
                                              cpu_peripheral_bridge_s1_write,
                                              cpu_peripheral_bridge_s1_writedata,
                                              d1_cpu_peripheral_bridge_s1_end_xfer
                                           )
;

  output           cpu_data_master_granted_cpu_peripheral_bridge_s1;
  output           cpu_data_master_qualified_request_cpu_peripheral_bridge_s1;
  output           cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1;
  output           cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  output           cpu_data_master_requests_cpu_peripheral_bridge_s1;
  output  [  6: 0] cpu_peripheral_bridge_s1_address;
  output  [  3: 0] cpu_peripheral_bridge_s1_byteenable;
  output           cpu_peripheral_bridge_s1_endofpacket_from_sa;
  output  [  6: 0] cpu_peripheral_bridge_s1_nativeaddress;
  output           cpu_peripheral_bridge_s1_read;
  output  [ 31: 0] cpu_peripheral_bridge_s1_readdata_from_sa;
  output           cpu_peripheral_bridge_s1_reset_n;
  output           cpu_peripheral_bridge_s1_waitrequest_from_sa;
  output           cpu_peripheral_bridge_s1_write;
  output  [ 31: 0] cpu_peripheral_bridge_s1_writedata;
  output           d1_cpu_peripheral_bridge_s1_end_xfer;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            cpu_peripheral_bridge_s1_endofpacket;
  input   [ 31: 0] cpu_peripheral_bridge_s1_readdata;
  input            cpu_peripheral_bridge_s1_readdatavalid;
  input            cpu_peripheral_bridge_s1_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_qualified_request_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  wire             cpu_data_master_requests_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_saved_grant_cpu_peripheral_bridge_s1;
  wire    [  6: 0] cpu_peripheral_bridge_s1_address;
  wire             cpu_peripheral_bridge_s1_allgrants;
  wire             cpu_peripheral_bridge_s1_allow_new_arb_cycle;
  wire             cpu_peripheral_bridge_s1_any_bursting_master_saved_grant;
  wire             cpu_peripheral_bridge_s1_any_continuerequest;
  wire             cpu_peripheral_bridge_s1_arb_counter_enable;
  reg     [  2: 0] cpu_peripheral_bridge_s1_arb_share_counter;
  wire    [  2: 0] cpu_peripheral_bridge_s1_arb_share_counter_next_value;
  wire    [  2: 0] cpu_peripheral_bridge_s1_arb_share_set_values;
  wire             cpu_peripheral_bridge_s1_beginbursttransfer_internal;
  wire             cpu_peripheral_bridge_s1_begins_xfer;
  wire    [  3: 0] cpu_peripheral_bridge_s1_byteenable;
  wire             cpu_peripheral_bridge_s1_end_xfer;
  wire             cpu_peripheral_bridge_s1_endofpacket_from_sa;
  wire             cpu_peripheral_bridge_s1_firsttransfer;
  wire             cpu_peripheral_bridge_s1_grant_vector;
  wire             cpu_peripheral_bridge_s1_in_a_read_cycle;
  wire             cpu_peripheral_bridge_s1_in_a_write_cycle;
  wire             cpu_peripheral_bridge_s1_master_qreq_vector;
  wire             cpu_peripheral_bridge_s1_move_on_to_next_transaction;
  wire    [  6: 0] cpu_peripheral_bridge_s1_nativeaddress;
  wire             cpu_peripheral_bridge_s1_non_bursting_master_requests;
  wire             cpu_peripheral_bridge_s1_read;
  wire    [ 31: 0] cpu_peripheral_bridge_s1_readdata_from_sa;
  wire             cpu_peripheral_bridge_s1_readdatavalid_from_sa;
  reg              cpu_peripheral_bridge_s1_reg_firsttransfer;
  wire             cpu_peripheral_bridge_s1_reset_n;
  reg              cpu_peripheral_bridge_s1_slavearbiterlockenable;
  wire             cpu_peripheral_bridge_s1_slavearbiterlockenable2;
  wire             cpu_peripheral_bridge_s1_unreg_firsttransfer;
  wire             cpu_peripheral_bridge_s1_waitrequest_from_sa;
  wire             cpu_peripheral_bridge_s1_waits_for_read;
  wire             cpu_peripheral_bridge_s1_waits_for_write;
  wire             cpu_peripheral_bridge_s1_write;
  wire    [ 31: 0] cpu_peripheral_bridge_s1_writedata;
  reg              d1_cpu_peripheral_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_cpu_peripheral_bridge_s1_from_cpu_data_master;
  wire             wait_for_cpu_peripheral_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_peripheral_bridge_s1_end_xfer;
    end


  assign cpu_peripheral_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_peripheral_bridge_s1));
  //assign cpu_peripheral_bridge_s1_readdatavalid_from_sa = cpu_peripheral_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_peripheral_bridge_s1_readdatavalid_from_sa = cpu_peripheral_bridge_s1_readdatavalid;

  //assign cpu_peripheral_bridge_s1_readdata_from_sa = cpu_peripheral_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_peripheral_bridge_s1_readdata_from_sa = cpu_peripheral_bridge_s1_readdata;

  assign cpu_data_master_requests_cpu_peripheral_bridge_s1 = ({cpu_data_master_address_to_slave[27 : 9] , 9'b0} == 28'h8000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign cpu_peripheral_bridge_s1_waitrequest_from_sa = cpu_peripheral_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_peripheral_bridge_s1_waitrequest_from_sa = cpu_peripheral_bridge_s1_waitrequest;

  //cpu_peripheral_bridge_s1_arb_share_counter set values, which is an e_mux
  assign cpu_peripheral_bridge_s1_arb_share_set_values = 1;

  //cpu_peripheral_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign cpu_peripheral_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_cpu_peripheral_bridge_s1;

  //cpu_peripheral_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_peripheral_bridge_s1_any_bursting_master_saved_grant = 0;

  //cpu_peripheral_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_peripheral_bridge_s1_arb_share_counter_next_value = cpu_peripheral_bridge_s1_firsttransfer ? (cpu_peripheral_bridge_s1_arb_share_set_values - 1) : |cpu_peripheral_bridge_s1_arb_share_counter ? (cpu_peripheral_bridge_s1_arb_share_counter - 1) : 0;

  //cpu_peripheral_bridge_s1_allgrants all slave grants, which is an e_mux
  assign cpu_peripheral_bridge_s1_allgrants = |cpu_peripheral_bridge_s1_grant_vector;

  //cpu_peripheral_bridge_s1_end_xfer assignment, which is an e_assign
  assign cpu_peripheral_bridge_s1_end_xfer = ~(cpu_peripheral_bridge_s1_waits_for_read | cpu_peripheral_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1 = cpu_peripheral_bridge_s1_end_xfer & (~cpu_peripheral_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_peripheral_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_peripheral_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1 & cpu_peripheral_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1 & ~cpu_peripheral_bridge_s1_non_bursting_master_requests);

  //cpu_peripheral_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_s1_arb_share_counter <= 0;
      else if (cpu_peripheral_bridge_s1_arb_counter_enable)
          cpu_peripheral_bridge_s1_arb_share_counter <= cpu_peripheral_bridge_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|cpu_peripheral_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1) | (end_xfer_arb_share_counter_term_cpu_peripheral_bridge_s1 & ~cpu_peripheral_bridge_s1_non_bursting_master_requests))
          cpu_peripheral_bridge_s1_slavearbiterlockenable <= |cpu_peripheral_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master cpu_peripheral_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_peripheral_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_peripheral_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_s1_slavearbiterlockenable2 = |cpu_peripheral_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master cpu_peripheral_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_peripheral_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu_peripheral_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign cpu_peripheral_bridge_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_cpu_peripheral_bridge_s1 = cpu_data_master_requests_cpu_peripheral_bridge_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //unique name for cpu_peripheral_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign cpu_peripheral_bridge_s1_move_on_to_next_transaction = cpu_peripheral_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_cpu_peripheral_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_cpu_peripheral_bridge_s1_module rdv_fifo_for_cpu_data_master_to_cpu_peripheral_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_cpu_peripheral_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_cpu_peripheral_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_cpu_peripheral_bridge_s1),
      .full                 (),
      .read                 (cpu_peripheral_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~cpu_peripheral_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_cpu_peripheral_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1 = cpu_peripheral_bridge_s1_readdatavalid_from_sa;

  //cpu_peripheral_bridge_s1_writedata mux, which is an e_mux
  assign cpu_peripheral_bridge_s1_writedata = cpu_data_master_writedata;

  //assign cpu_peripheral_bridge_s1_endofpacket_from_sa = cpu_peripheral_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_peripheral_bridge_s1_endofpacket_from_sa = cpu_peripheral_bridge_s1_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_cpu_peripheral_bridge_s1 = cpu_data_master_qualified_request_cpu_peripheral_bridge_s1;

  //cpu/data_master saved-grant cpu_peripheral_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_peripheral_bridge_s1 = cpu_data_master_requests_cpu_peripheral_bridge_s1;

  //allow new arb cycle for cpu_peripheral_bridge/s1, which is an e_assign
  assign cpu_peripheral_bridge_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign cpu_peripheral_bridge_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign cpu_peripheral_bridge_s1_master_qreq_vector = 1;

  //cpu_peripheral_bridge_s1_reset_n assignment, which is an e_assign
  assign cpu_peripheral_bridge_s1_reset_n = reset_n;

  //cpu_peripheral_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign cpu_peripheral_bridge_s1_firsttransfer = cpu_peripheral_bridge_s1_begins_xfer ? cpu_peripheral_bridge_s1_unreg_firsttransfer : cpu_peripheral_bridge_s1_reg_firsttransfer;

  //cpu_peripheral_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_peripheral_bridge_s1_unreg_firsttransfer = ~(cpu_peripheral_bridge_s1_slavearbiterlockenable & cpu_peripheral_bridge_s1_any_continuerequest);

  //cpu_peripheral_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (cpu_peripheral_bridge_s1_begins_xfer)
          cpu_peripheral_bridge_s1_reg_firsttransfer <= cpu_peripheral_bridge_s1_unreg_firsttransfer;
    end


  //cpu_peripheral_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_peripheral_bridge_s1_beginbursttransfer_internal = cpu_peripheral_bridge_s1_begins_xfer;

  //cpu_peripheral_bridge_s1_read assignment, which is an e_mux
  assign cpu_peripheral_bridge_s1_read = cpu_data_master_granted_cpu_peripheral_bridge_s1 & cpu_data_master_read;

  //cpu_peripheral_bridge_s1_write assignment, which is an e_mux
  assign cpu_peripheral_bridge_s1_write = cpu_data_master_granted_cpu_peripheral_bridge_s1 & cpu_data_master_write;

  assign shifted_address_to_cpu_peripheral_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_peripheral_bridge_s1_address mux, which is an e_mux
  assign cpu_peripheral_bridge_s1_address = shifted_address_to_cpu_peripheral_bridge_s1_from_cpu_data_master >> 2;

  //slaveid cpu_peripheral_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign cpu_peripheral_bridge_s1_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_cpu_peripheral_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_peripheral_bridge_s1_end_xfer <= 1;
      else 
        d1_cpu_peripheral_bridge_s1_end_xfer <= cpu_peripheral_bridge_s1_end_xfer;
    end


  //cpu_peripheral_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign cpu_peripheral_bridge_s1_waits_for_read = cpu_peripheral_bridge_s1_in_a_read_cycle & cpu_peripheral_bridge_s1_waitrequest_from_sa;

  //cpu_peripheral_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign cpu_peripheral_bridge_s1_in_a_read_cycle = cpu_data_master_granted_cpu_peripheral_bridge_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_peripheral_bridge_s1_in_a_read_cycle;

  //cpu_peripheral_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign cpu_peripheral_bridge_s1_waits_for_write = cpu_peripheral_bridge_s1_in_a_write_cycle & cpu_peripheral_bridge_s1_waitrequest_from_sa;

  //cpu_peripheral_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign cpu_peripheral_bridge_s1_in_a_write_cycle = cpu_data_master_granted_cpu_peripheral_bridge_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_peripheral_bridge_s1_in_a_write_cycle;

  assign wait_for_cpu_peripheral_bridge_s1_counter = 0;
  //cpu_peripheral_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign cpu_peripheral_bridge_s1_byteenable = (cpu_data_master_granted_cpu_peripheral_bridge_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_peripheral_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_peripheral_bridge_m1_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_peripheral_bridge_m1_address,
                                              cpu_peripheral_bridge_m1_byteenable,
                                              cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_granted_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_granted_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_granted_key_s1,
                                              cpu_peripheral_bridge_m1_granted_lcd_control_slave,
                                              cpu_peripheral_bridge_m1_granted_pio_led_s1,
                                              cpu_peripheral_bridge_m1_granted_sd_clk_s1,
                                              cpu_peripheral_bridge_m1_granted_sd_cmd_s1,
                                              cpu_peripheral_bridge_m1_granted_sd_dat_s1,
                                              cpu_peripheral_bridge_m1_granted_sd_wp_n_s1,
                                              cpu_peripheral_bridge_m1_granted_seg7_avalon_slave,
                                              cpu_peripheral_bridge_m1_granted_sw_s1,
                                              cpu_peripheral_bridge_m1_granted_sysid_control_slave,
                                              cpu_peripheral_bridge_m1_granted_timer_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_key_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave,
                                              cpu_peripheral_bridge_m1_qualified_request_pio_led_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave,
                                              cpu_peripheral_bridge_m1_qualified_request_sw_s1,
                                              cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave,
                                              cpu_peripheral_bridge_m1_qualified_request_timer_s1,
                                              cpu_peripheral_bridge_m1_read,
                                              cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_key_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave,
                                              cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave,
                                              cpu_peripheral_bridge_m1_read_data_valid_sw_s1,
                                              cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave,
                                              cpu_peripheral_bridge_m1_read_data_valid_timer_s1,
                                              cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_requests_i2c_scl_s1,
                                              cpu_peripheral_bridge_m1_requests_i2c_sda_s1,
                                              cpu_peripheral_bridge_m1_requests_key_s1,
                                              cpu_peripheral_bridge_m1_requests_lcd_control_slave,
                                              cpu_peripheral_bridge_m1_requests_pio_led_s1,
                                              cpu_peripheral_bridge_m1_requests_sd_clk_s1,
                                              cpu_peripheral_bridge_m1_requests_sd_cmd_s1,
                                              cpu_peripheral_bridge_m1_requests_sd_dat_s1,
                                              cpu_peripheral_bridge_m1_requests_sd_wp_n_s1,
                                              cpu_peripheral_bridge_m1_requests_seg7_avalon_slave,
                                              cpu_peripheral_bridge_m1_requests_sw_s1,
                                              cpu_peripheral_bridge_m1_requests_sysid_control_slave,
                                              cpu_peripheral_bridge_m1_requests_timer_s1,
                                              cpu_peripheral_bridge_m1_write,
                                              cpu_peripheral_bridge_m1_writedata,
                                              d1_eep_i2c_scl_s1_end_xfer,
                                              d1_eep_i2c_sda_s1_end_xfer,
                                              d1_i2c_scl_s1_end_xfer,
                                              d1_i2c_sda_s1_end_xfer,
                                              d1_key_s1_end_xfer,
                                              d1_lcd_control_slave_end_xfer,
                                              d1_pio_led_s1_end_xfer,
                                              d1_sd_clk_s1_end_xfer,
                                              d1_sd_cmd_s1_end_xfer,
                                              d1_sd_dat_s1_end_xfer,
                                              d1_sd_wp_n_s1_end_xfer,
                                              d1_seg7_avalon_slave_end_xfer,
                                              d1_sw_s1_end_xfer,
                                              d1_sysid_control_slave_end_xfer,
                                              d1_timer_s1_end_xfer,
                                              eep_i2c_scl_s1_readdata_from_sa,
                                              eep_i2c_sda_s1_readdata_from_sa,
                                              i2c_scl_s1_readdata_from_sa,
                                              i2c_sda_s1_readdata_from_sa,
                                              key_s1_readdata_from_sa,
                                              lcd_control_slave_readdata_from_sa,
                                              lcd_control_slave_wait_counter_eq_0,
                                              pio_led_s1_readdata_from_sa,
                                              reset_n,
                                              sd_clk_s1_readdata_from_sa,
                                              sd_cmd_s1_readdata_from_sa,
                                              sd_dat_s1_readdata_from_sa,
                                              sd_wp_n_s1_readdata_from_sa,
                                              seg7_avalon_slave_readdata_from_sa,
                                              sw_s1_readdata_from_sa,
                                              sysid_control_slave_readdata_from_sa,
                                              timer_s1_readdata_from_sa,

                                             // outputs:
                                              cpu_peripheral_bridge_m1_address_to_slave,
                                              cpu_peripheral_bridge_m1_latency_counter,
                                              cpu_peripheral_bridge_m1_readdata,
                                              cpu_peripheral_bridge_m1_readdatavalid,
                                              cpu_peripheral_bridge_m1_reset_n,
                                              cpu_peripheral_bridge_m1_waitrequest
                                           )
;

  output  [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  output           cpu_peripheral_bridge_m1_latency_counter;
  output  [ 31: 0] cpu_peripheral_bridge_m1_readdata;
  output           cpu_peripheral_bridge_m1_readdatavalid;
  output           cpu_peripheral_bridge_m1_reset_n;
  output           cpu_peripheral_bridge_m1_waitrequest;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address;
  input   [  3: 0] cpu_peripheral_bridge_m1_byteenable;
  input            cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_granted_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_granted_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_granted_key_s1;
  input            cpu_peripheral_bridge_m1_granted_lcd_control_slave;
  input            cpu_peripheral_bridge_m1_granted_pio_led_s1;
  input            cpu_peripheral_bridge_m1_granted_sd_clk_s1;
  input            cpu_peripheral_bridge_m1_granted_sd_cmd_s1;
  input            cpu_peripheral_bridge_m1_granted_sd_dat_s1;
  input            cpu_peripheral_bridge_m1_granted_sd_wp_n_s1;
  input            cpu_peripheral_bridge_m1_granted_seg7_avalon_slave;
  input            cpu_peripheral_bridge_m1_granted_sw_s1;
  input            cpu_peripheral_bridge_m1_granted_sysid_control_slave;
  input            cpu_peripheral_bridge_m1_granted_timer_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_key_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave;
  input            cpu_peripheral_bridge_m1_qualified_request_pio_led_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave;
  input            cpu_peripheral_bridge_m1_qualified_request_sw_s1;
  input            cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  input            cpu_peripheral_bridge_m1_qualified_request_timer_s1;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_key_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave;
  input            cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave;
  input            cpu_peripheral_bridge_m1_read_data_valid_sw_s1;
  input            cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  input            cpu_peripheral_bridge_m1_read_data_valid_timer_s1;
  input            cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_requests_i2c_scl_s1;
  input            cpu_peripheral_bridge_m1_requests_i2c_sda_s1;
  input            cpu_peripheral_bridge_m1_requests_key_s1;
  input            cpu_peripheral_bridge_m1_requests_lcd_control_slave;
  input            cpu_peripheral_bridge_m1_requests_pio_led_s1;
  input            cpu_peripheral_bridge_m1_requests_sd_clk_s1;
  input            cpu_peripheral_bridge_m1_requests_sd_cmd_s1;
  input            cpu_peripheral_bridge_m1_requests_sd_dat_s1;
  input            cpu_peripheral_bridge_m1_requests_sd_wp_n_s1;
  input            cpu_peripheral_bridge_m1_requests_seg7_avalon_slave;
  input            cpu_peripheral_bridge_m1_requests_sw_s1;
  input            cpu_peripheral_bridge_m1_requests_sysid_control_slave;
  input            cpu_peripheral_bridge_m1_requests_timer_s1;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            d1_eep_i2c_scl_s1_end_xfer;
  input            d1_eep_i2c_sda_s1_end_xfer;
  input            d1_i2c_scl_s1_end_xfer;
  input            d1_i2c_sda_s1_end_xfer;
  input            d1_key_s1_end_xfer;
  input            d1_lcd_control_slave_end_xfer;
  input            d1_pio_led_s1_end_xfer;
  input            d1_sd_clk_s1_end_xfer;
  input            d1_sd_cmd_s1_end_xfer;
  input            d1_sd_dat_s1_end_xfer;
  input            d1_sd_wp_n_s1_end_xfer;
  input            d1_seg7_avalon_slave_end_xfer;
  input            d1_sw_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_s1_end_xfer;
  input            eep_i2c_scl_s1_readdata_from_sa;
  input            eep_i2c_sda_s1_readdata_from_sa;
  input            i2c_scl_s1_readdata_from_sa;
  input            i2c_sda_s1_readdata_from_sa;
  input   [  3: 0] key_s1_readdata_from_sa;
  input   [  7: 0] lcd_control_slave_readdata_from_sa;
  input            lcd_control_slave_wait_counter_eq_0;
  input   [ 25: 0] pio_led_s1_readdata_from_sa;
  input            reset_n;
  input            sd_clk_s1_readdata_from_sa;
  input            sd_cmd_s1_readdata_from_sa;
  input   [  3: 0] sd_dat_s1_readdata_from_sa;
  input            sd_wp_n_s1_readdata_from_sa;
  input   [  7: 0] seg7_avalon_slave_readdata_from_sa;
  input   [ 17: 0] sw_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 15: 0] timer_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [  8: 0] cpu_peripheral_bridge_m1_address_last_time;
  wire    [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  reg     [  3: 0] cpu_peripheral_bridge_m1_byteenable_last_time;
  wire             cpu_peripheral_bridge_m1_is_granted_some_slave;
  reg              cpu_peripheral_bridge_m1_latency_counter;
  reg              cpu_peripheral_bridge_m1_read_but_no_slave_selected;
  reg              cpu_peripheral_bridge_m1_read_last_time;
  wire    [ 31: 0] cpu_peripheral_bridge_m1_readdata;
  wire             cpu_peripheral_bridge_m1_readdatavalid;
  wire             cpu_peripheral_bridge_m1_reset_n;
  wire             cpu_peripheral_bridge_m1_run;
  wire             cpu_peripheral_bridge_m1_waitrequest;
  reg              cpu_peripheral_bridge_m1_write_last_time;
  reg     [ 31: 0] cpu_peripheral_bridge_m1_writedata_last_time;
  wire             latency_load_value;
  wire             p1_cpu_peripheral_bridge_m1_latency_counter;
  wire             pre_flush_cpu_peripheral_bridge_m1_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1 | ~cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_eep_i2c_scl_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1 | ~cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_eep_i2c_sda_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1 | ~cpu_peripheral_bridge_m1_requests_i2c_scl_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_i2c_scl_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1 | ~cpu_peripheral_bridge_m1_requests_i2c_sda_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_i2c_sda_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_key_s1 | ~cpu_peripheral_bridge_m1_requests_key_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_key_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_key_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_key_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_peripheral_bridge_m1_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave | ~cpu_peripheral_bridge_m1_requests_lcd_control_slave) & ((~cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave | ~cpu_peripheral_bridge_m1_read | (1 & ((lcd_control_slave_wait_counter_eq_0 & ~d1_lcd_control_slave_end_xfer)) & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave | ~cpu_peripheral_bridge_m1_write | (1 & ((lcd_control_slave_wait_counter_eq_0 & ~d1_lcd_control_slave_end_xfer)) & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_pio_led_s1 | ~cpu_peripheral_bridge_m1_requests_pio_led_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_pio_led_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_pio_led_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_pio_led_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1 | ~cpu_peripheral_bridge_m1_requests_sd_clk_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_sd_clk_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1 | ~cpu_peripheral_bridge_m1_requests_sd_cmd_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_sd_cmd_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1 | ~cpu_peripheral_bridge_m1_requests_sd_dat_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_sd_dat_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1 | ~cpu_peripheral_bridge_m1_requests_sd_wp_n_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_sd_wp_n_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave | ~cpu_peripheral_bridge_m1_requests_seg7_avalon_slave) & ((~cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave | ~(cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write) | (1 & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write)))) & ((~cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave | ~(cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write) | (1 & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write)))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_sw_s1 | ~cpu_peripheral_bridge_m1_requests_sw_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_sw_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_sw_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_sw_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave | ~cpu_peripheral_bridge_m1_requests_sysid_control_slave) & ((~cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write))) & 1 & (cpu_peripheral_bridge_m1_qualified_request_timer_s1 | ~cpu_peripheral_bridge_m1_requests_timer_s1) & ((~cpu_peripheral_bridge_m1_qualified_request_timer_s1 | ~cpu_peripheral_bridge_m1_read | (1 & ~d1_timer_s1_end_xfer & cpu_peripheral_bridge_m1_read))) & ((~cpu_peripheral_bridge_m1_qualified_request_timer_s1 | ~cpu_peripheral_bridge_m1_write | (1 & cpu_peripheral_bridge_m1_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_peripheral_bridge_m1_address_to_slave = cpu_peripheral_bridge_m1_address[8 : 0];

  //cpu_peripheral_bridge_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_read_but_no_slave_selected <= 0;
      else 
        cpu_peripheral_bridge_m1_read_but_no_slave_selected <= cpu_peripheral_bridge_m1_read & cpu_peripheral_bridge_m1_run & ~cpu_peripheral_bridge_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_peripheral_bridge_m1_is_granted_some_slave = cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1 |
    cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1 |
    cpu_peripheral_bridge_m1_granted_i2c_scl_s1 |
    cpu_peripheral_bridge_m1_granted_i2c_sda_s1 |
    cpu_peripheral_bridge_m1_granted_key_s1 |
    cpu_peripheral_bridge_m1_granted_lcd_control_slave |
    cpu_peripheral_bridge_m1_granted_pio_led_s1 |
    cpu_peripheral_bridge_m1_granted_sd_clk_s1 |
    cpu_peripheral_bridge_m1_granted_sd_cmd_s1 |
    cpu_peripheral_bridge_m1_granted_sd_dat_s1 |
    cpu_peripheral_bridge_m1_granted_sd_wp_n_s1 |
    cpu_peripheral_bridge_m1_granted_seg7_avalon_slave |
    cpu_peripheral_bridge_m1_granted_sw_s1 |
    cpu_peripheral_bridge_m1_granted_sysid_control_slave |
    cpu_peripheral_bridge_m1_granted_timer_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_peripheral_bridge_m1_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_peripheral_bridge_m1_readdatavalid = cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_key_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_sw_s1 |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave |
    cpu_peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_cpu_peripheral_bridge_m1_readdatavalid |
    cpu_peripheral_bridge_m1_read_data_valid_timer_s1;

  //cpu_peripheral_bridge/m1 readdata mux, which is an e_mux
  assign cpu_peripheral_bridge_m1_readdata = ({32 {~(cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1 & cpu_peripheral_bridge_m1_read)}} | eep_i2c_scl_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1 & cpu_peripheral_bridge_m1_read)}} | eep_i2c_sda_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1 & cpu_peripheral_bridge_m1_read)}} | i2c_scl_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1 & cpu_peripheral_bridge_m1_read)}} | i2c_sda_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_key_s1 & cpu_peripheral_bridge_m1_read)}} | key_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave & cpu_peripheral_bridge_m1_read)}} | lcd_control_slave_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_pio_led_s1 & cpu_peripheral_bridge_m1_read)}} | pio_led_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1 & cpu_peripheral_bridge_m1_read)}} | sd_clk_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1 & cpu_peripheral_bridge_m1_read)}} | sd_cmd_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1 & cpu_peripheral_bridge_m1_read)}} | sd_dat_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1 & cpu_peripheral_bridge_m1_read)}} | sd_wp_n_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave & cpu_peripheral_bridge_m1_read)}} | seg7_avalon_slave_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_sw_s1 & cpu_peripheral_bridge_m1_read)}} | sw_s1_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave & cpu_peripheral_bridge_m1_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(cpu_peripheral_bridge_m1_qualified_request_timer_s1 & cpu_peripheral_bridge_m1_read)}} | timer_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_peripheral_bridge_m1_waitrequest = ~cpu_peripheral_bridge_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_latency_counter <= 0;
      else 
        cpu_peripheral_bridge_m1_latency_counter <= p1_cpu_peripheral_bridge_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_peripheral_bridge_m1_latency_counter = ((cpu_peripheral_bridge_m1_run & cpu_peripheral_bridge_m1_read))? latency_load_value :
    (cpu_peripheral_bridge_m1_latency_counter)? cpu_peripheral_bridge_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //cpu_peripheral_bridge_m1_reset_n assignment, which is an e_assign
  assign cpu_peripheral_bridge_m1_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_peripheral_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_address_last_time <= 0;
      else 
        cpu_peripheral_bridge_m1_address_last_time <= cpu_peripheral_bridge_m1_address;
    end


  //cpu_peripheral_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_peripheral_bridge_m1_waitrequest & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
    end


  //cpu_peripheral_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_peripheral_bridge_m1_address != cpu_peripheral_bridge_m1_address_last_time))
        begin
          $write("%0d ns: cpu_peripheral_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_peripheral_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_byteenable_last_time <= 0;
      else 
        cpu_peripheral_bridge_m1_byteenable_last_time <= cpu_peripheral_bridge_m1_byteenable;
    end


  //cpu_peripheral_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_peripheral_bridge_m1_byteenable != cpu_peripheral_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: cpu_peripheral_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_peripheral_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_read_last_time <= 0;
      else 
        cpu_peripheral_bridge_m1_read_last_time <= cpu_peripheral_bridge_m1_read;
    end


  //cpu_peripheral_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_peripheral_bridge_m1_read != cpu_peripheral_bridge_m1_read_last_time))
        begin
          $write("%0d ns: cpu_peripheral_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_peripheral_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_write_last_time <= 0;
      else 
        cpu_peripheral_bridge_m1_write_last_time <= cpu_peripheral_bridge_m1_write;
    end


  //cpu_peripheral_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_peripheral_bridge_m1_write != cpu_peripheral_bridge_m1_write_last_time))
        begin
          $write("%0d ns: cpu_peripheral_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_peripheral_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_peripheral_bridge_m1_writedata_last_time <= 0;
      else 
        cpu_peripheral_bridge_m1_writedata_last_time <= cpu_peripheral_bridge_m1_writedata;
    end


  //cpu_peripheral_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_peripheral_bridge_m1_writedata != cpu_peripheral_bridge_m1_writedata_last_time) & cpu_peripheral_bridge_m1_write)
        begin
          $write("%0d ns: cpu_peripheral_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_peripheral_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module eep_i2c_scl_s1_arbitrator (
                                   // inputs:
                                    clk,
                                    cpu_peripheral_bridge_m1_address_to_slave,
                                    cpu_peripheral_bridge_m1_latency_counter,
                                    cpu_peripheral_bridge_m1_nativeaddress,
                                    cpu_peripheral_bridge_m1_read,
                                    cpu_peripheral_bridge_m1_write,
                                    cpu_peripheral_bridge_m1_writedata,
                                    eep_i2c_scl_s1_readdata,
                                    reset_n,

                                   // outputs:
                                    cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1,
                                    cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1,
                                    cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1,
                                    cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1,
                                    d1_eep_i2c_scl_s1_end_xfer,
                                    eep_i2c_scl_s1_address,
                                    eep_i2c_scl_s1_chipselect,
                                    eep_i2c_scl_s1_readdata_from_sa,
                                    eep_i2c_scl_s1_reset_n,
                                    eep_i2c_scl_s1_write_n,
                                    eep_i2c_scl_s1_writedata
                                 )
;

  output           cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1;
  output           cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1;
  output           d1_eep_i2c_scl_s1_end_xfer;
  output  [  1: 0] eep_i2c_scl_s1_address;
  output           eep_i2c_scl_s1_chipselect;
  output           eep_i2c_scl_s1_readdata_from_sa;
  output           eep_i2c_scl_s1_reset_n;
  output           eep_i2c_scl_s1_write_n;
  output           eep_i2c_scl_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            eep_i2c_scl_s1_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_eep_i2c_scl_s1;
  reg              d1_eep_i2c_scl_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  1: 0] eep_i2c_scl_s1_address;
  wire             eep_i2c_scl_s1_allgrants;
  wire             eep_i2c_scl_s1_allow_new_arb_cycle;
  wire             eep_i2c_scl_s1_any_bursting_master_saved_grant;
  wire             eep_i2c_scl_s1_any_continuerequest;
  wire             eep_i2c_scl_s1_arb_counter_enable;
  reg              eep_i2c_scl_s1_arb_share_counter;
  wire             eep_i2c_scl_s1_arb_share_counter_next_value;
  wire             eep_i2c_scl_s1_arb_share_set_values;
  wire             eep_i2c_scl_s1_beginbursttransfer_internal;
  wire             eep_i2c_scl_s1_begins_xfer;
  wire             eep_i2c_scl_s1_chipselect;
  wire             eep_i2c_scl_s1_end_xfer;
  wire             eep_i2c_scl_s1_firsttransfer;
  wire             eep_i2c_scl_s1_grant_vector;
  wire             eep_i2c_scl_s1_in_a_read_cycle;
  wire             eep_i2c_scl_s1_in_a_write_cycle;
  wire             eep_i2c_scl_s1_master_qreq_vector;
  wire             eep_i2c_scl_s1_non_bursting_master_requests;
  wire             eep_i2c_scl_s1_readdata_from_sa;
  reg              eep_i2c_scl_s1_reg_firsttransfer;
  wire             eep_i2c_scl_s1_reset_n;
  reg              eep_i2c_scl_s1_slavearbiterlockenable;
  wire             eep_i2c_scl_s1_slavearbiterlockenable2;
  wire             eep_i2c_scl_s1_unreg_firsttransfer;
  wire             eep_i2c_scl_s1_waits_for_read;
  wire             eep_i2c_scl_s1_waits_for_write;
  wire             eep_i2c_scl_s1_write_n;
  wire             eep_i2c_scl_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_eep_i2c_scl_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_eep_i2c_scl_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~eep_i2c_scl_s1_end_xfer;
    end


  assign eep_i2c_scl_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1));
  //assign eep_i2c_scl_s1_readdata_from_sa = eep_i2c_scl_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign eep_i2c_scl_s1_readdata_from_sa = eep_i2c_scl_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'ha0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //eep_i2c_scl_s1_arb_share_counter set values, which is an e_mux
  assign eep_i2c_scl_s1_arb_share_set_values = 1;

  //eep_i2c_scl_s1_non_bursting_master_requests mux, which is an e_mux
  assign eep_i2c_scl_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1;

  //eep_i2c_scl_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign eep_i2c_scl_s1_any_bursting_master_saved_grant = 0;

  //eep_i2c_scl_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign eep_i2c_scl_s1_arb_share_counter_next_value = eep_i2c_scl_s1_firsttransfer ? (eep_i2c_scl_s1_arb_share_set_values - 1) : |eep_i2c_scl_s1_arb_share_counter ? (eep_i2c_scl_s1_arb_share_counter - 1) : 0;

  //eep_i2c_scl_s1_allgrants all slave grants, which is an e_mux
  assign eep_i2c_scl_s1_allgrants = |eep_i2c_scl_s1_grant_vector;

  //eep_i2c_scl_s1_end_xfer assignment, which is an e_assign
  assign eep_i2c_scl_s1_end_xfer = ~(eep_i2c_scl_s1_waits_for_read | eep_i2c_scl_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_eep_i2c_scl_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_eep_i2c_scl_s1 = eep_i2c_scl_s1_end_xfer & (~eep_i2c_scl_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //eep_i2c_scl_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign eep_i2c_scl_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_eep_i2c_scl_s1 & eep_i2c_scl_s1_allgrants) | (end_xfer_arb_share_counter_term_eep_i2c_scl_s1 & ~eep_i2c_scl_s1_non_bursting_master_requests);

  //eep_i2c_scl_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          eep_i2c_scl_s1_arb_share_counter <= 0;
      else if (eep_i2c_scl_s1_arb_counter_enable)
          eep_i2c_scl_s1_arb_share_counter <= eep_i2c_scl_s1_arb_share_counter_next_value;
    end


  //eep_i2c_scl_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          eep_i2c_scl_s1_slavearbiterlockenable <= 0;
      else if ((|eep_i2c_scl_s1_master_qreq_vector & end_xfer_arb_share_counter_term_eep_i2c_scl_s1) | (end_xfer_arb_share_counter_term_eep_i2c_scl_s1 & ~eep_i2c_scl_s1_non_bursting_master_requests))
          eep_i2c_scl_s1_slavearbiterlockenable <= |eep_i2c_scl_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 eep_i2c_scl/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = eep_i2c_scl_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //eep_i2c_scl_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign eep_i2c_scl_s1_slavearbiterlockenable2 = |eep_i2c_scl_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 eep_i2c_scl/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = eep_i2c_scl_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //eep_i2c_scl_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign eep_i2c_scl_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1 = cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1 = cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1 & cpu_peripheral_bridge_m1_read & ~eep_i2c_scl_s1_waits_for_read;

  //eep_i2c_scl_s1_writedata mux, which is an e_mux
  assign eep_i2c_scl_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1 = cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1;

  //cpu_peripheral_bridge/m1 saved-grant eep_i2c_scl/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_eep_i2c_scl_s1 = cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1;

  //allow new arb cycle for eep_i2c_scl/s1, which is an e_assign
  assign eep_i2c_scl_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign eep_i2c_scl_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign eep_i2c_scl_s1_master_qreq_vector = 1;

  //eep_i2c_scl_s1_reset_n assignment, which is an e_assign
  assign eep_i2c_scl_s1_reset_n = reset_n;

  assign eep_i2c_scl_s1_chipselect = cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1;
  //eep_i2c_scl_s1_firsttransfer first transaction, which is an e_assign
  assign eep_i2c_scl_s1_firsttransfer = eep_i2c_scl_s1_begins_xfer ? eep_i2c_scl_s1_unreg_firsttransfer : eep_i2c_scl_s1_reg_firsttransfer;

  //eep_i2c_scl_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign eep_i2c_scl_s1_unreg_firsttransfer = ~(eep_i2c_scl_s1_slavearbiterlockenable & eep_i2c_scl_s1_any_continuerequest);

  //eep_i2c_scl_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          eep_i2c_scl_s1_reg_firsttransfer <= 1'b1;
      else if (eep_i2c_scl_s1_begins_xfer)
          eep_i2c_scl_s1_reg_firsttransfer <= eep_i2c_scl_s1_unreg_firsttransfer;
    end


  //eep_i2c_scl_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign eep_i2c_scl_s1_beginbursttransfer_internal = eep_i2c_scl_s1_begins_xfer;

  //~eep_i2c_scl_s1_write_n assignment, which is an e_mux
  assign eep_i2c_scl_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1 & cpu_peripheral_bridge_m1_write);

  //eep_i2c_scl_s1_address mux, which is an e_mux
  assign eep_i2c_scl_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_eep_i2c_scl_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_eep_i2c_scl_s1_end_xfer <= 1;
      else 
        d1_eep_i2c_scl_s1_end_xfer <= eep_i2c_scl_s1_end_xfer;
    end


  //eep_i2c_scl_s1_waits_for_read in a cycle, which is an e_mux
  assign eep_i2c_scl_s1_waits_for_read = eep_i2c_scl_s1_in_a_read_cycle & eep_i2c_scl_s1_begins_xfer;

  //eep_i2c_scl_s1_in_a_read_cycle assignment, which is an e_assign
  assign eep_i2c_scl_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = eep_i2c_scl_s1_in_a_read_cycle;

  //eep_i2c_scl_s1_waits_for_write in a cycle, which is an e_mux
  assign eep_i2c_scl_s1_waits_for_write = eep_i2c_scl_s1_in_a_write_cycle & 0;

  //eep_i2c_scl_s1_in_a_write_cycle assignment, which is an e_assign
  assign eep_i2c_scl_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = eep_i2c_scl_s1_in_a_write_cycle;

  assign wait_for_eep_i2c_scl_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //eep_i2c_scl/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module eep_i2c_sda_s1_arbitrator (
                                   // inputs:
                                    clk,
                                    cpu_peripheral_bridge_m1_address_to_slave,
                                    cpu_peripheral_bridge_m1_latency_counter,
                                    cpu_peripheral_bridge_m1_nativeaddress,
                                    cpu_peripheral_bridge_m1_read,
                                    cpu_peripheral_bridge_m1_write,
                                    cpu_peripheral_bridge_m1_writedata,
                                    eep_i2c_sda_s1_readdata,
                                    reset_n,

                                   // outputs:
                                    cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1,
                                    cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1,
                                    cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1,
                                    cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1,
                                    d1_eep_i2c_sda_s1_end_xfer,
                                    eep_i2c_sda_s1_address,
                                    eep_i2c_sda_s1_chipselect,
                                    eep_i2c_sda_s1_readdata_from_sa,
                                    eep_i2c_sda_s1_reset_n,
                                    eep_i2c_sda_s1_write_n,
                                    eep_i2c_sda_s1_writedata
                                 )
;

  output           cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1;
  output           cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1;
  output           d1_eep_i2c_sda_s1_end_xfer;
  output  [  1: 0] eep_i2c_sda_s1_address;
  output           eep_i2c_sda_s1_chipselect;
  output           eep_i2c_sda_s1_readdata_from_sa;
  output           eep_i2c_sda_s1_reset_n;
  output           eep_i2c_sda_s1_write_n;
  output           eep_i2c_sda_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            eep_i2c_sda_s1_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_eep_i2c_sda_s1;
  reg              d1_eep_i2c_sda_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  1: 0] eep_i2c_sda_s1_address;
  wire             eep_i2c_sda_s1_allgrants;
  wire             eep_i2c_sda_s1_allow_new_arb_cycle;
  wire             eep_i2c_sda_s1_any_bursting_master_saved_grant;
  wire             eep_i2c_sda_s1_any_continuerequest;
  wire             eep_i2c_sda_s1_arb_counter_enable;
  reg              eep_i2c_sda_s1_arb_share_counter;
  wire             eep_i2c_sda_s1_arb_share_counter_next_value;
  wire             eep_i2c_sda_s1_arb_share_set_values;
  wire             eep_i2c_sda_s1_beginbursttransfer_internal;
  wire             eep_i2c_sda_s1_begins_xfer;
  wire             eep_i2c_sda_s1_chipselect;
  wire             eep_i2c_sda_s1_end_xfer;
  wire             eep_i2c_sda_s1_firsttransfer;
  wire             eep_i2c_sda_s1_grant_vector;
  wire             eep_i2c_sda_s1_in_a_read_cycle;
  wire             eep_i2c_sda_s1_in_a_write_cycle;
  wire             eep_i2c_sda_s1_master_qreq_vector;
  wire             eep_i2c_sda_s1_non_bursting_master_requests;
  wire             eep_i2c_sda_s1_readdata_from_sa;
  reg              eep_i2c_sda_s1_reg_firsttransfer;
  wire             eep_i2c_sda_s1_reset_n;
  reg              eep_i2c_sda_s1_slavearbiterlockenable;
  wire             eep_i2c_sda_s1_slavearbiterlockenable2;
  wire             eep_i2c_sda_s1_unreg_firsttransfer;
  wire             eep_i2c_sda_s1_waits_for_read;
  wire             eep_i2c_sda_s1_waits_for_write;
  wire             eep_i2c_sda_s1_write_n;
  wire             eep_i2c_sda_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_eep_i2c_sda_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_eep_i2c_sda_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~eep_i2c_sda_s1_end_xfer;
    end


  assign eep_i2c_sda_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1));
  //assign eep_i2c_sda_s1_readdata_from_sa = eep_i2c_sda_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign eep_i2c_sda_s1_readdata_from_sa = eep_i2c_sda_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'hb0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //eep_i2c_sda_s1_arb_share_counter set values, which is an e_mux
  assign eep_i2c_sda_s1_arb_share_set_values = 1;

  //eep_i2c_sda_s1_non_bursting_master_requests mux, which is an e_mux
  assign eep_i2c_sda_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1;

  //eep_i2c_sda_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign eep_i2c_sda_s1_any_bursting_master_saved_grant = 0;

  //eep_i2c_sda_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign eep_i2c_sda_s1_arb_share_counter_next_value = eep_i2c_sda_s1_firsttransfer ? (eep_i2c_sda_s1_arb_share_set_values - 1) : |eep_i2c_sda_s1_arb_share_counter ? (eep_i2c_sda_s1_arb_share_counter - 1) : 0;

  //eep_i2c_sda_s1_allgrants all slave grants, which is an e_mux
  assign eep_i2c_sda_s1_allgrants = |eep_i2c_sda_s1_grant_vector;

  //eep_i2c_sda_s1_end_xfer assignment, which is an e_assign
  assign eep_i2c_sda_s1_end_xfer = ~(eep_i2c_sda_s1_waits_for_read | eep_i2c_sda_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_eep_i2c_sda_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_eep_i2c_sda_s1 = eep_i2c_sda_s1_end_xfer & (~eep_i2c_sda_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //eep_i2c_sda_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign eep_i2c_sda_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_eep_i2c_sda_s1 & eep_i2c_sda_s1_allgrants) | (end_xfer_arb_share_counter_term_eep_i2c_sda_s1 & ~eep_i2c_sda_s1_non_bursting_master_requests);

  //eep_i2c_sda_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          eep_i2c_sda_s1_arb_share_counter <= 0;
      else if (eep_i2c_sda_s1_arb_counter_enable)
          eep_i2c_sda_s1_arb_share_counter <= eep_i2c_sda_s1_arb_share_counter_next_value;
    end


  //eep_i2c_sda_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          eep_i2c_sda_s1_slavearbiterlockenable <= 0;
      else if ((|eep_i2c_sda_s1_master_qreq_vector & end_xfer_arb_share_counter_term_eep_i2c_sda_s1) | (end_xfer_arb_share_counter_term_eep_i2c_sda_s1 & ~eep_i2c_sda_s1_non_bursting_master_requests))
          eep_i2c_sda_s1_slavearbiterlockenable <= |eep_i2c_sda_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 eep_i2c_sda/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = eep_i2c_sda_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //eep_i2c_sda_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign eep_i2c_sda_s1_slavearbiterlockenable2 = |eep_i2c_sda_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 eep_i2c_sda/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = eep_i2c_sda_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //eep_i2c_sda_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign eep_i2c_sda_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1 = cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1 = cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1 & cpu_peripheral_bridge_m1_read & ~eep_i2c_sda_s1_waits_for_read;

  //eep_i2c_sda_s1_writedata mux, which is an e_mux
  assign eep_i2c_sda_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1 = cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1;

  //cpu_peripheral_bridge/m1 saved-grant eep_i2c_sda/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_eep_i2c_sda_s1 = cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1;

  //allow new arb cycle for eep_i2c_sda/s1, which is an e_assign
  assign eep_i2c_sda_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign eep_i2c_sda_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign eep_i2c_sda_s1_master_qreq_vector = 1;

  //eep_i2c_sda_s1_reset_n assignment, which is an e_assign
  assign eep_i2c_sda_s1_reset_n = reset_n;

  assign eep_i2c_sda_s1_chipselect = cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1;
  //eep_i2c_sda_s1_firsttransfer first transaction, which is an e_assign
  assign eep_i2c_sda_s1_firsttransfer = eep_i2c_sda_s1_begins_xfer ? eep_i2c_sda_s1_unreg_firsttransfer : eep_i2c_sda_s1_reg_firsttransfer;

  //eep_i2c_sda_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign eep_i2c_sda_s1_unreg_firsttransfer = ~(eep_i2c_sda_s1_slavearbiterlockenable & eep_i2c_sda_s1_any_continuerequest);

  //eep_i2c_sda_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          eep_i2c_sda_s1_reg_firsttransfer <= 1'b1;
      else if (eep_i2c_sda_s1_begins_xfer)
          eep_i2c_sda_s1_reg_firsttransfer <= eep_i2c_sda_s1_unreg_firsttransfer;
    end


  //eep_i2c_sda_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign eep_i2c_sda_s1_beginbursttransfer_internal = eep_i2c_sda_s1_begins_xfer;

  //~eep_i2c_sda_s1_write_n assignment, which is an e_mux
  assign eep_i2c_sda_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1 & cpu_peripheral_bridge_m1_write);

  //eep_i2c_sda_s1_address mux, which is an e_mux
  assign eep_i2c_sda_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_eep_i2c_sda_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_eep_i2c_sda_s1_end_xfer <= 1;
      else 
        d1_eep_i2c_sda_s1_end_xfer <= eep_i2c_sda_s1_end_xfer;
    end


  //eep_i2c_sda_s1_waits_for_read in a cycle, which is an e_mux
  assign eep_i2c_sda_s1_waits_for_read = eep_i2c_sda_s1_in_a_read_cycle & eep_i2c_sda_s1_begins_xfer;

  //eep_i2c_sda_s1_in_a_read_cycle assignment, which is an e_assign
  assign eep_i2c_sda_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = eep_i2c_sda_s1_in_a_read_cycle;

  //eep_i2c_sda_s1_waits_for_write in a cycle, which is an e_mux
  assign eep_i2c_sda_s1_waits_for_write = eep_i2c_sda_s1_in_a_write_cycle & 0;

  //eep_i2c_sda_s1_in_a_write_cycle assignment, which is an e_assign
  assign eep_i2c_sda_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = eep_i2c_sda_s1_in_a_write_cycle;

  assign wait_for_eep_i2c_sda_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //eep_i2c_sda/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module i2c_scl_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_peripheral_bridge_m1_address_to_slave,
                                cpu_peripheral_bridge_m1_latency_counter,
                                cpu_peripheral_bridge_m1_nativeaddress,
                                cpu_peripheral_bridge_m1_read,
                                cpu_peripheral_bridge_m1_write,
                                cpu_peripheral_bridge_m1_writedata,
                                i2c_scl_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_peripheral_bridge_m1_granted_i2c_scl_s1,
                                cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1,
                                cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1,
                                cpu_peripheral_bridge_m1_requests_i2c_scl_s1,
                                d1_i2c_scl_s1_end_xfer,
                                i2c_scl_s1_address,
                                i2c_scl_s1_chipselect,
                                i2c_scl_s1_readdata_from_sa,
                                i2c_scl_s1_reset_n,
                                i2c_scl_s1_write_n,
                                i2c_scl_s1_writedata
                             )
;

  output           cpu_peripheral_bridge_m1_granted_i2c_scl_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1;
  output           cpu_peripheral_bridge_m1_requests_i2c_scl_s1;
  output           d1_i2c_scl_s1_end_xfer;
  output  [  1: 0] i2c_scl_s1_address;
  output           i2c_scl_s1_chipselect;
  output           i2c_scl_s1_readdata_from_sa;
  output           i2c_scl_s1_reset_n;
  output           i2c_scl_s1_write_n;
  output           i2c_scl_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            i2c_scl_s1_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_requests_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_i2c_scl_s1;
  reg              d1_i2c_scl_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_i2c_scl_s1;
  wire    [  1: 0] i2c_scl_s1_address;
  wire             i2c_scl_s1_allgrants;
  wire             i2c_scl_s1_allow_new_arb_cycle;
  wire             i2c_scl_s1_any_bursting_master_saved_grant;
  wire             i2c_scl_s1_any_continuerequest;
  wire             i2c_scl_s1_arb_counter_enable;
  reg              i2c_scl_s1_arb_share_counter;
  wire             i2c_scl_s1_arb_share_counter_next_value;
  wire             i2c_scl_s1_arb_share_set_values;
  wire             i2c_scl_s1_beginbursttransfer_internal;
  wire             i2c_scl_s1_begins_xfer;
  wire             i2c_scl_s1_chipselect;
  wire             i2c_scl_s1_end_xfer;
  wire             i2c_scl_s1_firsttransfer;
  wire             i2c_scl_s1_grant_vector;
  wire             i2c_scl_s1_in_a_read_cycle;
  wire             i2c_scl_s1_in_a_write_cycle;
  wire             i2c_scl_s1_master_qreq_vector;
  wire             i2c_scl_s1_non_bursting_master_requests;
  wire             i2c_scl_s1_readdata_from_sa;
  reg              i2c_scl_s1_reg_firsttransfer;
  wire             i2c_scl_s1_reset_n;
  reg              i2c_scl_s1_slavearbiterlockenable;
  wire             i2c_scl_s1_slavearbiterlockenable2;
  wire             i2c_scl_s1_unreg_firsttransfer;
  wire             i2c_scl_s1_waits_for_read;
  wire             i2c_scl_s1_waits_for_write;
  wire             i2c_scl_s1_write_n;
  wire             i2c_scl_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_i2c_scl_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~i2c_scl_s1_end_xfer;
    end


  assign i2c_scl_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1));
  //assign i2c_scl_s1_readdata_from_sa = i2c_scl_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign i2c_scl_s1_readdata_from_sa = i2c_scl_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_i2c_scl_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'he0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //i2c_scl_s1_arb_share_counter set values, which is an e_mux
  assign i2c_scl_s1_arb_share_set_values = 1;

  //i2c_scl_s1_non_bursting_master_requests mux, which is an e_mux
  assign i2c_scl_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_i2c_scl_s1;

  //i2c_scl_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign i2c_scl_s1_any_bursting_master_saved_grant = 0;

  //i2c_scl_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign i2c_scl_s1_arb_share_counter_next_value = i2c_scl_s1_firsttransfer ? (i2c_scl_s1_arb_share_set_values - 1) : |i2c_scl_s1_arb_share_counter ? (i2c_scl_s1_arb_share_counter - 1) : 0;

  //i2c_scl_s1_allgrants all slave grants, which is an e_mux
  assign i2c_scl_s1_allgrants = |i2c_scl_s1_grant_vector;

  //i2c_scl_s1_end_xfer assignment, which is an e_assign
  assign i2c_scl_s1_end_xfer = ~(i2c_scl_s1_waits_for_read | i2c_scl_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_i2c_scl_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_i2c_scl_s1 = i2c_scl_s1_end_xfer & (~i2c_scl_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //i2c_scl_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign i2c_scl_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_i2c_scl_s1 & i2c_scl_s1_allgrants) | (end_xfer_arb_share_counter_term_i2c_scl_s1 & ~i2c_scl_s1_non_bursting_master_requests);

  //i2c_scl_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_scl_s1_arb_share_counter <= 0;
      else if (i2c_scl_s1_arb_counter_enable)
          i2c_scl_s1_arb_share_counter <= i2c_scl_s1_arb_share_counter_next_value;
    end


  //i2c_scl_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_scl_s1_slavearbiterlockenable <= 0;
      else if ((|i2c_scl_s1_master_qreq_vector & end_xfer_arb_share_counter_term_i2c_scl_s1) | (end_xfer_arb_share_counter_term_i2c_scl_s1 & ~i2c_scl_s1_non_bursting_master_requests))
          i2c_scl_s1_slavearbiterlockenable <= |i2c_scl_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 i2c_scl/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = i2c_scl_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //i2c_scl_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign i2c_scl_s1_slavearbiterlockenable2 = |i2c_scl_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 i2c_scl/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = i2c_scl_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //i2c_scl_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign i2c_scl_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1 = cpu_peripheral_bridge_m1_requests_i2c_scl_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1 = cpu_peripheral_bridge_m1_granted_i2c_scl_s1 & cpu_peripheral_bridge_m1_read & ~i2c_scl_s1_waits_for_read;

  //i2c_scl_s1_writedata mux, which is an e_mux
  assign i2c_scl_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_i2c_scl_s1 = cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1;

  //cpu_peripheral_bridge/m1 saved-grant i2c_scl/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_i2c_scl_s1 = cpu_peripheral_bridge_m1_requests_i2c_scl_s1;

  //allow new arb cycle for i2c_scl/s1, which is an e_assign
  assign i2c_scl_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign i2c_scl_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign i2c_scl_s1_master_qreq_vector = 1;

  //i2c_scl_s1_reset_n assignment, which is an e_assign
  assign i2c_scl_s1_reset_n = reset_n;

  assign i2c_scl_s1_chipselect = cpu_peripheral_bridge_m1_granted_i2c_scl_s1;
  //i2c_scl_s1_firsttransfer first transaction, which is an e_assign
  assign i2c_scl_s1_firsttransfer = i2c_scl_s1_begins_xfer ? i2c_scl_s1_unreg_firsttransfer : i2c_scl_s1_reg_firsttransfer;

  //i2c_scl_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign i2c_scl_s1_unreg_firsttransfer = ~(i2c_scl_s1_slavearbiterlockenable & i2c_scl_s1_any_continuerequest);

  //i2c_scl_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_scl_s1_reg_firsttransfer <= 1'b1;
      else if (i2c_scl_s1_begins_xfer)
          i2c_scl_s1_reg_firsttransfer <= i2c_scl_s1_unreg_firsttransfer;
    end


  //i2c_scl_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign i2c_scl_s1_beginbursttransfer_internal = i2c_scl_s1_begins_xfer;

  //~i2c_scl_s1_write_n assignment, which is an e_mux
  assign i2c_scl_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_i2c_scl_s1 & cpu_peripheral_bridge_m1_write);

  //i2c_scl_s1_address mux, which is an e_mux
  assign i2c_scl_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_i2c_scl_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_i2c_scl_s1_end_xfer <= 1;
      else 
        d1_i2c_scl_s1_end_xfer <= i2c_scl_s1_end_xfer;
    end


  //i2c_scl_s1_waits_for_read in a cycle, which is an e_mux
  assign i2c_scl_s1_waits_for_read = i2c_scl_s1_in_a_read_cycle & i2c_scl_s1_begins_xfer;

  //i2c_scl_s1_in_a_read_cycle assignment, which is an e_assign
  assign i2c_scl_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_i2c_scl_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = i2c_scl_s1_in_a_read_cycle;

  //i2c_scl_s1_waits_for_write in a cycle, which is an e_mux
  assign i2c_scl_s1_waits_for_write = i2c_scl_s1_in_a_write_cycle & 0;

  //i2c_scl_s1_in_a_write_cycle assignment, which is an e_assign
  assign i2c_scl_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_i2c_scl_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = i2c_scl_s1_in_a_write_cycle;

  assign wait_for_i2c_scl_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //i2c_scl/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module i2c_sda_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_peripheral_bridge_m1_address_to_slave,
                                cpu_peripheral_bridge_m1_latency_counter,
                                cpu_peripheral_bridge_m1_nativeaddress,
                                cpu_peripheral_bridge_m1_read,
                                cpu_peripheral_bridge_m1_write,
                                cpu_peripheral_bridge_m1_writedata,
                                i2c_sda_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_peripheral_bridge_m1_granted_i2c_sda_s1,
                                cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1,
                                cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1,
                                cpu_peripheral_bridge_m1_requests_i2c_sda_s1,
                                d1_i2c_sda_s1_end_xfer,
                                i2c_sda_s1_address,
                                i2c_sda_s1_chipselect,
                                i2c_sda_s1_readdata_from_sa,
                                i2c_sda_s1_reset_n,
                                i2c_sda_s1_write_n,
                                i2c_sda_s1_writedata
                             )
;

  output           cpu_peripheral_bridge_m1_granted_i2c_sda_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1;
  output           cpu_peripheral_bridge_m1_requests_i2c_sda_s1;
  output           d1_i2c_sda_s1_end_xfer;
  output  [  1: 0] i2c_sda_s1_address;
  output           i2c_sda_s1_chipselect;
  output           i2c_sda_s1_readdata_from_sa;
  output           i2c_sda_s1_reset_n;
  output           i2c_sda_s1_write_n;
  output           i2c_sda_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            i2c_sda_s1_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_requests_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_i2c_sda_s1;
  reg              d1_i2c_sda_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_i2c_sda_s1;
  wire    [  1: 0] i2c_sda_s1_address;
  wire             i2c_sda_s1_allgrants;
  wire             i2c_sda_s1_allow_new_arb_cycle;
  wire             i2c_sda_s1_any_bursting_master_saved_grant;
  wire             i2c_sda_s1_any_continuerequest;
  wire             i2c_sda_s1_arb_counter_enable;
  reg              i2c_sda_s1_arb_share_counter;
  wire             i2c_sda_s1_arb_share_counter_next_value;
  wire             i2c_sda_s1_arb_share_set_values;
  wire             i2c_sda_s1_beginbursttransfer_internal;
  wire             i2c_sda_s1_begins_xfer;
  wire             i2c_sda_s1_chipselect;
  wire             i2c_sda_s1_end_xfer;
  wire             i2c_sda_s1_firsttransfer;
  wire             i2c_sda_s1_grant_vector;
  wire             i2c_sda_s1_in_a_read_cycle;
  wire             i2c_sda_s1_in_a_write_cycle;
  wire             i2c_sda_s1_master_qreq_vector;
  wire             i2c_sda_s1_non_bursting_master_requests;
  wire             i2c_sda_s1_readdata_from_sa;
  reg              i2c_sda_s1_reg_firsttransfer;
  wire             i2c_sda_s1_reset_n;
  reg              i2c_sda_s1_slavearbiterlockenable;
  wire             i2c_sda_s1_slavearbiterlockenable2;
  wire             i2c_sda_s1_unreg_firsttransfer;
  wire             i2c_sda_s1_waits_for_read;
  wire             i2c_sda_s1_waits_for_write;
  wire             i2c_sda_s1_write_n;
  wire             i2c_sda_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_i2c_sda_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~i2c_sda_s1_end_xfer;
    end


  assign i2c_sda_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1));
  //assign i2c_sda_s1_readdata_from_sa = i2c_sda_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign i2c_sda_s1_readdata_from_sa = i2c_sda_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_i2c_sda_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'hf0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //i2c_sda_s1_arb_share_counter set values, which is an e_mux
  assign i2c_sda_s1_arb_share_set_values = 1;

  //i2c_sda_s1_non_bursting_master_requests mux, which is an e_mux
  assign i2c_sda_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_i2c_sda_s1;

  //i2c_sda_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign i2c_sda_s1_any_bursting_master_saved_grant = 0;

  //i2c_sda_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign i2c_sda_s1_arb_share_counter_next_value = i2c_sda_s1_firsttransfer ? (i2c_sda_s1_arb_share_set_values - 1) : |i2c_sda_s1_arb_share_counter ? (i2c_sda_s1_arb_share_counter - 1) : 0;

  //i2c_sda_s1_allgrants all slave grants, which is an e_mux
  assign i2c_sda_s1_allgrants = |i2c_sda_s1_grant_vector;

  //i2c_sda_s1_end_xfer assignment, which is an e_assign
  assign i2c_sda_s1_end_xfer = ~(i2c_sda_s1_waits_for_read | i2c_sda_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_i2c_sda_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_i2c_sda_s1 = i2c_sda_s1_end_xfer & (~i2c_sda_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //i2c_sda_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign i2c_sda_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_i2c_sda_s1 & i2c_sda_s1_allgrants) | (end_xfer_arb_share_counter_term_i2c_sda_s1 & ~i2c_sda_s1_non_bursting_master_requests);

  //i2c_sda_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_sda_s1_arb_share_counter <= 0;
      else if (i2c_sda_s1_arb_counter_enable)
          i2c_sda_s1_arb_share_counter <= i2c_sda_s1_arb_share_counter_next_value;
    end


  //i2c_sda_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_sda_s1_slavearbiterlockenable <= 0;
      else if ((|i2c_sda_s1_master_qreq_vector & end_xfer_arb_share_counter_term_i2c_sda_s1) | (end_xfer_arb_share_counter_term_i2c_sda_s1 & ~i2c_sda_s1_non_bursting_master_requests))
          i2c_sda_s1_slavearbiterlockenable <= |i2c_sda_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 i2c_sda/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = i2c_sda_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //i2c_sda_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign i2c_sda_s1_slavearbiterlockenable2 = |i2c_sda_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 i2c_sda/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = i2c_sda_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //i2c_sda_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign i2c_sda_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1 = cpu_peripheral_bridge_m1_requests_i2c_sda_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1 = cpu_peripheral_bridge_m1_granted_i2c_sda_s1 & cpu_peripheral_bridge_m1_read & ~i2c_sda_s1_waits_for_read;

  //i2c_sda_s1_writedata mux, which is an e_mux
  assign i2c_sda_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_i2c_sda_s1 = cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1;

  //cpu_peripheral_bridge/m1 saved-grant i2c_sda/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_i2c_sda_s1 = cpu_peripheral_bridge_m1_requests_i2c_sda_s1;

  //allow new arb cycle for i2c_sda/s1, which is an e_assign
  assign i2c_sda_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign i2c_sda_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign i2c_sda_s1_master_qreq_vector = 1;

  //i2c_sda_s1_reset_n assignment, which is an e_assign
  assign i2c_sda_s1_reset_n = reset_n;

  assign i2c_sda_s1_chipselect = cpu_peripheral_bridge_m1_granted_i2c_sda_s1;
  //i2c_sda_s1_firsttransfer first transaction, which is an e_assign
  assign i2c_sda_s1_firsttransfer = i2c_sda_s1_begins_xfer ? i2c_sda_s1_unreg_firsttransfer : i2c_sda_s1_reg_firsttransfer;

  //i2c_sda_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign i2c_sda_s1_unreg_firsttransfer = ~(i2c_sda_s1_slavearbiterlockenable & i2c_sda_s1_any_continuerequest);

  //i2c_sda_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i2c_sda_s1_reg_firsttransfer <= 1'b1;
      else if (i2c_sda_s1_begins_xfer)
          i2c_sda_s1_reg_firsttransfer <= i2c_sda_s1_unreg_firsttransfer;
    end


  //i2c_sda_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign i2c_sda_s1_beginbursttransfer_internal = i2c_sda_s1_begins_xfer;

  //~i2c_sda_s1_write_n assignment, which is an e_mux
  assign i2c_sda_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_i2c_sda_s1 & cpu_peripheral_bridge_m1_write);

  //i2c_sda_s1_address mux, which is an e_mux
  assign i2c_sda_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_i2c_sda_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_i2c_sda_s1_end_xfer <= 1;
      else 
        d1_i2c_sda_s1_end_xfer <= i2c_sda_s1_end_xfer;
    end


  //i2c_sda_s1_waits_for_read in a cycle, which is an e_mux
  assign i2c_sda_s1_waits_for_read = i2c_sda_s1_in_a_read_cycle & i2c_sda_s1_begins_xfer;

  //i2c_sda_s1_in_a_read_cycle assignment, which is an e_assign
  assign i2c_sda_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_i2c_sda_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = i2c_sda_s1_in_a_read_cycle;

  //i2c_sda_s1_waits_for_write in a cycle, which is an e_mux
  assign i2c_sda_s1_waits_for_write = i2c_sda_s1_in_a_write_cycle & 0;

  //i2c_sda_s1_in_a_write_cycle assignment, which is an e_assign
  assign i2c_sda_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_i2c_sda_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = i2c_sda_s1_in_a_write_cycle;

  assign wait_for_i2c_sda_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //i2c_sda/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_latency_counter,
                                                 cpu_data_master_read,
                                                 cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                                 cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 27: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h9001050) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module key_s1_arbitrator (
                           // inputs:
                            clk,
                            cpu_peripheral_bridge_m1_address_to_slave,
                            cpu_peripheral_bridge_m1_latency_counter,
                            cpu_peripheral_bridge_m1_nativeaddress,
                            cpu_peripheral_bridge_m1_read,
                            cpu_peripheral_bridge_m1_write,
                            cpu_peripheral_bridge_m1_writedata,
                            key_s1_irq,
                            key_s1_readdata,
                            reset_n,

                           // outputs:
                            cpu_peripheral_bridge_m1_granted_key_s1,
                            cpu_peripheral_bridge_m1_qualified_request_key_s1,
                            cpu_peripheral_bridge_m1_read_data_valid_key_s1,
                            cpu_peripheral_bridge_m1_requests_key_s1,
                            d1_key_s1_end_xfer,
                            key_s1_address,
                            key_s1_chipselect,
                            key_s1_irq_from_sa,
                            key_s1_readdata_from_sa,
                            key_s1_reset_n,
                            key_s1_write_n,
                            key_s1_writedata
                         )
;

  output           cpu_peripheral_bridge_m1_granted_key_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_key_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_key_s1;
  output           cpu_peripheral_bridge_m1_requests_key_s1;
  output           d1_key_s1_end_xfer;
  output  [  1: 0] key_s1_address;
  output           key_s1_chipselect;
  output           key_s1_irq_from_sa;
  output  [  3: 0] key_s1_readdata_from_sa;
  output           key_s1_reset_n;
  output           key_s1_write_n;
  output  [  3: 0] key_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            key_s1_irq;
  input   [  3: 0] key_s1_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_key_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_key_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_key_s1;
  wire             cpu_peripheral_bridge_m1_requests_key_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_key_s1;
  reg              d1_key_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_key_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] key_s1_address;
  wire             key_s1_allgrants;
  wire             key_s1_allow_new_arb_cycle;
  wire             key_s1_any_bursting_master_saved_grant;
  wire             key_s1_any_continuerequest;
  wire             key_s1_arb_counter_enable;
  reg              key_s1_arb_share_counter;
  wire             key_s1_arb_share_counter_next_value;
  wire             key_s1_arb_share_set_values;
  wire             key_s1_beginbursttransfer_internal;
  wire             key_s1_begins_xfer;
  wire             key_s1_chipselect;
  wire             key_s1_end_xfer;
  wire             key_s1_firsttransfer;
  wire             key_s1_grant_vector;
  wire             key_s1_in_a_read_cycle;
  wire             key_s1_in_a_write_cycle;
  wire             key_s1_irq_from_sa;
  wire             key_s1_master_qreq_vector;
  wire             key_s1_non_bursting_master_requests;
  wire    [  3: 0] key_s1_readdata_from_sa;
  reg              key_s1_reg_firsttransfer;
  wire             key_s1_reset_n;
  reg              key_s1_slavearbiterlockenable;
  wire             key_s1_slavearbiterlockenable2;
  wire             key_s1_unreg_firsttransfer;
  wire             key_s1_waits_for_read;
  wire             key_s1_waits_for_write;
  wire             key_s1_write_n;
  wire    [  3: 0] key_s1_writedata;
  wire             wait_for_key_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~key_s1_end_xfer;
    end


  assign key_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_key_s1));
  //assign key_s1_readdata_from_sa = key_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign key_s1_readdata_from_sa = key_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_key_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h40) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //key_s1_arb_share_counter set values, which is an e_mux
  assign key_s1_arb_share_set_values = 1;

  //key_s1_non_bursting_master_requests mux, which is an e_mux
  assign key_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_key_s1;

  //key_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign key_s1_any_bursting_master_saved_grant = 0;

  //key_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign key_s1_arb_share_counter_next_value = key_s1_firsttransfer ? (key_s1_arb_share_set_values - 1) : |key_s1_arb_share_counter ? (key_s1_arb_share_counter - 1) : 0;

  //key_s1_allgrants all slave grants, which is an e_mux
  assign key_s1_allgrants = |key_s1_grant_vector;

  //key_s1_end_xfer assignment, which is an e_assign
  assign key_s1_end_xfer = ~(key_s1_waits_for_read | key_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_key_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_key_s1 = key_s1_end_xfer & (~key_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //key_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign key_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_key_s1 & key_s1_allgrants) | (end_xfer_arb_share_counter_term_key_s1 & ~key_s1_non_bursting_master_requests);

  //key_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          key_s1_arb_share_counter <= 0;
      else if (key_s1_arb_counter_enable)
          key_s1_arb_share_counter <= key_s1_arb_share_counter_next_value;
    end


  //key_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          key_s1_slavearbiterlockenable <= 0;
      else if ((|key_s1_master_qreq_vector & end_xfer_arb_share_counter_term_key_s1) | (end_xfer_arb_share_counter_term_key_s1 & ~key_s1_non_bursting_master_requests))
          key_s1_slavearbiterlockenable <= |key_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 key/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = key_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //key_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign key_s1_slavearbiterlockenable2 = |key_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 key/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = key_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //key_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign key_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_key_s1 = cpu_peripheral_bridge_m1_requests_key_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_key_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_key_s1 = cpu_peripheral_bridge_m1_granted_key_s1 & cpu_peripheral_bridge_m1_read & ~key_s1_waits_for_read;

  //key_s1_writedata mux, which is an e_mux
  assign key_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_key_s1 = cpu_peripheral_bridge_m1_qualified_request_key_s1;

  //cpu_peripheral_bridge/m1 saved-grant key/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_key_s1 = cpu_peripheral_bridge_m1_requests_key_s1;

  //allow new arb cycle for key/s1, which is an e_assign
  assign key_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign key_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign key_s1_master_qreq_vector = 1;

  //key_s1_reset_n assignment, which is an e_assign
  assign key_s1_reset_n = reset_n;

  assign key_s1_chipselect = cpu_peripheral_bridge_m1_granted_key_s1;
  //key_s1_firsttransfer first transaction, which is an e_assign
  assign key_s1_firsttransfer = key_s1_begins_xfer ? key_s1_unreg_firsttransfer : key_s1_reg_firsttransfer;

  //key_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign key_s1_unreg_firsttransfer = ~(key_s1_slavearbiterlockenable & key_s1_any_continuerequest);

  //key_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          key_s1_reg_firsttransfer <= 1'b1;
      else if (key_s1_begins_xfer)
          key_s1_reg_firsttransfer <= key_s1_unreg_firsttransfer;
    end


  //key_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign key_s1_beginbursttransfer_internal = key_s1_begins_xfer;

  //~key_s1_write_n assignment, which is an e_mux
  assign key_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_key_s1 & cpu_peripheral_bridge_m1_write);

  //key_s1_address mux, which is an e_mux
  assign key_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_key_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_key_s1_end_xfer <= 1;
      else 
        d1_key_s1_end_xfer <= key_s1_end_xfer;
    end


  //key_s1_waits_for_read in a cycle, which is an e_mux
  assign key_s1_waits_for_read = key_s1_in_a_read_cycle & key_s1_begins_xfer;

  //key_s1_in_a_read_cycle assignment, which is an e_assign
  assign key_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_key_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = key_s1_in_a_read_cycle;

  //key_s1_waits_for_write in a cycle, which is an e_mux
  assign key_s1_waits_for_write = key_s1_in_a_write_cycle & 0;

  //key_s1_in_a_write_cycle assignment, which is an e_assign
  assign key_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_key_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = key_s1_in_a_write_cycle;

  assign wait_for_key_s1_counter = 0;
  //assign key_s1_irq_from_sa = key_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign key_s1_irq_from_sa = key_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //key/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_control_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_peripheral_bridge_m1_address_to_slave,
                                       cpu_peripheral_bridge_m1_byteenable,
                                       cpu_peripheral_bridge_m1_latency_counter,
                                       cpu_peripheral_bridge_m1_nativeaddress,
                                       cpu_peripheral_bridge_m1_read,
                                       cpu_peripheral_bridge_m1_write,
                                       cpu_peripheral_bridge_m1_writedata,
                                       lcd_control_slave_readdata,
                                       reset_n,

                                      // outputs:
                                       cpu_peripheral_bridge_m1_granted_lcd_control_slave,
                                       cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave,
                                       cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave,
                                       cpu_peripheral_bridge_m1_requests_lcd_control_slave,
                                       d1_lcd_control_slave_end_xfer,
                                       lcd_control_slave_address,
                                       lcd_control_slave_begintransfer,
                                       lcd_control_slave_read,
                                       lcd_control_slave_readdata_from_sa,
                                       lcd_control_slave_wait_counter_eq_0,
                                       lcd_control_slave_write,
                                       lcd_control_slave_writedata
                                    )
;

  output           cpu_peripheral_bridge_m1_granted_lcd_control_slave;
  output           cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave;
  output           cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave;
  output           cpu_peripheral_bridge_m1_requests_lcd_control_slave;
  output           d1_lcd_control_slave_end_xfer;
  output  [  1: 0] lcd_control_slave_address;
  output           lcd_control_slave_begintransfer;
  output           lcd_control_slave_read;
  output  [  7: 0] lcd_control_slave_readdata_from_sa;
  output           lcd_control_slave_wait_counter_eq_0;
  output           lcd_control_slave_write;
  output  [  7: 0] lcd_control_slave_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input   [  3: 0] cpu_peripheral_bridge_m1_byteenable;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input   [  7: 0] lcd_control_slave_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_requests_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_saved_grant_lcd_control_slave;
  reg              d1_lcd_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_allgrants;
  wire             lcd_control_slave_allow_new_arb_cycle;
  wire             lcd_control_slave_any_bursting_master_saved_grant;
  wire             lcd_control_slave_any_continuerequest;
  wire             lcd_control_slave_arb_counter_enable;
  reg              lcd_control_slave_arb_share_counter;
  wire             lcd_control_slave_arb_share_counter_next_value;
  wire             lcd_control_slave_arb_share_set_values;
  wire             lcd_control_slave_beginbursttransfer_internal;
  wire             lcd_control_slave_begins_xfer;
  wire             lcd_control_slave_begintransfer;
  wire    [  2: 0] lcd_control_slave_counter_load_value;
  wire             lcd_control_slave_end_xfer;
  wire             lcd_control_slave_firsttransfer;
  wire             lcd_control_slave_grant_vector;
  wire             lcd_control_slave_in_a_read_cycle;
  wire             lcd_control_slave_in_a_write_cycle;
  wire             lcd_control_slave_master_qreq_vector;
  wire             lcd_control_slave_non_bursting_master_requests;
  wire             lcd_control_slave_pretend_byte_enable;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  reg              lcd_control_slave_reg_firsttransfer;
  reg              lcd_control_slave_slavearbiterlockenable;
  wire             lcd_control_slave_slavearbiterlockenable2;
  wire             lcd_control_slave_unreg_firsttransfer;
  reg     [  2: 0] lcd_control_slave_wait_counter;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_waits_for_read;
  wire             lcd_control_slave_waits_for_write;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire             wait_for_lcd_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_control_slave_end_xfer;
    end


  assign lcd_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave));
  //assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata;

  assign cpu_peripheral_bridge_m1_requests_lcd_control_slave = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h50) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //lcd_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_control_slave_arb_share_set_values = 1;

  //lcd_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_control_slave_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_lcd_control_slave;

  //lcd_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_control_slave_arb_share_counter_next_value = lcd_control_slave_firsttransfer ? (lcd_control_slave_arb_share_set_values - 1) : |lcd_control_slave_arb_share_counter ? (lcd_control_slave_arb_share_counter - 1) : 0;

  //lcd_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_control_slave_allgrants = |lcd_control_slave_grant_vector;

  //lcd_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_control_slave_end_xfer = ~(lcd_control_slave_waits_for_read | lcd_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_control_slave = lcd_control_slave_end_xfer & (~lcd_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_control_slave & lcd_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests);

  //lcd_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_arb_share_counter <= 0;
      else if (lcd_control_slave_arb_counter_enable)
          lcd_control_slave_arb_share_counter <= lcd_control_slave_arb_share_counter_next_value;
    end


  //lcd_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_control_slave) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests))
          lcd_control_slave_slavearbiterlockenable <= |lcd_control_slave_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 lcd/control_slave arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = lcd_control_slave_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //lcd_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_control_slave_slavearbiterlockenable2 = |lcd_control_slave_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 lcd/control_slave arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = lcd_control_slave_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //lcd_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_control_slave_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave = cpu_peripheral_bridge_m1_requests_lcd_control_slave & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave = cpu_peripheral_bridge_m1_granted_lcd_control_slave & cpu_peripheral_bridge_m1_read & ~lcd_control_slave_waits_for_read;

  //lcd_control_slave_writedata mux, which is an e_mux
  assign lcd_control_slave_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_lcd_control_slave = cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave;

  //cpu_peripheral_bridge/m1 saved-grant lcd/control_slave, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_lcd_control_slave = cpu_peripheral_bridge_m1_requests_lcd_control_slave;

  //allow new arb cycle for lcd/control_slave, which is an e_assign
  assign lcd_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_control_slave_master_qreq_vector = 1;

  assign lcd_control_slave_begintransfer = lcd_control_slave_begins_xfer;
  //lcd_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_firsttransfer = lcd_control_slave_begins_xfer ? lcd_control_slave_unreg_firsttransfer : lcd_control_slave_reg_firsttransfer;

  //lcd_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_unreg_firsttransfer = ~(lcd_control_slave_slavearbiterlockenable & lcd_control_slave_any_continuerequest);

  //lcd_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_control_slave_begins_xfer)
          lcd_control_slave_reg_firsttransfer <= lcd_control_slave_unreg_firsttransfer;
    end


  //lcd_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_control_slave_beginbursttransfer_internal = lcd_control_slave_begins_xfer;

  //lcd_control_slave_read assignment, which is an e_mux
  assign lcd_control_slave_read = ((cpu_peripheral_bridge_m1_granted_lcd_control_slave & cpu_peripheral_bridge_m1_read))& ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter < 3);

  //lcd_control_slave_write assignment, which is an e_mux
  assign lcd_control_slave_write = ((cpu_peripheral_bridge_m1_granted_lcd_control_slave & cpu_peripheral_bridge_m1_write)) & ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter >= 3) & (lcd_control_slave_wait_counter < 6) & lcd_control_slave_pretend_byte_enable;

  //lcd_control_slave_address mux, which is an e_mux
  assign lcd_control_slave_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_lcd_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_control_slave_end_xfer <= 1;
      else 
        d1_lcd_control_slave_end_xfer <= lcd_control_slave_end_xfer;
    end


  //lcd_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_read = lcd_control_slave_in_a_read_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_lcd_control_slave & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_control_slave_in_a_read_cycle;

  //lcd_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_write = lcd_control_slave_in_a_write_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_lcd_control_slave & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_control_slave_in_a_write_cycle;

  assign lcd_control_slave_wait_counter_eq_0 = lcd_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_wait_counter <= 0;
      else 
        lcd_control_slave_wait_counter <= lcd_control_slave_counter_load_value;
    end


  assign lcd_control_slave_counter_load_value = ((lcd_control_slave_in_a_read_cycle & lcd_control_slave_begins_xfer))? 4 :
    ((lcd_control_slave_in_a_write_cycle & lcd_control_slave_begins_xfer))? 7 :
    (~lcd_control_slave_wait_counter_eq_0)? lcd_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_control_slave_counter = lcd_control_slave_begins_xfer | ~lcd_control_slave_wait_counter_eq_0;
  //lcd_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_control_slave_pretend_byte_enable = (cpu_peripheral_bridge_m1_granted_lcd_control_slave)? cpu_peripheral_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_clock_0_in_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           nios_audio_clock_0_in_endofpacket,
                                           nios_audio_clock_0_in_readdata,
                                           nios_audio_clock_0_in_waitrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_nios_audio_clock_0_in,
                                           cpu_data_master_qualified_request_nios_audio_clock_0_in,
                                           cpu_data_master_read_data_valid_nios_audio_clock_0_in,
                                           cpu_data_master_requests_nios_audio_clock_0_in,
                                           d1_nios_audio_clock_0_in_end_xfer,
                                           nios_audio_clock_0_in_address,
                                           nios_audio_clock_0_in_byteenable,
                                           nios_audio_clock_0_in_endofpacket_from_sa,
                                           nios_audio_clock_0_in_nativeaddress,
                                           nios_audio_clock_0_in_read,
                                           nios_audio_clock_0_in_readdata_from_sa,
                                           nios_audio_clock_0_in_reset_n,
                                           nios_audio_clock_0_in_waitrequest_from_sa,
                                           nios_audio_clock_0_in_write,
                                           nios_audio_clock_0_in_writedata
                                        )
;

  output           cpu_data_master_granted_nios_audio_clock_0_in;
  output           cpu_data_master_qualified_request_nios_audio_clock_0_in;
  output           cpu_data_master_read_data_valid_nios_audio_clock_0_in;
  output           cpu_data_master_requests_nios_audio_clock_0_in;
  output           d1_nios_audio_clock_0_in_end_xfer;
  output  [  3: 0] nios_audio_clock_0_in_address;
  output  [  3: 0] nios_audio_clock_0_in_byteenable;
  output           nios_audio_clock_0_in_endofpacket_from_sa;
  output  [  1: 0] nios_audio_clock_0_in_nativeaddress;
  output           nios_audio_clock_0_in_read;
  output  [ 31: 0] nios_audio_clock_0_in_readdata_from_sa;
  output           nios_audio_clock_0_in_reset_n;
  output           nios_audio_clock_0_in_waitrequest_from_sa;
  output           nios_audio_clock_0_in_write;
  output  [ 31: 0] nios_audio_clock_0_in_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            nios_audio_clock_0_in_endofpacket;
  input   [ 31: 0] nios_audio_clock_0_in_readdata;
  input            nios_audio_clock_0_in_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_nios_audio_clock_0_in;
  wire             cpu_data_master_qualified_request_nios_audio_clock_0_in;
  wire             cpu_data_master_read_data_valid_nios_audio_clock_0_in;
  wire             cpu_data_master_requests_nios_audio_clock_0_in;
  wire             cpu_data_master_saved_grant_nios_audio_clock_0_in;
  reg              d1_nios_audio_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_audio_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] nios_audio_clock_0_in_address;
  wire             nios_audio_clock_0_in_allgrants;
  wire             nios_audio_clock_0_in_allow_new_arb_cycle;
  wire             nios_audio_clock_0_in_any_bursting_master_saved_grant;
  wire             nios_audio_clock_0_in_any_continuerequest;
  wire             nios_audio_clock_0_in_arb_counter_enable;
  reg     [  2: 0] nios_audio_clock_0_in_arb_share_counter;
  wire    [  2: 0] nios_audio_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] nios_audio_clock_0_in_arb_share_set_values;
  wire             nios_audio_clock_0_in_beginbursttransfer_internal;
  wire             nios_audio_clock_0_in_begins_xfer;
  wire    [  3: 0] nios_audio_clock_0_in_byteenable;
  wire             nios_audio_clock_0_in_end_xfer;
  wire             nios_audio_clock_0_in_endofpacket_from_sa;
  wire             nios_audio_clock_0_in_firsttransfer;
  wire             nios_audio_clock_0_in_grant_vector;
  wire             nios_audio_clock_0_in_in_a_read_cycle;
  wire             nios_audio_clock_0_in_in_a_write_cycle;
  wire             nios_audio_clock_0_in_master_qreq_vector;
  wire    [  1: 0] nios_audio_clock_0_in_nativeaddress;
  wire             nios_audio_clock_0_in_non_bursting_master_requests;
  wire             nios_audio_clock_0_in_read;
  wire    [ 31: 0] nios_audio_clock_0_in_readdata_from_sa;
  reg              nios_audio_clock_0_in_reg_firsttransfer;
  wire             nios_audio_clock_0_in_reset_n;
  reg              nios_audio_clock_0_in_slavearbiterlockenable;
  wire             nios_audio_clock_0_in_slavearbiterlockenable2;
  wire             nios_audio_clock_0_in_unreg_firsttransfer;
  wire             nios_audio_clock_0_in_waitrequest_from_sa;
  wire             nios_audio_clock_0_in_waits_for_read;
  wire             nios_audio_clock_0_in_waits_for_write;
  wire             nios_audio_clock_0_in_write;
  wire    [ 31: 0] nios_audio_clock_0_in_writedata;
  wire             wait_for_nios_audio_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~nios_audio_clock_0_in_end_xfer;
    end


  assign nios_audio_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_nios_audio_clock_0_in));
  //assign nios_audio_clock_0_in_readdata_from_sa = nios_audio_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_0_in_readdata_from_sa = nios_audio_clock_0_in_readdata;

  assign cpu_data_master_requests_nios_audio_clock_0_in = ({cpu_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h9001020) & (cpu_data_master_read | cpu_data_master_write);
  //assign nios_audio_clock_0_in_waitrequest_from_sa = nios_audio_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_0_in_waitrequest_from_sa = nios_audio_clock_0_in_waitrequest;

  //nios_audio_clock_0_in_arb_share_counter set values, which is an e_mux
  assign nios_audio_clock_0_in_arb_share_set_values = 1;

  //nios_audio_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign nios_audio_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_nios_audio_clock_0_in;

  //nios_audio_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_audio_clock_0_in_any_bursting_master_saved_grant = 0;

  //nios_audio_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_audio_clock_0_in_arb_share_counter_next_value = nios_audio_clock_0_in_firsttransfer ? (nios_audio_clock_0_in_arb_share_set_values - 1) : |nios_audio_clock_0_in_arb_share_counter ? (nios_audio_clock_0_in_arb_share_counter - 1) : 0;

  //nios_audio_clock_0_in_allgrants all slave grants, which is an e_mux
  assign nios_audio_clock_0_in_allgrants = |nios_audio_clock_0_in_grant_vector;

  //nios_audio_clock_0_in_end_xfer assignment, which is an e_assign
  assign nios_audio_clock_0_in_end_xfer = ~(nios_audio_clock_0_in_waits_for_read | nios_audio_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_audio_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_audio_clock_0_in = nios_audio_clock_0_in_end_xfer & (~nios_audio_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_audio_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_audio_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_audio_clock_0_in & nios_audio_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_nios_audio_clock_0_in & ~nios_audio_clock_0_in_non_bursting_master_requests);

  //nios_audio_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_in_arb_share_counter <= 0;
      else if (nios_audio_clock_0_in_arb_counter_enable)
          nios_audio_clock_0_in_arb_share_counter <= nios_audio_clock_0_in_arb_share_counter_next_value;
    end


  //nios_audio_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|nios_audio_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_nios_audio_clock_0_in) | (end_xfer_arb_share_counter_term_nios_audio_clock_0_in & ~nios_audio_clock_0_in_non_bursting_master_requests))
          nios_audio_clock_0_in_slavearbiterlockenable <= |nios_audio_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master nios_audio_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = nios_audio_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //nios_audio_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_audio_clock_0_in_slavearbiterlockenable2 = |nios_audio_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master nios_audio_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = nios_audio_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //nios_audio_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign nios_audio_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_nios_audio_clock_0_in = cpu_data_master_requests_nios_audio_clock_0_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_nios_audio_clock_0_in, which is an e_mux
  assign cpu_data_master_read_data_valid_nios_audio_clock_0_in = cpu_data_master_granted_nios_audio_clock_0_in & cpu_data_master_read & ~nios_audio_clock_0_in_waits_for_read;

  //nios_audio_clock_0_in_writedata mux, which is an e_mux
  assign nios_audio_clock_0_in_writedata = cpu_data_master_writedata;

  //assign nios_audio_clock_0_in_endofpacket_from_sa = nios_audio_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_0_in_endofpacket_from_sa = nios_audio_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_nios_audio_clock_0_in = cpu_data_master_qualified_request_nios_audio_clock_0_in;

  //cpu/data_master saved-grant nios_audio_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_nios_audio_clock_0_in = cpu_data_master_requests_nios_audio_clock_0_in;

  //allow new arb cycle for nios_audio_clock_0/in, which is an e_assign
  assign nios_audio_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign nios_audio_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign nios_audio_clock_0_in_master_qreq_vector = 1;

  //nios_audio_clock_0_in_reset_n assignment, which is an e_assign
  assign nios_audio_clock_0_in_reset_n = reset_n;

  //nios_audio_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign nios_audio_clock_0_in_firsttransfer = nios_audio_clock_0_in_begins_xfer ? nios_audio_clock_0_in_unreg_firsttransfer : nios_audio_clock_0_in_reg_firsttransfer;

  //nios_audio_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_audio_clock_0_in_unreg_firsttransfer = ~(nios_audio_clock_0_in_slavearbiterlockenable & nios_audio_clock_0_in_any_continuerequest);

  //nios_audio_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (nios_audio_clock_0_in_begins_xfer)
          nios_audio_clock_0_in_reg_firsttransfer <= nios_audio_clock_0_in_unreg_firsttransfer;
    end


  //nios_audio_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_audio_clock_0_in_beginbursttransfer_internal = nios_audio_clock_0_in_begins_xfer;

  //nios_audio_clock_0_in_read assignment, which is an e_mux
  assign nios_audio_clock_0_in_read = cpu_data_master_granted_nios_audio_clock_0_in & cpu_data_master_read;

  //nios_audio_clock_0_in_write assignment, which is an e_mux
  assign nios_audio_clock_0_in_write = cpu_data_master_granted_nios_audio_clock_0_in & cpu_data_master_write;

  //nios_audio_clock_0_in_address mux, which is an e_mux
  assign nios_audio_clock_0_in_address = cpu_data_master_address_to_slave;

  //slaveid nios_audio_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign nios_audio_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_nios_audio_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_audio_clock_0_in_end_xfer <= 1;
      else 
        d1_nios_audio_clock_0_in_end_xfer <= nios_audio_clock_0_in_end_xfer;
    end


  //nios_audio_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign nios_audio_clock_0_in_waits_for_read = nios_audio_clock_0_in_in_a_read_cycle & nios_audio_clock_0_in_waitrequest_from_sa;

  //nios_audio_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign nios_audio_clock_0_in_in_a_read_cycle = cpu_data_master_granted_nios_audio_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_audio_clock_0_in_in_a_read_cycle;

  //nios_audio_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign nios_audio_clock_0_in_waits_for_write = nios_audio_clock_0_in_in_a_write_cycle & nios_audio_clock_0_in_waitrequest_from_sa;

  //nios_audio_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign nios_audio_clock_0_in_in_a_write_cycle = cpu_data_master_granted_nios_audio_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_audio_clock_0_in_in_a_write_cycle;

  assign wait_for_nios_audio_clock_0_in_counter = 0;
  //nios_audio_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign nios_audio_clock_0_in_byteenable = (cpu_data_master_granted_nios_audio_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_audio_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_clock_0_out_arbitrator (
                                           // inputs:
                                            altpll_audio_pll_slave_readdata_from_sa,
                                            clk,
                                            d1_altpll_audio_pll_slave_end_xfer,
                                            nios_audio_clock_0_out_address,
                                            nios_audio_clock_0_out_byteenable,
                                            nios_audio_clock_0_out_granted_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_read,
                                            nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_requests_altpll_audio_pll_slave,
                                            nios_audio_clock_0_out_write,
                                            nios_audio_clock_0_out_writedata,
                                            reset_n,

                                           // outputs:
                                            nios_audio_clock_0_out_address_to_slave,
                                            nios_audio_clock_0_out_readdata,
                                            nios_audio_clock_0_out_reset_n,
                                            nios_audio_clock_0_out_waitrequest
                                         )
;

  output  [  3: 0] nios_audio_clock_0_out_address_to_slave;
  output  [ 31: 0] nios_audio_clock_0_out_readdata;
  output           nios_audio_clock_0_out_reset_n;
  output           nios_audio_clock_0_out_waitrequest;
  input   [ 31: 0] altpll_audio_pll_slave_readdata_from_sa;
  input            clk;
  input            d1_altpll_audio_pll_slave_end_xfer;
  input   [  3: 0] nios_audio_clock_0_out_address;
  input   [  3: 0] nios_audio_clock_0_out_byteenable;
  input            nios_audio_clock_0_out_granted_altpll_audio_pll_slave;
  input            nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave;
  input            nios_audio_clock_0_out_read;
  input            nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave;
  input            nios_audio_clock_0_out_requests_altpll_audio_pll_slave;
  input            nios_audio_clock_0_out_write;
  input   [ 31: 0] nios_audio_clock_0_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  3: 0] nios_audio_clock_0_out_address_last_time;
  wire    [  3: 0] nios_audio_clock_0_out_address_to_slave;
  reg     [  3: 0] nios_audio_clock_0_out_byteenable_last_time;
  reg              nios_audio_clock_0_out_read_last_time;
  wire    [ 31: 0] nios_audio_clock_0_out_readdata;
  wire             nios_audio_clock_0_out_reset_n;
  wire             nios_audio_clock_0_out_run;
  wire             nios_audio_clock_0_out_waitrequest;
  reg              nios_audio_clock_0_out_write_last_time;
  reg     [ 31: 0] nios_audio_clock_0_out_writedata_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave | ~(nios_audio_clock_0_out_read | nios_audio_clock_0_out_write) | (1 & (nios_audio_clock_0_out_read | nios_audio_clock_0_out_write)))) & ((~nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave | ~(nios_audio_clock_0_out_read | nios_audio_clock_0_out_write) | (1 & (nios_audio_clock_0_out_read | nios_audio_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign nios_audio_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign nios_audio_clock_0_out_address_to_slave = nios_audio_clock_0_out_address;

  //nios_audio_clock_0/out readdata mux, which is an e_mux
  assign nios_audio_clock_0_out_readdata = altpll_audio_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign nios_audio_clock_0_out_waitrequest = ~nios_audio_clock_0_out_run;

  //nios_audio_clock_0_out_reset_n assignment, which is an e_assign
  assign nios_audio_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_audio_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_out_address_last_time <= 0;
      else 
        nios_audio_clock_0_out_address_last_time <= nios_audio_clock_0_out_address;
    end


  //nios_audio_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= nios_audio_clock_0_out_waitrequest & (nios_audio_clock_0_out_read | nios_audio_clock_0_out_write);
    end


  //nios_audio_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_0_out_address != nios_audio_clock_0_out_address_last_time))
        begin
          $write("%0d ns: nios_audio_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_out_byteenable_last_time <= 0;
      else 
        nios_audio_clock_0_out_byteenable_last_time <= nios_audio_clock_0_out_byteenable;
    end


  //nios_audio_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_0_out_byteenable != nios_audio_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: nios_audio_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_out_read_last_time <= 0;
      else 
        nios_audio_clock_0_out_read_last_time <= nios_audio_clock_0_out_read;
    end


  //nios_audio_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_0_out_read != nios_audio_clock_0_out_read_last_time))
        begin
          $write("%0d ns: nios_audio_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_out_write_last_time <= 0;
      else 
        nios_audio_clock_0_out_write_last_time <= nios_audio_clock_0_out_write;
    end


  //nios_audio_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_0_out_write != nios_audio_clock_0_out_write_last_time))
        begin
          $write("%0d ns: nios_audio_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_0_out_writedata_last_time <= 0;
      else 
        nios_audio_clock_0_out_writedata_last_time <= nios_audio_clock_0_out_writedata;
    end


  //nios_audio_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_0_out_writedata != nios_audio_clock_0_out_writedata_last_time) & nios_audio_clock_0_out_write)
        begin
          $write("%0d ns: nios_audio_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_clock_1_in_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           nios_audio_clock_1_in_endofpacket,
                                           nios_audio_clock_1_in_readdata,
                                           nios_audio_clock_1_in_waitrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_nios_audio_clock_1_in,
                                           cpu_data_master_qualified_request_nios_audio_clock_1_in,
                                           cpu_data_master_read_data_valid_nios_audio_clock_1_in,
                                           cpu_data_master_requests_nios_audio_clock_1_in,
                                           d1_nios_audio_clock_1_in_end_xfer,
                                           nios_audio_clock_1_in_address,
                                           nios_audio_clock_1_in_byteenable,
                                           nios_audio_clock_1_in_endofpacket_from_sa,
                                           nios_audio_clock_1_in_nativeaddress,
                                           nios_audio_clock_1_in_read,
                                           nios_audio_clock_1_in_readdata_from_sa,
                                           nios_audio_clock_1_in_reset_n,
                                           nios_audio_clock_1_in_waitrequest_from_sa,
                                           nios_audio_clock_1_in_write,
                                           nios_audio_clock_1_in_writedata
                                        )
;

  output           cpu_data_master_granted_nios_audio_clock_1_in;
  output           cpu_data_master_qualified_request_nios_audio_clock_1_in;
  output           cpu_data_master_read_data_valid_nios_audio_clock_1_in;
  output           cpu_data_master_requests_nios_audio_clock_1_in;
  output           d1_nios_audio_clock_1_in_end_xfer;
  output  [  3: 0] nios_audio_clock_1_in_address;
  output  [  3: 0] nios_audio_clock_1_in_byteenable;
  output           nios_audio_clock_1_in_endofpacket_from_sa;
  output  [  1: 0] nios_audio_clock_1_in_nativeaddress;
  output           nios_audio_clock_1_in_read;
  output  [ 31: 0] nios_audio_clock_1_in_readdata_from_sa;
  output           nios_audio_clock_1_in_reset_n;
  output           nios_audio_clock_1_in_waitrequest_from_sa;
  output           nios_audio_clock_1_in_write;
  output  [ 31: 0] nios_audio_clock_1_in_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            nios_audio_clock_1_in_endofpacket;
  input   [ 31: 0] nios_audio_clock_1_in_readdata;
  input            nios_audio_clock_1_in_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_nios_audio_clock_1_in;
  wire             cpu_data_master_qualified_request_nios_audio_clock_1_in;
  wire             cpu_data_master_read_data_valid_nios_audio_clock_1_in;
  wire             cpu_data_master_requests_nios_audio_clock_1_in;
  wire             cpu_data_master_saved_grant_nios_audio_clock_1_in;
  reg              d1_nios_audio_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_audio_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] nios_audio_clock_1_in_address;
  wire             nios_audio_clock_1_in_allgrants;
  wire             nios_audio_clock_1_in_allow_new_arb_cycle;
  wire             nios_audio_clock_1_in_any_bursting_master_saved_grant;
  wire             nios_audio_clock_1_in_any_continuerequest;
  wire             nios_audio_clock_1_in_arb_counter_enable;
  reg     [  2: 0] nios_audio_clock_1_in_arb_share_counter;
  wire    [  2: 0] nios_audio_clock_1_in_arb_share_counter_next_value;
  wire    [  2: 0] nios_audio_clock_1_in_arb_share_set_values;
  wire             nios_audio_clock_1_in_beginbursttransfer_internal;
  wire             nios_audio_clock_1_in_begins_xfer;
  wire    [  3: 0] nios_audio_clock_1_in_byteenable;
  wire             nios_audio_clock_1_in_end_xfer;
  wire             nios_audio_clock_1_in_endofpacket_from_sa;
  wire             nios_audio_clock_1_in_firsttransfer;
  wire             nios_audio_clock_1_in_grant_vector;
  wire             nios_audio_clock_1_in_in_a_read_cycle;
  wire             nios_audio_clock_1_in_in_a_write_cycle;
  wire             nios_audio_clock_1_in_master_qreq_vector;
  wire    [  1: 0] nios_audio_clock_1_in_nativeaddress;
  wire             nios_audio_clock_1_in_non_bursting_master_requests;
  wire             nios_audio_clock_1_in_read;
  wire    [ 31: 0] nios_audio_clock_1_in_readdata_from_sa;
  reg              nios_audio_clock_1_in_reg_firsttransfer;
  wire             nios_audio_clock_1_in_reset_n;
  reg              nios_audio_clock_1_in_slavearbiterlockenable;
  wire             nios_audio_clock_1_in_slavearbiterlockenable2;
  wire             nios_audio_clock_1_in_unreg_firsttransfer;
  wire             nios_audio_clock_1_in_waitrequest_from_sa;
  wire             nios_audio_clock_1_in_waits_for_read;
  wire             nios_audio_clock_1_in_waits_for_write;
  wire             nios_audio_clock_1_in_write;
  wire    [ 31: 0] nios_audio_clock_1_in_writedata;
  wire             wait_for_nios_audio_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~nios_audio_clock_1_in_end_xfer;
    end


  assign nios_audio_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_nios_audio_clock_1_in));
  //assign nios_audio_clock_1_in_readdata_from_sa = nios_audio_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_1_in_readdata_from_sa = nios_audio_clock_1_in_readdata;

  assign cpu_data_master_requests_nios_audio_clock_1_in = ({cpu_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h9001030) & (cpu_data_master_read | cpu_data_master_write);
  //assign nios_audio_clock_1_in_waitrequest_from_sa = nios_audio_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_1_in_waitrequest_from_sa = nios_audio_clock_1_in_waitrequest;

  //nios_audio_clock_1_in_arb_share_counter set values, which is an e_mux
  assign nios_audio_clock_1_in_arb_share_set_values = 1;

  //nios_audio_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign nios_audio_clock_1_in_non_bursting_master_requests = cpu_data_master_requests_nios_audio_clock_1_in;

  //nios_audio_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_audio_clock_1_in_any_bursting_master_saved_grant = 0;

  //nios_audio_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_audio_clock_1_in_arb_share_counter_next_value = nios_audio_clock_1_in_firsttransfer ? (nios_audio_clock_1_in_arb_share_set_values - 1) : |nios_audio_clock_1_in_arb_share_counter ? (nios_audio_clock_1_in_arb_share_counter - 1) : 0;

  //nios_audio_clock_1_in_allgrants all slave grants, which is an e_mux
  assign nios_audio_clock_1_in_allgrants = |nios_audio_clock_1_in_grant_vector;

  //nios_audio_clock_1_in_end_xfer assignment, which is an e_assign
  assign nios_audio_clock_1_in_end_xfer = ~(nios_audio_clock_1_in_waits_for_read | nios_audio_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_audio_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_audio_clock_1_in = nios_audio_clock_1_in_end_xfer & (~nios_audio_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_audio_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_audio_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_audio_clock_1_in & nios_audio_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_nios_audio_clock_1_in & ~nios_audio_clock_1_in_non_bursting_master_requests);

  //nios_audio_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_in_arb_share_counter <= 0;
      else if (nios_audio_clock_1_in_arb_counter_enable)
          nios_audio_clock_1_in_arb_share_counter <= nios_audio_clock_1_in_arb_share_counter_next_value;
    end


  //nios_audio_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|nios_audio_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_nios_audio_clock_1_in) | (end_xfer_arb_share_counter_term_nios_audio_clock_1_in & ~nios_audio_clock_1_in_non_bursting_master_requests))
          nios_audio_clock_1_in_slavearbiterlockenable <= |nios_audio_clock_1_in_arb_share_counter_next_value;
    end


  //cpu/data_master nios_audio_clock_1/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = nios_audio_clock_1_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //nios_audio_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_audio_clock_1_in_slavearbiterlockenable2 = |nios_audio_clock_1_in_arb_share_counter_next_value;

  //cpu/data_master nios_audio_clock_1/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = nios_audio_clock_1_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //nios_audio_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign nios_audio_clock_1_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_nios_audio_clock_1_in = cpu_data_master_requests_nios_audio_clock_1_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_nios_audio_clock_1_in, which is an e_mux
  assign cpu_data_master_read_data_valid_nios_audio_clock_1_in = cpu_data_master_granted_nios_audio_clock_1_in & cpu_data_master_read & ~nios_audio_clock_1_in_waits_for_read;

  //nios_audio_clock_1_in_writedata mux, which is an e_mux
  assign nios_audio_clock_1_in_writedata = cpu_data_master_writedata;

  //assign nios_audio_clock_1_in_endofpacket_from_sa = nios_audio_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_1_in_endofpacket_from_sa = nios_audio_clock_1_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_nios_audio_clock_1_in = cpu_data_master_qualified_request_nios_audio_clock_1_in;

  //cpu/data_master saved-grant nios_audio_clock_1/in, which is an e_assign
  assign cpu_data_master_saved_grant_nios_audio_clock_1_in = cpu_data_master_requests_nios_audio_clock_1_in;

  //allow new arb cycle for nios_audio_clock_1/in, which is an e_assign
  assign nios_audio_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign nios_audio_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign nios_audio_clock_1_in_master_qreq_vector = 1;

  //nios_audio_clock_1_in_reset_n assignment, which is an e_assign
  assign nios_audio_clock_1_in_reset_n = reset_n;

  //nios_audio_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign nios_audio_clock_1_in_firsttransfer = nios_audio_clock_1_in_begins_xfer ? nios_audio_clock_1_in_unreg_firsttransfer : nios_audio_clock_1_in_reg_firsttransfer;

  //nios_audio_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_audio_clock_1_in_unreg_firsttransfer = ~(nios_audio_clock_1_in_slavearbiterlockenable & nios_audio_clock_1_in_any_continuerequest);

  //nios_audio_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (nios_audio_clock_1_in_begins_xfer)
          nios_audio_clock_1_in_reg_firsttransfer <= nios_audio_clock_1_in_unreg_firsttransfer;
    end


  //nios_audio_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_audio_clock_1_in_beginbursttransfer_internal = nios_audio_clock_1_in_begins_xfer;

  //nios_audio_clock_1_in_read assignment, which is an e_mux
  assign nios_audio_clock_1_in_read = cpu_data_master_granted_nios_audio_clock_1_in & cpu_data_master_read;

  //nios_audio_clock_1_in_write assignment, which is an e_mux
  assign nios_audio_clock_1_in_write = cpu_data_master_granted_nios_audio_clock_1_in & cpu_data_master_write;

  //nios_audio_clock_1_in_address mux, which is an e_mux
  assign nios_audio_clock_1_in_address = cpu_data_master_address_to_slave;

  //slaveid nios_audio_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign nios_audio_clock_1_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_nios_audio_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_audio_clock_1_in_end_xfer <= 1;
      else 
        d1_nios_audio_clock_1_in_end_xfer <= nios_audio_clock_1_in_end_xfer;
    end


  //nios_audio_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign nios_audio_clock_1_in_waits_for_read = nios_audio_clock_1_in_in_a_read_cycle & nios_audio_clock_1_in_waitrequest_from_sa;

  //nios_audio_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign nios_audio_clock_1_in_in_a_read_cycle = cpu_data_master_granted_nios_audio_clock_1_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_audio_clock_1_in_in_a_read_cycle;

  //nios_audio_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign nios_audio_clock_1_in_waits_for_write = nios_audio_clock_1_in_in_a_write_cycle & nios_audio_clock_1_in_waitrequest_from_sa;

  //nios_audio_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign nios_audio_clock_1_in_in_a_write_cycle = cpu_data_master_granted_nios_audio_clock_1_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_audio_clock_1_in_in_a_write_cycle;

  assign wait_for_nios_audio_clock_1_in_counter = 0;
  //nios_audio_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign nios_audio_clock_1_in_byteenable = (cpu_data_master_granted_nios_audio_clock_1_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_audio_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_clock_1_out_arbitrator (
                                           // inputs:
                                            altpll_pll_slave_readdata_from_sa,
                                            clk,
                                            d1_altpll_pll_slave_end_xfer,
                                            nios_audio_clock_1_out_address,
                                            nios_audio_clock_1_out_byteenable,
                                            nios_audio_clock_1_out_granted_altpll_pll_slave,
                                            nios_audio_clock_1_out_qualified_request_altpll_pll_slave,
                                            nios_audio_clock_1_out_read,
                                            nios_audio_clock_1_out_read_data_valid_altpll_pll_slave,
                                            nios_audio_clock_1_out_requests_altpll_pll_slave,
                                            nios_audio_clock_1_out_write,
                                            nios_audio_clock_1_out_writedata,
                                            reset_n,

                                           // outputs:
                                            nios_audio_clock_1_out_address_to_slave,
                                            nios_audio_clock_1_out_readdata,
                                            nios_audio_clock_1_out_reset_n,
                                            nios_audio_clock_1_out_waitrequest
                                         )
;

  output  [  3: 0] nios_audio_clock_1_out_address_to_slave;
  output  [ 31: 0] nios_audio_clock_1_out_readdata;
  output           nios_audio_clock_1_out_reset_n;
  output           nios_audio_clock_1_out_waitrequest;
  input   [ 31: 0] altpll_pll_slave_readdata_from_sa;
  input            clk;
  input            d1_altpll_pll_slave_end_xfer;
  input   [  3: 0] nios_audio_clock_1_out_address;
  input   [  3: 0] nios_audio_clock_1_out_byteenable;
  input            nios_audio_clock_1_out_granted_altpll_pll_slave;
  input            nios_audio_clock_1_out_qualified_request_altpll_pll_slave;
  input            nios_audio_clock_1_out_read;
  input            nios_audio_clock_1_out_read_data_valid_altpll_pll_slave;
  input            nios_audio_clock_1_out_requests_altpll_pll_slave;
  input            nios_audio_clock_1_out_write;
  input   [ 31: 0] nios_audio_clock_1_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  3: 0] nios_audio_clock_1_out_address_last_time;
  wire    [  3: 0] nios_audio_clock_1_out_address_to_slave;
  reg     [  3: 0] nios_audio_clock_1_out_byteenable_last_time;
  reg              nios_audio_clock_1_out_read_last_time;
  wire    [ 31: 0] nios_audio_clock_1_out_readdata;
  wire             nios_audio_clock_1_out_reset_n;
  wire             nios_audio_clock_1_out_run;
  wire             nios_audio_clock_1_out_waitrequest;
  reg              nios_audio_clock_1_out_write_last_time;
  reg     [ 31: 0] nios_audio_clock_1_out_writedata_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~nios_audio_clock_1_out_qualified_request_altpll_pll_slave | ~(nios_audio_clock_1_out_read | nios_audio_clock_1_out_write) | (1 & (nios_audio_clock_1_out_read | nios_audio_clock_1_out_write)))) & ((~nios_audio_clock_1_out_qualified_request_altpll_pll_slave | ~(nios_audio_clock_1_out_read | nios_audio_clock_1_out_write) | (1 & (nios_audio_clock_1_out_read | nios_audio_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign nios_audio_clock_1_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign nios_audio_clock_1_out_address_to_slave = nios_audio_clock_1_out_address;

  //nios_audio_clock_1/out readdata mux, which is an e_mux
  assign nios_audio_clock_1_out_readdata = altpll_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign nios_audio_clock_1_out_waitrequest = ~nios_audio_clock_1_out_run;

  //nios_audio_clock_1_out_reset_n assignment, which is an e_assign
  assign nios_audio_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_audio_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_out_address_last_time <= 0;
      else 
        nios_audio_clock_1_out_address_last_time <= nios_audio_clock_1_out_address;
    end


  //nios_audio_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= nios_audio_clock_1_out_waitrequest & (nios_audio_clock_1_out_read | nios_audio_clock_1_out_write);
    end


  //nios_audio_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_1_out_address != nios_audio_clock_1_out_address_last_time))
        begin
          $write("%0d ns: nios_audio_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_out_byteenable_last_time <= 0;
      else 
        nios_audio_clock_1_out_byteenable_last_time <= nios_audio_clock_1_out_byteenable;
    end


  //nios_audio_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_1_out_byteenable != nios_audio_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: nios_audio_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_out_read_last_time <= 0;
      else 
        nios_audio_clock_1_out_read_last_time <= nios_audio_clock_1_out_read;
    end


  //nios_audio_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_1_out_read != nios_audio_clock_1_out_read_last_time))
        begin
          $write("%0d ns: nios_audio_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_out_write_last_time <= 0;
      else 
        nios_audio_clock_1_out_write_last_time <= nios_audio_clock_1_out_write;
    end


  //nios_audio_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_1_out_write != nios_audio_clock_1_out_write_last_time))
        begin
          $write("%0d ns: nios_audio_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_1_out_writedata_last_time <= 0;
      else 
        nios_audio_clock_1_out_writedata_last_time <= nios_audio_clock_1_out_writedata;
    end


  //nios_audio_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_1_out_writedata != nios_audio_clock_1_out_writedata_last_time) & nios_audio_clock_1_out_write)
        begin
          $write("%0d ns: nios_audio_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_clock_2_in_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           nios_audio_clock_2_in_endofpacket,
                                           nios_audio_clock_2_in_readdata,
                                           nios_audio_clock_2_in_waitrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_nios_audio_clock_2_in,
                                           cpu_data_master_qualified_request_nios_audio_clock_2_in,
                                           cpu_data_master_read_data_valid_nios_audio_clock_2_in,
                                           cpu_data_master_requests_nios_audio_clock_2_in,
                                           d1_nios_audio_clock_2_in_end_xfer,
                                           nios_audio_clock_2_in_address,
                                           nios_audio_clock_2_in_byteenable,
                                           nios_audio_clock_2_in_endofpacket_from_sa,
                                           nios_audio_clock_2_in_nativeaddress,
                                           nios_audio_clock_2_in_read,
                                           nios_audio_clock_2_in_readdata_from_sa,
                                           nios_audio_clock_2_in_reset_n,
                                           nios_audio_clock_2_in_waitrequest_from_sa,
                                           nios_audio_clock_2_in_write,
                                           nios_audio_clock_2_in_writedata
                                        )
;

  output           cpu_data_master_granted_nios_audio_clock_2_in;
  output           cpu_data_master_qualified_request_nios_audio_clock_2_in;
  output           cpu_data_master_read_data_valid_nios_audio_clock_2_in;
  output           cpu_data_master_requests_nios_audio_clock_2_in;
  output           d1_nios_audio_clock_2_in_end_xfer;
  output  [  3: 0] nios_audio_clock_2_in_address;
  output  [  1: 0] nios_audio_clock_2_in_byteenable;
  output           nios_audio_clock_2_in_endofpacket_from_sa;
  output  [  2: 0] nios_audio_clock_2_in_nativeaddress;
  output           nios_audio_clock_2_in_read;
  output  [ 15: 0] nios_audio_clock_2_in_readdata_from_sa;
  output           nios_audio_clock_2_in_reset_n;
  output           nios_audio_clock_2_in_waitrequest_from_sa;
  output           nios_audio_clock_2_in_write;
  output  [ 15: 0] nios_audio_clock_2_in_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            nios_audio_clock_2_in_endofpacket;
  input   [ 15: 0] nios_audio_clock_2_in_readdata;
  input            nios_audio_clock_2_in_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_nios_audio_clock_2_in;
  wire             cpu_data_master_qualified_request_nios_audio_clock_2_in;
  wire             cpu_data_master_read_data_valid_nios_audio_clock_2_in;
  wire             cpu_data_master_requests_nios_audio_clock_2_in;
  wire             cpu_data_master_saved_grant_nios_audio_clock_2_in;
  reg              d1_nios_audio_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_audio_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] nios_audio_clock_2_in_address;
  wire             nios_audio_clock_2_in_allgrants;
  wire             nios_audio_clock_2_in_allow_new_arb_cycle;
  wire             nios_audio_clock_2_in_any_bursting_master_saved_grant;
  wire             nios_audio_clock_2_in_any_continuerequest;
  wire             nios_audio_clock_2_in_arb_counter_enable;
  reg     [  2: 0] nios_audio_clock_2_in_arb_share_counter;
  wire    [  2: 0] nios_audio_clock_2_in_arb_share_counter_next_value;
  wire    [  2: 0] nios_audio_clock_2_in_arb_share_set_values;
  wire             nios_audio_clock_2_in_beginbursttransfer_internal;
  wire             nios_audio_clock_2_in_begins_xfer;
  wire    [  1: 0] nios_audio_clock_2_in_byteenable;
  wire             nios_audio_clock_2_in_end_xfer;
  wire             nios_audio_clock_2_in_endofpacket_from_sa;
  wire             nios_audio_clock_2_in_firsttransfer;
  wire             nios_audio_clock_2_in_grant_vector;
  wire             nios_audio_clock_2_in_in_a_read_cycle;
  wire             nios_audio_clock_2_in_in_a_write_cycle;
  wire             nios_audio_clock_2_in_master_qreq_vector;
  wire    [  2: 0] nios_audio_clock_2_in_nativeaddress;
  wire             nios_audio_clock_2_in_non_bursting_master_requests;
  wire             nios_audio_clock_2_in_read;
  wire    [ 15: 0] nios_audio_clock_2_in_readdata_from_sa;
  reg              nios_audio_clock_2_in_reg_firsttransfer;
  wire             nios_audio_clock_2_in_reset_n;
  reg              nios_audio_clock_2_in_slavearbiterlockenable;
  wire             nios_audio_clock_2_in_slavearbiterlockenable2;
  wire             nios_audio_clock_2_in_unreg_firsttransfer;
  wire             nios_audio_clock_2_in_waitrequest_from_sa;
  wire             nios_audio_clock_2_in_waits_for_read;
  wire             nios_audio_clock_2_in_waits_for_write;
  wire             nios_audio_clock_2_in_write;
  wire    [ 15: 0] nios_audio_clock_2_in_writedata;
  wire    [ 27: 0] shifted_address_to_nios_audio_clock_2_in_from_cpu_data_master;
  wire             wait_for_nios_audio_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~nios_audio_clock_2_in_end_xfer;
    end


  assign nios_audio_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_nios_audio_clock_2_in));
  //assign nios_audio_clock_2_in_readdata_from_sa = nios_audio_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_2_in_readdata_from_sa = nios_audio_clock_2_in_readdata;

  assign cpu_data_master_requests_nios_audio_clock_2_in = ({cpu_data_master_address_to_slave[27 : 5] , 5'b0} == 28'h9001000) & (cpu_data_master_read | cpu_data_master_write);
  //assign nios_audio_clock_2_in_waitrequest_from_sa = nios_audio_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_2_in_waitrequest_from_sa = nios_audio_clock_2_in_waitrequest;

  //nios_audio_clock_2_in_arb_share_counter set values, which is an e_mux
  assign nios_audio_clock_2_in_arb_share_set_values = 1;

  //nios_audio_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign nios_audio_clock_2_in_non_bursting_master_requests = cpu_data_master_requests_nios_audio_clock_2_in;

  //nios_audio_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_audio_clock_2_in_any_bursting_master_saved_grant = 0;

  //nios_audio_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_audio_clock_2_in_arb_share_counter_next_value = nios_audio_clock_2_in_firsttransfer ? (nios_audio_clock_2_in_arb_share_set_values - 1) : |nios_audio_clock_2_in_arb_share_counter ? (nios_audio_clock_2_in_arb_share_counter - 1) : 0;

  //nios_audio_clock_2_in_allgrants all slave grants, which is an e_mux
  assign nios_audio_clock_2_in_allgrants = |nios_audio_clock_2_in_grant_vector;

  //nios_audio_clock_2_in_end_xfer assignment, which is an e_assign
  assign nios_audio_clock_2_in_end_xfer = ~(nios_audio_clock_2_in_waits_for_read | nios_audio_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_audio_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_audio_clock_2_in = nios_audio_clock_2_in_end_xfer & (~nios_audio_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_audio_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_audio_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_audio_clock_2_in & nios_audio_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_nios_audio_clock_2_in & ~nios_audio_clock_2_in_non_bursting_master_requests);

  //nios_audio_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_in_arb_share_counter <= 0;
      else if (nios_audio_clock_2_in_arb_counter_enable)
          nios_audio_clock_2_in_arb_share_counter <= nios_audio_clock_2_in_arb_share_counter_next_value;
    end


  //nios_audio_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|nios_audio_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_nios_audio_clock_2_in) | (end_xfer_arb_share_counter_term_nios_audio_clock_2_in & ~nios_audio_clock_2_in_non_bursting_master_requests))
          nios_audio_clock_2_in_slavearbiterlockenable <= |nios_audio_clock_2_in_arb_share_counter_next_value;
    end


  //cpu/data_master nios_audio_clock_2/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = nios_audio_clock_2_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //nios_audio_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_audio_clock_2_in_slavearbiterlockenable2 = |nios_audio_clock_2_in_arb_share_counter_next_value;

  //cpu/data_master nios_audio_clock_2/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = nios_audio_clock_2_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //nios_audio_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign nios_audio_clock_2_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_nios_audio_clock_2_in = cpu_data_master_requests_nios_audio_clock_2_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_nios_audio_clock_2_in, which is an e_mux
  assign cpu_data_master_read_data_valid_nios_audio_clock_2_in = cpu_data_master_granted_nios_audio_clock_2_in & cpu_data_master_read & ~nios_audio_clock_2_in_waits_for_read;

  //nios_audio_clock_2_in_writedata mux, which is an e_mux
  assign nios_audio_clock_2_in_writedata = cpu_data_master_writedata;

  //assign nios_audio_clock_2_in_endofpacket_from_sa = nios_audio_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_audio_clock_2_in_endofpacket_from_sa = nios_audio_clock_2_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_nios_audio_clock_2_in = cpu_data_master_qualified_request_nios_audio_clock_2_in;

  //cpu/data_master saved-grant nios_audio_clock_2/in, which is an e_assign
  assign cpu_data_master_saved_grant_nios_audio_clock_2_in = cpu_data_master_requests_nios_audio_clock_2_in;

  //allow new arb cycle for nios_audio_clock_2/in, which is an e_assign
  assign nios_audio_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign nios_audio_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign nios_audio_clock_2_in_master_qreq_vector = 1;

  //nios_audio_clock_2_in_reset_n assignment, which is an e_assign
  assign nios_audio_clock_2_in_reset_n = reset_n;

  //nios_audio_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign nios_audio_clock_2_in_firsttransfer = nios_audio_clock_2_in_begins_xfer ? nios_audio_clock_2_in_unreg_firsttransfer : nios_audio_clock_2_in_reg_firsttransfer;

  //nios_audio_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_audio_clock_2_in_unreg_firsttransfer = ~(nios_audio_clock_2_in_slavearbiterlockenable & nios_audio_clock_2_in_any_continuerequest);

  //nios_audio_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (nios_audio_clock_2_in_begins_xfer)
          nios_audio_clock_2_in_reg_firsttransfer <= nios_audio_clock_2_in_unreg_firsttransfer;
    end


  //nios_audio_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_audio_clock_2_in_beginbursttransfer_internal = nios_audio_clock_2_in_begins_xfer;

  //nios_audio_clock_2_in_read assignment, which is an e_mux
  assign nios_audio_clock_2_in_read = cpu_data_master_granted_nios_audio_clock_2_in & cpu_data_master_read;

  //nios_audio_clock_2_in_write assignment, which is an e_mux
  assign nios_audio_clock_2_in_write = cpu_data_master_granted_nios_audio_clock_2_in & cpu_data_master_write;

  assign shifted_address_to_nios_audio_clock_2_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //nios_audio_clock_2_in_address mux, which is an e_mux
  assign nios_audio_clock_2_in_address = shifted_address_to_nios_audio_clock_2_in_from_cpu_data_master >> 2;

  //slaveid nios_audio_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign nios_audio_clock_2_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_nios_audio_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_audio_clock_2_in_end_xfer <= 1;
      else 
        d1_nios_audio_clock_2_in_end_xfer <= nios_audio_clock_2_in_end_xfer;
    end


  //nios_audio_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign nios_audio_clock_2_in_waits_for_read = nios_audio_clock_2_in_in_a_read_cycle & nios_audio_clock_2_in_waitrequest_from_sa;

  //nios_audio_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign nios_audio_clock_2_in_in_a_read_cycle = cpu_data_master_granted_nios_audio_clock_2_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_audio_clock_2_in_in_a_read_cycle;

  //nios_audio_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign nios_audio_clock_2_in_waits_for_write = nios_audio_clock_2_in_in_a_write_cycle & nios_audio_clock_2_in_waitrequest_from_sa;

  //nios_audio_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign nios_audio_clock_2_in_in_a_write_cycle = cpu_data_master_granted_nios_audio_clock_2_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_audio_clock_2_in_in_a_write_cycle;

  assign wait_for_nios_audio_clock_2_in_counter = 0;
  //nios_audio_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign nios_audio_clock_2_in_byteenable = (cpu_data_master_granted_nios_audio_clock_2_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_audio_clock_2/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_clock_2_out_arbitrator (
                                           // inputs:
                                            audio_avalon_slave_readdata_from_sa,
                                            clk,
                                            d1_audio_avalon_slave_end_xfer,
                                            nios_audio_clock_2_out_address,
                                            nios_audio_clock_2_out_byteenable,
                                            nios_audio_clock_2_out_granted_audio_avalon_slave,
                                            nios_audio_clock_2_out_qualified_request_audio_avalon_slave,
                                            nios_audio_clock_2_out_read,
                                            nios_audio_clock_2_out_read_data_valid_audio_avalon_slave,
                                            nios_audio_clock_2_out_requests_audio_avalon_slave,
                                            nios_audio_clock_2_out_write,
                                            nios_audio_clock_2_out_writedata,
                                            reset_n,

                                           // outputs:
                                            nios_audio_clock_2_out_address_to_slave,
                                            nios_audio_clock_2_out_readdata,
                                            nios_audio_clock_2_out_reset_n,
                                            nios_audio_clock_2_out_waitrequest
                                         )
;

  output  [  3: 0] nios_audio_clock_2_out_address_to_slave;
  output  [ 15: 0] nios_audio_clock_2_out_readdata;
  output           nios_audio_clock_2_out_reset_n;
  output           nios_audio_clock_2_out_waitrequest;
  input   [ 15: 0] audio_avalon_slave_readdata_from_sa;
  input            clk;
  input            d1_audio_avalon_slave_end_xfer;
  input   [  3: 0] nios_audio_clock_2_out_address;
  input   [  1: 0] nios_audio_clock_2_out_byteenable;
  input            nios_audio_clock_2_out_granted_audio_avalon_slave;
  input            nios_audio_clock_2_out_qualified_request_audio_avalon_slave;
  input            nios_audio_clock_2_out_read;
  input            nios_audio_clock_2_out_read_data_valid_audio_avalon_slave;
  input            nios_audio_clock_2_out_requests_audio_avalon_slave;
  input            nios_audio_clock_2_out_write;
  input   [ 15: 0] nios_audio_clock_2_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  3: 0] nios_audio_clock_2_out_address_last_time;
  wire    [  3: 0] nios_audio_clock_2_out_address_to_slave;
  reg     [  1: 0] nios_audio_clock_2_out_byteenable_last_time;
  reg              nios_audio_clock_2_out_read_last_time;
  wire    [ 15: 0] nios_audio_clock_2_out_readdata;
  wire             nios_audio_clock_2_out_reset_n;
  wire             nios_audio_clock_2_out_run;
  wire             nios_audio_clock_2_out_waitrequest;
  reg              nios_audio_clock_2_out_write_last_time;
  reg     [ 15: 0] nios_audio_clock_2_out_writedata_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~nios_audio_clock_2_out_qualified_request_audio_avalon_slave | ~(nios_audio_clock_2_out_read | nios_audio_clock_2_out_write) | (1 & (nios_audio_clock_2_out_read | nios_audio_clock_2_out_write)))) & ((~nios_audio_clock_2_out_qualified_request_audio_avalon_slave | ~(nios_audio_clock_2_out_read | nios_audio_clock_2_out_write) | (1 & (nios_audio_clock_2_out_read | nios_audio_clock_2_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign nios_audio_clock_2_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign nios_audio_clock_2_out_address_to_slave = nios_audio_clock_2_out_address;

  //nios_audio_clock_2/out readdata mux, which is an e_mux
  assign nios_audio_clock_2_out_readdata = audio_avalon_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign nios_audio_clock_2_out_waitrequest = ~nios_audio_clock_2_out_run;

  //nios_audio_clock_2_out_reset_n assignment, which is an e_assign
  assign nios_audio_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_audio_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_out_address_last_time <= 0;
      else 
        nios_audio_clock_2_out_address_last_time <= nios_audio_clock_2_out_address;
    end


  //nios_audio_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= nios_audio_clock_2_out_waitrequest & (nios_audio_clock_2_out_read | nios_audio_clock_2_out_write);
    end


  //nios_audio_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_2_out_address != nios_audio_clock_2_out_address_last_time))
        begin
          $write("%0d ns: nios_audio_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_out_byteenable_last_time <= 0;
      else 
        nios_audio_clock_2_out_byteenable_last_time <= nios_audio_clock_2_out_byteenable;
    end


  //nios_audio_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_2_out_byteenable != nios_audio_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: nios_audio_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_out_read_last_time <= 0;
      else 
        nios_audio_clock_2_out_read_last_time <= nios_audio_clock_2_out_read;
    end


  //nios_audio_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_2_out_read != nios_audio_clock_2_out_read_last_time))
        begin
          $write("%0d ns: nios_audio_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_out_write_last_time <= 0;
      else 
        nios_audio_clock_2_out_write_last_time <= nios_audio_clock_2_out_write;
    end


  //nios_audio_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_2_out_write != nios_audio_clock_2_out_write_last_time))
        begin
          $write("%0d ns: nios_audio_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_audio_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_audio_clock_2_out_writedata_last_time <= 0;
      else 
        nios_audio_clock_2_out_writedata_last_time <= nios_audio_clock_2_out_writedata;
    end


  //nios_audio_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_audio_clock_2_out_writedata != nios_audio_clock_2_out_writedata_last_time) & nios_audio_clock_2_out_write)
        begin
          $write("%0d ns: nios_audio_clock_2_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_led_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_peripheral_bridge_m1_address_to_slave,
                                cpu_peripheral_bridge_m1_latency_counter,
                                cpu_peripheral_bridge_m1_nativeaddress,
                                cpu_peripheral_bridge_m1_read,
                                cpu_peripheral_bridge_m1_write,
                                cpu_peripheral_bridge_m1_writedata,
                                pio_led_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_peripheral_bridge_m1_granted_pio_led_s1,
                                cpu_peripheral_bridge_m1_qualified_request_pio_led_s1,
                                cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1,
                                cpu_peripheral_bridge_m1_requests_pio_led_s1,
                                d1_pio_led_s1_end_xfer,
                                pio_led_s1_address,
                                pio_led_s1_chipselect,
                                pio_led_s1_readdata_from_sa,
                                pio_led_s1_reset_n,
                                pio_led_s1_write_n,
                                pio_led_s1_writedata
                             )
;

  output           cpu_peripheral_bridge_m1_granted_pio_led_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_pio_led_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1;
  output           cpu_peripheral_bridge_m1_requests_pio_led_s1;
  output           d1_pio_led_s1_end_xfer;
  output  [  1: 0] pio_led_s1_address;
  output           pio_led_s1_chipselect;
  output  [ 25: 0] pio_led_s1_readdata_from_sa;
  output           pio_led_s1_reset_n;
  output           pio_led_s1_write_n;
  output  [ 25: 0] pio_led_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input   [ 25: 0] pio_led_s1_readdata;
  input            reset_n;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_requests_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_pio_led_s1;
  reg              d1_pio_led_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_led_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_led_s1_address;
  wire             pio_led_s1_allgrants;
  wire             pio_led_s1_allow_new_arb_cycle;
  wire             pio_led_s1_any_bursting_master_saved_grant;
  wire             pio_led_s1_any_continuerequest;
  wire             pio_led_s1_arb_counter_enable;
  reg              pio_led_s1_arb_share_counter;
  wire             pio_led_s1_arb_share_counter_next_value;
  wire             pio_led_s1_arb_share_set_values;
  wire             pio_led_s1_beginbursttransfer_internal;
  wire             pio_led_s1_begins_xfer;
  wire             pio_led_s1_chipselect;
  wire             pio_led_s1_end_xfer;
  wire             pio_led_s1_firsttransfer;
  wire             pio_led_s1_grant_vector;
  wire             pio_led_s1_in_a_read_cycle;
  wire             pio_led_s1_in_a_write_cycle;
  wire             pio_led_s1_master_qreq_vector;
  wire             pio_led_s1_non_bursting_master_requests;
  wire    [ 25: 0] pio_led_s1_readdata_from_sa;
  reg              pio_led_s1_reg_firsttransfer;
  wire             pio_led_s1_reset_n;
  reg              pio_led_s1_slavearbiterlockenable;
  wire             pio_led_s1_slavearbiterlockenable2;
  wire             pio_led_s1_unreg_firsttransfer;
  wire             pio_led_s1_waits_for_read;
  wire             pio_led_s1_waits_for_write;
  wire             pio_led_s1_write_n;
  wire    [ 25: 0] pio_led_s1_writedata;
  wire             wait_for_pio_led_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_led_s1_end_xfer;
    end


  assign pio_led_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_pio_led_s1));
  //assign pio_led_s1_readdata_from_sa = pio_led_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_led_s1_readdata_from_sa = pio_led_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_pio_led_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'hc0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //pio_led_s1_arb_share_counter set values, which is an e_mux
  assign pio_led_s1_arb_share_set_values = 1;

  //pio_led_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_led_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_pio_led_s1;

  //pio_led_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_led_s1_any_bursting_master_saved_grant = 0;

  //pio_led_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_led_s1_arb_share_counter_next_value = pio_led_s1_firsttransfer ? (pio_led_s1_arb_share_set_values - 1) : |pio_led_s1_arb_share_counter ? (pio_led_s1_arb_share_counter - 1) : 0;

  //pio_led_s1_allgrants all slave grants, which is an e_mux
  assign pio_led_s1_allgrants = |pio_led_s1_grant_vector;

  //pio_led_s1_end_xfer assignment, which is an e_assign
  assign pio_led_s1_end_xfer = ~(pio_led_s1_waits_for_read | pio_led_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_led_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_led_s1 = pio_led_s1_end_xfer & (~pio_led_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_led_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_led_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_led_s1 & pio_led_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_led_s1 & ~pio_led_s1_non_bursting_master_requests);

  //pio_led_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_arb_share_counter <= 0;
      else if (pio_led_s1_arb_counter_enable)
          pio_led_s1_arb_share_counter <= pio_led_s1_arb_share_counter_next_value;
    end


  //pio_led_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_slavearbiterlockenable <= 0;
      else if ((|pio_led_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_led_s1) | (end_xfer_arb_share_counter_term_pio_led_s1 & ~pio_led_s1_non_bursting_master_requests))
          pio_led_s1_slavearbiterlockenable <= |pio_led_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 pio_led/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = pio_led_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //pio_led_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_led_s1_slavearbiterlockenable2 = |pio_led_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 pio_led/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = pio_led_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //pio_led_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_led_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_pio_led_s1 = cpu_peripheral_bridge_m1_requests_pio_led_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1 = cpu_peripheral_bridge_m1_granted_pio_led_s1 & cpu_peripheral_bridge_m1_read & ~pio_led_s1_waits_for_read;

  //pio_led_s1_writedata mux, which is an e_mux
  assign pio_led_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_pio_led_s1 = cpu_peripheral_bridge_m1_qualified_request_pio_led_s1;

  //cpu_peripheral_bridge/m1 saved-grant pio_led/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_pio_led_s1 = cpu_peripheral_bridge_m1_requests_pio_led_s1;

  //allow new arb cycle for pio_led/s1, which is an e_assign
  assign pio_led_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_led_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_led_s1_master_qreq_vector = 1;

  //pio_led_s1_reset_n assignment, which is an e_assign
  assign pio_led_s1_reset_n = reset_n;

  assign pio_led_s1_chipselect = cpu_peripheral_bridge_m1_granted_pio_led_s1;
  //pio_led_s1_firsttransfer first transaction, which is an e_assign
  assign pio_led_s1_firsttransfer = pio_led_s1_begins_xfer ? pio_led_s1_unreg_firsttransfer : pio_led_s1_reg_firsttransfer;

  //pio_led_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_led_s1_unreg_firsttransfer = ~(pio_led_s1_slavearbiterlockenable & pio_led_s1_any_continuerequest);

  //pio_led_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_led_s1_reg_firsttransfer <= 1'b1;
      else if (pio_led_s1_begins_xfer)
          pio_led_s1_reg_firsttransfer <= pio_led_s1_unreg_firsttransfer;
    end


  //pio_led_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_led_s1_beginbursttransfer_internal = pio_led_s1_begins_xfer;

  //~pio_led_s1_write_n assignment, which is an e_mux
  assign pio_led_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_pio_led_s1 & cpu_peripheral_bridge_m1_write);

  //pio_led_s1_address mux, which is an e_mux
  assign pio_led_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_pio_led_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_led_s1_end_xfer <= 1;
      else 
        d1_pio_led_s1_end_xfer <= pio_led_s1_end_xfer;
    end


  //pio_led_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_led_s1_waits_for_read = pio_led_s1_in_a_read_cycle & pio_led_s1_begins_xfer;

  //pio_led_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_led_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_pio_led_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_led_s1_in_a_read_cycle;

  //pio_led_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_led_s1_waits_for_write = pio_led_s1_in_a_write_cycle & 0;

  //pio_led_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_led_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_pio_led_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_led_s1_in_a_write_cycle;

  assign wait_for_pio_led_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_led/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sd_clk_s1_arbitrator (
                              // inputs:
                               clk,
                               cpu_peripheral_bridge_m1_address_to_slave,
                               cpu_peripheral_bridge_m1_latency_counter,
                               cpu_peripheral_bridge_m1_nativeaddress,
                               cpu_peripheral_bridge_m1_read,
                               cpu_peripheral_bridge_m1_write,
                               cpu_peripheral_bridge_m1_writedata,
                               reset_n,
                               sd_clk_s1_readdata,

                              // outputs:
                               cpu_peripheral_bridge_m1_granted_sd_clk_s1,
                               cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1,
                               cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1,
                               cpu_peripheral_bridge_m1_requests_sd_clk_s1,
                               d1_sd_clk_s1_end_xfer,
                               sd_clk_s1_address,
                               sd_clk_s1_chipselect,
                               sd_clk_s1_readdata_from_sa,
                               sd_clk_s1_reset_n,
                               sd_clk_s1_write_n,
                               sd_clk_s1_writedata
                            )
;

  output           cpu_peripheral_bridge_m1_granted_sd_clk_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1;
  output           cpu_peripheral_bridge_m1_requests_sd_clk_s1;
  output           d1_sd_clk_s1_end_xfer;
  output  [  1: 0] sd_clk_s1_address;
  output           sd_clk_s1_chipselect;
  output           sd_clk_s1_readdata_from_sa;
  output           sd_clk_s1_reset_n;
  output           sd_clk_s1_write_n;
  output           sd_clk_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            reset_n;
  input            sd_clk_s1_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_sd_clk_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sd_clk_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sd_clk_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] sd_clk_s1_address;
  wire             sd_clk_s1_allgrants;
  wire             sd_clk_s1_allow_new_arb_cycle;
  wire             sd_clk_s1_any_bursting_master_saved_grant;
  wire             sd_clk_s1_any_continuerequest;
  wire             sd_clk_s1_arb_counter_enable;
  reg              sd_clk_s1_arb_share_counter;
  wire             sd_clk_s1_arb_share_counter_next_value;
  wire             sd_clk_s1_arb_share_set_values;
  wire             sd_clk_s1_beginbursttransfer_internal;
  wire             sd_clk_s1_begins_xfer;
  wire             sd_clk_s1_chipselect;
  wire             sd_clk_s1_end_xfer;
  wire             sd_clk_s1_firsttransfer;
  wire             sd_clk_s1_grant_vector;
  wire             sd_clk_s1_in_a_read_cycle;
  wire             sd_clk_s1_in_a_write_cycle;
  wire             sd_clk_s1_master_qreq_vector;
  wire             sd_clk_s1_non_bursting_master_requests;
  wire             sd_clk_s1_readdata_from_sa;
  reg              sd_clk_s1_reg_firsttransfer;
  wire             sd_clk_s1_reset_n;
  reg              sd_clk_s1_slavearbiterlockenable;
  wire             sd_clk_s1_slavearbiterlockenable2;
  wire             sd_clk_s1_unreg_firsttransfer;
  wire             sd_clk_s1_waits_for_read;
  wire             sd_clk_s1_waits_for_write;
  wire             sd_clk_s1_write_n;
  wire             sd_clk_s1_writedata;
  wire             wait_for_sd_clk_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sd_clk_s1_end_xfer;
    end


  assign sd_clk_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1));
  //assign sd_clk_s1_readdata_from_sa = sd_clk_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sd_clk_s1_readdata_from_sa = sd_clk_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_sd_clk_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h70) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //sd_clk_s1_arb_share_counter set values, which is an e_mux
  assign sd_clk_s1_arb_share_set_values = 1;

  //sd_clk_s1_non_bursting_master_requests mux, which is an e_mux
  assign sd_clk_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_sd_clk_s1;

  //sd_clk_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sd_clk_s1_any_bursting_master_saved_grant = 0;

  //sd_clk_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sd_clk_s1_arb_share_counter_next_value = sd_clk_s1_firsttransfer ? (sd_clk_s1_arb_share_set_values - 1) : |sd_clk_s1_arb_share_counter ? (sd_clk_s1_arb_share_counter - 1) : 0;

  //sd_clk_s1_allgrants all slave grants, which is an e_mux
  assign sd_clk_s1_allgrants = |sd_clk_s1_grant_vector;

  //sd_clk_s1_end_xfer assignment, which is an e_assign
  assign sd_clk_s1_end_xfer = ~(sd_clk_s1_waits_for_read | sd_clk_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sd_clk_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sd_clk_s1 = sd_clk_s1_end_xfer & (~sd_clk_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sd_clk_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sd_clk_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sd_clk_s1 & sd_clk_s1_allgrants) | (end_xfer_arb_share_counter_term_sd_clk_s1 & ~sd_clk_s1_non_bursting_master_requests);

  //sd_clk_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_clk_s1_arb_share_counter <= 0;
      else if (sd_clk_s1_arb_counter_enable)
          sd_clk_s1_arb_share_counter <= sd_clk_s1_arb_share_counter_next_value;
    end


  //sd_clk_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_clk_s1_slavearbiterlockenable <= 0;
      else if ((|sd_clk_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sd_clk_s1) | (end_xfer_arb_share_counter_term_sd_clk_s1 & ~sd_clk_s1_non_bursting_master_requests))
          sd_clk_s1_slavearbiterlockenable <= |sd_clk_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 sd_clk/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = sd_clk_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //sd_clk_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sd_clk_s1_slavearbiterlockenable2 = |sd_clk_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 sd_clk/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = sd_clk_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //sd_clk_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sd_clk_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1 = cpu_peripheral_bridge_m1_requests_sd_clk_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1 = cpu_peripheral_bridge_m1_granted_sd_clk_s1 & cpu_peripheral_bridge_m1_read & ~sd_clk_s1_waits_for_read;

  //sd_clk_s1_writedata mux, which is an e_mux
  assign sd_clk_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_sd_clk_s1 = cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1;

  //cpu_peripheral_bridge/m1 saved-grant sd_clk/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_sd_clk_s1 = cpu_peripheral_bridge_m1_requests_sd_clk_s1;

  //allow new arb cycle for sd_clk/s1, which is an e_assign
  assign sd_clk_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sd_clk_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sd_clk_s1_master_qreq_vector = 1;

  //sd_clk_s1_reset_n assignment, which is an e_assign
  assign sd_clk_s1_reset_n = reset_n;

  assign sd_clk_s1_chipselect = cpu_peripheral_bridge_m1_granted_sd_clk_s1;
  //sd_clk_s1_firsttransfer first transaction, which is an e_assign
  assign sd_clk_s1_firsttransfer = sd_clk_s1_begins_xfer ? sd_clk_s1_unreg_firsttransfer : sd_clk_s1_reg_firsttransfer;

  //sd_clk_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sd_clk_s1_unreg_firsttransfer = ~(sd_clk_s1_slavearbiterlockenable & sd_clk_s1_any_continuerequest);

  //sd_clk_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_clk_s1_reg_firsttransfer <= 1'b1;
      else if (sd_clk_s1_begins_xfer)
          sd_clk_s1_reg_firsttransfer <= sd_clk_s1_unreg_firsttransfer;
    end


  //sd_clk_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sd_clk_s1_beginbursttransfer_internal = sd_clk_s1_begins_xfer;

  //~sd_clk_s1_write_n assignment, which is an e_mux
  assign sd_clk_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_sd_clk_s1 & cpu_peripheral_bridge_m1_write);

  //sd_clk_s1_address mux, which is an e_mux
  assign sd_clk_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_sd_clk_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sd_clk_s1_end_xfer <= 1;
      else 
        d1_sd_clk_s1_end_xfer <= sd_clk_s1_end_xfer;
    end


  //sd_clk_s1_waits_for_read in a cycle, which is an e_mux
  assign sd_clk_s1_waits_for_read = sd_clk_s1_in_a_read_cycle & sd_clk_s1_begins_xfer;

  //sd_clk_s1_in_a_read_cycle assignment, which is an e_assign
  assign sd_clk_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_sd_clk_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sd_clk_s1_in_a_read_cycle;

  //sd_clk_s1_waits_for_write in a cycle, which is an e_mux
  assign sd_clk_s1_waits_for_write = sd_clk_s1_in_a_write_cycle & 0;

  //sd_clk_s1_in_a_write_cycle assignment, which is an e_assign
  assign sd_clk_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_sd_clk_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sd_clk_s1_in_a_write_cycle;

  assign wait_for_sd_clk_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sd_clk/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sd_cmd_s1_arbitrator (
                              // inputs:
                               clk,
                               cpu_peripheral_bridge_m1_address_to_slave,
                               cpu_peripheral_bridge_m1_latency_counter,
                               cpu_peripheral_bridge_m1_nativeaddress,
                               cpu_peripheral_bridge_m1_read,
                               cpu_peripheral_bridge_m1_write,
                               cpu_peripheral_bridge_m1_writedata,
                               reset_n,
                               sd_cmd_s1_readdata,

                              // outputs:
                               cpu_peripheral_bridge_m1_granted_sd_cmd_s1,
                               cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1,
                               cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1,
                               cpu_peripheral_bridge_m1_requests_sd_cmd_s1,
                               d1_sd_cmd_s1_end_xfer,
                               sd_cmd_s1_address,
                               sd_cmd_s1_chipselect,
                               sd_cmd_s1_readdata_from_sa,
                               sd_cmd_s1_reset_n,
                               sd_cmd_s1_write_n,
                               sd_cmd_s1_writedata
                            )
;

  output           cpu_peripheral_bridge_m1_granted_sd_cmd_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1;
  output           cpu_peripheral_bridge_m1_requests_sd_cmd_s1;
  output           d1_sd_cmd_s1_end_xfer;
  output  [  1: 0] sd_cmd_s1_address;
  output           sd_cmd_s1_chipselect;
  output           sd_cmd_s1_readdata_from_sa;
  output           sd_cmd_s1_reset_n;
  output           sd_cmd_s1_write_n;
  output           sd_cmd_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            reset_n;
  input            sd_cmd_s1_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_sd_cmd_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sd_cmd_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sd_cmd_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] sd_cmd_s1_address;
  wire             sd_cmd_s1_allgrants;
  wire             sd_cmd_s1_allow_new_arb_cycle;
  wire             sd_cmd_s1_any_bursting_master_saved_grant;
  wire             sd_cmd_s1_any_continuerequest;
  wire             sd_cmd_s1_arb_counter_enable;
  reg              sd_cmd_s1_arb_share_counter;
  wire             sd_cmd_s1_arb_share_counter_next_value;
  wire             sd_cmd_s1_arb_share_set_values;
  wire             sd_cmd_s1_beginbursttransfer_internal;
  wire             sd_cmd_s1_begins_xfer;
  wire             sd_cmd_s1_chipselect;
  wire             sd_cmd_s1_end_xfer;
  wire             sd_cmd_s1_firsttransfer;
  wire             sd_cmd_s1_grant_vector;
  wire             sd_cmd_s1_in_a_read_cycle;
  wire             sd_cmd_s1_in_a_write_cycle;
  wire             sd_cmd_s1_master_qreq_vector;
  wire             sd_cmd_s1_non_bursting_master_requests;
  wire             sd_cmd_s1_readdata_from_sa;
  reg              sd_cmd_s1_reg_firsttransfer;
  wire             sd_cmd_s1_reset_n;
  reg              sd_cmd_s1_slavearbiterlockenable;
  wire             sd_cmd_s1_slavearbiterlockenable2;
  wire             sd_cmd_s1_unreg_firsttransfer;
  wire             sd_cmd_s1_waits_for_read;
  wire             sd_cmd_s1_waits_for_write;
  wire             sd_cmd_s1_write_n;
  wire             sd_cmd_s1_writedata;
  wire             wait_for_sd_cmd_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sd_cmd_s1_end_xfer;
    end


  assign sd_cmd_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1));
  //assign sd_cmd_s1_readdata_from_sa = sd_cmd_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sd_cmd_s1_readdata_from_sa = sd_cmd_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_sd_cmd_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h60) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //sd_cmd_s1_arb_share_counter set values, which is an e_mux
  assign sd_cmd_s1_arb_share_set_values = 1;

  //sd_cmd_s1_non_bursting_master_requests mux, which is an e_mux
  assign sd_cmd_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_sd_cmd_s1;

  //sd_cmd_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sd_cmd_s1_any_bursting_master_saved_grant = 0;

  //sd_cmd_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sd_cmd_s1_arb_share_counter_next_value = sd_cmd_s1_firsttransfer ? (sd_cmd_s1_arb_share_set_values - 1) : |sd_cmd_s1_arb_share_counter ? (sd_cmd_s1_arb_share_counter - 1) : 0;

  //sd_cmd_s1_allgrants all slave grants, which is an e_mux
  assign sd_cmd_s1_allgrants = |sd_cmd_s1_grant_vector;

  //sd_cmd_s1_end_xfer assignment, which is an e_assign
  assign sd_cmd_s1_end_xfer = ~(sd_cmd_s1_waits_for_read | sd_cmd_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sd_cmd_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sd_cmd_s1 = sd_cmd_s1_end_xfer & (~sd_cmd_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sd_cmd_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sd_cmd_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sd_cmd_s1 & sd_cmd_s1_allgrants) | (end_xfer_arb_share_counter_term_sd_cmd_s1 & ~sd_cmd_s1_non_bursting_master_requests);

  //sd_cmd_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_cmd_s1_arb_share_counter <= 0;
      else if (sd_cmd_s1_arb_counter_enable)
          sd_cmd_s1_arb_share_counter <= sd_cmd_s1_arb_share_counter_next_value;
    end


  //sd_cmd_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_cmd_s1_slavearbiterlockenable <= 0;
      else if ((|sd_cmd_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sd_cmd_s1) | (end_xfer_arb_share_counter_term_sd_cmd_s1 & ~sd_cmd_s1_non_bursting_master_requests))
          sd_cmd_s1_slavearbiterlockenable <= |sd_cmd_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 sd_cmd/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = sd_cmd_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //sd_cmd_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sd_cmd_s1_slavearbiterlockenable2 = |sd_cmd_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 sd_cmd/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = sd_cmd_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //sd_cmd_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sd_cmd_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1 = cpu_peripheral_bridge_m1_requests_sd_cmd_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1 = cpu_peripheral_bridge_m1_granted_sd_cmd_s1 & cpu_peripheral_bridge_m1_read & ~sd_cmd_s1_waits_for_read;

  //sd_cmd_s1_writedata mux, which is an e_mux
  assign sd_cmd_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_sd_cmd_s1 = cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1;

  //cpu_peripheral_bridge/m1 saved-grant sd_cmd/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_sd_cmd_s1 = cpu_peripheral_bridge_m1_requests_sd_cmd_s1;

  //allow new arb cycle for sd_cmd/s1, which is an e_assign
  assign sd_cmd_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sd_cmd_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sd_cmd_s1_master_qreq_vector = 1;

  //sd_cmd_s1_reset_n assignment, which is an e_assign
  assign sd_cmd_s1_reset_n = reset_n;

  assign sd_cmd_s1_chipselect = cpu_peripheral_bridge_m1_granted_sd_cmd_s1;
  //sd_cmd_s1_firsttransfer first transaction, which is an e_assign
  assign sd_cmd_s1_firsttransfer = sd_cmd_s1_begins_xfer ? sd_cmd_s1_unreg_firsttransfer : sd_cmd_s1_reg_firsttransfer;

  //sd_cmd_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sd_cmd_s1_unreg_firsttransfer = ~(sd_cmd_s1_slavearbiterlockenable & sd_cmd_s1_any_continuerequest);

  //sd_cmd_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_cmd_s1_reg_firsttransfer <= 1'b1;
      else if (sd_cmd_s1_begins_xfer)
          sd_cmd_s1_reg_firsttransfer <= sd_cmd_s1_unreg_firsttransfer;
    end


  //sd_cmd_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sd_cmd_s1_beginbursttransfer_internal = sd_cmd_s1_begins_xfer;

  //~sd_cmd_s1_write_n assignment, which is an e_mux
  assign sd_cmd_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_sd_cmd_s1 & cpu_peripheral_bridge_m1_write);

  //sd_cmd_s1_address mux, which is an e_mux
  assign sd_cmd_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_sd_cmd_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sd_cmd_s1_end_xfer <= 1;
      else 
        d1_sd_cmd_s1_end_xfer <= sd_cmd_s1_end_xfer;
    end


  //sd_cmd_s1_waits_for_read in a cycle, which is an e_mux
  assign sd_cmd_s1_waits_for_read = sd_cmd_s1_in_a_read_cycle & sd_cmd_s1_begins_xfer;

  //sd_cmd_s1_in_a_read_cycle assignment, which is an e_assign
  assign sd_cmd_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_sd_cmd_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sd_cmd_s1_in_a_read_cycle;

  //sd_cmd_s1_waits_for_write in a cycle, which is an e_mux
  assign sd_cmd_s1_waits_for_write = sd_cmd_s1_in_a_write_cycle & 0;

  //sd_cmd_s1_in_a_write_cycle assignment, which is an e_assign
  assign sd_cmd_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_sd_cmd_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sd_cmd_s1_in_a_write_cycle;

  assign wait_for_sd_cmd_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sd_cmd/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sd_dat_s1_arbitrator (
                              // inputs:
                               clk,
                               cpu_peripheral_bridge_m1_address_to_slave,
                               cpu_peripheral_bridge_m1_latency_counter,
                               cpu_peripheral_bridge_m1_nativeaddress,
                               cpu_peripheral_bridge_m1_read,
                               cpu_peripheral_bridge_m1_write,
                               cpu_peripheral_bridge_m1_writedata,
                               reset_n,
                               sd_dat_s1_readdata,

                              // outputs:
                               cpu_peripheral_bridge_m1_granted_sd_dat_s1,
                               cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1,
                               cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1,
                               cpu_peripheral_bridge_m1_requests_sd_dat_s1,
                               d1_sd_dat_s1_end_xfer,
                               sd_dat_s1_address,
                               sd_dat_s1_chipselect,
                               sd_dat_s1_readdata_from_sa,
                               sd_dat_s1_reset_n,
                               sd_dat_s1_write_n,
                               sd_dat_s1_writedata
                            )
;

  output           cpu_peripheral_bridge_m1_granted_sd_dat_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1;
  output           cpu_peripheral_bridge_m1_requests_sd_dat_s1;
  output           d1_sd_dat_s1_end_xfer;
  output  [  1: 0] sd_dat_s1_address;
  output           sd_dat_s1_chipselect;
  output  [  3: 0] sd_dat_s1_readdata_from_sa;
  output           sd_dat_s1_reset_n;
  output           sd_dat_s1_write_n;
  output  [  3: 0] sd_dat_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            reset_n;
  input   [  3: 0] sd_dat_s1_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_sd_dat_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sd_dat_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sd_dat_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] sd_dat_s1_address;
  wire             sd_dat_s1_allgrants;
  wire             sd_dat_s1_allow_new_arb_cycle;
  wire             sd_dat_s1_any_bursting_master_saved_grant;
  wire             sd_dat_s1_any_continuerequest;
  wire             sd_dat_s1_arb_counter_enable;
  reg              sd_dat_s1_arb_share_counter;
  wire             sd_dat_s1_arb_share_counter_next_value;
  wire             sd_dat_s1_arb_share_set_values;
  wire             sd_dat_s1_beginbursttransfer_internal;
  wire             sd_dat_s1_begins_xfer;
  wire             sd_dat_s1_chipselect;
  wire             sd_dat_s1_end_xfer;
  wire             sd_dat_s1_firsttransfer;
  wire             sd_dat_s1_grant_vector;
  wire             sd_dat_s1_in_a_read_cycle;
  wire             sd_dat_s1_in_a_write_cycle;
  wire             sd_dat_s1_master_qreq_vector;
  wire             sd_dat_s1_non_bursting_master_requests;
  wire    [  3: 0] sd_dat_s1_readdata_from_sa;
  reg              sd_dat_s1_reg_firsttransfer;
  wire             sd_dat_s1_reset_n;
  reg              sd_dat_s1_slavearbiterlockenable;
  wire             sd_dat_s1_slavearbiterlockenable2;
  wire             sd_dat_s1_unreg_firsttransfer;
  wire             sd_dat_s1_waits_for_read;
  wire             sd_dat_s1_waits_for_write;
  wire             sd_dat_s1_write_n;
  wire    [  3: 0] sd_dat_s1_writedata;
  wire             wait_for_sd_dat_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sd_dat_s1_end_xfer;
    end


  assign sd_dat_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1));
  //assign sd_dat_s1_readdata_from_sa = sd_dat_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sd_dat_s1_readdata_from_sa = sd_dat_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_sd_dat_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h80) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //sd_dat_s1_arb_share_counter set values, which is an e_mux
  assign sd_dat_s1_arb_share_set_values = 1;

  //sd_dat_s1_non_bursting_master_requests mux, which is an e_mux
  assign sd_dat_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_sd_dat_s1;

  //sd_dat_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sd_dat_s1_any_bursting_master_saved_grant = 0;

  //sd_dat_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sd_dat_s1_arb_share_counter_next_value = sd_dat_s1_firsttransfer ? (sd_dat_s1_arb_share_set_values - 1) : |sd_dat_s1_arb_share_counter ? (sd_dat_s1_arb_share_counter - 1) : 0;

  //sd_dat_s1_allgrants all slave grants, which is an e_mux
  assign sd_dat_s1_allgrants = |sd_dat_s1_grant_vector;

  //sd_dat_s1_end_xfer assignment, which is an e_assign
  assign sd_dat_s1_end_xfer = ~(sd_dat_s1_waits_for_read | sd_dat_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sd_dat_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sd_dat_s1 = sd_dat_s1_end_xfer & (~sd_dat_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sd_dat_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sd_dat_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sd_dat_s1 & sd_dat_s1_allgrants) | (end_xfer_arb_share_counter_term_sd_dat_s1 & ~sd_dat_s1_non_bursting_master_requests);

  //sd_dat_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_dat_s1_arb_share_counter <= 0;
      else if (sd_dat_s1_arb_counter_enable)
          sd_dat_s1_arb_share_counter <= sd_dat_s1_arb_share_counter_next_value;
    end


  //sd_dat_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_dat_s1_slavearbiterlockenable <= 0;
      else if ((|sd_dat_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sd_dat_s1) | (end_xfer_arb_share_counter_term_sd_dat_s1 & ~sd_dat_s1_non_bursting_master_requests))
          sd_dat_s1_slavearbiterlockenable <= |sd_dat_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 sd_dat/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = sd_dat_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //sd_dat_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sd_dat_s1_slavearbiterlockenable2 = |sd_dat_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 sd_dat/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = sd_dat_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //sd_dat_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sd_dat_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1 = cpu_peripheral_bridge_m1_requests_sd_dat_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1 = cpu_peripheral_bridge_m1_granted_sd_dat_s1 & cpu_peripheral_bridge_m1_read & ~sd_dat_s1_waits_for_read;

  //sd_dat_s1_writedata mux, which is an e_mux
  assign sd_dat_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_sd_dat_s1 = cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1;

  //cpu_peripheral_bridge/m1 saved-grant sd_dat/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_sd_dat_s1 = cpu_peripheral_bridge_m1_requests_sd_dat_s1;

  //allow new arb cycle for sd_dat/s1, which is an e_assign
  assign sd_dat_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sd_dat_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sd_dat_s1_master_qreq_vector = 1;

  //sd_dat_s1_reset_n assignment, which is an e_assign
  assign sd_dat_s1_reset_n = reset_n;

  assign sd_dat_s1_chipselect = cpu_peripheral_bridge_m1_granted_sd_dat_s1;
  //sd_dat_s1_firsttransfer first transaction, which is an e_assign
  assign sd_dat_s1_firsttransfer = sd_dat_s1_begins_xfer ? sd_dat_s1_unreg_firsttransfer : sd_dat_s1_reg_firsttransfer;

  //sd_dat_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sd_dat_s1_unreg_firsttransfer = ~(sd_dat_s1_slavearbiterlockenable & sd_dat_s1_any_continuerequest);

  //sd_dat_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_dat_s1_reg_firsttransfer <= 1'b1;
      else if (sd_dat_s1_begins_xfer)
          sd_dat_s1_reg_firsttransfer <= sd_dat_s1_unreg_firsttransfer;
    end


  //sd_dat_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sd_dat_s1_beginbursttransfer_internal = sd_dat_s1_begins_xfer;

  //~sd_dat_s1_write_n assignment, which is an e_mux
  assign sd_dat_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_sd_dat_s1 & cpu_peripheral_bridge_m1_write);

  //sd_dat_s1_address mux, which is an e_mux
  assign sd_dat_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_sd_dat_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sd_dat_s1_end_xfer <= 1;
      else 
        d1_sd_dat_s1_end_xfer <= sd_dat_s1_end_xfer;
    end


  //sd_dat_s1_waits_for_read in a cycle, which is an e_mux
  assign sd_dat_s1_waits_for_read = sd_dat_s1_in_a_read_cycle & sd_dat_s1_begins_xfer;

  //sd_dat_s1_in_a_read_cycle assignment, which is an e_assign
  assign sd_dat_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_sd_dat_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sd_dat_s1_in_a_read_cycle;

  //sd_dat_s1_waits_for_write in a cycle, which is an e_mux
  assign sd_dat_s1_waits_for_write = sd_dat_s1_in_a_write_cycle & 0;

  //sd_dat_s1_in_a_write_cycle assignment, which is an e_assign
  assign sd_dat_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_sd_dat_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sd_dat_s1_in_a_write_cycle;

  assign wait_for_sd_dat_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sd_dat/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sd_wp_n_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_peripheral_bridge_m1_address_to_slave,
                                cpu_peripheral_bridge_m1_latency_counter,
                                cpu_peripheral_bridge_m1_nativeaddress,
                                cpu_peripheral_bridge_m1_read,
                                cpu_peripheral_bridge_m1_write,
                                reset_n,
                                sd_wp_n_s1_readdata,

                               // outputs:
                                cpu_peripheral_bridge_m1_granted_sd_wp_n_s1,
                                cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1,
                                cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1,
                                cpu_peripheral_bridge_m1_requests_sd_wp_n_s1,
                                d1_sd_wp_n_s1_end_xfer,
                                sd_wp_n_s1_address,
                                sd_wp_n_s1_readdata_from_sa,
                                sd_wp_n_s1_reset_n
                             )
;

  output           cpu_peripheral_bridge_m1_granted_sd_wp_n_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1;
  output           cpu_peripheral_bridge_m1_requests_sd_wp_n_s1;
  output           d1_sd_wp_n_s1_end_xfer;
  output  [  1: 0] sd_wp_n_s1_address;
  output           sd_wp_n_s1_readdata_from_sa;
  output           sd_wp_n_s1_reset_n;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input            reset_n;
  input            sd_wp_n_s1_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_sd_wp_n_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sd_wp_n_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sd_wp_n_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] sd_wp_n_s1_address;
  wire             sd_wp_n_s1_allgrants;
  wire             sd_wp_n_s1_allow_new_arb_cycle;
  wire             sd_wp_n_s1_any_bursting_master_saved_grant;
  wire             sd_wp_n_s1_any_continuerequest;
  wire             sd_wp_n_s1_arb_counter_enable;
  reg              sd_wp_n_s1_arb_share_counter;
  wire             sd_wp_n_s1_arb_share_counter_next_value;
  wire             sd_wp_n_s1_arb_share_set_values;
  wire             sd_wp_n_s1_beginbursttransfer_internal;
  wire             sd_wp_n_s1_begins_xfer;
  wire             sd_wp_n_s1_end_xfer;
  wire             sd_wp_n_s1_firsttransfer;
  wire             sd_wp_n_s1_grant_vector;
  wire             sd_wp_n_s1_in_a_read_cycle;
  wire             sd_wp_n_s1_in_a_write_cycle;
  wire             sd_wp_n_s1_master_qreq_vector;
  wire             sd_wp_n_s1_non_bursting_master_requests;
  wire             sd_wp_n_s1_readdata_from_sa;
  reg              sd_wp_n_s1_reg_firsttransfer;
  wire             sd_wp_n_s1_reset_n;
  reg              sd_wp_n_s1_slavearbiterlockenable;
  wire             sd_wp_n_s1_slavearbiterlockenable2;
  wire             sd_wp_n_s1_unreg_firsttransfer;
  wire             sd_wp_n_s1_waits_for_read;
  wire             sd_wp_n_s1_waits_for_write;
  wire             wait_for_sd_wp_n_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sd_wp_n_s1_end_xfer;
    end


  assign sd_wp_n_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1));
  //assign sd_wp_n_s1_readdata_from_sa = sd_wp_n_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sd_wp_n_s1_readdata_from_sa = sd_wp_n_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_sd_wp_n_s1 = (({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'h90) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write)) & cpu_peripheral_bridge_m1_read;
  //sd_wp_n_s1_arb_share_counter set values, which is an e_mux
  assign sd_wp_n_s1_arb_share_set_values = 1;

  //sd_wp_n_s1_non_bursting_master_requests mux, which is an e_mux
  assign sd_wp_n_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_sd_wp_n_s1;

  //sd_wp_n_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sd_wp_n_s1_any_bursting_master_saved_grant = 0;

  //sd_wp_n_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sd_wp_n_s1_arb_share_counter_next_value = sd_wp_n_s1_firsttransfer ? (sd_wp_n_s1_arb_share_set_values - 1) : |sd_wp_n_s1_arb_share_counter ? (sd_wp_n_s1_arb_share_counter - 1) : 0;

  //sd_wp_n_s1_allgrants all slave grants, which is an e_mux
  assign sd_wp_n_s1_allgrants = |sd_wp_n_s1_grant_vector;

  //sd_wp_n_s1_end_xfer assignment, which is an e_assign
  assign sd_wp_n_s1_end_xfer = ~(sd_wp_n_s1_waits_for_read | sd_wp_n_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sd_wp_n_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sd_wp_n_s1 = sd_wp_n_s1_end_xfer & (~sd_wp_n_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sd_wp_n_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sd_wp_n_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sd_wp_n_s1 & sd_wp_n_s1_allgrants) | (end_xfer_arb_share_counter_term_sd_wp_n_s1 & ~sd_wp_n_s1_non_bursting_master_requests);

  //sd_wp_n_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_wp_n_s1_arb_share_counter <= 0;
      else if (sd_wp_n_s1_arb_counter_enable)
          sd_wp_n_s1_arb_share_counter <= sd_wp_n_s1_arb_share_counter_next_value;
    end


  //sd_wp_n_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_wp_n_s1_slavearbiterlockenable <= 0;
      else if ((|sd_wp_n_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sd_wp_n_s1) | (end_xfer_arb_share_counter_term_sd_wp_n_s1 & ~sd_wp_n_s1_non_bursting_master_requests))
          sd_wp_n_s1_slavearbiterlockenable <= |sd_wp_n_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 sd_wp_n/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = sd_wp_n_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //sd_wp_n_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sd_wp_n_s1_slavearbiterlockenable2 = |sd_wp_n_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 sd_wp_n/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = sd_wp_n_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //sd_wp_n_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sd_wp_n_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1 = cpu_peripheral_bridge_m1_requests_sd_wp_n_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1 = cpu_peripheral_bridge_m1_granted_sd_wp_n_s1 & cpu_peripheral_bridge_m1_read & ~sd_wp_n_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_sd_wp_n_s1 = cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1;

  //cpu_peripheral_bridge/m1 saved-grant sd_wp_n/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_sd_wp_n_s1 = cpu_peripheral_bridge_m1_requests_sd_wp_n_s1;

  //allow new arb cycle for sd_wp_n/s1, which is an e_assign
  assign sd_wp_n_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sd_wp_n_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sd_wp_n_s1_master_qreq_vector = 1;

  //sd_wp_n_s1_reset_n assignment, which is an e_assign
  assign sd_wp_n_s1_reset_n = reset_n;

  //sd_wp_n_s1_firsttransfer first transaction, which is an e_assign
  assign sd_wp_n_s1_firsttransfer = sd_wp_n_s1_begins_xfer ? sd_wp_n_s1_unreg_firsttransfer : sd_wp_n_s1_reg_firsttransfer;

  //sd_wp_n_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sd_wp_n_s1_unreg_firsttransfer = ~(sd_wp_n_s1_slavearbiterlockenable & sd_wp_n_s1_any_continuerequest);

  //sd_wp_n_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_wp_n_s1_reg_firsttransfer <= 1'b1;
      else if (sd_wp_n_s1_begins_xfer)
          sd_wp_n_s1_reg_firsttransfer <= sd_wp_n_s1_unreg_firsttransfer;
    end


  //sd_wp_n_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sd_wp_n_s1_beginbursttransfer_internal = sd_wp_n_s1_begins_xfer;

  //sd_wp_n_s1_address mux, which is an e_mux
  assign sd_wp_n_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_sd_wp_n_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sd_wp_n_s1_end_xfer <= 1;
      else 
        d1_sd_wp_n_s1_end_xfer <= sd_wp_n_s1_end_xfer;
    end


  //sd_wp_n_s1_waits_for_read in a cycle, which is an e_mux
  assign sd_wp_n_s1_waits_for_read = sd_wp_n_s1_in_a_read_cycle & sd_wp_n_s1_begins_xfer;

  //sd_wp_n_s1_in_a_read_cycle assignment, which is an e_assign
  assign sd_wp_n_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_sd_wp_n_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sd_wp_n_s1_in_a_read_cycle;

  //sd_wp_n_s1_waits_for_write in a cycle, which is an e_mux
  assign sd_wp_n_s1_waits_for_write = sd_wp_n_s1_in_a_write_cycle & 0;

  //sd_wp_n_s1_in_a_write_cycle assignment, which is an e_assign
  assign sd_wp_n_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_sd_wp_n_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sd_wp_n_s1_in_a_write_cycle;

  assign wait_for_sd_wp_n_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sd_wp_n/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sdram_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_byteenable,
                              cpu_data_master_latency_counter,
                              cpu_data_master_read,
                              cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,

                             // outputs:
                              cpu_data_master_granted_sdram_s1,
                              cpu_data_master_qualified_request_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                              cpu_data_master_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata
                           )
;

  output           cpu_data_master_granted_sdram_s1;
  output           cpu_data_master_qualified_request_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_data_master_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 24: 0] sdram_s1_address;
  output  [  3: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 31: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 31: 0] sdram_s1_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_data_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  wire             sdram_s1_arb_counter_enable;
  reg     [  2: 0] sdram_s1_arb_share_counter;
  wire    [  2: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  2: 0] sdram_s1_arb_share_set_values;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire             sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire             sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire    [ 27: 0] shifted_address_to_sdram_s1_from_cpu_data_master;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sdram_s1));
  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign cpu_data_master_requests_sdram_s1 = ({cpu_data_master_address_to_slave[27] , 27'b0} == 28'h0) & (cpu_data_master_read | cpu_data_master_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = 1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = cpu_data_master_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = |sdram_s1_grant_vector;

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sdram_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sdram_s1 = cpu_data_master_requests_sdram_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register))));
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1_module rdv_fifo_for_cpu_data_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sdram_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sdram_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sdram_s1 = sdram_s1_readdatavalid_from_sa;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sdram_s1 = cpu_data_master_qualified_request_sdram_s1;

  //cpu/data_master saved-grant sdram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sdram_s1 = cpu_data_master_requests_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sdram_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sdram_s1_master_qreq_vector = 1;

  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = cpu_data_master_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~(cpu_data_master_granted_sdram_s1 & cpu_data_master_read);

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~(cpu_data_master_granted_sdram_s1 & cpu_data_master_write);

  assign shifted_address_to_sdram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = shifted_address_to_sdram_s1_from_cpu_data_master >> 2;

  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = cpu_data_master_granted_sdram_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = cpu_data_master_granted_sdram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((cpu_data_master_granted_sdram_s1)? cpu_data_master_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module seg7_avalon_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_peripheral_bridge_m1_address_to_slave,
                                       cpu_peripheral_bridge_m1_byteenable,
                                       cpu_peripheral_bridge_m1_latency_counter,
                                       cpu_peripheral_bridge_m1_nativeaddress,
                                       cpu_peripheral_bridge_m1_read,
                                       cpu_peripheral_bridge_m1_write,
                                       cpu_peripheral_bridge_m1_writedata,
                                       reset_n,
                                       seg7_avalon_slave_readdata,

                                      // outputs:
                                       cpu_peripheral_bridge_m1_granted_seg7_avalon_slave,
                                       cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave,
                                       cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave,
                                       cpu_peripheral_bridge_m1_requests_seg7_avalon_slave,
                                       d1_seg7_avalon_slave_end_xfer,
                                       seg7_avalon_slave_address,
                                       seg7_avalon_slave_read,
                                       seg7_avalon_slave_readdata_from_sa,
                                       seg7_avalon_slave_reset,
                                       seg7_avalon_slave_write,
                                       seg7_avalon_slave_writedata
                                    )
;

  output           cpu_peripheral_bridge_m1_granted_seg7_avalon_slave;
  output           cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave;
  output           cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave;
  output           cpu_peripheral_bridge_m1_requests_seg7_avalon_slave;
  output           d1_seg7_avalon_slave_end_xfer;
  output  [  2: 0] seg7_avalon_slave_address;
  output           seg7_avalon_slave_read;
  output  [  7: 0] seg7_avalon_slave_readdata_from_sa;
  output           seg7_avalon_slave_reset;
  output           seg7_avalon_slave_write;
  output  [  7: 0] seg7_avalon_slave_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input   [  3: 0] cpu_peripheral_bridge_m1_byteenable;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            reset_n;
  input   [  7: 0] seg7_avalon_slave_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_requests_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_saved_grant_seg7_avalon_slave;
  reg              d1_reasons_to_wait;
  reg              d1_seg7_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_seg7_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] seg7_avalon_slave_address;
  wire             seg7_avalon_slave_allgrants;
  wire             seg7_avalon_slave_allow_new_arb_cycle;
  wire             seg7_avalon_slave_any_bursting_master_saved_grant;
  wire             seg7_avalon_slave_any_continuerequest;
  wire             seg7_avalon_slave_arb_counter_enable;
  reg              seg7_avalon_slave_arb_share_counter;
  wire             seg7_avalon_slave_arb_share_counter_next_value;
  wire             seg7_avalon_slave_arb_share_set_values;
  wire             seg7_avalon_slave_beginbursttransfer_internal;
  wire             seg7_avalon_slave_begins_xfer;
  wire             seg7_avalon_slave_end_xfer;
  wire             seg7_avalon_slave_firsttransfer;
  wire             seg7_avalon_slave_grant_vector;
  wire             seg7_avalon_slave_in_a_read_cycle;
  wire             seg7_avalon_slave_in_a_write_cycle;
  wire             seg7_avalon_slave_master_qreq_vector;
  wire             seg7_avalon_slave_non_bursting_master_requests;
  wire             seg7_avalon_slave_pretend_byte_enable;
  wire             seg7_avalon_slave_read;
  wire    [  7: 0] seg7_avalon_slave_readdata_from_sa;
  reg              seg7_avalon_slave_reg_firsttransfer;
  wire             seg7_avalon_slave_reset;
  reg              seg7_avalon_slave_slavearbiterlockenable;
  wire             seg7_avalon_slave_slavearbiterlockenable2;
  wire             seg7_avalon_slave_unreg_firsttransfer;
  wire             seg7_avalon_slave_waits_for_read;
  wire             seg7_avalon_slave_waits_for_write;
  wire             seg7_avalon_slave_write;
  wire    [  7: 0] seg7_avalon_slave_writedata;
  wire             wait_for_seg7_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~seg7_avalon_slave_end_xfer;
    end


  assign seg7_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave));
  //assign seg7_avalon_slave_readdata_from_sa = seg7_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign seg7_avalon_slave_readdata_from_sa = seg7_avalon_slave_readdata;

  assign cpu_peripheral_bridge_m1_requests_seg7_avalon_slave = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 5] , 5'b0} == 9'h20) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //seg7_avalon_slave_arb_share_counter set values, which is an e_mux
  assign seg7_avalon_slave_arb_share_set_values = 1;

  //seg7_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign seg7_avalon_slave_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_seg7_avalon_slave;

  //seg7_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign seg7_avalon_slave_any_bursting_master_saved_grant = 0;

  //seg7_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign seg7_avalon_slave_arb_share_counter_next_value = seg7_avalon_slave_firsttransfer ? (seg7_avalon_slave_arb_share_set_values - 1) : |seg7_avalon_slave_arb_share_counter ? (seg7_avalon_slave_arb_share_counter - 1) : 0;

  //seg7_avalon_slave_allgrants all slave grants, which is an e_mux
  assign seg7_avalon_slave_allgrants = |seg7_avalon_slave_grant_vector;

  //seg7_avalon_slave_end_xfer assignment, which is an e_assign
  assign seg7_avalon_slave_end_xfer = ~(seg7_avalon_slave_waits_for_read | seg7_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_seg7_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_seg7_avalon_slave = seg7_avalon_slave_end_xfer & (~seg7_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //seg7_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign seg7_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_seg7_avalon_slave & seg7_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_seg7_avalon_slave & ~seg7_avalon_slave_non_bursting_master_requests);

  //seg7_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seg7_avalon_slave_arb_share_counter <= 0;
      else if (seg7_avalon_slave_arb_counter_enable)
          seg7_avalon_slave_arb_share_counter <= seg7_avalon_slave_arb_share_counter_next_value;
    end


  //seg7_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seg7_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|seg7_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_seg7_avalon_slave) | (end_xfer_arb_share_counter_term_seg7_avalon_slave & ~seg7_avalon_slave_non_bursting_master_requests))
          seg7_avalon_slave_slavearbiterlockenable <= |seg7_avalon_slave_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 seg7/avalon_slave arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = seg7_avalon_slave_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //seg7_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign seg7_avalon_slave_slavearbiterlockenable2 = |seg7_avalon_slave_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 seg7/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = seg7_avalon_slave_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //seg7_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign seg7_avalon_slave_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave = cpu_peripheral_bridge_m1_requests_seg7_avalon_slave & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave = cpu_peripheral_bridge_m1_granted_seg7_avalon_slave & cpu_peripheral_bridge_m1_read & ~seg7_avalon_slave_waits_for_read;

  //seg7_avalon_slave_writedata mux, which is an e_mux
  assign seg7_avalon_slave_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_seg7_avalon_slave = cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave;

  //cpu_peripheral_bridge/m1 saved-grant seg7/avalon_slave, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_seg7_avalon_slave = cpu_peripheral_bridge_m1_requests_seg7_avalon_slave;

  //allow new arb cycle for seg7/avalon_slave, which is an e_assign
  assign seg7_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign seg7_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign seg7_avalon_slave_master_qreq_vector = 1;

  //~seg7_avalon_slave_reset assignment, which is an e_assign
  assign seg7_avalon_slave_reset = ~reset_n;

  //seg7_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign seg7_avalon_slave_firsttransfer = seg7_avalon_slave_begins_xfer ? seg7_avalon_slave_unreg_firsttransfer : seg7_avalon_slave_reg_firsttransfer;

  //seg7_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign seg7_avalon_slave_unreg_firsttransfer = ~(seg7_avalon_slave_slavearbiterlockenable & seg7_avalon_slave_any_continuerequest);

  //seg7_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seg7_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (seg7_avalon_slave_begins_xfer)
          seg7_avalon_slave_reg_firsttransfer <= seg7_avalon_slave_unreg_firsttransfer;
    end


  //seg7_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign seg7_avalon_slave_beginbursttransfer_internal = seg7_avalon_slave_begins_xfer;

  //seg7_avalon_slave_read assignment, which is an e_mux
  assign seg7_avalon_slave_read = cpu_peripheral_bridge_m1_granted_seg7_avalon_slave & cpu_peripheral_bridge_m1_read;

  //seg7_avalon_slave_write assignment, which is an e_mux
  assign seg7_avalon_slave_write = ((cpu_peripheral_bridge_m1_granted_seg7_avalon_slave & cpu_peripheral_bridge_m1_write)) & seg7_avalon_slave_pretend_byte_enable;

  //seg7_avalon_slave_address mux, which is an e_mux
  assign seg7_avalon_slave_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_seg7_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_seg7_avalon_slave_end_xfer <= 1;
      else 
        d1_seg7_avalon_slave_end_xfer <= seg7_avalon_slave_end_xfer;
    end


  //seg7_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign seg7_avalon_slave_waits_for_read = seg7_avalon_slave_in_a_read_cycle & 0;

  //seg7_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign seg7_avalon_slave_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_seg7_avalon_slave & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = seg7_avalon_slave_in_a_read_cycle;

  //seg7_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign seg7_avalon_slave_waits_for_write = seg7_avalon_slave_in_a_write_cycle & 0;

  //seg7_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign seg7_avalon_slave_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_seg7_avalon_slave & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = seg7_avalon_slave_in_a_write_cycle;

  assign wait_for_seg7_avalon_slave_counter = 0;
  //seg7_avalon_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign seg7_avalon_slave_pretend_byte_enable = (cpu_peripheral_bridge_m1_granted_seg7_avalon_slave)? cpu_peripheral_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //seg7/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_avalon_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_byteenable,
                                       cpu_data_master_dbs_address,
                                       cpu_data_master_dbs_write_16,
                                       cpu_data_master_latency_counter,
                                       cpu_data_master_read,
                                       cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                       cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                       cpu_data_master_write,
                                       cpu_instruction_master_address_to_slave,
                                       cpu_instruction_master_dbs_address,
                                       cpu_instruction_master_latency_counter,
                                       cpu_instruction_master_read,
                                       reset_n,
                                       sram_avalon_slave_readdata,

                                      // outputs:
                                       cpu_data_master_byteenable_sram_avalon_slave,
                                       cpu_data_master_granted_sram_avalon_slave,
                                       cpu_data_master_qualified_request_sram_avalon_slave,
                                       cpu_data_master_read_data_valid_sram_avalon_slave,
                                       cpu_data_master_requests_sram_avalon_slave,
                                       cpu_instruction_master_granted_sram_avalon_slave,
                                       cpu_instruction_master_qualified_request_sram_avalon_slave,
                                       cpu_instruction_master_read_data_valid_sram_avalon_slave,
                                       cpu_instruction_master_requests_sram_avalon_slave,
                                       d1_sram_avalon_slave_end_xfer,
                                       sram_avalon_slave_address,
                                       sram_avalon_slave_byteenable_n,
                                       sram_avalon_slave_chipselect_n,
                                       sram_avalon_slave_read_n,
                                       sram_avalon_slave_readdata_from_sa,
                                       sram_avalon_slave_reset_n,
                                       sram_avalon_slave_wait_counter_eq_0,
                                       sram_avalon_slave_write_n,
                                       sram_avalon_slave_writedata
                                    )
;

  output  [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  output           cpu_data_master_granted_sram_avalon_slave;
  output           cpu_data_master_qualified_request_sram_avalon_slave;
  output           cpu_data_master_read_data_valid_sram_avalon_slave;
  output           cpu_data_master_requests_sram_avalon_slave;
  output           cpu_instruction_master_granted_sram_avalon_slave;
  output           cpu_instruction_master_qualified_request_sram_avalon_slave;
  output           cpu_instruction_master_read_data_valid_sram_avalon_slave;
  output           cpu_instruction_master_requests_sram_avalon_slave;
  output           d1_sram_avalon_slave_end_xfer;
  output  [ 19: 0] sram_avalon_slave_address;
  output  [  1: 0] sram_avalon_slave_byteenable_n;
  output           sram_avalon_slave_chipselect_n;
  output           sram_avalon_slave_read_n;
  output  [ 15: 0] sram_avalon_slave_readdata_from_sa;
  output           sram_avalon_slave_reset_n;
  output           sram_avalon_slave_wait_counter_eq_0;
  output           sram_avalon_slave_write_n;
  output  [ 15: 0] sram_avalon_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sram_avalon_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sram_avalon_slave;
  wire             cpu_data_master_qualified_request_sram_avalon_slave;
  wire             cpu_data_master_read_data_valid_sram_avalon_slave;
  wire             cpu_data_master_requests_sram_avalon_slave;
  wire             cpu_data_master_saved_grant_sram_avalon_slave;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sram_avalon_slave;
  wire             cpu_instruction_master_qualified_request_sram_avalon_slave;
  wire             cpu_instruction_master_read_data_valid_sram_avalon_slave;
  wire             cpu_instruction_master_requests_sram_avalon_slave;
  wire             cpu_instruction_master_saved_grant_sram_avalon_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sram_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_sram_avalon_slave;
  reg              last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave;
  wire    [ 27: 0] shifted_address_to_sram_avalon_slave_from_cpu_data_master;
  wire    [ 27: 0] shifted_address_to_sram_avalon_slave_from_cpu_instruction_master;
  wire    [ 19: 0] sram_avalon_slave_address;
  wire             sram_avalon_slave_allgrants;
  wire             sram_avalon_slave_allow_new_arb_cycle;
  wire             sram_avalon_slave_any_bursting_master_saved_grant;
  wire             sram_avalon_slave_any_continuerequest;
  reg     [  1: 0] sram_avalon_slave_arb_addend;
  wire             sram_avalon_slave_arb_counter_enable;
  reg     [  2: 0] sram_avalon_slave_arb_share_counter;
  wire    [  2: 0] sram_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] sram_avalon_slave_arb_share_set_values;
  wire    [  1: 0] sram_avalon_slave_arb_winner;
  wire             sram_avalon_slave_arbitration_holdoff_internal;
  wire             sram_avalon_slave_beginbursttransfer_internal;
  wire             sram_avalon_slave_begins_xfer;
  wire    [  1: 0] sram_avalon_slave_byteenable_n;
  wire             sram_avalon_slave_chipselect_n;
  wire    [  3: 0] sram_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] sram_avalon_slave_chosen_master_rot_left;
  wire    [  1: 0] sram_avalon_slave_counter_load_value;
  wire             sram_avalon_slave_end_xfer;
  wire             sram_avalon_slave_firsttransfer;
  wire    [  1: 0] sram_avalon_slave_grant_vector;
  wire             sram_avalon_slave_in_a_read_cycle;
  wire             sram_avalon_slave_in_a_write_cycle;
  wire    [  1: 0] sram_avalon_slave_master_qreq_vector;
  wire             sram_avalon_slave_non_bursting_master_requests;
  wire             sram_avalon_slave_read_n;
  wire    [ 15: 0] sram_avalon_slave_readdata_from_sa;
  reg              sram_avalon_slave_reg_firsttransfer;
  wire             sram_avalon_slave_reset_n;
  reg     [  1: 0] sram_avalon_slave_saved_chosen_master_vector;
  reg              sram_avalon_slave_slavearbiterlockenable;
  wire             sram_avalon_slave_slavearbiterlockenable2;
  wire             sram_avalon_slave_unreg_firsttransfer;
  reg     [  1: 0] sram_avalon_slave_wait_counter;
  wire             sram_avalon_slave_wait_counter_eq_0;
  wire             sram_avalon_slave_waits_for_read;
  wire             sram_avalon_slave_waits_for_write;
  wire             sram_avalon_slave_write_n;
  wire    [ 15: 0] sram_avalon_slave_writedata;
  wire             wait_for_sram_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_avalon_slave_end_xfer;
    end


  assign sram_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sram_avalon_slave | cpu_instruction_master_qualified_request_sram_avalon_slave));
  //assign sram_avalon_slave_readdata_from_sa = sram_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_avalon_slave_readdata_from_sa = sram_avalon_slave_readdata;

  assign cpu_data_master_requests_sram_avalon_slave = ({cpu_data_master_address_to_slave[27 : 21] , 21'b0} == 28'ha800000) & (cpu_data_master_read | cpu_data_master_write);
  //sram_avalon_slave_arb_share_counter set values, which is an e_mux
  assign sram_avalon_slave_arb_share_set_values = (cpu_data_master_granted_sram_avalon_slave)? 2 :
    (cpu_instruction_master_granted_sram_avalon_slave)? 2 :
    (cpu_data_master_granted_sram_avalon_slave)? 2 :
    (cpu_instruction_master_granted_sram_avalon_slave)? 2 :
    1;

  //sram_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign sram_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_sram_avalon_slave |
    cpu_instruction_master_requests_sram_avalon_slave |
    cpu_data_master_requests_sram_avalon_slave |
    cpu_instruction_master_requests_sram_avalon_slave;

  //sram_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_avalon_slave_any_bursting_master_saved_grant = 0;

  //sram_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_avalon_slave_arb_share_counter_next_value = sram_avalon_slave_firsttransfer ? (sram_avalon_slave_arb_share_set_values - 1) : |sram_avalon_slave_arb_share_counter ? (sram_avalon_slave_arb_share_counter - 1) : 0;

  //sram_avalon_slave_allgrants all slave grants, which is an e_mux
  assign sram_avalon_slave_allgrants = (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector);

  //sram_avalon_slave_end_xfer assignment, which is an e_assign
  assign sram_avalon_slave_end_xfer = ~(sram_avalon_slave_waits_for_read | sram_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_avalon_slave = sram_avalon_slave_end_xfer & (~sram_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_avalon_slave & sram_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_sram_avalon_slave & ~sram_avalon_slave_non_bursting_master_requests);

  //sram_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_arb_share_counter <= 0;
      else if (sram_avalon_slave_arb_counter_enable)
          sram_avalon_slave_arb_share_counter <= sram_avalon_slave_arb_share_counter_next_value;
    end


  //sram_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|sram_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sram_avalon_slave) | (end_xfer_arb_share_counter_term_sram_avalon_slave & ~sram_avalon_slave_non_bursting_master_requests))
          sram_avalon_slave_slavearbiterlockenable <= |sram_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sram/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sram_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sram_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_avalon_slave_slavearbiterlockenable2 = |sram_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master sram/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sram_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master sram/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sram_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sram/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sram_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sram/avalon_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave <= cpu_instruction_master_saved_grant_sram_avalon_slave ? 1 : (sram_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sram_avalon_slave) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave & cpu_instruction_master_requests_sram_avalon_slave;

  //sram_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_sram_avalon_slave = cpu_data_master_requests_sram_avalon_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((!cpu_data_master_byteenable_sram_avalon_slave) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_sram_avalon_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sram_avalon_slave = cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read & ~sram_avalon_slave_waits_for_read;

  //sram_avalon_slave_writedata mux, which is an e_mux
  assign sram_avalon_slave_writedata = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_sram_avalon_slave = (({cpu_instruction_master_address_to_slave[27 : 21] , 21'b0} == 28'ha800000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted sram/avalon_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sram_avalon_slave <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sram_avalon_slave <= cpu_data_master_saved_grant_sram_avalon_slave ? 1 : (sram_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_sram_avalon_slave) ? 0 : last_cycle_cpu_data_master_granted_slave_sram_avalon_slave;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_sram_avalon_slave & cpu_data_master_requests_sram_avalon_slave;

  assign cpu_instruction_master_qualified_request_sram_avalon_slave = cpu_instruction_master_requests_sram_avalon_slave & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_sram_avalon_slave, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sram_avalon_slave = cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read & ~sram_avalon_slave_waits_for_read;

  //allow new arb cycle for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_sram_avalon_slave;

  //cpu/instruction_master grant sram/avalon_slave, which is an e_assign
  assign cpu_instruction_master_granted_sram_avalon_slave = sram_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant sram/avalon_slave, which is an e_assign
  assign cpu_instruction_master_saved_grant_sram_avalon_slave = sram_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_sram_avalon_slave;

  //cpu/data_master assignment into master qualified-requests vector for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_sram_avalon_slave;

  //cpu/data_master grant sram/avalon_slave, which is an e_assign
  assign cpu_data_master_granted_sram_avalon_slave = sram_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant sram/avalon_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sram_avalon_slave = sram_avalon_slave_arb_winner[1] && cpu_data_master_requests_sram_avalon_slave;

  //sram/avalon_slave chosen-master double-vector, which is an e_assign
  assign sram_avalon_slave_chosen_master_double_vector = {sram_avalon_slave_master_qreq_vector, sram_avalon_slave_master_qreq_vector} & ({~sram_avalon_slave_master_qreq_vector, ~sram_avalon_slave_master_qreq_vector} + sram_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_avalon_slave_arb_winner = (sram_avalon_slave_allow_new_arb_cycle & | sram_avalon_slave_grant_vector) ? sram_avalon_slave_grant_vector : sram_avalon_slave_saved_chosen_master_vector;

  //saved sram_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_saved_chosen_master_vector <= 0;
      else if (sram_avalon_slave_allow_new_arb_cycle)
          sram_avalon_slave_saved_chosen_master_vector <= |sram_avalon_slave_grant_vector ? sram_avalon_slave_grant_vector : sram_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_avalon_slave_grant_vector = {(sram_avalon_slave_chosen_master_double_vector[1] | sram_avalon_slave_chosen_master_double_vector[3]),
    (sram_avalon_slave_chosen_master_double_vector[0] | sram_avalon_slave_chosen_master_double_vector[2])};

  //sram/avalon_slave chosen master rotated left, which is an e_assign
  assign sram_avalon_slave_chosen_master_rot_left = (sram_avalon_slave_arb_winner << 1) ? (sram_avalon_slave_arb_winner << 1) : 1;

  //sram/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_arb_addend <= 1;
      else if (|sram_avalon_slave_grant_vector)
          sram_avalon_slave_arb_addend <= sram_avalon_slave_end_xfer? sram_avalon_slave_chosen_master_rot_left : sram_avalon_slave_grant_vector;
    end


  //sram_avalon_slave_reset_n assignment, which is an e_assign
  assign sram_avalon_slave_reset_n = reset_n;

  assign sram_avalon_slave_chipselect_n = ~(cpu_data_master_granted_sram_avalon_slave | cpu_instruction_master_granted_sram_avalon_slave);
  //sram_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_slave_firsttransfer = sram_avalon_slave_begins_xfer ? sram_avalon_slave_unreg_firsttransfer : sram_avalon_slave_reg_firsttransfer;

  //sram_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_slave_unreg_firsttransfer = ~(sram_avalon_slave_slavearbiterlockenable & sram_avalon_slave_any_continuerequest);

  //sram_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (sram_avalon_slave_begins_xfer)
          sram_avalon_slave_reg_firsttransfer <= sram_avalon_slave_unreg_firsttransfer;
    end


  //sram_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_avalon_slave_beginbursttransfer_internal = sram_avalon_slave_begins_xfer;

  //sram_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_avalon_slave_arbitration_holdoff_internal = sram_avalon_slave_begins_xfer & sram_avalon_slave_firsttransfer;

  //~sram_avalon_slave_read_n assignment, which is an e_mux
  assign sram_avalon_slave_read_n = ~(((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read) | (cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read))& ~sram_avalon_slave_begins_xfer);

  //~sram_avalon_slave_write_n assignment, which is an e_mux
  assign sram_avalon_slave_write_n = ~(((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write)) & ~sram_avalon_slave_begins_xfer & (sram_avalon_slave_wait_counter >= 1));

  assign shifted_address_to_sram_avalon_slave_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_avalon_slave_address mux, which is an e_mux
  assign sram_avalon_slave_address = (cpu_data_master_granted_sram_avalon_slave)? (shifted_address_to_sram_avalon_slave_from_cpu_data_master >> 1) :
    (shifted_address_to_sram_avalon_slave_from_cpu_instruction_master >> 1);

  assign shifted_address_to_sram_avalon_slave_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sram_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_avalon_slave_end_xfer <= 1;
      else 
        d1_sram_avalon_slave_end_xfer <= sram_avalon_slave_end_xfer;
    end


  //sram_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign sram_avalon_slave_waits_for_read = sram_avalon_slave_in_a_read_cycle & wait_for_sram_avalon_slave_counter;

  //sram_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign sram_avalon_slave_in_a_read_cycle = (cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read) | (cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_avalon_slave_in_a_read_cycle;

  //sram_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign sram_avalon_slave_waits_for_write = sram_avalon_slave_in_a_write_cycle & wait_for_sram_avalon_slave_counter;

  //sram_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign sram_avalon_slave_in_a_write_cycle = cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_avalon_slave_in_a_write_cycle;

  assign sram_avalon_slave_wait_counter_eq_0 = sram_avalon_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_wait_counter <= 0;
      else 
        sram_avalon_slave_wait_counter <= sram_avalon_slave_counter_load_value;
    end


  assign sram_avalon_slave_counter_load_value = ((sram_avalon_slave_in_a_write_cycle & sram_avalon_slave_begins_xfer))? 2 :
    ((sram_avalon_slave_in_a_read_cycle & sram_avalon_slave_begins_xfer))? 1 :
    (~sram_avalon_slave_wait_counter_eq_0)? sram_avalon_slave_wait_counter - 1 :
    0;

  assign wait_for_sram_avalon_slave_counter = sram_avalon_slave_begins_xfer | ~sram_avalon_slave_wait_counter_eq_0;
  //~sram_avalon_slave_byteenable_n byte enable port mux, which is an e_mux
  assign sram_avalon_slave_byteenable_n = ~((cpu_data_master_granted_sram_avalon_slave)? cpu_data_master_byteenable_sram_avalon_slave :
    -1);

  assign {cpu_data_master_byteenable_sram_avalon_slave_segment_1,
cpu_data_master_byteenable_sram_avalon_slave_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sram_avalon_slave = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sram_avalon_slave_segment_0 :
    cpu_data_master_byteenable_sram_avalon_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_sram_avalon_slave + cpu_instruction_master_granted_sram_avalon_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_sram_avalon_slave + cpu_instruction_master_saved_grant_sram_avalon_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sw_s1_arbitrator (
                          // inputs:
                           clk,
                           cpu_peripheral_bridge_m1_address_to_slave,
                           cpu_peripheral_bridge_m1_latency_counter,
                           cpu_peripheral_bridge_m1_nativeaddress,
                           cpu_peripheral_bridge_m1_read,
                           cpu_peripheral_bridge_m1_write,
                           cpu_peripheral_bridge_m1_writedata,
                           reset_n,
                           sw_s1_irq,
                           sw_s1_readdata,

                          // outputs:
                           cpu_peripheral_bridge_m1_granted_sw_s1,
                           cpu_peripheral_bridge_m1_qualified_request_sw_s1,
                           cpu_peripheral_bridge_m1_read_data_valid_sw_s1,
                           cpu_peripheral_bridge_m1_requests_sw_s1,
                           d1_sw_s1_end_xfer,
                           sw_s1_address,
                           sw_s1_chipselect,
                           sw_s1_irq_from_sa,
                           sw_s1_readdata_from_sa,
                           sw_s1_reset_n,
                           sw_s1_write_n,
                           sw_s1_writedata
                        )
;

  output           cpu_peripheral_bridge_m1_granted_sw_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_sw_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_sw_s1;
  output           cpu_peripheral_bridge_m1_requests_sw_s1;
  output           d1_sw_s1_end_xfer;
  output  [  1: 0] sw_s1_address;
  output           sw_s1_chipselect;
  output           sw_s1_irq_from_sa;
  output  [ 17: 0] sw_s1_readdata_from_sa;
  output           sw_s1_reset_n;
  output           sw_s1_write_n;
  output  [ 17: 0] sw_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            reset_n;
  input            sw_s1_irq;
  input   [ 17: 0] sw_s1_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_sw_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sw_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sw_s1;
  wire             cpu_peripheral_bridge_m1_requests_sw_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_sw_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sw_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sw_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] sw_s1_address;
  wire             sw_s1_allgrants;
  wire             sw_s1_allow_new_arb_cycle;
  wire             sw_s1_any_bursting_master_saved_grant;
  wire             sw_s1_any_continuerequest;
  wire             sw_s1_arb_counter_enable;
  reg              sw_s1_arb_share_counter;
  wire             sw_s1_arb_share_counter_next_value;
  wire             sw_s1_arb_share_set_values;
  wire             sw_s1_beginbursttransfer_internal;
  wire             sw_s1_begins_xfer;
  wire             sw_s1_chipselect;
  wire             sw_s1_end_xfer;
  wire             sw_s1_firsttransfer;
  wire             sw_s1_grant_vector;
  wire             sw_s1_in_a_read_cycle;
  wire             sw_s1_in_a_write_cycle;
  wire             sw_s1_irq_from_sa;
  wire             sw_s1_master_qreq_vector;
  wire             sw_s1_non_bursting_master_requests;
  wire    [ 17: 0] sw_s1_readdata_from_sa;
  reg              sw_s1_reg_firsttransfer;
  wire             sw_s1_reset_n;
  reg              sw_s1_slavearbiterlockenable;
  wire             sw_s1_slavearbiterlockenable2;
  wire             sw_s1_unreg_firsttransfer;
  wire             sw_s1_waits_for_read;
  wire             sw_s1_waits_for_write;
  wire             sw_s1_write_n;
  wire    [ 17: 0] sw_s1_writedata;
  wire             wait_for_sw_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sw_s1_end_xfer;
    end


  assign sw_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_sw_s1));
  //assign sw_s1_readdata_from_sa = sw_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sw_s1_readdata_from_sa = sw_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_sw_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 4] , 4'b0} == 9'hd0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //sw_s1_arb_share_counter set values, which is an e_mux
  assign sw_s1_arb_share_set_values = 1;

  //sw_s1_non_bursting_master_requests mux, which is an e_mux
  assign sw_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_sw_s1;

  //sw_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sw_s1_any_bursting_master_saved_grant = 0;

  //sw_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sw_s1_arb_share_counter_next_value = sw_s1_firsttransfer ? (sw_s1_arb_share_set_values - 1) : |sw_s1_arb_share_counter ? (sw_s1_arb_share_counter - 1) : 0;

  //sw_s1_allgrants all slave grants, which is an e_mux
  assign sw_s1_allgrants = |sw_s1_grant_vector;

  //sw_s1_end_xfer assignment, which is an e_assign
  assign sw_s1_end_xfer = ~(sw_s1_waits_for_read | sw_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sw_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sw_s1 = sw_s1_end_xfer & (~sw_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sw_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sw_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sw_s1 & sw_s1_allgrants) | (end_xfer_arb_share_counter_term_sw_s1 & ~sw_s1_non_bursting_master_requests);

  //sw_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_arb_share_counter <= 0;
      else if (sw_s1_arb_counter_enable)
          sw_s1_arb_share_counter <= sw_s1_arb_share_counter_next_value;
    end


  //sw_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_slavearbiterlockenable <= 0;
      else if ((|sw_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sw_s1) | (end_xfer_arb_share_counter_term_sw_s1 & ~sw_s1_non_bursting_master_requests))
          sw_s1_slavearbiterlockenable <= |sw_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 sw/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = sw_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //sw_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sw_s1_slavearbiterlockenable2 = |sw_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 sw/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = sw_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //sw_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sw_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_sw_s1 = cpu_peripheral_bridge_m1_requests_sw_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_sw_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_sw_s1 = cpu_peripheral_bridge_m1_granted_sw_s1 & cpu_peripheral_bridge_m1_read & ~sw_s1_waits_for_read;

  //sw_s1_writedata mux, which is an e_mux
  assign sw_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_sw_s1 = cpu_peripheral_bridge_m1_qualified_request_sw_s1;

  //cpu_peripheral_bridge/m1 saved-grant sw/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_sw_s1 = cpu_peripheral_bridge_m1_requests_sw_s1;

  //allow new arb cycle for sw/s1, which is an e_assign
  assign sw_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sw_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sw_s1_master_qreq_vector = 1;

  //sw_s1_reset_n assignment, which is an e_assign
  assign sw_s1_reset_n = reset_n;

  assign sw_s1_chipselect = cpu_peripheral_bridge_m1_granted_sw_s1;
  //sw_s1_firsttransfer first transaction, which is an e_assign
  assign sw_s1_firsttransfer = sw_s1_begins_xfer ? sw_s1_unreg_firsttransfer : sw_s1_reg_firsttransfer;

  //sw_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sw_s1_unreg_firsttransfer = ~(sw_s1_slavearbiterlockenable & sw_s1_any_continuerequest);

  //sw_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_reg_firsttransfer <= 1'b1;
      else if (sw_s1_begins_xfer)
          sw_s1_reg_firsttransfer <= sw_s1_unreg_firsttransfer;
    end


  //sw_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sw_s1_beginbursttransfer_internal = sw_s1_begins_xfer;

  //~sw_s1_write_n assignment, which is an e_mux
  assign sw_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_sw_s1 & cpu_peripheral_bridge_m1_write);

  //sw_s1_address mux, which is an e_mux
  assign sw_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_sw_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sw_s1_end_xfer <= 1;
      else 
        d1_sw_s1_end_xfer <= sw_s1_end_xfer;
    end


  //sw_s1_waits_for_read in a cycle, which is an e_mux
  assign sw_s1_waits_for_read = sw_s1_in_a_read_cycle & sw_s1_begins_xfer;

  //sw_s1_in_a_read_cycle assignment, which is an e_assign
  assign sw_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_sw_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sw_s1_in_a_read_cycle;

  //sw_s1_waits_for_write in a cycle, which is an e_mux
  assign sw_s1_waits_for_write = sw_s1_in_a_write_cycle & 0;

  //sw_s1_in_a_write_cycle assignment, which is an e_assign
  assign sw_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_sw_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sw_s1_in_a_write_cycle;

  assign wait_for_sw_s1_counter = 0;
  //assign sw_s1_irq_from_sa = sw_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sw_s1_irq_from_sa = sw_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sw/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_peripheral_bridge_m1_address_to_slave,
                                         cpu_peripheral_bridge_m1_latency_counter,
                                         cpu_peripheral_bridge_m1_nativeaddress,
                                         cpu_peripheral_bridge_m1_read,
                                         cpu_peripheral_bridge_m1_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_peripheral_bridge_m1_granted_sysid_control_slave,
                                         cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave,
                                         cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave,
                                         cpu_peripheral_bridge_m1_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_peripheral_bridge_m1_granted_sysid_control_slave;
  output           cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  output           cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  output           cpu_peripheral_bridge_m1_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_requests_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg              sysid_control_slave_arb_share_counter;
  wire             sysid_control_slave_arb_share_counter_next_value;
  wire             sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_peripheral_bridge_m1_requests_sysid_control_slave = (({cpu_peripheral_bridge_m1_address_to_slave[8 : 3] , 3'b0} == 9'h100) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write)) & cpu_peripheral_bridge_m1_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave = cpu_peripheral_bridge_m1_requests_sysid_control_slave & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave = cpu_peripheral_bridge_m1_granted_sysid_control_slave & cpu_peripheral_bridge_m1_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_sysid_control_slave = cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave;

  //cpu_peripheral_bridge/m1 saved-grant sysid/control_slave, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_sysid_control_slave = cpu_peripheral_bridge_m1_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_sysid_control_slave & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_sysid_control_slave & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_peripheral_bridge_m1_address_to_slave,
                              cpu_peripheral_bridge_m1_latency_counter,
                              cpu_peripheral_bridge_m1_nativeaddress,
                              cpu_peripheral_bridge_m1_read,
                              cpu_peripheral_bridge_m1_write,
                              cpu_peripheral_bridge_m1_writedata,
                              reset_n,
                              timer_s1_irq,
                              timer_s1_readdata,

                             // outputs:
                              cpu_peripheral_bridge_m1_granted_timer_s1,
                              cpu_peripheral_bridge_m1_qualified_request_timer_s1,
                              cpu_peripheral_bridge_m1_read_data_valid_timer_s1,
                              cpu_peripheral_bridge_m1_requests_timer_s1,
                              d1_timer_s1_end_xfer,
                              timer_s1_address,
                              timer_s1_chipselect,
                              timer_s1_irq_from_sa,
                              timer_s1_readdata_from_sa,
                              timer_s1_reset_n,
                              timer_s1_write_n,
                              timer_s1_writedata
                           )
;

  output           cpu_peripheral_bridge_m1_granted_timer_s1;
  output           cpu_peripheral_bridge_m1_qualified_request_timer_s1;
  output           cpu_peripheral_bridge_m1_read_data_valid_timer_s1;
  output           cpu_peripheral_bridge_m1_requests_timer_s1;
  output           d1_timer_s1_end_xfer;
  output  [  2: 0] timer_s1_address;
  output           timer_s1_chipselect;
  output           timer_s1_irq_from_sa;
  output  [ 15: 0] timer_s1_readdata_from_sa;
  output           timer_s1_reset_n;
  output           timer_s1_write_n;
  output  [ 15: 0] timer_s1_writedata;
  input            clk;
  input   [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  input            cpu_peripheral_bridge_m1_latency_counter;
  input   [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  input            cpu_peripheral_bridge_m1_read;
  input            cpu_peripheral_bridge_m1_write;
  input   [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  input            reset_n;
  input            timer_s1_irq;
  input   [ 15: 0] timer_s1_readdata;

  wire             cpu_peripheral_bridge_m1_arbiterlock;
  wire             cpu_peripheral_bridge_m1_arbiterlock2;
  wire             cpu_peripheral_bridge_m1_continuerequest;
  wire             cpu_peripheral_bridge_m1_granted_timer_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_timer_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_timer_s1;
  wire             cpu_peripheral_bridge_m1_requests_timer_s1;
  wire             cpu_peripheral_bridge_m1_saved_grant_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_allgrants;
  wire             timer_s1_allow_new_arb_cycle;
  wire             timer_s1_any_bursting_master_saved_grant;
  wire             timer_s1_any_continuerequest;
  wire             timer_s1_arb_counter_enable;
  reg              timer_s1_arb_share_counter;
  wire             timer_s1_arb_share_counter_next_value;
  wire             timer_s1_arb_share_set_values;
  wire             timer_s1_beginbursttransfer_internal;
  wire             timer_s1_begins_xfer;
  wire             timer_s1_chipselect;
  wire             timer_s1_end_xfer;
  wire             timer_s1_firsttransfer;
  wire             timer_s1_grant_vector;
  wire             timer_s1_in_a_read_cycle;
  wire             timer_s1_in_a_write_cycle;
  wire             timer_s1_irq_from_sa;
  wire             timer_s1_master_qreq_vector;
  wire             timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  reg              timer_s1_reg_firsttransfer;
  wire             timer_s1_reset_n;
  reg              timer_s1_slavearbiterlockenable;
  wire             timer_s1_slavearbiterlockenable2;
  wire             timer_s1_unreg_firsttransfer;
  wire             timer_s1_waits_for_read;
  wire             timer_s1_waits_for_write;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             wait_for_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_s1_end_xfer;
    end


  assign timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_peripheral_bridge_m1_qualified_request_timer_s1));
  //assign timer_s1_readdata_from_sa = timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_readdata_from_sa = timer_s1_readdata;

  assign cpu_peripheral_bridge_m1_requests_timer_s1 = ({cpu_peripheral_bridge_m1_address_to_slave[8 : 5] , 5'b0} == 9'h0) & (cpu_peripheral_bridge_m1_read | cpu_peripheral_bridge_m1_write);
  //timer_s1_arb_share_counter set values, which is an e_mux
  assign timer_s1_arb_share_set_values = 1;

  //timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_s1_non_bursting_master_requests = cpu_peripheral_bridge_m1_requests_timer_s1;

  //timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_s1_any_bursting_master_saved_grant = 0;

  //timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_s1_arb_share_counter_next_value = timer_s1_firsttransfer ? (timer_s1_arb_share_set_values - 1) : |timer_s1_arb_share_counter ? (timer_s1_arb_share_counter - 1) : 0;

  //timer_s1_allgrants all slave grants, which is an e_mux
  assign timer_s1_allgrants = |timer_s1_grant_vector;

  //timer_s1_end_xfer assignment, which is an e_assign
  assign timer_s1_end_xfer = ~(timer_s1_waits_for_read | timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_s1 = timer_s1_end_xfer & (~timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_s1 & timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests);

  //timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_arb_share_counter <= 0;
      else if (timer_s1_arb_counter_enable)
          timer_s1_arb_share_counter <= timer_s1_arb_share_counter_next_value;
    end


  //timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_slavearbiterlockenable <= 0;
      else if ((|timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_s1) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests))
          timer_s1_slavearbiterlockenable <= |timer_s1_arb_share_counter_next_value;
    end


  //cpu_peripheral_bridge/m1 timer/s1 arbiterlock, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock = timer_s1_slavearbiterlockenable & cpu_peripheral_bridge_m1_continuerequest;

  //timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_s1_slavearbiterlockenable2 = |timer_s1_arb_share_counter_next_value;

  //cpu_peripheral_bridge/m1 timer/s1 arbiterlock2, which is an e_assign
  assign cpu_peripheral_bridge_m1_arbiterlock2 = timer_s1_slavearbiterlockenable2 & cpu_peripheral_bridge_m1_continuerequest;

  //timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_s1_any_continuerequest = 1;

  //cpu_peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign cpu_peripheral_bridge_m1_continuerequest = 1;

  assign cpu_peripheral_bridge_m1_qualified_request_timer_s1 = cpu_peripheral_bridge_m1_requests_timer_s1 & ~((cpu_peripheral_bridge_m1_read & ((cpu_peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid cpu_peripheral_bridge_m1_read_data_valid_timer_s1, which is an e_mux
  assign cpu_peripheral_bridge_m1_read_data_valid_timer_s1 = cpu_peripheral_bridge_m1_granted_timer_s1 & cpu_peripheral_bridge_m1_read & ~timer_s1_waits_for_read;

  //timer_s1_writedata mux, which is an e_mux
  assign timer_s1_writedata = cpu_peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign cpu_peripheral_bridge_m1_granted_timer_s1 = cpu_peripheral_bridge_m1_qualified_request_timer_s1;

  //cpu_peripheral_bridge/m1 saved-grant timer/s1, which is an e_assign
  assign cpu_peripheral_bridge_m1_saved_grant_timer_s1 = cpu_peripheral_bridge_m1_requests_timer_s1;

  //allow new arb cycle for timer/s1, which is an e_assign
  assign timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_s1_master_qreq_vector = 1;

  //timer_s1_reset_n assignment, which is an e_assign
  assign timer_s1_reset_n = reset_n;

  assign timer_s1_chipselect = cpu_peripheral_bridge_m1_granted_timer_s1;
  //timer_s1_firsttransfer first transaction, which is an e_assign
  assign timer_s1_firsttransfer = timer_s1_begins_xfer ? timer_s1_unreg_firsttransfer : timer_s1_reg_firsttransfer;

  //timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_s1_unreg_firsttransfer = ~(timer_s1_slavearbiterlockenable & timer_s1_any_continuerequest);

  //timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_reg_firsttransfer <= 1'b1;
      else if (timer_s1_begins_xfer)
          timer_s1_reg_firsttransfer <= timer_s1_unreg_firsttransfer;
    end


  //timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_s1_beginbursttransfer_internal = timer_s1_begins_xfer;

  //~timer_s1_write_n assignment, which is an e_mux
  assign timer_s1_write_n = ~(cpu_peripheral_bridge_m1_granted_timer_s1 & cpu_peripheral_bridge_m1_write);

  //timer_s1_address mux, which is an e_mux
  assign timer_s1_address = cpu_peripheral_bridge_m1_nativeaddress;

  //d1_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_s1_end_xfer <= 1;
      else 
        d1_timer_s1_end_xfer <= timer_s1_end_xfer;
    end


  //timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_s1_waits_for_read = timer_s1_in_a_read_cycle & timer_s1_begins_xfer;

  //timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_s1_in_a_read_cycle = cpu_peripheral_bridge_m1_granted_timer_s1 & cpu_peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_s1_in_a_read_cycle;

  //timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_s1_waits_for_write = timer_s1_in_a_write_cycle & 0;

  //timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_s1_in_a_write_cycle = cpu_peripheral_bridge_m1_granted_timer_s1 & cpu_peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_s1_in_a_write_cycle;

  assign wait_for_timer_s1_counter = 0;
  //assign timer_s1_irq_from_sa = timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_irq_from_sa = timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_flash_avalon_slave_arbitrator (
                                                        // inputs:
                                                         clk,
                                                         cpu_data_master_address_to_slave,
                                                         cpu_data_master_byteenable,
                                                         cpu_data_master_dbs_address,
                                                         cpu_data_master_dbs_write_8,
                                                         cpu_data_master_latency_counter,
                                                         cpu_data_master_read,
                                                         cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                                                         cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                         cpu_data_master_write,
                                                         cpu_instruction_master_address_to_slave,
                                                         cpu_instruction_master_dbs_address,
                                                         cpu_instruction_master_latency_counter,
                                                         cpu_instruction_master_read,
                                                         reset_n,

                                                        // outputs:
                                                         address_to_the_cfi_flash,
                                                         cfi_flash_s1_wait_counter_eq_0,
                                                         cpu_data_master_byteenable_cfi_flash_s1,
                                                         cpu_data_master_granted_cfi_flash_s1,
                                                         cpu_data_master_qualified_request_cfi_flash_s1,
                                                         cpu_data_master_read_data_valid_cfi_flash_s1,
                                                         cpu_data_master_requests_cfi_flash_s1,
                                                         cpu_instruction_master_granted_cfi_flash_s1,
                                                         cpu_instruction_master_qualified_request_cfi_flash_s1,
                                                         cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                                         cpu_instruction_master_requests_cfi_flash_s1,
                                                         d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                                         incoming_tri_state_bridge_flash_data,
                                                         incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0,
                                                         read_n_to_the_cfi_flash,
                                                         select_n_to_the_cfi_flash,
                                                         tri_state_bridge_flash_data,
                                                         write_n_to_the_cfi_flash
                                                      )
;

  output  [ 22: 0] address_to_the_cfi_flash;
  output           cfi_flash_s1_wait_counter_eq_0;
  output           cpu_data_master_byteenable_cfi_flash_s1;
  output           cpu_data_master_granted_cfi_flash_s1;
  output           cpu_data_master_qualified_request_cfi_flash_s1;
  output           cpu_data_master_read_data_valid_cfi_flash_s1;
  output           cpu_data_master_requests_cfi_flash_s1;
  output           cpu_instruction_master_granted_cfi_flash_s1;
  output           cpu_instruction_master_qualified_request_cfi_flash_s1;
  output           cpu_instruction_master_read_data_valid_cfi_flash_s1;
  output           cpu_instruction_master_requests_cfi_flash_s1;
  output           d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  output  [  7: 0] incoming_tri_state_bridge_flash_data;
  output  [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  inout   [  7: 0] tri_state_bridge_flash_data;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;

  reg     [ 22: 0] address_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  4: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  wire             cfi_flash_s1_pretend_byte_enable;
  reg     [  4: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_cfi_flash_s1;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_0;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_2;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_saved_grant_cfi_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_saved_grant_cfi_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [  7: 0] d1_outgoing_tri_state_bridge_flash_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [  7: 0] incoming_tri_state_bridge_flash_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_tri_state_bridge_flash_data_bit_0_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_1_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_2_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_3_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_4_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_5_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_6_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_7_is_x;
  wire    [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
  wire    [  7: 0] outgoing_tri_state_bridge_flash_data;
  wire    [ 22: 0] p1_address_to_the_cfi_flash;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tri_state_bridge_flash_avalon_slave_allgrants;
  wire             tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_flash_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_flash_avalon_slave_arb_addend;
  wire             tri_state_bridge_flash_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_arb_winner;
  wire             tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_flash_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_flash_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_flash_avalon_slave_end_xfer;
  wire             tri_state_bridge_flash_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_flash_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_flash_avalon_slave_read_pending;
  reg              tri_state_bridge_flash_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_flash_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_flash_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_flash_avalon_slave_write_pending;
  wire    [  7: 0] tri_state_bridge_flash_data;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_flash_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_flash_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1));
  assign cpu_data_master_requests_cfi_flash_s1 = ({cpu_data_master_address_to_slave[27 : 23] , 23'b0} == 28'ha000000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else 
        select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tri_state_bridge_flash_avalon_slave_write_pending = 0;
  //tri_state_bridge_flash/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_read_pending = 0;

  //tri_state_bridge_flash_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_arb_share_set_values = (cpu_data_master_granted_cfi_flash_s1)? 4 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 4 :
    (cpu_data_master_granted_cfi_flash_s1)? 4 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 4 :
    1;

  //tri_state_bridge_flash_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1 |
    cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value = tri_state_bridge_flash_avalon_slave_firsttransfer ? (tri_state_bridge_flash_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_flash_avalon_slave_arb_share_counter ? (tri_state_bridge_flash_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_flash_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_allgrants = (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector);

  //tri_state_bridge_flash_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave = tri_state_bridge_flash_avalon_slave_end_xfer & (~tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_flash_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & tri_state_bridge_flash_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & ~tri_state_bridge_flash_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_flash_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_flash_avalon_slave_arb_counter_enable)
          tri_state_bridge_flash_avalon_slave_arb_share_counter <= tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_flash_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_flash_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & ~tri_state_bridge_flash_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_flash_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tri_state_bridge_flash/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tri_state_bridge_flash/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_flash/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_flash/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= cpu_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 & cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cfi_flash_s1 = cpu_data_master_requests_cfi_flash_s1 & ~((cpu_data_master_read & (tri_state_bridge_flash_avalon_slave_write_pending | (tri_state_bridge_flash_avalon_slave_read_pending) | (2 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((tri_state_bridge_flash_avalon_slave_read_pending | !cpu_data_master_byteenable_cfi_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_data_master_read_data_valid_cfi_flash_s1_shift_register, cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //tri_state_bridge_flash_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_tri_state_bridge_flash_data <= 0;
      else 
        incoming_tri_state_bridge_flash_data <= tri_state_bridge_flash_data;
    end


  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_tri_state_bridge_flash_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_tri_state_bridge_flash_data <= 0;
      else 
        d1_outgoing_tri_state_bridge_flash_data <= outgoing_tri_state_bridge_flash_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_tri_state_bridge_flash_data tristate driver, which is an e_assign
  assign tri_state_bridge_flash_data = (d1_in_a_write_cycle)? d1_outgoing_tri_state_bridge_flash_data:{8{1'bz}};

  //outgoing_tri_state_bridge_flash_data mux, which is an e_mux
  assign outgoing_tri_state_bridge_flash_data = cpu_data_master_dbs_write_8;

  assign cpu_instruction_master_requests_cfi_flash_s1 = (({cpu_instruction_master_address_to_slave[27 : 23] , 23'b0} == 28'ha000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= cpu_data_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 & cpu_data_master_requests_cfi_flash_s1;

  assign cpu_instruction_master_qualified_request_cfi_flash_s1 = cpu_instruction_master_requests_cfi_flash_s1 & ~((cpu_instruction_master_read & (tri_state_bridge_flash_avalon_slave_write_pending | (tri_state_bridge_flash_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register, cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1 = cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_flash/avalon_slave, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cfi_flash_s1;

  //cpu/instruction_master grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_cfi_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_cfi_flash_s1;

  //cpu/data_master grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_granted_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_arb_winner[1] && cpu_data_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_chosen_master_double_vector = {tri_state_bridge_flash_avalon_slave_master_qreq_vector, tri_state_bridge_flash_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_flash_avalon_slave_master_qreq_vector, ~tri_state_bridge_flash_avalon_slave_master_qreq_vector} + tri_state_bridge_flash_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_flash_avalon_slave_arb_winner = (tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_flash_avalon_slave_grant_vector) ? tri_state_bridge_flash_avalon_slave_grant_vector : tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_flash_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_flash_avalon_slave_grant_vector ? tri_state_bridge_flash_avalon_slave_grant_vector : tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_flash_avalon_slave_grant_vector = {(tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge_flash/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_chosen_master_rot_left = (tri_state_bridge_flash_avalon_slave_arb_winner << 1) ? (tri_state_bridge_flash_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_flash/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_flash_avalon_slave_grant_vector)
          tri_state_bridge_flash_avalon_slave_arb_addend <= tri_state_bridge_flash_avalon_slave_end_xfer? tri_state_bridge_flash_avalon_slave_chosen_master_rot_left : tri_state_bridge_flash_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(cpu_data_master_granted_cfi_flash_s1 | cpu_instruction_master_granted_cfi_flash_s1);
  //tri_state_bridge_flash_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_firsttransfer = tri_state_bridge_flash_avalon_slave_begins_xfer ? tri_state_bridge_flash_avalon_slave_unreg_firsttransfer : tri_state_bridge_flash_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_flash_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & tri_state_bridge_flash_avalon_slave_any_continuerequest);

  //tri_state_bridge_flash_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_flash_avalon_slave_begins_xfer)
          tri_state_bridge_flash_avalon_slave_reg_firsttransfer <= tri_state_bridge_flash_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal = tri_state_bridge_flash_avalon_slave_begins_xfer;

  //tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_flash_avalon_slave_begins_xfer & tri_state_bridge_flash_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else 
        read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read))& ~tri_state_bridge_flash_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 16));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else 
        write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write)) & ~tri_state_bridge_flash_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 6) & (cfi_flash_s1_wait_counter < 22) & cfi_flash_s1_pretend_byte_enable);

  //address_to_the_cfi_flash of type address to p1_address_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash <= 0;
      else 
        address_to_the_cfi_flash <= p1_address_to_the_cfi_flash;
    end


  //p1_address_to_the_cfi_flash mux, which is an e_mux
  assign p1_address_to_the_cfi_flash = (cpu_data_master_granted_cfi_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1 : 0]});

  //d1_tri_state_bridge_flash_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_flash_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_flash_avalon_slave_end_xfer <= tri_state_bridge_flash_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else 
        cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tri_state_bridge_flash_avalon_slave_begins_xfer))? 20 :
    ((cfi_flash_s1_in_a_write_cycle & tri_state_bridge_flash_avalon_slave_begins_xfer))? 26 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tri_state_bridge_flash_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  //cfi_flash_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign cfi_flash_s1_pretend_byte_enable = (cpu_data_master_granted_cfi_flash_s1)? cpu_data_master_byteenable_cfi_flash_s1 :
    -1;

  assign {cpu_data_master_byteenable_cfi_flash_s1_segment_3,
cpu_data_master_byteenable_cfi_flash_s1_segment_2,
cpu_data_master_byteenable_cfi_flash_s1_segment_1,
cpu_data_master_byteenable_cfi_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_cfi_flash_s1 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_cfi_flash_s1_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_cfi_flash_s1_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_cfi_flash_s1_segment_2 :
    cpu_data_master_byteenable_cfi_flash_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_tri_state_bridge_flash_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_0_is_x = ^(incoming_tri_state_bridge_flash_data[0]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[0] = incoming_tri_state_bridge_flash_data_bit_0_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[0];

  //incoming_tri_state_bridge_flash_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_1_is_x = ^(incoming_tri_state_bridge_flash_data[1]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[1] = incoming_tri_state_bridge_flash_data_bit_1_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[1];

  //incoming_tri_state_bridge_flash_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_2_is_x = ^(incoming_tri_state_bridge_flash_data[2]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[2] = incoming_tri_state_bridge_flash_data_bit_2_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[2];

  //incoming_tri_state_bridge_flash_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_3_is_x = ^(incoming_tri_state_bridge_flash_data[3]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[3] = incoming_tri_state_bridge_flash_data_bit_3_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[3];

  //incoming_tri_state_bridge_flash_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_4_is_x = ^(incoming_tri_state_bridge_flash_data[4]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[4] = incoming_tri_state_bridge_flash_data_bit_4_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[4];

  //incoming_tri_state_bridge_flash_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_5_is_x = ^(incoming_tri_state_bridge_flash_data[5]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[5] = incoming_tri_state_bridge_flash_data_bit_5_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[5];

  //incoming_tri_state_bridge_flash_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_6_is_x = ^(incoming_tri_state_bridge_flash_data[6]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[6] = incoming_tri_state_bridge_flash_data_bit_6_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[6];

  //incoming_tri_state_bridge_flash_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_7_is_x = ^(incoming_tri_state_bridge_flash_data[7]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[7] = incoming_tri_state_bridge_flash_data_bit_7_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[7];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cfi_flash_s1 + cpu_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cfi_flash_s1 + cpu_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0 = incoming_tri_state_bridge_flash_data;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_flash_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module usb_dc_arbitrator (
                           // inputs:
                            clk,
                            cpu_data_master_address_to_slave,
                            cpu_data_master_latency_counter,
                            cpu_data_master_read,
                            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                            cpu_data_master_read_data_valid_sdram_s1_shift_register,
                            cpu_data_master_write,
                            cpu_data_master_writedata,
                            reset_n,
                            usb_dc_irq_n,
                            usb_dc_readdata,

                           // outputs:
                            cpu_data_master_granted_usb_dc,
                            cpu_data_master_qualified_request_usb_dc,
                            cpu_data_master_read_data_valid_usb_dc,
                            cpu_data_master_requests_usb_dc,
                            d1_usb_dc_end_xfer,
                            usb_dc_address,
                            usb_dc_chipselect_n,
                            usb_dc_irq_n_from_sa,
                            usb_dc_read_n,
                            usb_dc_readdata_from_sa,
                            usb_dc_reset_n,
                            usb_dc_wait_counter_eq_0,
                            usb_dc_write_n,
                            usb_dc_writedata
                         )
;

  output           cpu_data_master_granted_usb_dc;
  output           cpu_data_master_qualified_request_usb_dc;
  output           cpu_data_master_read_data_valid_usb_dc;
  output           cpu_data_master_requests_usb_dc;
  output           d1_usb_dc_end_xfer;
  output           usb_dc_address;
  output           usb_dc_chipselect_n;
  output           usb_dc_irq_n_from_sa;
  output           usb_dc_read_n;
  output  [ 15: 0] usb_dc_readdata_from_sa;
  output           usb_dc_reset_n;
  output           usb_dc_wait_counter_eq_0;
  output           usb_dc_write_n;
  output  [ 15: 0] usb_dc_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            usb_dc_irq_n;
  input   [ 15: 0] usb_dc_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_usb_dc;
  wire             cpu_data_master_qualified_request_usb_dc;
  wire             cpu_data_master_read_data_valid_usb_dc;
  wire             cpu_data_master_requests_usb_dc;
  wire             cpu_data_master_saved_grant_usb_dc;
  reg              d1_reasons_to_wait;
  reg              d1_usb_dc_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_usb_dc;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_usb_dc_from_cpu_data_master;
  wire             usb_dc_address;
  wire             usb_dc_allgrants;
  wire             usb_dc_allow_new_arb_cycle;
  wire             usb_dc_any_bursting_master_saved_grant;
  wire             usb_dc_any_continuerequest;
  wire             usb_dc_arb_counter_enable;
  reg     [  2: 0] usb_dc_arb_share_counter;
  wire    [  2: 0] usb_dc_arb_share_counter_next_value;
  wire    [  2: 0] usb_dc_arb_share_set_values;
  wire             usb_dc_beginbursttransfer_internal;
  wire             usb_dc_begins_xfer;
  wire             usb_dc_chipselect_n;
  wire    [  4: 0] usb_dc_counter_load_value;
  wire             usb_dc_end_xfer;
  wire             usb_dc_firsttransfer;
  wire             usb_dc_grant_vector;
  wire             usb_dc_in_a_read_cycle;
  wire             usb_dc_in_a_write_cycle;
  wire             usb_dc_irq_n_from_sa;
  wire             usb_dc_master_qreq_vector;
  wire             usb_dc_non_bursting_master_requests;
  wire             usb_dc_read_n;
  wire    [ 15: 0] usb_dc_readdata_from_sa;
  reg              usb_dc_reg_firsttransfer;
  wire             usb_dc_reset_n;
  reg              usb_dc_slavearbiterlockenable;
  wire             usb_dc_slavearbiterlockenable2;
  wire             usb_dc_unreg_firsttransfer;
  reg     [  4: 0] usb_dc_wait_counter;
  wire             usb_dc_wait_counter_eq_0;
  wire             usb_dc_waits_for_read;
  wire             usb_dc_waits_for_write;
  wire             usb_dc_write_n;
  wire    [ 15: 0] usb_dc_writedata;
  wire             wait_for_usb_dc_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~usb_dc_end_xfer;
    end


  assign usb_dc_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_usb_dc));
  //assign usb_dc_readdata_from_sa = usb_dc_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign usb_dc_readdata_from_sa = usb_dc_readdata;

  assign cpu_data_master_requests_usb_dc = ({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h9001048) & (cpu_data_master_read | cpu_data_master_write);
  //usb_dc_arb_share_counter set values, which is an e_mux
  assign usb_dc_arb_share_set_values = 1;

  //usb_dc_non_bursting_master_requests mux, which is an e_mux
  assign usb_dc_non_bursting_master_requests = cpu_data_master_requests_usb_dc;

  //usb_dc_any_bursting_master_saved_grant mux, which is an e_mux
  assign usb_dc_any_bursting_master_saved_grant = 0;

  //usb_dc_arb_share_counter_next_value assignment, which is an e_assign
  assign usb_dc_arb_share_counter_next_value = usb_dc_firsttransfer ? (usb_dc_arb_share_set_values - 1) : |usb_dc_arb_share_counter ? (usb_dc_arb_share_counter - 1) : 0;

  //usb_dc_allgrants all slave grants, which is an e_mux
  assign usb_dc_allgrants = |usb_dc_grant_vector;

  //usb_dc_end_xfer assignment, which is an e_assign
  assign usb_dc_end_xfer = ~(usb_dc_waits_for_read | usb_dc_waits_for_write);

  //end_xfer_arb_share_counter_term_usb_dc arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_usb_dc = usb_dc_end_xfer & (~usb_dc_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //usb_dc_arb_share_counter arbitration counter enable, which is an e_assign
  assign usb_dc_arb_counter_enable = (end_xfer_arb_share_counter_term_usb_dc & usb_dc_allgrants) | (end_xfer_arb_share_counter_term_usb_dc & ~usb_dc_non_bursting_master_requests);

  //usb_dc_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_dc_arb_share_counter <= 0;
      else if (usb_dc_arb_counter_enable)
          usb_dc_arb_share_counter <= usb_dc_arb_share_counter_next_value;
    end


  //usb_dc_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_dc_slavearbiterlockenable <= 0;
      else if ((|usb_dc_master_qreq_vector & end_xfer_arb_share_counter_term_usb_dc) | (end_xfer_arb_share_counter_term_usb_dc & ~usb_dc_non_bursting_master_requests))
          usb_dc_slavearbiterlockenable <= |usb_dc_arb_share_counter_next_value;
    end


  //cpu/data_master usb/dc arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = usb_dc_slavearbiterlockenable & cpu_data_master_continuerequest;

  //usb_dc_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign usb_dc_slavearbiterlockenable2 = |usb_dc_arb_share_counter_next_value;

  //cpu/data_master usb/dc arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = usb_dc_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //usb_dc_any_continuerequest at least one master continues requesting, which is an e_assign
  assign usb_dc_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_usb_dc = cpu_data_master_requests_usb_dc & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_usb_dc, which is an e_mux
  assign cpu_data_master_read_data_valid_usb_dc = cpu_data_master_granted_usb_dc & cpu_data_master_read & ~usb_dc_waits_for_read;

  //usb_dc_writedata mux, which is an e_mux
  assign usb_dc_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_usb_dc = cpu_data_master_qualified_request_usb_dc;

  //cpu/data_master saved-grant usb/dc, which is an e_assign
  assign cpu_data_master_saved_grant_usb_dc = cpu_data_master_requests_usb_dc;

  //allow new arb cycle for usb/dc, which is an e_assign
  assign usb_dc_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign usb_dc_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign usb_dc_master_qreq_vector = 1;

  //usb_dc_reset_n assignment, which is an e_assign
  assign usb_dc_reset_n = reset_n;

  assign usb_dc_chipselect_n = ~cpu_data_master_granted_usb_dc;
  //usb_dc_firsttransfer first transaction, which is an e_assign
  assign usb_dc_firsttransfer = usb_dc_begins_xfer ? usb_dc_unreg_firsttransfer : usb_dc_reg_firsttransfer;

  //usb_dc_unreg_firsttransfer first transaction, which is an e_assign
  assign usb_dc_unreg_firsttransfer = ~(usb_dc_slavearbiterlockenable & usb_dc_any_continuerequest);

  //usb_dc_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_dc_reg_firsttransfer <= 1'b1;
      else if (usb_dc_begins_xfer)
          usb_dc_reg_firsttransfer <= usb_dc_unreg_firsttransfer;
    end


  //usb_dc_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign usb_dc_beginbursttransfer_internal = usb_dc_begins_xfer;

  //~usb_dc_read_n assignment, which is an e_mux
  assign usb_dc_read_n = ~(((cpu_data_master_granted_usb_dc & cpu_data_master_read))& ~usb_dc_begins_xfer & (usb_dc_wait_counter < 8));

  //~usb_dc_write_n assignment, which is an e_mux
  assign usb_dc_write_n = ~(((cpu_data_master_granted_usb_dc & cpu_data_master_write)) & ~usb_dc_begins_xfer & (usb_dc_wait_counter >= 8) & (usb_dc_wait_counter < 16));

  assign shifted_address_to_usb_dc_from_cpu_data_master = cpu_data_master_address_to_slave;
  //usb_dc_address mux, which is an e_mux
  assign usb_dc_address = shifted_address_to_usb_dc_from_cpu_data_master >> 2;

  //d1_usb_dc_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_usb_dc_end_xfer <= 1;
      else 
        d1_usb_dc_end_xfer <= usb_dc_end_xfer;
    end


  //usb_dc_waits_for_read in a cycle, which is an e_mux
  assign usb_dc_waits_for_read = usb_dc_in_a_read_cycle & wait_for_usb_dc_counter;

  //usb_dc_in_a_read_cycle assignment, which is an e_assign
  assign usb_dc_in_a_read_cycle = cpu_data_master_granted_usb_dc & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = usb_dc_in_a_read_cycle;

  //usb_dc_waits_for_write in a cycle, which is an e_mux
  assign usb_dc_waits_for_write = usb_dc_in_a_write_cycle & wait_for_usb_dc_counter;

  //usb_dc_in_a_write_cycle assignment, which is an e_assign
  assign usb_dc_in_a_write_cycle = cpu_data_master_granted_usb_dc & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = usb_dc_in_a_write_cycle;

  assign usb_dc_wait_counter_eq_0 = usb_dc_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_dc_wait_counter <= 0;
      else 
        usb_dc_wait_counter <= usb_dc_counter_load_value;
    end


  assign usb_dc_counter_load_value = ((usb_dc_in_a_write_cycle & usb_dc_begins_xfer))? 22 :
    ((usb_dc_in_a_read_cycle & usb_dc_begins_xfer))? 14 :
    (~usb_dc_wait_counter_eq_0)? usb_dc_wait_counter - 1 :
    0;

  assign wait_for_usb_dc_counter = usb_dc_begins_xfer | ~usb_dc_wait_counter_eq_0;
  //assign usb_dc_irq_n_from_sa = usb_dc_irq_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign usb_dc_irq_n_from_sa = usb_dc_irq_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //usb/dc enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module usb_hc_arbitrator (
                           // inputs:
                            clk,
                            cpu_data_master_address_to_slave,
                            cpu_data_master_latency_counter,
                            cpu_data_master_read,
                            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register,
                            cpu_data_master_read_data_valid_sdram_s1_shift_register,
                            cpu_data_master_write,
                            cpu_data_master_writedata,
                            reset_n,
                            usb_hc_irq_n,
                            usb_hc_readdata,

                           // outputs:
                            cpu_data_master_granted_usb_hc,
                            cpu_data_master_qualified_request_usb_hc,
                            cpu_data_master_read_data_valid_usb_hc,
                            cpu_data_master_requests_usb_hc,
                            d1_usb_hc_end_xfer,
                            usb_hc_address,
                            usb_hc_chipselect_n,
                            usb_hc_irq_n_from_sa,
                            usb_hc_read_n,
                            usb_hc_readdata_from_sa,
                            usb_hc_reset_n,
                            usb_hc_wait_counter_eq_0,
                            usb_hc_write_n,
                            usb_hc_writedata
                         )
;

  output           cpu_data_master_granted_usb_hc;
  output           cpu_data_master_qualified_request_usb_hc;
  output           cpu_data_master_read_data_valid_usb_hc;
  output           cpu_data_master_requests_usb_hc;
  output           d1_usb_hc_end_xfer;
  output           usb_hc_address;
  output           usb_hc_chipselect_n;
  output           usb_hc_irq_n_from_sa;
  output           usb_hc_read_n;
  output  [ 15: 0] usb_hc_readdata_from_sa;
  output           usb_hc_reset_n;
  output           usb_hc_wait_counter_eq_0;
  output           usb_hc_write_n;
  output  [ 15: 0] usb_hc_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            usb_hc_irq_n;
  input   [ 15: 0] usb_hc_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_usb_hc;
  wire             cpu_data_master_qualified_request_usb_hc;
  wire             cpu_data_master_read_data_valid_usb_hc;
  wire             cpu_data_master_requests_usb_hc;
  wire             cpu_data_master_saved_grant_usb_hc;
  reg              d1_reasons_to_wait;
  reg              d1_usb_hc_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_usb_hc;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_usb_hc_from_cpu_data_master;
  wire             usb_hc_address;
  wire             usb_hc_allgrants;
  wire             usb_hc_allow_new_arb_cycle;
  wire             usb_hc_any_bursting_master_saved_grant;
  wire             usb_hc_any_continuerequest;
  wire             usb_hc_arb_counter_enable;
  reg     [  2: 0] usb_hc_arb_share_counter;
  wire    [  2: 0] usb_hc_arb_share_counter_next_value;
  wire    [  2: 0] usb_hc_arb_share_set_values;
  wire             usb_hc_beginbursttransfer_internal;
  wire             usb_hc_begins_xfer;
  wire             usb_hc_chipselect_n;
  wire    [  3: 0] usb_hc_counter_load_value;
  wire             usb_hc_end_xfer;
  wire             usb_hc_firsttransfer;
  wire             usb_hc_grant_vector;
  wire             usb_hc_in_a_read_cycle;
  wire             usb_hc_in_a_write_cycle;
  wire             usb_hc_irq_n_from_sa;
  wire             usb_hc_master_qreq_vector;
  wire             usb_hc_non_bursting_master_requests;
  wire             usb_hc_read_n;
  wire    [ 15: 0] usb_hc_readdata_from_sa;
  reg              usb_hc_reg_firsttransfer;
  wire             usb_hc_reset_n;
  reg              usb_hc_slavearbiterlockenable;
  wire             usb_hc_slavearbiterlockenable2;
  wire             usb_hc_unreg_firsttransfer;
  reg     [  3: 0] usb_hc_wait_counter;
  wire             usb_hc_wait_counter_eq_0;
  wire             usb_hc_waits_for_read;
  wire             usb_hc_waits_for_write;
  wire             usb_hc_write_n;
  wire    [ 15: 0] usb_hc_writedata;
  wire             wait_for_usb_hc_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~usb_hc_end_xfer;
    end


  assign usb_hc_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_usb_hc));
  //assign usb_hc_readdata_from_sa = usb_hc_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign usb_hc_readdata_from_sa = usb_hc_readdata;

  assign cpu_data_master_requests_usb_hc = ({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h9001040) & (cpu_data_master_read | cpu_data_master_write);
  //usb_hc_arb_share_counter set values, which is an e_mux
  assign usb_hc_arb_share_set_values = 1;

  //usb_hc_non_bursting_master_requests mux, which is an e_mux
  assign usb_hc_non_bursting_master_requests = cpu_data_master_requests_usb_hc;

  //usb_hc_any_bursting_master_saved_grant mux, which is an e_mux
  assign usb_hc_any_bursting_master_saved_grant = 0;

  //usb_hc_arb_share_counter_next_value assignment, which is an e_assign
  assign usb_hc_arb_share_counter_next_value = usb_hc_firsttransfer ? (usb_hc_arb_share_set_values - 1) : |usb_hc_arb_share_counter ? (usb_hc_arb_share_counter - 1) : 0;

  //usb_hc_allgrants all slave grants, which is an e_mux
  assign usb_hc_allgrants = |usb_hc_grant_vector;

  //usb_hc_end_xfer assignment, which is an e_assign
  assign usb_hc_end_xfer = ~(usb_hc_waits_for_read | usb_hc_waits_for_write);

  //end_xfer_arb_share_counter_term_usb_hc arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_usb_hc = usb_hc_end_xfer & (~usb_hc_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //usb_hc_arb_share_counter arbitration counter enable, which is an e_assign
  assign usb_hc_arb_counter_enable = (end_xfer_arb_share_counter_term_usb_hc & usb_hc_allgrants) | (end_xfer_arb_share_counter_term_usb_hc & ~usb_hc_non_bursting_master_requests);

  //usb_hc_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_hc_arb_share_counter <= 0;
      else if (usb_hc_arb_counter_enable)
          usb_hc_arb_share_counter <= usb_hc_arb_share_counter_next_value;
    end


  //usb_hc_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_hc_slavearbiterlockenable <= 0;
      else if ((|usb_hc_master_qreq_vector & end_xfer_arb_share_counter_term_usb_hc) | (end_xfer_arb_share_counter_term_usb_hc & ~usb_hc_non_bursting_master_requests))
          usb_hc_slavearbiterlockenable <= |usb_hc_arb_share_counter_next_value;
    end


  //cpu/data_master usb/hc arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = usb_hc_slavearbiterlockenable & cpu_data_master_continuerequest;

  //usb_hc_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign usb_hc_slavearbiterlockenable2 = |usb_hc_arb_share_counter_next_value;

  //cpu/data_master usb/hc arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = usb_hc_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //usb_hc_any_continuerequest at least one master continues requesting, which is an e_assign
  assign usb_hc_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_usb_hc = cpu_data_master_requests_usb_hc & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_usb_hc, which is an e_mux
  assign cpu_data_master_read_data_valid_usb_hc = cpu_data_master_granted_usb_hc & cpu_data_master_read & ~usb_hc_waits_for_read;

  //usb_hc_writedata mux, which is an e_mux
  assign usb_hc_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_usb_hc = cpu_data_master_qualified_request_usb_hc;

  //cpu/data_master saved-grant usb/hc, which is an e_assign
  assign cpu_data_master_saved_grant_usb_hc = cpu_data_master_requests_usb_hc;

  //allow new arb cycle for usb/hc, which is an e_assign
  assign usb_hc_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign usb_hc_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign usb_hc_master_qreq_vector = 1;

  //usb_hc_reset_n assignment, which is an e_assign
  assign usb_hc_reset_n = reset_n;

  assign usb_hc_chipselect_n = ~cpu_data_master_granted_usb_hc;
  //usb_hc_firsttransfer first transaction, which is an e_assign
  assign usb_hc_firsttransfer = usb_hc_begins_xfer ? usb_hc_unreg_firsttransfer : usb_hc_reg_firsttransfer;

  //usb_hc_unreg_firsttransfer first transaction, which is an e_assign
  assign usb_hc_unreg_firsttransfer = ~(usb_hc_slavearbiterlockenable & usb_hc_any_continuerequest);

  //usb_hc_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_hc_reg_firsttransfer <= 1'b1;
      else if (usb_hc_begins_xfer)
          usb_hc_reg_firsttransfer <= usb_hc_unreg_firsttransfer;
    end


  //usb_hc_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign usb_hc_beginbursttransfer_internal = usb_hc_begins_xfer;

  //~usb_hc_read_n assignment, which is an e_mux
  assign usb_hc_read_n = ~(((cpu_data_master_granted_usb_hc & cpu_data_master_read))& ~usb_hc_begins_xfer & (usb_hc_wait_counter < 3));

  //~usb_hc_write_n assignment, which is an e_mux
  assign usb_hc_write_n = ~(((cpu_data_master_granted_usb_hc & cpu_data_master_write)) & ~usb_hc_begins_xfer & (usb_hc_wait_counter >= 7) & (usb_hc_wait_counter < 10));

  assign shifted_address_to_usb_hc_from_cpu_data_master = cpu_data_master_address_to_slave;
  //usb_hc_address mux, which is an e_mux
  assign usb_hc_address = shifted_address_to_usb_hc_from_cpu_data_master >> 2;

  //d1_usb_hc_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_usb_hc_end_xfer <= 1;
      else 
        d1_usb_hc_end_xfer <= usb_hc_end_xfer;
    end


  //usb_hc_waits_for_read in a cycle, which is an e_mux
  assign usb_hc_waits_for_read = usb_hc_in_a_read_cycle & wait_for_usb_hc_counter;

  //usb_hc_in_a_read_cycle assignment, which is an e_assign
  assign usb_hc_in_a_read_cycle = cpu_data_master_granted_usb_hc & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = usb_hc_in_a_read_cycle;

  //usb_hc_waits_for_write in a cycle, which is an e_mux
  assign usb_hc_waits_for_write = usb_hc_in_a_write_cycle & wait_for_usb_hc_counter;

  //usb_hc_in_a_write_cycle assignment, which is an e_assign
  assign usb_hc_in_a_write_cycle = cpu_data_master_granted_usb_hc & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = usb_hc_in_a_write_cycle;

  assign usb_hc_wait_counter_eq_0 = usb_hc_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          usb_hc_wait_counter <= 0;
      else 
        usb_hc_wait_counter <= usb_hc_counter_load_value;
    end


  assign usb_hc_counter_load_value = ((usb_hc_in_a_write_cycle & usb_hc_begins_xfer))? 15 :
    ((usb_hc_in_a_read_cycle & usb_hc_begins_xfer))? 8 :
    (~usb_hc_wait_counter_eq_0)? usb_hc_wait_counter - 1 :
    0;

  assign wait_for_usb_hc_counter = usb_hc_begins_xfer | ~usb_hc_wait_counter_eq_0;
  //assign usb_hc_irq_n_from_sa = usb_hc_irq_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign usb_hc_irq_n_from_sa = usb_hc_irq_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //usb/hc enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_reset_clk_50_domain_synch_module (
                                                     // inputs:
                                                      clk,
                                                      data_in,
                                                      reset_n,

                                                     // outputs:
                                                      data_out
                                                   )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_reset_audio_18_domain_synch_module (
                                                       // inputs:
                                                        clk,
                                                        data_in,
                                                        reset_n,

                                                       // outputs:
                                                        data_out
                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_reset_altpll_sys_domain_synch_module (
                                                         // inputs:
                                                          clk,
                                                          data_in,
                                                          reset_n,

                                                         // outputs:
                                                          data_out
                                                       )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio_reset_altpll_io_domain_synch_module (
                                                        // inputs:
                                                         clk,
                                                         data_in,
                                                         reset_n,

                                                        // outputs:
                                                         data_out
                                                      )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_audio (
                    // 1) global signals:
                     altpll_25,
                     altpll_io,
                     altpll_sdram,
                     altpll_sys,
                     audio_18,
                     clk_50,
                     reset_n,

                    // the_altpll
                     locked_from_the_altpll,
                     phasedone_from_the_altpll,

                    // the_altpll_audio
                     locked_from_the_altpll_audio,
                     phasedone_from_the_altpll_audio,

                    // the_audio
                     avs_s1_export_ADCDAT_to_the_audio,
                     avs_s1_export_ADCLRC_to_the_audio,
                     avs_s1_export_BCLK_to_the_audio,
                     avs_s1_export_DACDAT_from_the_audio,
                     avs_s1_export_DACLRC_to_the_audio,
                     avs_s1_export_XCK_from_the_audio,

                    // the_eep_i2c_scl
                     out_port_from_the_eep_i2c_scl,

                    // the_eep_i2c_sda
                     bidir_port_to_and_from_the_eep_i2c_sda,

                    // the_i2c_scl
                     out_port_from_the_i2c_scl,

                    // the_i2c_sda
                     bidir_port_to_and_from_the_i2c_sda,

                    // the_key
                     in_port_to_the_key,

                    // the_lcd
                     LCD_E_from_the_lcd,
                     LCD_RS_from_the_lcd,
                     LCD_RW_from_the_lcd,
                     LCD_data_to_and_from_the_lcd,

                    // the_pio_led
                     out_port_from_the_pio_led,

                    // the_sd_clk
                     out_port_from_the_sd_clk,

                    // the_sd_cmd
                     bidir_port_to_and_from_the_sd_cmd,

                    // the_sd_dat
                     bidir_port_to_and_from_the_sd_dat,

                    // the_sd_wp_n
                     in_port_to_the_sd_wp_n,

                    // the_sdram
                     zs_addr_from_the_sdram,
                     zs_ba_from_the_sdram,
                     zs_cas_n_from_the_sdram,
                     zs_cke_from_the_sdram,
                     zs_cs_n_from_the_sdram,
                     zs_dq_to_and_from_the_sdram,
                     zs_dqm_from_the_sdram,
                     zs_ras_n_from_the_sdram,
                     zs_we_n_from_the_sdram,

                    // the_seg7
                     SEG7_from_the_seg7,

                    // the_sram
                     SRAM_ADDR_from_the_sram,
                     SRAM_CE_n_from_the_sram,
                     SRAM_DQ_to_and_from_the_sram,
                     SRAM_LB_n_from_the_sram,
                     SRAM_OE_n_from_the_sram,
                     SRAM_UB_n_from_the_sram,
                     SRAM_WE_n_from_the_sram,

                    // the_sw
                     in_port_to_the_sw,

                    // the_tri_state_bridge_flash_avalon_slave
                     address_to_the_cfi_flash,
                     read_n_to_the_cfi_flash,
                     select_n_to_the_cfi_flash,
                     tri_state_bridge_flash_data,
                     write_n_to_the_cfi_flash,

                    // the_usb
                     USB_ADDR_from_the_usb,
                     USB_CS_N_from_the_usb,
                     USB_DATA_to_and_from_the_usb,
                     USB_INT0_to_the_usb,
                     USB_INT1_to_the_usb,
                     USB_RD_N_from_the_usb,
                     USB_RST_N_from_the_usb,
                     USB_WR_N_from_the_usb
                  )
;

  output           LCD_E_from_the_lcd;
  output           LCD_RS_from_the_lcd;
  output           LCD_RW_from_the_lcd;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd;
  output  [ 63: 0] SEG7_from_the_seg7;
  output  [ 19: 0] SRAM_ADDR_from_the_sram;
  output           SRAM_CE_n_from_the_sram;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  output           SRAM_LB_n_from_the_sram;
  output           SRAM_OE_n_from_the_sram;
  output           SRAM_UB_n_from_the_sram;
  output           SRAM_WE_n_from_the_sram;
  output  [  1: 0] USB_ADDR_from_the_usb;
  output           USB_CS_N_from_the_usb;
  inout   [ 15: 0] USB_DATA_to_and_from_the_usb;
  output           USB_RD_N_from_the_usb;
  output           USB_RST_N_from_the_usb;
  output           USB_WR_N_from_the_usb;
  output  [ 22: 0] address_to_the_cfi_flash;
  output           altpll_25;
  output           altpll_io;
  output           altpll_sdram;
  output           altpll_sys;
  output           audio_18;
  output           avs_s1_export_DACDAT_from_the_audio;
  output           avs_s1_export_XCK_from_the_audio;
  inout            bidir_port_to_and_from_the_eep_i2c_sda;
  inout            bidir_port_to_and_from_the_i2c_sda;
  inout            bidir_port_to_and_from_the_sd_cmd;
  inout   [  3: 0] bidir_port_to_and_from_the_sd_dat;
  output           locked_from_the_altpll;
  output           locked_from_the_altpll_audio;
  output           out_port_from_the_eep_i2c_scl;
  output           out_port_from_the_i2c_scl;
  output  [ 25: 0] out_port_from_the_pio_led;
  output           out_port_from_the_sd_clk;
  output           phasedone_from_the_altpll;
  output           phasedone_from_the_altpll_audio;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  inout   [  7: 0] tri_state_bridge_flash_data;
  output           write_n_to_the_cfi_flash;
  output  [ 12: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 31: 0] zs_dq_to_and_from_the_sdram;
  output  [  3: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            USB_INT0_to_the_usb;
  input            USB_INT1_to_the_usb;
  input            avs_s1_export_ADCDAT_to_the_audio;
  input            avs_s1_export_ADCLRC_to_the_audio;
  input            avs_s1_export_BCLK_to_the_audio;
  input            avs_s1_export_DACLRC_to_the_audio;
  input            clk_50;
  input   [  3: 0] in_port_to_the_key;
  input            in_port_to_the_sd_wp_n;
  input   [ 17: 0] in_port_to_the_sw;
  input            reset_n;

  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire    [ 63: 0] SEG7_from_the_seg7;
  wire    [ 19: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_n_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_n_from_the_sram;
  wire             SRAM_OE_n_from_the_sram;
  wire             SRAM_UB_n_from_the_sram;
  wire             SRAM_WE_n_from_the_sram;
  wire    [  1: 0] USB_ADDR_from_the_usb;
  wire             USB_CS_N_from_the_usb;
  wire    [ 15: 0] USB_DATA_to_and_from_the_usb;
  wire             USB_RD_N_from_the_usb;
  wire             USB_RST_N_from_the_usb;
  wire             USB_WR_N_from_the_usb;
  wire    [ 22: 0] address_to_the_cfi_flash;
  wire             altpll_25;
  wire    [  1: 0] altpll_audio_pll_slave_address;
  wire             altpll_audio_pll_slave_read;
  wire    [ 31: 0] altpll_audio_pll_slave_readdata;
  wire    [ 31: 0] altpll_audio_pll_slave_readdata_from_sa;
  wire             altpll_audio_pll_slave_reset;
  wire             altpll_audio_pll_slave_write;
  wire    [ 31: 0] altpll_audio_pll_slave_writedata;
  wire             altpll_io;
  wire             altpll_io_reset_n;
  wire    [  1: 0] altpll_pll_slave_address;
  wire             altpll_pll_slave_read;
  wire    [ 31: 0] altpll_pll_slave_readdata;
  wire    [ 31: 0] altpll_pll_slave_readdata_from_sa;
  wire             altpll_pll_slave_reset;
  wire             altpll_pll_slave_write;
  wire    [ 31: 0] altpll_pll_slave_writedata;
  wire             altpll_sdram;
  wire             altpll_sys;
  wire             altpll_sys_reset_n;
  wire             audio_18;
  wire             audio_18_reset_n;
  wire    [  2: 0] audio_avalon_slave_address;
  wire             audio_avalon_slave_read;
  wire    [ 15: 0] audio_avalon_slave_readdata;
  wire    [ 15: 0] audio_avalon_slave_readdata_from_sa;
  wire             audio_avalon_slave_reset;
  wire             audio_avalon_slave_write;
  wire    [ 15: 0] audio_avalon_slave_writedata;
  wire             avs_s1_export_DACDAT_from_the_audio;
  wire             avs_s1_export_XCK_from_the_audio;
  wire             bidir_port_to_and_from_the_eep_i2c_sda;
  wire             bidir_port_to_and_from_the_i2c_sda;
  wire             bidir_port_to_and_from_the_sd_cmd;
  wire    [  3: 0] bidir_port_to_and_from_the_sd_dat;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             clk_50_reset_n;
  wire    [ 27: 0] cpu_data_master_address;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_nios_audio_clock_0_in;
  wire             cpu_data_master_granted_nios_audio_clock_1_in;
  wire             cpu_data_master_granted_nios_audio_clock_2_in;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_granted_sram_avalon_slave;
  wire             cpu_data_master_granted_usb_dc;
  wire             cpu_data_master_granted_usb_hc;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [  1: 0] cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_nios_audio_clock_0_in;
  wire             cpu_data_master_qualified_request_nios_audio_clock_1_in;
  wire             cpu_data_master_qualified_request_nios_audio_clock_2_in;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_qualified_request_sram_avalon_slave;
  wire             cpu_data_master_qualified_request_usb_dc;
  wire             cpu_data_master_qualified_request_usb_hc;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_nios_audio_clock_0_in;
  wire             cpu_data_master_read_data_valid_nios_audio_clock_1_in;
  wire             cpu_data_master_read_data_valid_nios_audio_clock_2_in;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_sram_avalon_slave;
  wire             cpu_data_master_read_data_valid_usb_dc;
  wire             cpu_data_master_read_data_valid_usb_hc;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_peripheral_bridge_s1;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_nios_audio_clock_0_in;
  wire             cpu_data_master_requests_nios_audio_clock_1_in;
  wire             cpu_data_master_requests_nios_audio_clock_2_in;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_requests_sram_avalon_slave;
  wire             cpu_data_master_requests_usb_dc;
  wire             cpu_data_master_requests_usb_hc;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 27: 0] cpu_instruction_master_address;
  wire    [ 27: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_sram_avalon_slave;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_sram_avalon_slave;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_sram_avalon_slave;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_sram_avalon_slave;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire    [  8: 0] cpu_peripheral_bridge_m1_address;
  wire    [  8: 0] cpu_peripheral_bridge_m1_address_to_slave;
  wire    [  3: 0] cpu_peripheral_bridge_m1_byteenable;
  wire             cpu_peripheral_bridge_m1_endofpacket;
  wire             cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_granted_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_granted_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_granted_key_s1;
  wire             cpu_peripheral_bridge_m1_granted_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_granted_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_granted_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_granted_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_granted_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_granted_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_granted_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_granted_sw_s1;
  wire             cpu_peripheral_bridge_m1_granted_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_granted_timer_s1;
  wire             cpu_peripheral_bridge_m1_latency_counter;
  wire    [  6: 0] cpu_peripheral_bridge_m1_nativeaddress;
  wire             cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_key_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_qualified_request_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_qualified_request_sw_s1;
  wire             cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_qualified_request_timer_s1;
  wire             cpu_peripheral_bridge_m1_read;
  wire             cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_key_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sw_s1;
  wire             cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_read_data_valid_timer_s1;
  wire    [ 31: 0] cpu_peripheral_bridge_m1_readdata;
  wire             cpu_peripheral_bridge_m1_readdatavalid;
  wire             cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_requests_i2c_scl_s1;
  wire             cpu_peripheral_bridge_m1_requests_i2c_sda_s1;
  wire             cpu_peripheral_bridge_m1_requests_key_s1;
  wire             cpu_peripheral_bridge_m1_requests_lcd_control_slave;
  wire             cpu_peripheral_bridge_m1_requests_pio_led_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_clk_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_cmd_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_dat_s1;
  wire             cpu_peripheral_bridge_m1_requests_sd_wp_n_s1;
  wire             cpu_peripheral_bridge_m1_requests_seg7_avalon_slave;
  wire             cpu_peripheral_bridge_m1_requests_sw_s1;
  wire             cpu_peripheral_bridge_m1_requests_sysid_control_slave;
  wire             cpu_peripheral_bridge_m1_requests_timer_s1;
  wire             cpu_peripheral_bridge_m1_reset_n;
  wire             cpu_peripheral_bridge_m1_waitrequest;
  wire             cpu_peripheral_bridge_m1_write;
  wire    [ 31: 0] cpu_peripheral_bridge_m1_writedata;
  wire    [  6: 0] cpu_peripheral_bridge_s1_address;
  wire    [  3: 0] cpu_peripheral_bridge_s1_byteenable;
  wire             cpu_peripheral_bridge_s1_endofpacket;
  wire             cpu_peripheral_bridge_s1_endofpacket_from_sa;
  wire    [  6: 0] cpu_peripheral_bridge_s1_nativeaddress;
  wire             cpu_peripheral_bridge_s1_read;
  wire    [ 31: 0] cpu_peripheral_bridge_s1_readdata;
  wire    [ 31: 0] cpu_peripheral_bridge_s1_readdata_from_sa;
  wire             cpu_peripheral_bridge_s1_readdatavalid;
  wire             cpu_peripheral_bridge_s1_reset_n;
  wire             cpu_peripheral_bridge_s1_waitrequest;
  wire             cpu_peripheral_bridge_s1_waitrequest_from_sa;
  wire             cpu_peripheral_bridge_s1_write;
  wire    [ 31: 0] cpu_peripheral_bridge_s1_writedata;
  wire             d1_altpll_audio_pll_slave_end_xfer;
  wire             d1_altpll_pll_slave_end_xfer;
  wire             d1_audio_avalon_slave_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_cpu_peripheral_bridge_s1_end_xfer;
  wire             d1_eep_i2c_scl_s1_end_xfer;
  wire             d1_eep_i2c_sda_s1_end_xfer;
  wire             d1_i2c_scl_s1_end_xfer;
  wire             d1_i2c_sda_s1_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_key_s1_end_xfer;
  wire             d1_lcd_control_slave_end_xfer;
  wire             d1_nios_audio_clock_0_in_end_xfer;
  wire             d1_nios_audio_clock_1_in_end_xfer;
  wire             d1_nios_audio_clock_2_in_end_xfer;
  wire             d1_pio_led_s1_end_xfer;
  wire             d1_sd_clk_s1_end_xfer;
  wire             d1_sd_cmd_s1_end_xfer;
  wire             d1_sd_dat_s1_end_xfer;
  wire             d1_sd_wp_n_s1_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_seg7_avalon_slave_end_xfer;
  wire             d1_sram_avalon_slave_end_xfer;
  wire             d1_sw_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_s1_end_xfer;
  wire             d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  wire             d1_usb_dc_end_xfer;
  wire             d1_usb_hc_end_xfer;
  wire    [  1: 0] eep_i2c_scl_s1_address;
  wire             eep_i2c_scl_s1_chipselect;
  wire             eep_i2c_scl_s1_readdata;
  wire             eep_i2c_scl_s1_readdata_from_sa;
  wire             eep_i2c_scl_s1_reset_n;
  wire             eep_i2c_scl_s1_write_n;
  wire             eep_i2c_scl_s1_writedata;
  wire    [  1: 0] eep_i2c_sda_s1_address;
  wire             eep_i2c_sda_s1_chipselect;
  wire             eep_i2c_sda_s1_readdata;
  wire             eep_i2c_sda_s1_readdata_from_sa;
  wire             eep_i2c_sda_s1_reset_n;
  wire             eep_i2c_sda_s1_write_n;
  wire             eep_i2c_sda_s1_writedata;
  wire    [  1: 0] i2c_scl_s1_address;
  wire             i2c_scl_s1_chipselect;
  wire             i2c_scl_s1_readdata;
  wire             i2c_scl_s1_readdata_from_sa;
  wire             i2c_scl_s1_reset_n;
  wire             i2c_scl_s1_write_n;
  wire             i2c_scl_s1_writedata;
  wire    [  1: 0] i2c_sda_s1_address;
  wire             i2c_sda_s1_chipselect;
  wire             i2c_sda_s1_readdata;
  wire             i2c_sda_s1_readdata_from_sa;
  wire             i2c_sda_s1_reset_n;
  wire             i2c_sda_s1_write_n;
  wire             i2c_sda_s1_writedata;
  wire    [  7: 0] incoming_tri_state_bridge_flash_data;
  wire    [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] key_s1_address;
  wire             key_s1_chipselect;
  wire             key_s1_irq;
  wire             key_s1_irq_from_sa;
  wire    [  3: 0] key_s1_readdata;
  wire    [  3: 0] key_s1_readdata_from_sa;
  wire             key_s1_reset_n;
  wire             key_s1_write_n;
  wire    [  3: 0] key_s1_writedata;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_begintransfer;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire             locked_from_the_altpll;
  wire             locked_from_the_altpll_audio;
  wire    [  3: 0] nios_audio_clock_0_in_address;
  wire    [  3: 0] nios_audio_clock_0_in_byteenable;
  wire             nios_audio_clock_0_in_endofpacket;
  wire             nios_audio_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] nios_audio_clock_0_in_nativeaddress;
  wire             nios_audio_clock_0_in_read;
  wire    [ 31: 0] nios_audio_clock_0_in_readdata;
  wire    [ 31: 0] nios_audio_clock_0_in_readdata_from_sa;
  wire             nios_audio_clock_0_in_reset_n;
  wire             nios_audio_clock_0_in_waitrequest;
  wire             nios_audio_clock_0_in_waitrequest_from_sa;
  wire             nios_audio_clock_0_in_write;
  wire    [ 31: 0] nios_audio_clock_0_in_writedata;
  wire    [  3: 0] nios_audio_clock_0_out_address;
  wire    [  3: 0] nios_audio_clock_0_out_address_to_slave;
  wire    [  3: 0] nios_audio_clock_0_out_byteenable;
  wire             nios_audio_clock_0_out_endofpacket;
  wire             nios_audio_clock_0_out_granted_altpll_audio_pll_slave;
  wire    [  1: 0] nios_audio_clock_0_out_nativeaddress;
  wire             nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave;
  wire             nios_audio_clock_0_out_read;
  wire             nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave;
  wire    [ 31: 0] nios_audio_clock_0_out_readdata;
  wire             nios_audio_clock_0_out_requests_altpll_audio_pll_slave;
  wire             nios_audio_clock_0_out_reset_n;
  wire             nios_audio_clock_0_out_waitrequest;
  wire             nios_audio_clock_0_out_write;
  wire    [ 31: 0] nios_audio_clock_0_out_writedata;
  wire    [  3: 0] nios_audio_clock_1_in_address;
  wire    [  3: 0] nios_audio_clock_1_in_byteenable;
  wire             nios_audio_clock_1_in_endofpacket;
  wire             nios_audio_clock_1_in_endofpacket_from_sa;
  wire    [  1: 0] nios_audio_clock_1_in_nativeaddress;
  wire             nios_audio_clock_1_in_read;
  wire    [ 31: 0] nios_audio_clock_1_in_readdata;
  wire    [ 31: 0] nios_audio_clock_1_in_readdata_from_sa;
  wire             nios_audio_clock_1_in_reset_n;
  wire             nios_audio_clock_1_in_waitrequest;
  wire             nios_audio_clock_1_in_waitrequest_from_sa;
  wire             nios_audio_clock_1_in_write;
  wire    [ 31: 0] nios_audio_clock_1_in_writedata;
  wire    [  3: 0] nios_audio_clock_1_out_address;
  wire    [  3: 0] nios_audio_clock_1_out_address_to_slave;
  wire    [  3: 0] nios_audio_clock_1_out_byteenable;
  wire             nios_audio_clock_1_out_endofpacket;
  wire             nios_audio_clock_1_out_granted_altpll_pll_slave;
  wire    [  1: 0] nios_audio_clock_1_out_nativeaddress;
  wire             nios_audio_clock_1_out_qualified_request_altpll_pll_slave;
  wire             nios_audio_clock_1_out_read;
  wire             nios_audio_clock_1_out_read_data_valid_altpll_pll_slave;
  wire    [ 31: 0] nios_audio_clock_1_out_readdata;
  wire             nios_audio_clock_1_out_requests_altpll_pll_slave;
  wire             nios_audio_clock_1_out_reset_n;
  wire             nios_audio_clock_1_out_waitrequest;
  wire             nios_audio_clock_1_out_write;
  wire    [ 31: 0] nios_audio_clock_1_out_writedata;
  wire    [  3: 0] nios_audio_clock_2_in_address;
  wire    [  1: 0] nios_audio_clock_2_in_byteenable;
  wire             nios_audio_clock_2_in_endofpacket;
  wire             nios_audio_clock_2_in_endofpacket_from_sa;
  wire    [  2: 0] nios_audio_clock_2_in_nativeaddress;
  wire             nios_audio_clock_2_in_read;
  wire    [ 15: 0] nios_audio_clock_2_in_readdata;
  wire    [ 15: 0] nios_audio_clock_2_in_readdata_from_sa;
  wire             nios_audio_clock_2_in_reset_n;
  wire             nios_audio_clock_2_in_waitrequest;
  wire             nios_audio_clock_2_in_waitrequest_from_sa;
  wire             nios_audio_clock_2_in_write;
  wire    [ 15: 0] nios_audio_clock_2_in_writedata;
  wire    [  3: 0] nios_audio_clock_2_out_address;
  wire    [  3: 0] nios_audio_clock_2_out_address_to_slave;
  wire    [  1: 0] nios_audio_clock_2_out_byteenable;
  wire             nios_audio_clock_2_out_endofpacket;
  wire             nios_audio_clock_2_out_granted_audio_avalon_slave;
  wire    [  2: 0] nios_audio_clock_2_out_nativeaddress;
  wire             nios_audio_clock_2_out_qualified_request_audio_avalon_slave;
  wire             nios_audio_clock_2_out_read;
  wire             nios_audio_clock_2_out_read_data_valid_audio_avalon_slave;
  wire    [ 15: 0] nios_audio_clock_2_out_readdata;
  wire             nios_audio_clock_2_out_requests_audio_avalon_slave;
  wire             nios_audio_clock_2_out_reset_n;
  wire             nios_audio_clock_2_out_waitrequest;
  wire             nios_audio_clock_2_out_write;
  wire    [ 15: 0] nios_audio_clock_2_out_writedata;
  wire             out_clk_altpll_audio_c0;
  wire             out_clk_altpll_c0;
  wire             out_clk_altpll_c1;
  wire             out_clk_altpll_c2;
  wire             out_clk_altpll_c3;
  wire             out_port_from_the_eep_i2c_scl;
  wire             out_port_from_the_i2c_scl;
  wire    [ 25: 0] out_port_from_the_pio_led;
  wire             out_port_from_the_sd_clk;
  wire             phasedone_from_the_altpll;
  wire             phasedone_from_the_altpll_audio;
  wire    [  1: 0] pio_led_s1_address;
  wire             pio_led_s1_chipselect;
  wire    [ 25: 0] pio_led_s1_readdata;
  wire    [ 25: 0] pio_led_s1_readdata_from_sa;
  wire             pio_led_s1_reset_n;
  wire             pio_led_s1_write_n;
  wire    [ 25: 0] pio_led_s1_writedata;
  wire             read_n_to_the_cfi_flash;
  wire             reset_n_sources;
  wire    [  1: 0] sd_clk_s1_address;
  wire             sd_clk_s1_chipselect;
  wire             sd_clk_s1_readdata;
  wire             sd_clk_s1_readdata_from_sa;
  wire             sd_clk_s1_reset_n;
  wire             sd_clk_s1_write_n;
  wire             sd_clk_s1_writedata;
  wire    [  1: 0] sd_cmd_s1_address;
  wire             sd_cmd_s1_chipselect;
  wire             sd_cmd_s1_readdata;
  wire             sd_cmd_s1_readdata_from_sa;
  wire             sd_cmd_s1_reset_n;
  wire             sd_cmd_s1_write_n;
  wire             sd_cmd_s1_writedata;
  wire    [  1: 0] sd_dat_s1_address;
  wire             sd_dat_s1_chipselect;
  wire    [  3: 0] sd_dat_s1_readdata;
  wire    [  3: 0] sd_dat_s1_readdata_from_sa;
  wire             sd_dat_s1_reset_n;
  wire             sd_dat_s1_write_n;
  wire    [  3: 0] sd_dat_s1_writedata;
  wire    [  1: 0] sd_wp_n_s1_address;
  wire             sd_wp_n_s1_readdata;
  wire             sd_wp_n_s1_readdata_from_sa;
  wire             sd_wp_n_s1_reset_n;
  wire    [ 24: 0] sdram_s1_address;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire    [  2: 0] seg7_avalon_slave_address;
  wire             seg7_avalon_slave_read;
  wire    [  7: 0] seg7_avalon_slave_readdata;
  wire    [  7: 0] seg7_avalon_slave_readdata_from_sa;
  wire             seg7_avalon_slave_reset;
  wire             seg7_avalon_slave_write;
  wire    [  7: 0] seg7_avalon_slave_writedata;
  wire             select_n_to_the_cfi_flash;
  wire    [ 19: 0] sram_avalon_slave_address;
  wire    [  1: 0] sram_avalon_slave_byteenable_n;
  wire             sram_avalon_slave_chipselect_n;
  wire             sram_avalon_slave_read_n;
  wire    [ 15: 0] sram_avalon_slave_readdata;
  wire    [ 15: 0] sram_avalon_slave_readdata_from_sa;
  wire             sram_avalon_slave_reset_n;
  wire             sram_avalon_slave_wait_counter_eq_0;
  wire             sram_avalon_slave_write_n;
  wire    [ 15: 0] sram_avalon_slave_writedata;
  wire    [  1: 0] sw_s1_address;
  wire             sw_s1_chipselect;
  wire             sw_s1_irq;
  wire             sw_s1_irq_from_sa;
  wire    [ 17: 0] sw_s1_readdata;
  wire    [ 17: 0] sw_s1_readdata_from_sa;
  wire             sw_s1_reset_n;
  wire             sw_s1_write_n;
  wire    [ 17: 0] sw_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_chipselect;
  wire             timer_s1_irq;
  wire             timer_s1_irq_from_sa;
  wire    [ 15: 0] timer_s1_readdata;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  wire             timer_s1_reset_n;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire    [  7: 0] tri_state_bridge_flash_data;
  wire             usb_dc_address;
  wire             usb_dc_chipselect_n;
  wire             usb_dc_irq_n;
  wire             usb_dc_irq_n_from_sa;
  wire             usb_dc_read_n;
  wire    [ 15: 0] usb_dc_readdata;
  wire    [ 15: 0] usb_dc_readdata_from_sa;
  wire             usb_dc_reset_n;
  wire             usb_dc_wait_counter_eq_0;
  wire             usb_dc_write_n;
  wire    [ 15: 0] usb_dc_writedata;
  wire             usb_hc_address;
  wire             usb_hc_chipselect_n;
  wire             usb_hc_irq_n;
  wire             usb_hc_irq_n_from_sa;
  wire             usb_hc_read_n;
  wire    [ 15: 0] usb_hc_readdata;
  wire    [ 15: 0] usb_hc_readdata_from_sa;
  wire             usb_hc_reset_n;
  wire             usb_hc_wait_counter_eq_0;
  wire             usb_hc_write_n;
  wire    [ 15: 0] usb_hc_writedata;
  wire             write_n_to_the_cfi_flash;
  wire    [ 12: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  altpll_pll_slave_arbitrator the_altpll_pll_slave
    (
      .altpll_pll_slave_address                                  (altpll_pll_slave_address),
      .altpll_pll_slave_read                                     (altpll_pll_slave_read),
      .altpll_pll_slave_readdata                                 (altpll_pll_slave_readdata),
      .altpll_pll_slave_readdata_from_sa                         (altpll_pll_slave_readdata_from_sa),
      .altpll_pll_slave_reset                                    (altpll_pll_slave_reset),
      .altpll_pll_slave_write                                    (altpll_pll_slave_write),
      .altpll_pll_slave_writedata                                (altpll_pll_slave_writedata),
      .clk                                                       (clk_50),
      .d1_altpll_pll_slave_end_xfer                              (d1_altpll_pll_slave_end_xfer),
      .nios_audio_clock_1_out_address_to_slave                   (nios_audio_clock_1_out_address_to_slave),
      .nios_audio_clock_1_out_granted_altpll_pll_slave           (nios_audio_clock_1_out_granted_altpll_pll_slave),
      .nios_audio_clock_1_out_qualified_request_altpll_pll_slave (nios_audio_clock_1_out_qualified_request_altpll_pll_slave),
      .nios_audio_clock_1_out_read                               (nios_audio_clock_1_out_read),
      .nios_audio_clock_1_out_read_data_valid_altpll_pll_slave   (nios_audio_clock_1_out_read_data_valid_altpll_pll_slave),
      .nios_audio_clock_1_out_requests_altpll_pll_slave          (nios_audio_clock_1_out_requests_altpll_pll_slave),
      .nios_audio_clock_1_out_write                              (nios_audio_clock_1_out_write),
      .nios_audio_clock_1_out_writedata                          (nios_audio_clock_1_out_writedata),
      .reset_n                                                   (clk_50_reset_n)
    );

  //altpll_sys out_clk assignment, which is an e_assign
  assign altpll_sys = out_clk_altpll_c0;

  //altpll_sdram out_clk assignment, which is an e_assign
  assign altpll_sdram = out_clk_altpll_c1;

  //altpll_io out_clk assignment, which is an e_assign
  assign altpll_io = out_clk_altpll_c2;

  //altpll_25 out_clk assignment, which is an e_assign
  assign altpll_25 = out_clk_altpll_c3;

  altpll the_altpll
    (
      .address   (altpll_pll_slave_address),
      .c0        (out_clk_altpll_c0),
      .c1        (out_clk_altpll_c1),
      .c2        (out_clk_altpll_c2),
      .c3        (out_clk_altpll_c3),
      .clk       (clk_50),
      .locked    (locked_from_the_altpll),
      .phasedone (phasedone_from_the_altpll),
      .read      (altpll_pll_slave_read),
      .readdata  (altpll_pll_slave_readdata),
      .reset     (altpll_pll_slave_reset),
      .write     (altpll_pll_slave_write),
      .writedata (altpll_pll_slave_writedata)
    );

  altpll_audio_pll_slave_arbitrator the_altpll_audio_pll_slave
    (
      .altpll_audio_pll_slave_address                                  (altpll_audio_pll_slave_address),
      .altpll_audio_pll_slave_read                                     (altpll_audio_pll_slave_read),
      .altpll_audio_pll_slave_readdata                                 (altpll_audio_pll_slave_readdata),
      .altpll_audio_pll_slave_readdata_from_sa                         (altpll_audio_pll_slave_readdata_from_sa),
      .altpll_audio_pll_slave_reset                                    (altpll_audio_pll_slave_reset),
      .altpll_audio_pll_slave_write                                    (altpll_audio_pll_slave_write),
      .altpll_audio_pll_slave_writedata                                (altpll_audio_pll_slave_writedata),
      .clk                                                             (clk_50),
      .d1_altpll_audio_pll_slave_end_xfer                              (d1_altpll_audio_pll_slave_end_xfer),
      .nios_audio_clock_0_out_address_to_slave                         (nios_audio_clock_0_out_address_to_slave),
      .nios_audio_clock_0_out_granted_altpll_audio_pll_slave           (nios_audio_clock_0_out_granted_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave (nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_read                                     (nios_audio_clock_0_out_read),
      .nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave   (nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_requests_altpll_audio_pll_slave          (nios_audio_clock_0_out_requests_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_write                                    (nios_audio_clock_0_out_write),
      .nios_audio_clock_0_out_writedata                                (nios_audio_clock_0_out_writedata),
      .reset_n                                                         (clk_50_reset_n)
    );

  //audio_18 out_clk assignment, which is an e_assign
  assign audio_18 = out_clk_altpll_audio_c0;

  altpll_audio the_altpll_audio
    (
      .address   (altpll_audio_pll_slave_address),
      .c0        (out_clk_altpll_audio_c0),
      .clk       (clk_50),
      .locked    (locked_from_the_altpll_audio),
      .phasedone (phasedone_from_the_altpll_audio),
      .read      (altpll_audio_pll_slave_read),
      .readdata  (altpll_audio_pll_slave_readdata),
      .reset     (altpll_audio_pll_slave_reset),
      .write     (altpll_audio_pll_slave_write),
      .writedata (altpll_audio_pll_slave_writedata)
    );

  audio_avalon_slave_arbitrator the_audio_avalon_slave
    (
      .audio_avalon_slave_address                                  (audio_avalon_slave_address),
      .audio_avalon_slave_read                                     (audio_avalon_slave_read),
      .audio_avalon_slave_readdata                                 (audio_avalon_slave_readdata),
      .audio_avalon_slave_readdata_from_sa                         (audio_avalon_slave_readdata_from_sa),
      .audio_avalon_slave_reset                                    (audio_avalon_slave_reset),
      .audio_avalon_slave_write                                    (audio_avalon_slave_write),
      .audio_avalon_slave_writedata                                (audio_avalon_slave_writedata),
      .clk                                                         (audio_18),
      .d1_audio_avalon_slave_end_xfer                              (d1_audio_avalon_slave_end_xfer),
      .nios_audio_clock_2_out_address_to_slave                     (nios_audio_clock_2_out_address_to_slave),
      .nios_audio_clock_2_out_granted_audio_avalon_slave           (nios_audio_clock_2_out_granted_audio_avalon_slave),
      .nios_audio_clock_2_out_nativeaddress                        (nios_audio_clock_2_out_nativeaddress),
      .nios_audio_clock_2_out_qualified_request_audio_avalon_slave (nios_audio_clock_2_out_qualified_request_audio_avalon_slave),
      .nios_audio_clock_2_out_read                                 (nios_audio_clock_2_out_read),
      .nios_audio_clock_2_out_read_data_valid_audio_avalon_slave   (nios_audio_clock_2_out_read_data_valid_audio_avalon_slave),
      .nios_audio_clock_2_out_requests_audio_avalon_slave          (nios_audio_clock_2_out_requests_audio_avalon_slave),
      .nios_audio_clock_2_out_write                                (nios_audio_clock_2_out_write),
      .nios_audio_clock_2_out_writedata                            (nios_audio_clock_2_out_writedata),
      .reset_n                                                     (audio_18_reset_n)
    );

  audio the_audio
    (
      .avs_s1_address       (audio_avalon_slave_address),
      .avs_s1_clk           (audio_18),
      .avs_s1_export_ADCDAT (avs_s1_export_ADCDAT_to_the_audio),
      .avs_s1_export_ADCLRC (avs_s1_export_ADCLRC_to_the_audio),
      .avs_s1_export_BCLK   (avs_s1_export_BCLK_to_the_audio),
      .avs_s1_export_DACDAT (avs_s1_export_DACDAT_from_the_audio),
      .avs_s1_export_DACLRC (avs_s1_export_DACLRC_to_the_audio),
      .avs_s1_export_XCK    (avs_s1_export_XCK_from_the_audio),
      .avs_s1_read          (audio_avalon_slave_read),
      .avs_s1_readdata      (audio_avalon_slave_readdata),
      .avs_s1_reset         (audio_avalon_slave_reset),
      .avs_s1_write         (audio_avalon_slave_write),
      .avs_s1_writedata     (audio_avalon_slave_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                             (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                           (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                 (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                   (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cpu_jtag_debug_module                          (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                 (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                    (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                                  (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module          (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                             (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module            (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                   (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                           (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                                     (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                                        (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                                        (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                                       (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                          (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                                  (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                           (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                                      (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                              (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                             (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                         (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                                       (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                                 (altpll_sys_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .altpll_sys                                                              (altpll_sys),
      .altpll_sys_reset_n                                                      (altpll_sys_reset_n),
      .cfi_flash_s1_wait_counter_eq_0                                          (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address                                                 (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                                 (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_byteenable_sram_avalon_slave                            (cpu_data_master_byteenable_sram_avalon_slave),
      .cpu_data_master_dbs_address                                             (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                            (cpu_data_master_dbs_write_16),
      .cpu_data_master_dbs_write_8                                             (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cfi_flash_s1                                    (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                           (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_cpu_peripheral_bridge_s1                        (cpu_data_master_granted_cpu_peripheral_bridge_s1),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                     (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_nios_audio_clock_0_in                           (cpu_data_master_granted_nios_audio_clock_0_in),
      .cpu_data_master_granted_nios_audio_clock_1_in                           (cpu_data_master_granted_nios_audio_clock_1_in),
      .cpu_data_master_granted_nios_audio_clock_2_in                           (cpu_data_master_granted_nios_audio_clock_2_in),
      .cpu_data_master_granted_sdram_s1                                        (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_granted_sram_avalon_slave                               (cpu_data_master_granted_sram_avalon_slave),
      .cpu_data_master_granted_usb_dc                                          (cpu_data_master_granted_usb_dc),
      .cpu_data_master_granted_usb_hc                                          (cpu_data_master_granted_usb_hc),
      .cpu_data_master_irq                                                     (cpu_data_master_irq),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cfi_flash_s1                          (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                 (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_peripheral_bridge_s1              (cpu_data_master_qualified_request_cpu_peripheral_bridge_s1),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave           (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_nios_audio_clock_0_in                 (cpu_data_master_qualified_request_nios_audio_clock_0_in),
      .cpu_data_master_qualified_request_nios_audio_clock_1_in                 (cpu_data_master_qualified_request_nios_audio_clock_1_in),
      .cpu_data_master_qualified_request_nios_audio_clock_2_in                 (cpu_data_master_qualified_request_nios_audio_clock_2_in),
      .cpu_data_master_qualified_request_sdram_s1                              (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_qualified_request_sram_avalon_slave                     (cpu_data_master_qualified_request_sram_avalon_slave),
      .cpu_data_master_qualified_request_usb_dc                                (cpu_data_master_qualified_request_usb_dc),
      .cpu_data_master_qualified_request_usb_hc                                (cpu_data_master_qualified_request_usb_hc),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                            (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                   (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1                (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave             (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_nios_audio_clock_0_in                   (cpu_data_master_read_data_valid_nios_audio_clock_0_in),
      .cpu_data_master_read_data_valid_nios_audio_clock_1_in                   (cpu_data_master_read_data_valid_nios_audio_clock_1_in),
      .cpu_data_master_read_data_valid_nios_audio_clock_2_in                   (cpu_data_master_read_data_valid_nios_audio_clock_2_in),
      .cpu_data_master_read_data_valid_sdram_s1                                (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sram_avalon_slave                       (cpu_data_master_read_data_valid_sram_avalon_slave),
      .cpu_data_master_read_data_valid_usb_dc                                  (cpu_data_master_read_data_valid_usb_dc),
      .cpu_data_master_read_data_valid_usb_hc                                  (cpu_data_master_read_data_valid_usb_hc),
      .cpu_data_master_readdata                                                (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                           (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_cfi_flash_s1                                   (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                          (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_peripheral_bridge_s1                       (cpu_data_master_requests_cpu_peripheral_bridge_s1),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                    (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_nios_audio_clock_0_in                          (cpu_data_master_requests_nios_audio_clock_0_in),
      .cpu_data_master_requests_nios_audio_clock_1_in                          (cpu_data_master_requests_nios_audio_clock_1_in),
      .cpu_data_master_requests_nios_audio_clock_2_in                          (cpu_data_master_requests_nios_audio_clock_2_in),
      .cpu_data_master_requests_sdram_s1                                       (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_requests_sram_avalon_slave                              (cpu_data_master_requests_sram_avalon_slave),
      .cpu_data_master_requests_usb_dc                                         (cpu_data_master_requests_usb_dc),
      .cpu_data_master_requests_usb_hc                                         (cpu_data_master_requests_usb_hc),
      .cpu_data_master_waitrequest                                             (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                  (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_peripheral_bridge_s1_readdata_from_sa                               (cpu_peripheral_bridge_s1_readdata_from_sa),
      .cpu_peripheral_bridge_s1_waitrequest_from_sa                            (cpu_peripheral_bridge_s1_waitrequest_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                       (d1_cpu_jtag_debug_module_end_xfer),
      .d1_cpu_peripheral_bridge_s1_end_xfer                                    (d1_cpu_peripheral_bridge_s1_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                 (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_nios_audio_clock_0_in_end_xfer                                       (d1_nios_audio_clock_0_in_end_xfer),
      .d1_nios_audio_clock_1_in_end_xfer                                       (d1_nios_audio_clock_1_in_end_xfer),
      .d1_nios_audio_clock_2_in_end_xfer                                       (d1_nios_audio_clock_2_in_end_xfer),
      .d1_sdram_s1_end_xfer                                                    (d1_sdram_s1_end_xfer),
      .d1_sram_avalon_slave_end_xfer                                           (d1_sram_avalon_slave_end_xfer),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                         (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .d1_usb_dc_end_xfer                                                      (d1_usb_dc_end_xfer),
      .d1_usb_hc_end_xfer                                                      (d1_usb_hc_end_xfer),
      .incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0             (incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                 (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                            (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                         (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .key_s1_irq_from_sa                                                      (key_s1_irq_from_sa),
      .nios_audio_clock_0_in_readdata_from_sa                                  (nios_audio_clock_0_in_readdata_from_sa),
      .nios_audio_clock_0_in_waitrequest_from_sa                               (nios_audio_clock_0_in_waitrequest_from_sa),
      .nios_audio_clock_1_in_readdata_from_sa                                  (nios_audio_clock_1_in_readdata_from_sa),
      .nios_audio_clock_1_in_waitrequest_from_sa                               (nios_audio_clock_1_in_waitrequest_from_sa),
      .nios_audio_clock_2_in_readdata_from_sa                                  (nios_audio_clock_2_in_readdata_from_sa),
      .nios_audio_clock_2_in_waitrequest_from_sa                               (nios_audio_clock_2_in_waitrequest_from_sa),
      .reset_n                                                                 (altpll_sys_reset_n),
      .sdram_s1_readdata_from_sa                                               (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                            (sdram_s1_waitrequest_from_sa),
      .sram_avalon_slave_readdata_from_sa                                      (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_wait_counter_eq_0                                     (sram_avalon_slave_wait_counter_eq_0),
      .sw_s1_irq_from_sa                                                       (sw_s1_irq_from_sa),
      .timer_s1_irq_from_sa                                                    (timer_s1_irq_from_sa),
      .usb_dc_irq_n_from_sa                                                    (usb_dc_irq_n_from_sa),
      .usb_dc_readdata_from_sa                                                 (usb_dc_readdata_from_sa),
      .usb_dc_wait_counter_eq_0                                                (usb_dc_wait_counter_eq_0),
      .usb_hc_irq_n_from_sa                                                    (usb_hc_irq_n_from_sa),
      .usb_hc_readdata_from_sa                                                 (usb_hc_readdata_from_sa),
      .usb_hc_wait_counter_eq_0                                                (usb_hc_wait_counter_eq_0)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                            (altpll_sys),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_sram_avalon_slave               (cpu_instruction_master_granted_sram_avalon_slave),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_sram_avalon_slave     (cpu_instruction_master_qualified_request_sram_avalon_slave),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_sram_avalon_slave       (cpu_instruction_master_read_data_valid_sram_avalon_slave),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                           (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_sram_avalon_slave              (cpu_instruction_master_requests_sram_avalon_slave),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_sram_avalon_slave_end_xfer                                  (d1_sram_avalon_slave_end_xfer),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_flash_data                           (incoming_tri_state_bridge_flash_data),
      .reset_n                                                        (altpll_sys_reset_n),
      .sram_avalon_slave_readdata_from_sa                             (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_wait_counter_eq_0                            (sram_avalon_slave_wait_counter_eq_0)
    );

  cpu the_cpu
    (
      .clk                                   (altpll_sys),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  cpu_peripheral_bridge_s1_arbitrator the_cpu_peripheral_bridge_s1
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_granted_cpu_peripheral_bridge_s1                        (cpu_data_master_granted_cpu_peripheral_bridge_s1),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_peripheral_bridge_s1              (cpu_data_master_qualified_request_cpu_peripheral_bridge_s1),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1                (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cpu_peripheral_bridge_s1                       (cpu_data_master_requests_cpu_peripheral_bridge_s1),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .cpu_peripheral_bridge_s1_address                                        (cpu_peripheral_bridge_s1_address),
      .cpu_peripheral_bridge_s1_byteenable                                     (cpu_peripheral_bridge_s1_byteenable),
      .cpu_peripheral_bridge_s1_endofpacket                                    (cpu_peripheral_bridge_s1_endofpacket),
      .cpu_peripheral_bridge_s1_endofpacket_from_sa                            (cpu_peripheral_bridge_s1_endofpacket_from_sa),
      .cpu_peripheral_bridge_s1_nativeaddress                                  (cpu_peripheral_bridge_s1_nativeaddress),
      .cpu_peripheral_bridge_s1_read                                           (cpu_peripheral_bridge_s1_read),
      .cpu_peripheral_bridge_s1_readdata                                       (cpu_peripheral_bridge_s1_readdata),
      .cpu_peripheral_bridge_s1_readdata_from_sa                               (cpu_peripheral_bridge_s1_readdata_from_sa),
      .cpu_peripheral_bridge_s1_readdatavalid                                  (cpu_peripheral_bridge_s1_readdatavalid),
      .cpu_peripheral_bridge_s1_reset_n                                        (cpu_peripheral_bridge_s1_reset_n),
      .cpu_peripheral_bridge_s1_waitrequest                                    (cpu_peripheral_bridge_s1_waitrequest),
      .cpu_peripheral_bridge_s1_waitrequest_from_sa                            (cpu_peripheral_bridge_s1_waitrequest_from_sa),
      .cpu_peripheral_bridge_s1_write                                          (cpu_peripheral_bridge_s1_write),
      .cpu_peripheral_bridge_s1_writedata                                      (cpu_peripheral_bridge_s1_writedata),
      .d1_cpu_peripheral_bridge_s1_end_xfer                                    (d1_cpu_peripheral_bridge_s1_end_xfer),
      .reset_n                                                                 (altpll_sys_reset_n)
    );

  cpu_peripheral_bridge_m1_arbitrator the_cpu_peripheral_bridge_m1
    (
      .clk                                                            (altpll_io),
      .cpu_peripheral_bridge_m1_address                               (cpu_peripheral_bridge_m1_address),
      .cpu_peripheral_bridge_m1_address_to_slave                      (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_byteenable                            (cpu_peripheral_bridge_m1_byteenable),
      .cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1                (cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1                (cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_granted_i2c_scl_s1                    (cpu_peripheral_bridge_m1_granted_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_granted_i2c_sda_s1                    (cpu_peripheral_bridge_m1_granted_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_granted_key_s1                        (cpu_peripheral_bridge_m1_granted_key_s1),
      .cpu_peripheral_bridge_m1_granted_lcd_control_slave             (cpu_peripheral_bridge_m1_granted_lcd_control_slave),
      .cpu_peripheral_bridge_m1_granted_pio_led_s1                    (cpu_peripheral_bridge_m1_granted_pio_led_s1),
      .cpu_peripheral_bridge_m1_granted_sd_clk_s1                     (cpu_peripheral_bridge_m1_granted_sd_clk_s1),
      .cpu_peripheral_bridge_m1_granted_sd_cmd_s1                     (cpu_peripheral_bridge_m1_granted_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_granted_sd_dat_s1                     (cpu_peripheral_bridge_m1_granted_sd_dat_s1),
      .cpu_peripheral_bridge_m1_granted_sd_wp_n_s1                    (cpu_peripheral_bridge_m1_granted_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_granted_seg7_avalon_slave             (cpu_peripheral_bridge_m1_granted_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_granted_sw_s1                         (cpu_peripheral_bridge_m1_granted_sw_s1),
      .cpu_peripheral_bridge_m1_granted_sysid_control_slave           (cpu_peripheral_bridge_m1_granted_sysid_control_slave),
      .cpu_peripheral_bridge_m1_granted_timer_s1                      (cpu_peripheral_bridge_m1_granted_timer_s1),
      .cpu_peripheral_bridge_m1_latency_counter                       (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1      (cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1      (cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1          (cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1          (cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_qualified_request_key_s1              (cpu_peripheral_bridge_m1_qualified_request_key_s1),
      .cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave   (cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave),
      .cpu_peripheral_bridge_m1_qualified_request_pio_led_s1          (cpu_peripheral_bridge_m1_qualified_request_pio_led_s1),
      .cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1           (cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1),
      .cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1           (cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1           (cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1),
      .cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1          (cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave   (cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_qualified_request_sw_s1               (cpu_peripheral_bridge_m1_qualified_request_sw_s1),
      .cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave (cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave),
      .cpu_peripheral_bridge_m1_qualified_request_timer_s1            (cpu_peripheral_bridge_m1_qualified_request_timer_s1),
      .cpu_peripheral_bridge_m1_read                                  (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1        (cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1        (cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1            (cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1            (cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_key_s1                (cpu_peripheral_bridge_m1_read_data_valid_key_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave     (cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave),
      .cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1            (cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1             (cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1             (cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1             (cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1            (cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave     (cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_read_data_valid_sw_s1                 (cpu_peripheral_bridge_m1_read_data_valid_sw_s1),
      .cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave   (cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave),
      .cpu_peripheral_bridge_m1_read_data_valid_timer_s1              (cpu_peripheral_bridge_m1_read_data_valid_timer_s1),
      .cpu_peripheral_bridge_m1_readdata                              (cpu_peripheral_bridge_m1_readdata),
      .cpu_peripheral_bridge_m1_readdatavalid                         (cpu_peripheral_bridge_m1_readdatavalid),
      .cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1               (cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1               (cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_requests_i2c_scl_s1                   (cpu_peripheral_bridge_m1_requests_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_requests_i2c_sda_s1                   (cpu_peripheral_bridge_m1_requests_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_requests_key_s1                       (cpu_peripheral_bridge_m1_requests_key_s1),
      .cpu_peripheral_bridge_m1_requests_lcd_control_slave            (cpu_peripheral_bridge_m1_requests_lcd_control_slave),
      .cpu_peripheral_bridge_m1_requests_pio_led_s1                   (cpu_peripheral_bridge_m1_requests_pio_led_s1),
      .cpu_peripheral_bridge_m1_requests_sd_clk_s1                    (cpu_peripheral_bridge_m1_requests_sd_clk_s1),
      .cpu_peripheral_bridge_m1_requests_sd_cmd_s1                    (cpu_peripheral_bridge_m1_requests_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_requests_sd_dat_s1                    (cpu_peripheral_bridge_m1_requests_sd_dat_s1),
      .cpu_peripheral_bridge_m1_requests_sd_wp_n_s1                   (cpu_peripheral_bridge_m1_requests_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_requests_seg7_avalon_slave            (cpu_peripheral_bridge_m1_requests_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_requests_sw_s1                        (cpu_peripheral_bridge_m1_requests_sw_s1),
      .cpu_peripheral_bridge_m1_requests_sysid_control_slave          (cpu_peripheral_bridge_m1_requests_sysid_control_slave),
      .cpu_peripheral_bridge_m1_requests_timer_s1                     (cpu_peripheral_bridge_m1_requests_timer_s1),
      .cpu_peripheral_bridge_m1_reset_n                               (cpu_peripheral_bridge_m1_reset_n),
      .cpu_peripheral_bridge_m1_waitrequest                           (cpu_peripheral_bridge_m1_waitrequest),
      .cpu_peripheral_bridge_m1_write                                 (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                             (cpu_peripheral_bridge_m1_writedata),
      .d1_eep_i2c_scl_s1_end_xfer                                     (d1_eep_i2c_scl_s1_end_xfer),
      .d1_eep_i2c_sda_s1_end_xfer                                     (d1_eep_i2c_sda_s1_end_xfer),
      .d1_i2c_scl_s1_end_xfer                                         (d1_i2c_scl_s1_end_xfer),
      .d1_i2c_sda_s1_end_xfer                                         (d1_i2c_sda_s1_end_xfer),
      .d1_key_s1_end_xfer                                             (d1_key_s1_end_xfer),
      .d1_lcd_control_slave_end_xfer                                  (d1_lcd_control_slave_end_xfer),
      .d1_pio_led_s1_end_xfer                                         (d1_pio_led_s1_end_xfer),
      .d1_sd_clk_s1_end_xfer                                          (d1_sd_clk_s1_end_xfer),
      .d1_sd_cmd_s1_end_xfer                                          (d1_sd_cmd_s1_end_xfer),
      .d1_sd_dat_s1_end_xfer                                          (d1_sd_dat_s1_end_xfer),
      .d1_sd_wp_n_s1_end_xfer                                         (d1_sd_wp_n_s1_end_xfer),
      .d1_seg7_avalon_slave_end_xfer                                  (d1_seg7_avalon_slave_end_xfer),
      .d1_sw_s1_end_xfer                                              (d1_sw_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                (d1_sysid_control_slave_end_xfer),
      .d1_timer_s1_end_xfer                                           (d1_timer_s1_end_xfer),
      .eep_i2c_scl_s1_readdata_from_sa                                (eep_i2c_scl_s1_readdata_from_sa),
      .eep_i2c_sda_s1_readdata_from_sa                                (eep_i2c_sda_s1_readdata_from_sa),
      .i2c_scl_s1_readdata_from_sa                                    (i2c_scl_s1_readdata_from_sa),
      .i2c_sda_s1_readdata_from_sa                                    (i2c_sda_s1_readdata_from_sa),
      .key_s1_readdata_from_sa                                        (key_s1_readdata_from_sa),
      .lcd_control_slave_readdata_from_sa                             (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_wait_counter_eq_0                            (lcd_control_slave_wait_counter_eq_0),
      .pio_led_s1_readdata_from_sa                                    (pio_led_s1_readdata_from_sa),
      .reset_n                                                        (altpll_io_reset_n),
      .sd_clk_s1_readdata_from_sa                                     (sd_clk_s1_readdata_from_sa),
      .sd_cmd_s1_readdata_from_sa                                     (sd_cmd_s1_readdata_from_sa),
      .sd_dat_s1_readdata_from_sa                                     (sd_dat_s1_readdata_from_sa),
      .sd_wp_n_s1_readdata_from_sa                                    (sd_wp_n_s1_readdata_from_sa),
      .seg7_avalon_slave_readdata_from_sa                             (seg7_avalon_slave_readdata_from_sa),
      .sw_s1_readdata_from_sa                                         (sw_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                           (sysid_control_slave_readdata_from_sa),
      .timer_s1_readdata_from_sa                                      (timer_s1_readdata_from_sa)
    );

  cpu_peripheral_bridge the_cpu_peripheral_bridge
    (
      .master_address       (cpu_peripheral_bridge_m1_address),
      .master_byteenable    (cpu_peripheral_bridge_m1_byteenable),
      .master_clk           (altpll_io),
      .master_endofpacket   (cpu_peripheral_bridge_m1_endofpacket),
      .master_nativeaddress (cpu_peripheral_bridge_m1_nativeaddress),
      .master_read          (cpu_peripheral_bridge_m1_read),
      .master_readdata      (cpu_peripheral_bridge_m1_readdata),
      .master_readdatavalid (cpu_peripheral_bridge_m1_readdatavalid),
      .master_reset_n       (cpu_peripheral_bridge_m1_reset_n),
      .master_waitrequest   (cpu_peripheral_bridge_m1_waitrequest),
      .master_write         (cpu_peripheral_bridge_m1_write),
      .master_writedata     (cpu_peripheral_bridge_m1_writedata),
      .slave_address        (cpu_peripheral_bridge_s1_address),
      .slave_byteenable     (cpu_peripheral_bridge_s1_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (cpu_peripheral_bridge_s1_endofpacket),
      .slave_nativeaddress  (cpu_peripheral_bridge_s1_nativeaddress),
      .slave_read           (cpu_peripheral_bridge_s1_read),
      .slave_readdata       (cpu_peripheral_bridge_s1_readdata),
      .slave_readdatavalid  (cpu_peripheral_bridge_s1_readdatavalid),
      .slave_reset_n        (cpu_peripheral_bridge_s1_reset_n),
      .slave_waitrequest    (cpu_peripheral_bridge_s1_waitrequest),
      .slave_write          (cpu_peripheral_bridge_s1_write),
      .slave_writedata      (cpu_peripheral_bridge_s1_writedata)
    );

  eep_i2c_scl_s1_arbitrator the_eep_i2c_scl_s1
    (
      .clk                                                       (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave                 (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1           (cpu_peripheral_bridge_m1_granted_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_latency_counter                  (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                    (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1 (cpu_peripheral_bridge_m1_qualified_request_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_read                             (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1   (cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1          (cpu_peripheral_bridge_m1_requests_eep_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_write                            (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                        (cpu_peripheral_bridge_m1_writedata),
      .d1_eep_i2c_scl_s1_end_xfer                                (d1_eep_i2c_scl_s1_end_xfer),
      .eep_i2c_scl_s1_address                                    (eep_i2c_scl_s1_address),
      .eep_i2c_scl_s1_chipselect                                 (eep_i2c_scl_s1_chipselect),
      .eep_i2c_scl_s1_readdata                                   (eep_i2c_scl_s1_readdata),
      .eep_i2c_scl_s1_readdata_from_sa                           (eep_i2c_scl_s1_readdata_from_sa),
      .eep_i2c_scl_s1_reset_n                                    (eep_i2c_scl_s1_reset_n),
      .eep_i2c_scl_s1_write_n                                    (eep_i2c_scl_s1_write_n),
      .eep_i2c_scl_s1_writedata                                  (eep_i2c_scl_s1_writedata),
      .reset_n                                                   (altpll_io_reset_n)
    );

  eep_i2c_scl the_eep_i2c_scl
    (
      .address    (eep_i2c_scl_s1_address),
      .chipselect (eep_i2c_scl_s1_chipselect),
      .clk        (altpll_io),
      .out_port   (out_port_from_the_eep_i2c_scl),
      .readdata   (eep_i2c_scl_s1_readdata),
      .reset_n    (eep_i2c_scl_s1_reset_n),
      .write_n    (eep_i2c_scl_s1_write_n),
      .writedata  (eep_i2c_scl_s1_writedata)
    );

  eep_i2c_sda_s1_arbitrator the_eep_i2c_sda_s1
    (
      .clk                                                       (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave                 (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1           (cpu_peripheral_bridge_m1_granted_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_latency_counter                  (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                    (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1 (cpu_peripheral_bridge_m1_qualified_request_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_read                             (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1   (cpu_peripheral_bridge_m1_read_data_valid_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1          (cpu_peripheral_bridge_m1_requests_eep_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_write                            (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                        (cpu_peripheral_bridge_m1_writedata),
      .d1_eep_i2c_sda_s1_end_xfer                                (d1_eep_i2c_sda_s1_end_xfer),
      .eep_i2c_sda_s1_address                                    (eep_i2c_sda_s1_address),
      .eep_i2c_sda_s1_chipselect                                 (eep_i2c_sda_s1_chipselect),
      .eep_i2c_sda_s1_readdata                                   (eep_i2c_sda_s1_readdata),
      .eep_i2c_sda_s1_readdata_from_sa                           (eep_i2c_sda_s1_readdata_from_sa),
      .eep_i2c_sda_s1_reset_n                                    (eep_i2c_sda_s1_reset_n),
      .eep_i2c_sda_s1_write_n                                    (eep_i2c_sda_s1_write_n),
      .eep_i2c_sda_s1_writedata                                  (eep_i2c_sda_s1_writedata),
      .reset_n                                                   (altpll_io_reset_n)
    );

  eep_i2c_sda the_eep_i2c_sda
    (
      .address    (eep_i2c_sda_s1_address),
      .bidir_port (bidir_port_to_and_from_the_eep_i2c_sda),
      .chipselect (eep_i2c_sda_s1_chipselect),
      .clk        (altpll_io),
      .readdata   (eep_i2c_sda_s1_readdata),
      .reset_n    (eep_i2c_sda_s1_reset_n),
      .write_n    (eep_i2c_sda_s1_write_n),
      .writedata  (eep_i2c_sda_s1_writedata)
    );

  i2c_scl_s1_arbitrator the_i2c_scl_s1
    (
      .clk                                                   (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave             (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_i2c_scl_s1           (cpu_peripheral_bridge_m1_granted_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_latency_counter              (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1 (cpu_peripheral_bridge_m1_qualified_request_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_read                         (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1   (cpu_peripheral_bridge_m1_read_data_valid_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_requests_i2c_scl_s1          (cpu_peripheral_bridge_m1_requests_i2c_scl_s1),
      .cpu_peripheral_bridge_m1_write                        (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                    (cpu_peripheral_bridge_m1_writedata),
      .d1_i2c_scl_s1_end_xfer                                (d1_i2c_scl_s1_end_xfer),
      .i2c_scl_s1_address                                    (i2c_scl_s1_address),
      .i2c_scl_s1_chipselect                                 (i2c_scl_s1_chipselect),
      .i2c_scl_s1_readdata                                   (i2c_scl_s1_readdata),
      .i2c_scl_s1_readdata_from_sa                           (i2c_scl_s1_readdata_from_sa),
      .i2c_scl_s1_reset_n                                    (i2c_scl_s1_reset_n),
      .i2c_scl_s1_write_n                                    (i2c_scl_s1_write_n),
      .i2c_scl_s1_writedata                                  (i2c_scl_s1_writedata),
      .reset_n                                               (altpll_io_reset_n)
    );

  i2c_scl the_i2c_scl
    (
      .address    (i2c_scl_s1_address),
      .chipselect (i2c_scl_s1_chipselect),
      .clk        (altpll_io),
      .out_port   (out_port_from_the_i2c_scl),
      .readdata   (i2c_scl_s1_readdata),
      .reset_n    (i2c_scl_s1_reset_n),
      .write_n    (i2c_scl_s1_write_n),
      .writedata  (i2c_scl_s1_writedata)
    );

  i2c_sda_s1_arbitrator the_i2c_sda_s1
    (
      .clk                                                   (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave             (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_i2c_sda_s1           (cpu_peripheral_bridge_m1_granted_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_latency_counter              (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1 (cpu_peripheral_bridge_m1_qualified_request_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_read                         (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1   (cpu_peripheral_bridge_m1_read_data_valid_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_requests_i2c_sda_s1          (cpu_peripheral_bridge_m1_requests_i2c_sda_s1),
      .cpu_peripheral_bridge_m1_write                        (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                    (cpu_peripheral_bridge_m1_writedata),
      .d1_i2c_sda_s1_end_xfer                                (d1_i2c_sda_s1_end_xfer),
      .i2c_sda_s1_address                                    (i2c_sda_s1_address),
      .i2c_sda_s1_chipselect                                 (i2c_sda_s1_chipselect),
      .i2c_sda_s1_readdata                                   (i2c_sda_s1_readdata),
      .i2c_sda_s1_readdata_from_sa                           (i2c_sda_s1_readdata_from_sa),
      .i2c_sda_s1_reset_n                                    (i2c_sda_s1_reset_n),
      .i2c_sda_s1_write_n                                    (i2c_sda_s1_write_n),
      .i2c_sda_s1_writedata                                  (i2c_sda_s1_writedata),
      .reset_n                                               (altpll_io_reset_n)
    );

  i2c_sda the_i2c_sda
    (
      .address    (i2c_sda_s1_address),
      .bidir_port (bidir_port_to_and_from_the_i2c_sda),
      .chipselect (i2c_sda_s1_chipselect),
      .clk        (altpll_io),
      .readdata   (i2c_sda_s1_readdata),
      .reset_n    (i2c_sda_s1_reset_n),
      .write_n    (i2c_sda_s1_write_n),
      .writedata  (i2c_sda_s1_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                     (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave           (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave             (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                    (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                 (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                                     (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                                  (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                               (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa                       (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                                         (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                 (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                                      (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                                    (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                            (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                                (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa                        (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                                     (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                                 (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                         (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                                     (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                                   (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                                 (altpll_sys_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (altpll_sys),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  key_s1_arbitrator the_key_s1
    (
      .clk                                               (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave         (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_key_s1           (cpu_peripheral_bridge_m1_granted_key_s1),
      .cpu_peripheral_bridge_m1_latency_counter          (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress            (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_key_s1 (cpu_peripheral_bridge_m1_qualified_request_key_s1),
      .cpu_peripheral_bridge_m1_read                     (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_key_s1   (cpu_peripheral_bridge_m1_read_data_valid_key_s1),
      .cpu_peripheral_bridge_m1_requests_key_s1          (cpu_peripheral_bridge_m1_requests_key_s1),
      .cpu_peripheral_bridge_m1_write                    (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                (cpu_peripheral_bridge_m1_writedata),
      .d1_key_s1_end_xfer                                (d1_key_s1_end_xfer),
      .key_s1_address                                    (key_s1_address),
      .key_s1_chipselect                                 (key_s1_chipselect),
      .key_s1_irq                                        (key_s1_irq),
      .key_s1_irq_from_sa                                (key_s1_irq_from_sa),
      .key_s1_readdata                                   (key_s1_readdata),
      .key_s1_readdata_from_sa                           (key_s1_readdata_from_sa),
      .key_s1_reset_n                                    (key_s1_reset_n),
      .key_s1_write_n                                    (key_s1_write_n),
      .key_s1_writedata                                  (key_s1_writedata),
      .reset_n                                           (altpll_io_reset_n)
    );

  key the_key
    (
      .address    (key_s1_address),
      .chipselect (key_s1_chipselect),
      .clk        (altpll_io),
      .in_port    (in_port_to_the_key),
      .irq        (key_s1_irq),
      .readdata   (key_s1_readdata),
      .reset_n    (key_s1_reset_n),
      .write_n    (key_s1_write_n),
      .writedata  (key_s1_writedata)
    );

  lcd_control_slave_arbitrator the_lcd_control_slave
    (
      .clk                                                          (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave                    (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_byteenable                          (cpu_peripheral_bridge_m1_byteenable),
      .cpu_peripheral_bridge_m1_granted_lcd_control_slave           (cpu_peripheral_bridge_m1_granted_lcd_control_slave),
      .cpu_peripheral_bridge_m1_latency_counter                     (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                       (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave (cpu_peripheral_bridge_m1_qualified_request_lcd_control_slave),
      .cpu_peripheral_bridge_m1_read                                (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave   (cpu_peripheral_bridge_m1_read_data_valid_lcd_control_slave),
      .cpu_peripheral_bridge_m1_requests_lcd_control_slave          (cpu_peripheral_bridge_m1_requests_lcd_control_slave),
      .cpu_peripheral_bridge_m1_write                               (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                           (cpu_peripheral_bridge_m1_writedata),
      .d1_lcd_control_slave_end_xfer                                (d1_lcd_control_slave_end_xfer),
      .lcd_control_slave_address                                    (lcd_control_slave_address),
      .lcd_control_slave_begintransfer                              (lcd_control_slave_begintransfer),
      .lcd_control_slave_read                                       (lcd_control_slave_read),
      .lcd_control_slave_readdata                                   (lcd_control_slave_readdata),
      .lcd_control_slave_readdata_from_sa                           (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_wait_counter_eq_0                          (lcd_control_slave_wait_counter_eq_0),
      .lcd_control_slave_write                                      (lcd_control_slave_write),
      .lcd_control_slave_writedata                                  (lcd_control_slave_writedata),
      .reset_n                                                      (altpll_io_reset_n)
    );

  lcd the_lcd
    (
      .LCD_E         (LCD_E_from_the_lcd),
      .LCD_RS        (LCD_RS_from_the_lcd),
      .LCD_RW        (LCD_RW_from_the_lcd),
      .LCD_data      (LCD_data_to_and_from_the_lcd),
      .address       (lcd_control_slave_address),
      .begintransfer (lcd_control_slave_begintransfer),
      .read          (lcd_control_slave_read),
      .readdata      (lcd_control_slave_readdata),
      .write         (lcd_control_slave_write),
      .writedata     (lcd_control_slave_writedata)
    );

  nios_audio_clock_0_in_arbitrator the_nios_audio_clock_0_in
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_granted_nios_audio_clock_0_in                           (cpu_data_master_granted_nios_audio_clock_0_in),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_nios_audio_clock_0_in                 (cpu_data_master_qualified_request_nios_audio_clock_0_in),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_nios_audio_clock_0_in                   (cpu_data_master_read_data_valid_nios_audio_clock_0_in),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_nios_audio_clock_0_in                          (cpu_data_master_requests_nios_audio_clock_0_in),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_nios_audio_clock_0_in_end_xfer                                       (d1_nios_audio_clock_0_in_end_xfer),
      .nios_audio_clock_0_in_address                                           (nios_audio_clock_0_in_address),
      .nios_audio_clock_0_in_byteenable                                        (nios_audio_clock_0_in_byteenable),
      .nios_audio_clock_0_in_endofpacket                                       (nios_audio_clock_0_in_endofpacket),
      .nios_audio_clock_0_in_endofpacket_from_sa                               (nios_audio_clock_0_in_endofpacket_from_sa),
      .nios_audio_clock_0_in_nativeaddress                                     (nios_audio_clock_0_in_nativeaddress),
      .nios_audio_clock_0_in_read                                              (nios_audio_clock_0_in_read),
      .nios_audio_clock_0_in_readdata                                          (nios_audio_clock_0_in_readdata),
      .nios_audio_clock_0_in_readdata_from_sa                                  (nios_audio_clock_0_in_readdata_from_sa),
      .nios_audio_clock_0_in_reset_n                                           (nios_audio_clock_0_in_reset_n),
      .nios_audio_clock_0_in_waitrequest                                       (nios_audio_clock_0_in_waitrequest),
      .nios_audio_clock_0_in_waitrequest_from_sa                               (nios_audio_clock_0_in_waitrequest_from_sa),
      .nios_audio_clock_0_in_write                                             (nios_audio_clock_0_in_write),
      .nios_audio_clock_0_in_writedata                                         (nios_audio_clock_0_in_writedata),
      .reset_n                                                                 (altpll_sys_reset_n)
    );

  nios_audio_clock_0_out_arbitrator the_nios_audio_clock_0_out
    (
      .altpll_audio_pll_slave_readdata_from_sa                         (altpll_audio_pll_slave_readdata_from_sa),
      .clk                                                             (clk_50),
      .d1_altpll_audio_pll_slave_end_xfer                              (d1_altpll_audio_pll_slave_end_xfer),
      .nios_audio_clock_0_out_address                                  (nios_audio_clock_0_out_address),
      .nios_audio_clock_0_out_address_to_slave                         (nios_audio_clock_0_out_address_to_slave),
      .nios_audio_clock_0_out_byteenable                               (nios_audio_clock_0_out_byteenable),
      .nios_audio_clock_0_out_granted_altpll_audio_pll_slave           (nios_audio_clock_0_out_granted_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave (nios_audio_clock_0_out_qualified_request_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_read                                     (nios_audio_clock_0_out_read),
      .nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave   (nios_audio_clock_0_out_read_data_valid_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_readdata                                 (nios_audio_clock_0_out_readdata),
      .nios_audio_clock_0_out_requests_altpll_audio_pll_slave          (nios_audio_clock_0_out_requests_altpll_audio_pll_slave),
      .nios_audio_clock_0_out_reset_n                                  (nios_audio_clock_0_out_reset_n),
      .nios_audio_clock_0_out_waitrequest                              (nios_audio_clock_0_out_waitrequest),
      .nios_audio_clock_0_out_write                                    (nios_audio_clock_0_out_write),
      .nios_audio_clock_0_out_writedata                                (nios_audio_clock_0_out_writedata),
      .reset_n                                                         (clk_50_reset_n)
    );

  nios_audio_clock_0 the_nios_audio_clock_0
    (
      .master_address       (nios_audio_clock_0_out_address),
      .master_byteenable    (nios_audio_clock_0_out_byteenable),
      .master_clk           (clk_50),
      .master_endofpacket   (nios_audio_clock_0_out_endofpacket),
      .master_nativeaddress (nios_audio_clock_0_out_nativeaddress),
      .master_read          (nios_audio_clock_0_out_read),
      .master_readdata      (nios_audio_clock_0_out_readdata),
      .master_reset_n       (nios_audio_clock_0_out_reset_n),
      .master_waitrequest   (nios_audio_clock_0_out_waitrequest),
      .master_write         (nios_audio_clock_0_out_write),
      .master_writedata     (nios_audio_clock_0_out_writedata),
      .slave_address        (nios_audio_clock_0_in_address),
      .slave_byteenable     (nios_audio_clock_0_in_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (nios_audio_clock_0_in_endofpacket),
      .slave_nativeaddress  (nios_audio_clock_0_in_nativeaddress),
      .slave_read           (nios_audio_clock_0_in_read),
      .slave_readdata       (nios_audio_clock_0_in_readdata),
      .slave_reset_n        (nios_audio_clock_0_in_reset_n),
      .slave_waitrequest    (nios_audio_clock_0_in_waitrequest),
      .slave_write          (nios_audio_clock_0_in_write),
      .slave_writedata      (nios_audio_clock_0_in_writedata)
    );

  nios_audio_clock_1_in_arbitrator the_nios_audio_clock_1_in
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_granted_nios_audio_clock_1_in                           (cpu_data_master_granted_nios_audio_clock_1_in),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_nios_audio_clock_1_in                 (cpu_data_master_qualified_request_nios_audio_clock_1_in),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_nios_audio_clock_1_in                   (cpu_data_master_read_data_valid_nios_audio_clock_1_in),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_nios_audio_clock_1_in                          (cpu_data_master_requests_nios_audio_clock_1_in),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_nios_audio_clock_1_in_end_xfer                                       (d1_nios_audio_clock_1_in_end_xfer),
      .nios_audio_clock_1_in_address                                           (nios_audio_clock_1_in_address),
      .nios_audio_clock_1_in_byteenable                                        (nios_audio_clock_1_in_byteenable),
      .nios_audio_clock_1_in_endofpacket                                       (nios_audio_clock_1_in_endofpacket),
      .nios_audio_clock_1_in_endofpacket_from_sa                               (nios_audio_clock_1_in_endofpacket_from_sa),
      .nios_audio_clock_1_in_nativeaddress                                     (nios_audio_clock_1_in_nativeaddress),
      .nios_audio_clock_1_in_read                                              (nios_audio_clock_1_in_read),
      .nios_audio_clock_1_in_readdata                                          (nios_audio_clock_1_in_readdata),
      .nios_audio_clock_1_in_readdata_from_sa                                  (nios_audio_clock_1_in_readdata_from_sa),
      .nios_audio_clock_1_in_reset_n                                           (nios_audio_clock_1_in_reset_n),
      .nios_audio_clock_1_in_waitrequest                                       (nios_audio_clock_1_in_waitrequest),
      .nios_audio_clock_1_in_waitrequest_from_sa                               (nios_audio_clock_1_in_waitrequest_from_sa),
      .nios_audio_clock_1_in_write                                             (nios_audio_clock_1_in_write),
      .nios_audio_clock_1_in_writedata                                         (nios_audio_clock_1_in_writedata),
      .reset_n                                                                 (altpll_sys_reset_n)
    );

  nios_audio_clock_1_out_arbitrator the_nios_audio_clock_1_out
    (
      .altpll_pll_slave_readdata_from_sa                         (altpll_pll_slave_readdata_from_sa),
      .clk                                                       (clk_50),
      .d1_altpll_pll_slave_end_xfer                              (d1_altpll_pll_slave_end_xfer),
      .nios_audio_clock_1_out_address                            (nios_audio_clock_1_out_address),
      .nios_audio_clock_1_out_address_to_slave                   (nios_audio_clock_1_out_address_to_slave),
      .nios_audio_clock_1_out_byteenable                         (nios_audio_clock_1_out_byteenable),
      .nios_audio_clock_1_out_granted_altpll_pll_slave           (nios_audio_clock_1_out_granted_altpll_pll_slave),
      .nios_audio_clock_1_out_qualified_request_altpll_pll_slave (nios_audio_clock_1_out_qualified_request_altpll_pll_slave),
      .nios_audio_clock_1_out_read                               (nios_audio_clock_1_out_read),
      .nios_audio_clock_1_out_read_data_valid_altpll_pll_slave   (nios_audio_clock_1_out_read_data_valid_altpll_pll_slave),
      .nios_audio_clock_1_out_readdata                           (nios_audio_clock_1_out_readdata),
      .nios_audio_clock_1_out_requests_altpll_pll_slave          (nios_audio_clock_1_out_requests_altpll_pll_slave),
      .nios_audio_clock_1_out_reset_n                            (nios_audio_clock_1_out_reset_n),
      .nios_audio_clock_1_out_waitrequest                        (nios_audio_clock_1_out_waitrequest),
      .nios_audio_clock_1_out_write                              (nios_audio_clock_1_out_write),
      .nios_audio_clock_1_out_writedata                          (nios_audio_clock_1_out_writedata),
      .reset_n                                                   (clk_50_reset_n)
    );

  nios_audio_clock_1 the_nios_audio_clock_1
    (
      .master_address       (nios_audio_clock_1_out_address),
      .master_byteenable    (nios_audio_clock_1_out_byteenable),
      .master_clk           (clk_50),
      .master_endofpacket   (nios_audio_clock_1_out_endofpacket),
      .master_nativeaddress (nios_audio_clock_1_out_nativeaddress),
      .master_read          (nios_audio_clock_1_out_read),
      .master_readdata      (nios_audio_clock_1_out_readdata),
      .master_reset_n       (nios_audio_clock_1_out_reset_n),
      .master_waitrequest   (nios_audio_clock_1_out_waitrequest),
      .master_write         (nios_audio_clock_1_out_write),
      .master_writedata     (nios_audio_clock_1_out_writedata),
      .slave_address        (nios_audio_clock_1_in_address),
      .slave_byteenable     (nios_audio_clock_1_in_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (nios_audio_clock_1_in_endofpacket),
      .slave_nativeaddress  (nios_audio_clock_1_in_nativeaddress),
      .slave_read           (nios_audio_clock_1_in_read),
      .slave_readdata       (nios_audio_clock_1_in_readdata),
      .slave_reset_n        (nios_audio_clock_1_in_reset_n),
      .slave_waitrequest    (nios_audio_clock_1_in_waitrequest),
      .slave_write          (nios_audio_clock_1_in_write),
      .slave_writedata      (nios_audio_clock_1_in_writedata)
    );

  nios_audio_clock_2_in_arbitrator the_nios_audio_clock_2_in
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_granted_nios_audio_clock_2_in                           (cpu_data_master_granted_nios_audio_clock_2_in),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_nios_audio_clock_2_in                 (cpu_data_master_qualified_request_nios_audio_clock_2_in),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_nios_audio_clock_2_in                   (cpu_data_master_read_data_valid_nios_audio_clock_2_in),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_nios_audio_clock_2_in                          (cpu_data_master_requests_nios_audio_clock_2_in),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_nios_audio_clock_2_in_end_xfer                                       (d1_nios_audio_clock_2_in_end_xfer),
      .nios_audio_clock_2_in_address                                           (nios_audio_clock_2_in_address),
      .nios_audio_clock_2_in_byteenable                                        (nios_audio_clock_2_in_byteenable),
      .nios_audio_clock_2_in_endofpacket                                       (nios_audio_clock_2_in_endofpacket),
      .nios_audio_clock_2_in_endofpacket_from_sa                               (nios_audio_clock_2_in_endofpacket_from_sa),
      .nios_audio_clock_2_in_nativeaddress                                     (nios_audio_clock_2_in_nativeaddress),
      .nios_audio_clock_2_in_read                                              (nios_audio_clock_2_in_read),
      .nios_audio_clock_2_in_readdata                                          (nios_audio_clock_2_in_readdata),
      .nios_audio_clock_2_in_readdata_from_sa                                  (nios_audio_clock_2_in_readdata_from_sa),
      .nios_audio_clock_2_in_reset_n                                           (nios_audio_clock_2_in_reset_n),
      .nios_audio_clock_2_in_waitrequest                                       (nios_audio_clock_2_in_waitrequest),
      .nios_audio_clock_2_in_waitrequest_from_sa                               (nios_audio_clock_2_in_waitrequest_from_sa),
      .nios_audio_clock_2_in_write                                             (nios_audio_clock_2_in_write),
      .nios_audio_clock_2_in_writedata                                         (nios_audio_clock_2_in_writedata),
      .reset_n                                                                 (altpll_sys_reset_n)
    );

  nios_audio_clock_2_out_arbitrator the_nios_audio_clock_2_out
    (
      .audio_avalon_slave_readdata_from_sa                         (audio_avalon_slave_readdata_from_sa),
      .clk                                                         (audio_18),
      .d1_audio_avalon_slave_end_xfer                              (d1_audio_avalon_slave_end_xfer),
      .nios_audio_clock_2_out_address                              (nios_audio_clock_2_out_address),
      .nios_audio_clock_2_out_address_to_slave                     (nios_audio_clock_2_out_address_to_slave),
      .nios_audio_clock_2_out_byteenable                           (nios_audio_clock_2_out_byteenable),
      .nios_audio_clock_2_out_granted_audio_avalon_slave           (nios_audio_clock_2_out_granted_audio_avalon_slave),
      .nios_audio_clock_2_out_qualified_request_audio_avalon_slave (nios_audio_clock_2_out_qualified_request_audio_avalon_slave),
      .nios_audio_clock_2_out_read                                 (nios_audio_clock_2_out_read),
      .nios_audio_clock_2_out_read_data_valid_audio_avalon_slave   (nios_audio_clock_2_out_read_data_valid_audio_avalon_slave),
      .nios_audio_clock_2_out_readdata                             (nios_audio_clock_2_out_readdata),
      .nios_audio_clock_2_out_requests_audio_avalon_slave          (nios_audio_clock_2_out_requests_audio_avalon_slave),
      .nios_audio_clock_2_out_reset_n                              (nios_audio_clock_2_out_reset_n),
      .nios_audio_clock_2_out_waitrequest                          (nios_audio_clock_2_out_waitrequest),
      .nios_audio_clock_2_out_write                                (nios_audio_clock_2_out_write),
      .nios_audio_clock_2_out_writedata                            (nios_audio_clock_2_out_writedata),
      .reset_n                                                     (audio_18_reset_n)
    );

  nios_audio_clock_2 the_nios_audio_clock_2
    (
      .master_address       (nios_audio_clock_2_out_address),
      .master_byteenable    (nios_audio_clock_2_out_byteenable),
      .master_clk           (audio_18),
      .master_endofpacket   (nios_audio_clock_2_out_endofpacket),
      .master_nativeaddress (nios_audio_clock_2_out_nativeaddress),
      .master_read          (nios_audio_clock_2_out_read),
      .master_readdata      (nios_audio_clock_2_out_readdata),
      .master_reset_n       (nios_audio_clock_2_out_reset_n),
      .master_waitrequest   (nios_audio_clock_2_out_waitrequest),
      .master_write         (nios_audio_clock_2_out_write),
      .master_writedata     (nios_audio_clock_2_out_writedata),
      .slave_address        (nios_audio_clock_2_in_address),
      .slave_byteenable     (nios_audio_clock_2_in_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (nios_audio_clock_2_in_endofpacket),
      .slave_nativeaddress  (nios_audio_clock_2_in_nativeaddress),
      .slave_read           (nios_audio_clock_2_in_read),
      .slave_readdata       (nios_audio_clock_2_in_readdata),
      .slave_reset_n        (nios_audio_clock_2_in_reset_n),
      .slave_waitrequest    (nios_audio_clock_2_in_waitrequest),
      .slave_write          (nios_audio_clock_2_in_write),
      .slave_writedata      (nios_audio_clock_2_in_writedata)
    );

  pio_led_s1_arbitrator the_pio_led_s1
    (
      .clk                                                   (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave             (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_pio_led_s1           (cpu_peripheral_bridge_m1_granted_pio_led_s1),
      .cpu_peripheral_bridge_m1_latency_counter              (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_pio_led_s1 (cpu_peripheral_bridge_m1_qualified_request_pio_led_s1),
      .cpu_peripheral_bridge_m1_read                         (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1   (cpu_peripheral_bridge_m1_read_data_valid_pio_led_s1),
      .cpu_peripheral_bridge_m1_requests_pio_led_s1          (cpu_peripheral_bridge_m1_requests_pio_led_s1),
      .cpu_peripheral_bridge_m1_write                        (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                    (cpu_peripheral_bridge_m1_writedata),
      .d1_pio_led_s1_end_xfer                                (d1_pio_led_s1_end_xfer),
      .pio_led_s1_address                                    (pio_led_s1_address),
      .pio_led_s1_chipselect                                 (pio_led_s1_chipselect),
      .pio_led_s1_readdata                                   (pio_led_s1_readdata),
      .pio_led_s1_readdata_from_sa                           (pio_led_s1_readdata_from_sa),
      .pio_led_s1_reset_n                                    (pio_led_s1_reset_n),
      .pio_led_s1_write_n                                    (pio_led_s1_write_n),
      .pio_led_s1_writedata                                  (pio_led_s1_writedata),
      .reset_n                                               (altpll_io_reset_n)
    );

  pio_led the_pio_led
    (
      .address    (pio_led_s1_address),
      .chipselect (pio_led_s1_chipselect),
      .clk        (altpll_io),
      .out_port   (out_port_from_the_pio_led),
      .readdata   (pio_led_s1_readdata),
      .reset_n    (pio_led_s1_reset_n),
      .write_n    (pio_led_s1_write_n),
      .writedata  (pio_led_s1_writedata)
    );

  sd_clk_s1_arbitrator the_sd_clk_s1
    (
      .clk                                                  (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave            (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_sd_clk_s1           (cpu_peripheral_bridge_m1_granted_sd_clk_s1),
      .cpu_peripheral_bridge_m1_latency_counter             (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress               (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1 (cpu_peripheral_bridge_m1_qualified_request_sd_clk_s1),
      .cpu_peripheral_bridge_m1_read                        (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1   (cpu_peripheral_bridge_m1_read_data_valid_sd_clk_s1),
      .cpu_peripheral_bridge_m1_requests_sd_clk_s1          (cpu_peripheral_bridge_m1_requests_sd_clk_s1),
      .cpu_peripheral_bridge_m1_write                       (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                   (cpu_peripheral_bridge_m1_writedata),
      .d1_sd_clk_s1_end_xfer                                (d1_sd_clk_s1_end_xfer),
      .reset_n                                              (altpll_io_reset_n),
      .sd_clk_s1_address                                    (sd_clk_s1_address),
      .sd_clk_s1_chipselect                                 (sd_clk_s1_chipselect),
      .sd_clk_s1_readdata                                   (sd_clk_s1_readdata),
      .sd_clk_s1_readdata_from_sa                           (sd_clk_s1_readdata_from_sa),
      .sd_clk_s1_reset_n                                    (sd_clk_s1_reset_n),
      .sd_clk_s1_write_n                                    (sd_clk_s1_write_n),
      .sd_clk_s1_writedata                                  (sd_clk_s1_writedata)
    );

  sd_clk the_sd_clk
    (
      .address    (sd_clk_s1_address),
      .chipselect (sd_clk_s1_chipselect),
      .clk        (altpll_io),
      .out_port   (out_port_from_the_sd_clk),
      .readdata   (sd_clk_s1_readdata),
      .reset_n    (sd_clk_s1_reset_n),
      .write_n    (sd_clk_s1_write_n),
      .writedata  (sd_clk_s1_writedata)
    );

  sd_cmd_s1_arbitrator the_sd_cmd_s1
    (
      .clk                                                  (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave            (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_sd_cmd_s1           (cpu_peripheral_bridge_m1_granted_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_latency_counter             (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress               (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1 (cpu_peripheral_bridge_m1_qualified_request_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_read                        (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1   (cpu_peripheral_bridge_m1_read_data_valid_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_requests_sd_cmd_s1          (cpu_peripheral_bridge_m1_requests_sd_cmd_s1),
      .cpu_peripheral_bridge_m1_write                       (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                   (cpu_peripheral_bridge_m1_writedata),
      .d1_sd_cmd_s1_end_xfer                                (d1_sd_cmd_s1_end_xfer),
      .reset_n                                              (altpll_io_reset_n),
      .sd_cmd_s1_address                                    (sd_cmd_s1_address),
      .sd_cmd_s1_chipselect                                 (sd_cmd_s1_chipselect),
      .sd_cmd_s1_readdata                                   (sd_cmd_s1_readdata),
      .sd_cmd_s1_readdata_from_sa                           (sd_cmd_s1_readdata_from_sa),
      .sd_cmd_s1_reset_n                                    (sd_cmd_s1_reset_n),
      .sd_cmd_s1_write_n                                    (sd_cmd_s1_write_n),
      .sd_cmd_s1_writedata                                  (sd_cmd_s1_writedata)
    );

  sd_cmd the_sd_cmd
    (
      .address    (sd_cmd_s1_address),
      .bidir_port (bidir_port_to_and_from_the_sd_cmd),
      .chipselect (sd_cmd_s1_chipselect),
      .clk        (altpll_io),
      .readdata   (sd_cmd_s1_readdata),
      .reset_n    (sd_cmd_s1_reset_n),
      .write_n    (sd_cmd_s1_write_n),
      .writedata  (sd_cmd_s1_writedata)
    );

  sd_dat_s1_arbitrator the_sd_dat_s1
    (
      .clk                                                  (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave            (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_sd_dat_s1           (cpu_peripheral_bridge_m1_granted_sd_dat_s1),
      .cpu_peripheral_bridge_m1_latency_counter             (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress               (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1 (cpu_peripheral_bridge_m1_qualified_request_sd_dat_s1),
      .cpu_peripheral_bridge_m1_read                        (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1   (cpu_peripheral_bridge_m1_read_data_valid_sd_dat_s1),
      .cpu_peripheral_bridge_m1_requests_sd_dat_s1          (cpu_peripheral_bridge_m1_requests_sd_dat_s1),
      .cpu_peripheral_bridge_m1_write                       (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                   (cpu_peripheral_bridge_m1_writedata),
      .d1_sd_dat_s1_end_xfer                                (d1_sd_dat_s1_end_xfer),
      .reset_n                                              (altpll_io_reset_n),
      .sd_dat_s1_address                                    (sd_dat_s1_address),
      .sd_dat_s1_chipselect                                 (sd_dat_s1_chipselect),
      .sd_dat_s1_readdata                                   (sd_dat_s1_readdata),
      .sd_dat_s1_readdata_from_sa                           (sd_dat_s1_readdata_from_sa),
      .sd_dat_s1_reset_n                                    (sd_dat_s1_reset_n),
      .sd_dat_s1_write_n                                    (sd_dat_s1_write_n),
      .sd_dat_s1_writedata                                  (sd_dat_s1_writedata)
    );

  sd_dat the_sd_dat
    (
      .address    (sd_dat_s1_address),
      .bidir_port (bidir_port_to_and_from_the_sd_dat),
      .chipselect (sd_dat_s1_chipselect),
      .clk        (altpll_io),
      .readdata   (sd_dat_s1_readdata),
      .reset_n    (sd_dat_s1_reset_n),
      .write_n    (sd_dat_s1_write_n),
      .writedata  (sd_dat_s1_writedata)
    );

  sd_wp_n_s1_arbitrator the_sd_wp_n_s1
    (
      .clk                                                   (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave             (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_sd_wp_n_s1           (cpu_peripheral_bridge_m1_granted_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_latency_counter              (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1 (cpu_peripheral_bridge_m1_qualified_request_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_read                         (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1   (cpu_peripheral_bridge_m1_read_data_valid_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_requests_sd_wp_n_s1          (cpu_peripheral_bridge_m1_requests_sd_wp_n_s1),
      .cpu_peripheral_bridge_m1_write                        (cpu_peripheral_bridge_m1_write),
      .d1_sd_wp_n_s1_end_xfer                                (d1_sd_wp_n_s1_end_xfer),
      .reset_n                                               (altpll_io_reset_n),
      .sd_wp_n_s1_address                                    (sd_wp_n_s1_address),
      .sd_wp_n_s1_readdata                                   (sd_wp_n_s1_readdata),
      .sd_wp_n_s1_readdata_from_sa                           (sd_wp_n_s1_readdata_from_sa),
      .sd_wp_n_s1_reset_n                                    (sd_wp_n_s1_reset_n)
    );

  sd_wp_n the_sd_wp_n
    (
      .address  (sd_wp_n_s1_address),
      .clk      (altpll_io),
      .in_port  (in_port_to_the_sd_wp_n),
      .readdata (sd_wp_n_s1_readdata),
      .reset_n  (sd_wp_n_s1_reset_n)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_granted_sdram_s1                                        (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sdram_s1                              (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1                                (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_sdram_s1                                       (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_sdram_s1_end_xfer                                                    (d1_sdram_s1_end_xfer),
      .reset_n                                                                 (altpll_sys_reset_n),
      .sdram_s1_address                                                        (sdram_s1_address),
      .sdram_s1_byteenable_n                                                   (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                                     (sdram_s1_chipselect),
      .sdram_s1_read_n                                                         (sdram_s1_read_n),
      .sdram_s1_readdata                                                       (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                               (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                                  (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                                        (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                                    (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                            (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                                        (sdram_s1_write_n),
      .sdram_s1_writedata                                                      (sdram_s1_writedata)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (altpll_sys),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  seg7_avalon_slave_arbitrator the_seg7_avalon_slave
    (
      .clk                                                          (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave                    (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_byteenable                          (cpu_peripheral_bridge_m1_byteenable),
      .cpu_peripheral_bridge_m1_granted_seg7_avalon_slave           (cpu_peripheral_bridge_m1_granted_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_latency_counter                     (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                       (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave (cpu_peripheral_bridge_m1_qualified_request_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_read                                (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave   (cpu_peripheral_bridge_m1_read_data_valid_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_requests_seg7_avalon_slave          (cpu_peripheral_bridge_m1_requests_seg7_avalon_slave),
      .cpu_peripheral_bridge_m1_write                               (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                           (cpu_peripheral_bridge_m1_writedata),
      .d1_seg7_avalon_slave_end_xfer                                (d1_seg7_avalon_slave_end_xfer),
      .reset_n                                                      (altpll_io_reset_n),
      .seg7_avalon_slave_address                                    (seg7_avalon_slave_address),
      .seg7_avalon_slave_read                                       (seg7_avalon_slave_read),
      .seg7_avalon_slave_readdata                                   (seg7_avalon_slave_readdata),
      .seg7_avalon_slave_readdata_from_sa                           (seg7_avalon_slave_readdata_from_sa),
      .seg7_avalon_slave_reset                                      (seg7_avalon_slave_reset),
      .seg7_avalon_slave_write                                      (seg7_avalon_slave_write),
      .seg7_avalon_slave_writedata                                  (seg7_avalon_slave_writedata)
    );

  seg7 the_seg7
    (
      .SEG7        (SEG7_from_the_seg7),
      .s_address   (seg7_avalon_slave_address),
      .s_clk       (altpll_io),
      .s_read      (seg7_avalon_slave_read),
      .s_readdata  (seg7_avalon_slave_readdata),
      .s_reset     (seg7_avalon_slave_reset),
      .s_write     (seg7_avalon_slave_write),
      .s_writedata (seg7_avalon_slave_writedata)
    );

  sram_avalon_slave_arbitrator the_sram_avalon_slave
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sram_avalon_slave                            (cpu_data_master_byteenable_sram_avalon_slave),
      .cpu_data_master_dbs_address                                             (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                            (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sram_avalon_slave                               (cpu_data_master_granted_sram_avalon_slave),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sram_avalon_slave                     (cpu_data_master_qualified_request_sram_avalon_slave),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sram_avalon_slave                       (cpu_data_master_read_data_valid_sram_avalon_slave),
      .cpu_data_master_requests_sram_avalon_slave                              (cpu_data_master_requests_sram_avalon_slave),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                                 (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                      (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sram_avalon_slave                        (cpu_instruction_master_granted_sram_avalon_slave),
      .cpu_instruction_master_latency_counter                                  (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_sram_avalon_slave              (cpu_instruction_master_qualified_request_sram_avalon_slave),
      .cpu_instruction_master_read                                             (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sram_avalon_slave                (cpu_instruction_master_read_data_valid_sram_avalon_slave),
      .cpu_instruction_master_requests_sram_avalon_slave                       (cpu_instruction_master_requests_sram_avalon_slave),
      .d1_sram_avalon_slave_end_xfer                                           (d1_sram_avalon_slave_end_xfer),
      .reset_n                                                                 (altpll_sys_reset_n),
      .sram_avalon_slave_address                                               (sram_avalon_slave_address),
      .sram_avalon_slave_byteenable_n                                          (sram_avalon_slave_byteenable_n),
      .sram_avalon_slave_chipselect_n                                          (sram_avalon_slave_chipselect_n),
      .sram_avalon_slave_read_n                                                (sram_avalon_slave_read_n),
      .sram_avalon_slave_readdata                                              (sram_avalon_slave_readdata),
      .sram_avalon_slave_readdata_from_sa                                      (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_reset_n                                               (sram_avalon_slave_reset_n),
      .sram_avalon_slave_wait_counter_eq_0                                     (sram_avalon_slave_wait_counter_eq_0),
      .sram_avalon_slave_write_n                                               (sram_avalon_slave_write_n),
      .sram_avalon_slave_writedata                                             (sram_avalon_slave_writedata)
    );

  sram the_sram
    (
      .SRAM_ADDR      (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n      (SRAM_CE_n_from_the_sram),
      .SRAM_DQ        (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n      (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n      (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n      (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n      (SRAM_WE_n_from_the_sram),
      .clk            (altpll_sys),
      .reset_n        (sram_avalon_slave_reset_n),
      .s_address      (sram_avalon_slave_address),
      .s_byteenable_n (sram_avalon_slave_byteenable_n),
      .s_chipselect_n (sram_avalon_slave_chipselect_n),
      .s_read_n       (sram_avalon_slave_read_n),
      .s_readdata     (sram_avalon_slave_readdata),
      .s_write_n      (sram_avalon_slave_write_n),
      .s_writedata    (sram_avalon_slave_writedata)
    );

  sw_s1_arbitrator the_sw_s1
    (
      .clk                                              (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave        (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_sw_s1           (cpu_peripheral_bridge_m1_granted_sw_s1),
      .cpu_peripheral_bridge_m1_latency_counter         (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress           (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_sw_s1 (cpu_peripheral_bridge_m1_qualified_request_sw_s1),
      .cpu_peripheral_bridge_m1_read                    (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_sw_s1   (cpu_peripheral_bridge_m1_read_data_valid_sw_s1),
      .cpu_peripheral_bridge_m1_requests_sw_s1          (cpu_peripheral_bridge_m1_requests_sw_s1),
      .cpu_peripheral_bridge_m1_write                   (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata               (cpu_peripheral_bridge_m1_writedata),
      .d1_sw_s1_end_xfer                                (d1_sw_s1_end_xfer),
      .reset_n                                          (altpll_io_reset_n),
      .sw_s1_address                                    (sw_s1_address),
      .sw_s1_chipselect                                 (sw_s1_chipselect),
      .sw_s1_irq                                        (sw_s1_irq),
      .sw_s1_irq_from_sa                                (sw_s1_irq_from_sa),
      .sw_s1_readdata                                   (sw_s1_readdata),
      .sw_s1_readdata_from_sa                           (sw_s1_readdata_from_sa),
      .sw_s1_reset_n                                    (sw_s1_reset_n),
      .sw_s1_write_n                                    (sw_s1_write_n),
      .sw_s1_writedata                                  (sw_s1_writedata)
    );

  sw the_sw
    (
      .address    (sw_s1_address),
      .chipselect (sw_s1_chipselect),
      .clk        (altpll_io),
      .in_port    (in_port_to_the_sw),
      .irq        (sw_s1_irq),
      .readdata   (sw_s1_readdata),
      .reset_n    (sw_s1_reset_n),
      .write_n    (sw_s1_write_n),
      .writedata  (sw_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                            (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave                      (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_sysid_control_slave           (cpu_peripheral_bridge_m1_granted_sysid_control_slave),
      .cpu_peripheral_bridge_m1_latency_counter                       (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress                         (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave (cpu_peripheral_bridge_m1_qualified_request_sysid_control_slave),
      .cpu_peripheral_bridge_m1_read                                  (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave   (cpu_peripheral_bridge_m1_read_data_valid_sysid_control_slave),
      .cpu_peripheral_bridge_m1_requests_sysid_control_slave          (cpu_peripheral_bridge_m1_requests_sysid_control_slave),
      .cpu_peripheral_bridge_m1_write                                 (cpu_peripheral_bridge_m1_write),
      .d1_sysid_control_slave_end_xfer                                (d1_sysid_control_slave_end_xfer),
      .reset_n                                                        (altpll_io_reset_n),
      .sysid_control_slave_address                                    (sysid_control_slave_address),
      .sysid_control_slave_readdata                                   (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                           (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                                    (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_s1_arbitrator the_timer_s1
    (
      .clk                                                 (altpll_io),
      .cpu_peripheral_bridge_m1_address_to_slave           (cpu_peripheral_bridge_m1_address_to_slave),
      .cpu_peripheral_bridge_m1_granted_timer_s1           (cpu_peripheral_bridge_m1_granted_timer_s1),
      .cpu_peripheral_bridge_m1_latency_counter            (cpu_peripheral_bridge_m1_latency_counter),
      .cpu_peripheral_bridge_m1_nativeaddress              (cpu_peripheral_bridge_m1_nativeaddress),
      .cpu_peripheral_bridge_m1_qualified_request_timer_s1 (cpu_peripheral_bridge_m1_qualified_request_timer_s1),
      .cpu_peripheral_bridge_m1_read                       (cpu_peripheral_bridge_m1_read),
      .cpu_peripheral_bridge_m1_read_data_valid_timer_s1   (cpu_peripheral_bridge_m1_read_data_valid_timer_s1),
      .cpu_peripheral_bridge_m1_requests_timer_s1          (cpu_peripheral_bridge_m1_requests_timer_s1),
      .cpu_peripheral_bridge_m1_write                      (cpu_peripheral_bridge_m1_write),
      .cpu_peripheral_bridge_m1_writedata                  (cpu_peripheral_bridge_m1_writedata),
      .d1_timer_s1_end_xfer                                (d1_timer_s1_end_xfer),
      .reset_n                                             (altpll_io_reset_n),
      .timer_s1_address                                    (timer_s1_address),
      .timer_s1_chipselect                                 (timer_s1_chipselect),
      .timer_s1_irq                                        (timer_s1_irq),
      .timer_s1_irq_from_sa                                (timer_s1_irq_from_sa),
      .timer_s1_readdata                                   (timer_s1_readdata),
      .timer_s1_readdata_from_sa                           (timer_s1_readdata_from_sa),
      .timer_s1_reset_n                                    (timer_s1_reset_n),
      .timer_s1_write_n                                    (timer_s1_write_n),
      .timer_s1_writedata                                  (timer_s1_writedata)
    );

  timer the_timer
    (
      .address    (timer_s1_address),
      .chipselect (timer_s1_chipselect),
      .clk        (altpll_io),
      .irq        (timer_s1_irq),
      .readdata   (timer_s1_readdata),
      .reset_n    (timer_s1_reset_n),
      .write_n    (timer_s1_write_n),
      .writedata  (timer_s1_writedata)
    );

  tri_state_bridge_flash_avalon_slave_arbitrator the_tri_state_bridge_flash_avalon_slave
    (
      .address_to_the_cfi_flash                                                (address_to_the_cfi_flash),
      .cfi_flash_s1_wait_counter_eq_0                                          (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                                 (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_dbs_address                                             (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                                             (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cfi_flash_s1                                    (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cfi_flash_s1                          (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                            (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cfi_flash_s1                                   (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                                 (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                      (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                             (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_latency_counter                                  (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1                   (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_read                                             (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1                     (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_requests_cfi_flash_s1                            (cpu_instruction_master_requests_cfi_flash_s1),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                         (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_flash_data                                    (incoming_tri_state_bridge_flash_data),
      .incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0             (incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0),
      .read_n_to_the_cfi_flash                                                 (read_n_to_the_cfi_flash),
      .reset_n                                                                 (altpll_sys_reset_n),
      .select_n_to_the_cfi_flash                                               (select_n_to_the_cfi_flash),
      .tri_state_bridge_flash_data                                             (tri_state_bridge_flash_data),
      .write_n_to_the_cfi_flash                                                (write_n_to_the_cfi_flash)
    );

  usb_dc_arbitrator the_usb_dc
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_usb_dc                                          (cpu_data_master_granted_usb_dc),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_usb_dc                                (cpu_data_master_qualified_request_usb_dc),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_usb_dc                                  (cpu_data_master_read_data_valid_usb_dc),
      .cpu_data_master_requests_usb_dc                                         (cpu_data_master_requests_usb_dc),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_usb_dc_end_xfer                                                      (d1_usb_dc_end_xfer),
      .reset_n                                                                 (altpll_sys_reset_n),
      .usb_dc_address                                                          (usb_dc_address),
      .usb_dc_chipselect_n                                                     (usb_dc_chipselect_n),
      .usb_dc_irq_n                                                            (usb_dc_irq_n),
      .usb_dc_irq_n_from_sa                                                    (usb_dc_irq_n_from_sa),
      .usb_dc_read_n                                                           (usb_dc_read_n),
      .usb_dc_readdata                                                         (usb_dc_readdata),
      .usb_dc_readdata_from_sa                                                 (usb_dc_readdata_from_sa),
      .usb_dc_reset_n                                                          (usb_dc_reset_n),
      .usb_dc_wait_counter_eq_0                                                (usb_dc_wait_counter_eq_0),
      .usb_dc_write_n                                                          (usb_dc_write_n),
      .usb_dc_writedata                                                        (usb_dc_writedata)
    );

  usb_hc_arbitrator the_usb_hc
    (
      .clk                                                                     (altpll_sys),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_usb_hc                                          (cpu_data_master_granted_usb_hc),
      .cpu_data_master_latency_counter                                         (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_usb_hc                                (cpu_data_master_qualified_request_usb_hc),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_cpu_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_usb_hc                                  (cpu_data_master_read_data_valid_usb_hc),
      .cpu_data_master_requests_usb_hc                                         (cpu_data_master_requests_usb_hc),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_usb_hc_end_xfer                                                      (d1_usb_hc_end_xfer),
      .reset_n                                                                 (altpll_sys_reset_n),
      .usb_hc_address                                                          (usb_hc_address),
      .usb_hc_chipselect_n                                                     (usb_hc_chipselect_n),
      .usb_hc_irq_n                                                            (usb_hc_irq_n),
      .usb_hc_irq_n_from_sa                                                    (usb_hc_irq_n_from_sa),
      .usb_hc_read_n                                                           (usb_hc_read_n),
      .usb_hc_readdata                                                         (usb_hc_readdata),
      .usb_hc_readdata_from_sa                                                 (usb_hc_readdata_from_sa),
      .usb_hc_reset_n                                                          (usb_hc_reset_n),
      .usb_hc_wait_counter_eq_0                                                (usb_hc_wait_counter_eq_0),
      .usb_hc_write_n                                                          (usb_hc_write_n),
      .usb_hc_writedata                                                        (usb_hc_writedata)
    );

  usb the_usb
    (
      .USB_ADDR                  (USB_ADDR_from_the_usb),
      .USB_CS_N                  (USB_CS_N_from_the_usb),
      .USB_DATA                  (USB_DATA_to_and_from_the_usb),
      .USB_INT0                  (USB_INT0_to_the_usb),
      .USB_INT1                  (USB_INT1_to_the_usb),
      .USB_RD_N                  (USB_RD_N_from_the_usb),
      .USB_RST_N                 (USB_RST_N_from_the_usb),
      .USB_WR_N                  (USB_WR_N_from_the_usb),
      .avs_dc_address_iADDR      (usb_dc_address),
      .avs_dc_chipselect_n_iCS_N (usb_dc_chipselect_n),
      .avs_dc_clk_iCLK           (altpll_sys),
      .avs_dc_irq_n_oINT0_N      (usb_dc_irq_n),
      .avs_dc_read_n_iRD_N       (usb_dc_read_n),
      .avs_dc_readdata_oDATA     (usb_dc_readdata),
      .avs_dc_reset_n_iRST_N     (usb_dc_reset_n),
      .avs_dc_write_n_iWR_N      (usb_dc_write_n),
      .avs_dc_writedata_iDATA    (usb_dc_writedata),
      .avs_hc_address_iADDR      (usb_hc_address),
      .avs_hc_chipselect_n_iCS_N (usb_hc_chipselect_n),
      .avs_hc_clk_iCLK           (altpll_sys),
      .avs_hc_irq_n_oINT0_N      (usb_hc_irq_n),
      .avs_hc_read_n_iRD_N       (usb_hc_read_n),
      .avs_hc_readdata_oDATA     (usb_hc_readdata),
      .avs_hc_reset_n_iRST_N     (usb_hc_reset_n),
      .avs_hc_write_n_iWR_N      (usb_hc_write_n),
      .avs_hc_writedata_iDATA    (usb_hc_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_audio_reset_clk_50_domain_synch_module nios_audio_reset_clk_50_domain_synch
    (
      .clk      (clk_50),
      .data_in  (1'b1),
      .data_out (clk_50_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  nios_audio_reset_audio_18_domain_synch_module nios_audio_reset_audio_18_domain_synch
    (
      .clk      (audio_18),
      .data_in  (1'b1),
      .data_out (audio_18_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_audio_reset_altpll_sys_domain_synch_module nios_audio_reset_altpll_sys_domain_synch
    (
      .clk      (altpll_sys),
      .data_in  (1'b1),
      .data_out (altpll_sys_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_audio_reset_altpll_io_domain_synch_module nios_audio_reset_altpll_io_domain_synch
    (
      .clk      (altpll_io),
      .data_in  (1'b1),
      .data_out (altpll_io_reset_n),
      .reset_n  (reset_n_sources)
    );

  //cpu_peripheral_bridge_m1_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign cpu_peripheral_bridge_m1_endofpacket = 0;

  //nios_audio_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign nios_audio_clock_0_out_endofpacket = 0;

  //nios_audio_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign nios_audio_clock_1_out_endofpacket = 0;

  //nios_audio_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign nios_audio_clock_2_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 22: 0] rdaddress;
  input            rdclken;
  input   [ 22: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [8388607: 0];
  wire    [  7: 0] q;
  reg     [ 22: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 23,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [  7: 0] data;
  input   [ 22: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.0/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.0/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.0/quartus/eda/sim_lib/sgate.v"
`include "ip/TERASIC_SRAM/TERASIC_SRAM.v"
`include "sram.v"
`include "usb.v"
`include "audio.v"
`include "altpll.v"
`include "seg7.v"
`include "altpll_audio.v"
`include "nios_audio_clock_1.v"
`include "sd_cmd.v"
`include "sysid.v"
`include "sdram.v"
`include "sdram_test_component.v"
`include "sw.v"
`include "timer.v"
`include "nios_audio_clock_0.v"
`include "key.v"
`include "sd_wp_n.v"
`include "pio_led.v"
`include "jtag_uart.v"
`include "i2c_scl.v"
`include "lcd.v"
`include "nios_audio_clock_2.v"
`include "eep_i2c_sda.v"
`include "sd_dat.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sd_clk.v"
`include "i2c_sda.v"
`include "cpu_peripheral_bridge.v"
`include "eep_i2c_scl.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire    [ 63: 0] SEG7_from_the_seg7;
  wire    [ 19: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_n_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_n_from_the_sram;
  wire             SRAM_OE_n_from_the_sram;
  wire             SRAM_UB_n_from_the_sram;
  wire             SRAM_WE_n_from_the_sram;
  wire    [  1: 0] USB_ADDR_from_the_usb;
  wire             USB_CS_N_from_the_usb;
  wire    [ 15: 0] USB_DATA_to_and_from_the_usb;
  wire             USB_INT0_to_the_usb;
  wire             USB_INT1_to_the_usb;
  wire             USB_RD_N_from_the_usb;
  wire             USB_RST_N_from_the_usb;
  wire             USB_WR_N_from_the_usb;
  wire    [ 22: 0] address_to_the_cfi_flash;
  wire             altpll_25;
  wire             altpll_io;
  wire             altpll_sdram;
  wire             altpll_sys;
  wire             audio_18;
  wire             avs_s1_export_ADCDAT_to_the_audio;
  wire             avs_s1_export_ADCLRC_to_the_audio;
  wire             avs_s1_export_BCLK_to_the_audio;
  wire             avs_s1_export_DACDAT_from_the_audio;
  wire             avs_s1_export_DACLRC_to_the_audio;
  wire             avs_s1_export_XCK_from_the_audio;
  wire             bidir_port_to_and_from_the_eep_i2c_sda;
  wire             bidir_port_to_and_from_the_i2c_sda;
  wire             bidir_port_to_and_from_the_sd_cmd;
  wire    [  3: 0] bidir_port_to_and_from_the_sd_dat;
  wire             clk;
  reg              clk_50;
  wire             cpu_peripheral_bridge_m1_endofpacket;
  wire             cpu_peripheral_bridge_s1_endofpacket_from_sa;
  wire    [  3: 0] in_port_to_the_key;
  wire             in_port_to_the_sd_wp_n;
  wire    [ 17: 0] in_port_to_the_sw;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_altpll;
  wire             locked_from_the_altpll_audio;
  wire             nios_audio_clock_0_in_endofpacket_from_sa;
  wire             nios_audio_clock_0_out_endofpacket;
  wire    [  1: 0] nios_audio_clock_0_out_nativeaddress;
  wire             nios_audio_clock_1_in_endofpacket_from_sa;
  wire             nios_audio_clock_1_out_endofpacket;
  wire    [  1: 0] nios_audio_clock_1_out_nativeaddress;
  wire             nios_audio_clock_2_in_endofpacket_from_sa;
  wire             nios_audio_clock_2_out_endofpacket;
  wire             out_port_from_the_eep_i2c_scl;
  wire             out_port_from_the_i2c_scl;
  wire    [ 25: 0] out_port_from_the_pio_led;
  wire             out_port_from_the_sd_clk;
  wire             phasedone_from_the_altpll;
  wire             phasedone_from_the_altpll_audio;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             select_n_to_the_cfi_flash;
  wire             sysid_control_slave_clock;
  wire    [  7: 0] tri_state_bridge_flash_data;
  wire             write_n_to_the_cfi_flash;
  wire    [ 12: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_audio DUT
    (
      .LCD_E_from_the_lcd                     (LCD_E_from_the_lcd),
      .LCD_RS_from_the_lcd                    (LCD_RS_from_the_lcd),
      .LCD_RW_from_the_lcd                    (LCD_RW_from_the_lcd),
      .LCD_data_to_and_from_the_lcd           (LCD_data_to_and_from_the_lcd),
      .SEG7_from_the_seg7                     (SEG7_from_the_seg7),
      .SRAM_ADDR_from_the_sram                (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n_from_the_sram                (SRAM_CE_n_from_the_sram),
      .SRAM_DQ_to_and_from_the_sram           (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n_from_the_sram                (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n_from_the_sram                (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n_from_the_sram                (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n_from_the_sram                (SRAM_WE_n_from_the_sram),
      .USB_ADDR_from_the_usb                  (USB_ADDR_from_the_usb),
      .USB_CS_N_from_the_usb                  (USB_CS_N_from_the_usb),
      .USB_DATA_to_and_from_the_usb           (USB_DATA_to_and_from_the_usb),
      .USB_INT0_to_the_usb                    (USB_INT0_to_the_usb),
      .USB_INT1_to_the_usb                    (USB_INT1_to_the_usb),
      .USB_RD_N_from_the_usb                  (USB_RD_N_from_the_usb),
      .USB_RST_N_from_the_usb                 (USB_RST_N_from_the_usb),
      .USB_WR_N_from_the_usb                  (USB_WR_N_from_the_usb),
      .address_to_the_cfi_flash               (address_to_the_cfi_flash),
      .altpll_25                              (altpll_25),
      .altpll_io                              (altpll_io),
      .altpll_sdram                           (altpll_sdram),
      .altpll_sys                             (altpll_sys),
      .audio_18                               (audio_18),
      .avs_s1_export_ADCDAT_to_the_audio      (avs_s1_export_ADCDAT_to_the_audio),
      .avs_s1_export_ADCLRC_to_the_audio      (avs_s1_export_ADCLRC_to_the_audio),
      .avs_s1_export_BCLK_to_the_audio        (avs_s1_export_BCLK_to_the_audio),
      .avs_s1_export_DACDAT_from_the_audio    (avs_s1_export_DACDAT_from_the_audio),
      .avs_s1_export_DACLRC_to_the_audio      (avs_s1_export_DACLRC_to_the_audio),
      .avs_s1_export_XCK_from_the_audio       (avs_s1_export_XCK_from_the_audio),
      .bidir_port_to_and_from_the_eep_i2c_sda (bidir_port_to_and_from_the_eep_i2c_sda),
      .bidir_port_to_and_from_the_i2c_sda     (bidir_port_to_and_from_the_i2c_sda),
      .bidir_port_to_and_from_the_sd_cmd      (bidir_port_to_and_from_the_sd_cmd),
      .bidir_port_to_and_from_the_sd_dat      (bidir_port_to_and_from_the_sd_dat),
      .clk_50                                 (clk_50),
      .in_port_to_the_key                     (in_port_to_the_key),
      .in_port_to_the_sd_wp_n                 (in_port_to_the_sd_wp_n),
      .in_port_to_the_sw                      (in_port_to_the_sw),
      .locked_from_the_altpll                 (locked_from_the_altpll),
      .locked_from_the_altpll_audio           (locked_from_the_altpll_audio),
      .out_port_from_the_eep_i2c_scl          (out_port_from_the_eep_i2c_scl),
      .out_port_from_the_i2c_scl              (out_port_from_the_i2c_scl),
      .out_port_from_the_pio_led              (out_port_from_the_pio_led),
      .out_port_from_the_sd_clk               (out_port_from_the_sd_clk),
      .phasedone_from_the_altpll              (phasedone_from_the_altpll),
      .phasedone_from_the_altpll_audio        (phasedone_from_the_altpll_audio),
      .read_n_to_the_cfi_flash                (read_n_to_the_cfi_flash),
      .reset_n                                (reset_n),
      .select_n_to_the_cfi_flash              (select_n_to_the_cfi_flash),
      .tri_state_bridge_flash_data            (tri_state_bridge_flash_data),
      .write_n_to_the_cfi_flash               (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram                 (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                   (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram                (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                  (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram                 (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram            (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                  (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram                (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram                 (zs_we_n_from_the_sdram)
    );

  cfi_flash the_cfi_flash
    (
      .address  (address_to_the_cfi_flash),
      .data     (tri_state_bridge_flash_data),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  sdram_test_component the_sdram_test_component
    (
      .clk      (altpll_sys),
      .zs_addr  (zs_addr_from_the_sdram),
      .zs_ba    (zs_ba_from_the_sdram),
      .zs_cas_n (zs_cas_n_from_the_sdram),
      .zs_cke   (zs_cke_from_the_sdram),
      .zs_cs_n  (zs_cs_n_from_the_sdram),
      .zs_dq    (zs_dq_to_and_from_the_sdram),
      .zs_dqm   (zs_dqm_from_the_sdram),
      .zs_ras_n (zs_ras_n_from_the_sdram),
      .zs_we_n  (zs_we_n_from_the_sdram)
    );

  initial
    clk_50 = 1'b0;
  always
    #10 clk_50 <= ~clk_50;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on