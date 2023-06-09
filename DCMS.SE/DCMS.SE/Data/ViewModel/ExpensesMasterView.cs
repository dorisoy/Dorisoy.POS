﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DCMS.SE.Data.ViewModel
{
    public class ExpensesMasterView
    {
        public int ExpensiveMasterId { get; set; }

        public string VoucherNo { get; set; }
        public DateTime? Date { get; set; }
        public string NepaliDate { get; set; }
        public string VoucherTypeName { get; set; }
        public string TerminalName { get; set; }
        public string Narration { get; set; }
        public decimal Amount { get; set; }
        public string WarehouseName { get; set; }
    }
}
