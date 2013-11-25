#ifndef BW_QUERY_H
#define BW_QUERY_H

#include <R.h>
#include <Rdefines.h>

typedef struct bbiFile bigWig_t;

typedef struct {
  double defaultValue;
  int do_abs;
  
  double total;
  double count;
} bwStepOpData;

typedef void (* bw_op_clear)(bwStepOpData * data);
typedef void (* bw_op_add)(bwStepOpData * data, double isize, double ivalue);
typedef double (* bw_op_result)(bwStepOpData * data, int step);

typedef struct {
  bw_op_clear clear;
  bw_op_add add;
  bw_op_result result;
} bwStepOp;

void bw_select_op(bwStepOp * op, const char * bw_op_type, int probe_mode);
SEXP bw_step_query(bigWig_t * bigwig, bwStepOp * op, const char * chrom, int start, int end, int step, double gap_value, int do_abs);
SEXP bw_chrom_step_query(bigWig_t * bigwig, bwStepOp * op, const char * chrom, int step, double gap_value, int do_abs);

#endif