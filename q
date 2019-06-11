AWK(1P)                                      POSIX Programmer's Manual                                     AWK(1P)

PPRROOLLOOGG
       This  manual page is part of the POSIX Programmer's Manual.  The Linux implementation of this interface may
       differ (consult the corresponding Linux manual page for details of Linux behavior), or  the  interface  may
       not be implemented on Linux.

NNAAMMEE
       awk — pattern scanning and processing language

SSYYNNOOPPSSIISS
       awk [[−F _s_e_p_s_t_r_i_n_g]] [[−v _a_s_s_i_g_n_m_e_n_t]]... _p_r_o_g_r_a_m [[_a_r_g_u_m_e_n_t...]]

       awk [[−F _s_e_p_s_t_r_i_n_g]] −f _p_r_o_g_f_i_l_e [[−f _p_r_o_g_f_i_l_e]]... [[−v _a_s_s_i_g_n_m_e_n_t]]...
            [[_a_r_g_u_m_e_n_t...]]

DDEESSCCRRIIPPTTIIOONN
       The  _a_w_k  utility  shall execute programs written in the _a_w_k programming language, which is specialized for
       textual data manipulation. An _a_w_k program is a sequence of patterns and corresponding actions.  When  input
       is read that matches a pattern, the action associated with that pattern is carried out.

       Input  shall  be interpreted as a sequence of records. By default, a record is a line, less its terminating
       <newline>, but this can be changed by using the RRSS built-in variable. Each record of input shall be matched
       in  turn against each pattern in the program. For each pattern matched, the associated action shall be exe‐
       cuted.

       The _a_w_k utility shall interpret each input record as a sequence of fields where, by default, a field  is  a
       string  of  non-<blank> non-<newline> characters. This default <blank> and <newline> field delimiter can be
       changed by using the FFSS built-in variable or the −−FF _s_e_p_s_t_r_i_n_g option. The  _a_w_k  utility  shall  denote  the
       first  field in a record $1, the second $2, and so on. The symbol $0 shall refer to the entire record; set‐
       ting any other field causes the re-evaluation of $0. Assigning to $0 shall reset the values  of  all  other
       fields and the NNFF built-in variable.

OOPPTTIIOONNSS
       The  _a_w_k utility shall conform to the Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s.

       The following options shall be supported:

       −−FF _s_e_p_s_t_r_i_n_g
                 Define the input field separator. This option shall be equivalent to:

                     --vv FFSS==_s_e_p_s_t_r_i_n_g

                 except that if −−FF _s_e_p_s_t_r_i_n_g and −−vv FS=_s_e_p_s_t_r_i_n_g are both used, it is unspecified whether  the  FFSS
                 assignment  resulting  from −−FF _s_e_p_s_t_r_i_n_g is processed in command line order or is processed after
                 the last −−vv FS=_s_e_p_s_t_r_i_n_g.  See the description of the FFSS built-in variable, and how it  is  used,
                 in the EXTENDED DESCRIPTION section.

       −−ff _p_r_o_g_f_i_l_e
                 Specify  the pathname of the file _p_r_o_g_f_i_l_e containing an _a_w_k program. A pathname of ''−−'' shall de‐
                 note the standard input. If multiple instances of this option are specified, the concatenation of
                 the  files specified as _p_r_o_g_f_i_l_e in the order specified shall be the _a_w_k program. The _a_w_k program
                 can alternatively be specified in the command line as a single argument.

       −−vv _a_s_s_i_g_n_m_e_n_t
                 The application shall ensure that the _a_s_s_i_g_n_m_e_n_t argument is in the same form  as  an  _a_s_s_i_g_n_m_e_n_t
                 operand.  The  specified  variable assignment shall occur prior to executing the _a_w_k program, in‐
                 cluding the actions associated with BBEEGGIINN patterns (if any). Multiple occurrences of this  option
                 can be specified.

OOPPEERRAANNDDSS
       The following operands shall be supported:

       _p_r_o_g_r_a_m   If  no −−ff option is specified, the first operand to _a_w_k shall be the text of the _a_w_k program. The
                 application shall supply the _p_r_o_g_r_a_m operand as a single argument to _a_w_k.  If the text  does  not
                 end in a <newline>, _a_w_k shall interpret the text as if it did.

       _a_r_g_u_m_e_n_t  Either of the following two types of _a_r_g_u_m_e_n_t can be intermixed:

                 _f_i_l_e      A  pathname  of a file that contains the input to be read, which is matched against the
                           set of patterns in the program. If no _f_i_l_e operands are specified, or if a _f_i_l_e operand
                           is ''−−'', the standard input shall be used.

                 _a_s_s_i_g_n_m_e_n_t
                           An  operand  that begins with an <underscore> or alphabetic character from the portable
                           character set (see the table in the Base Definitions volume  of  POSIX.1‐2008,  _S_e_c_t_i_o_n
                           _6_._1, _P_o_r_t_a_b_l_e _C_h_a_r_a_c_t_e_r _S_e_t), followed by a sequence of underscores, digits, and alpha‐
                           betics from the portable character set, followed by the ''=='' character, shall specify  a
                           variable  assignment  rather  than a pathname.  The characters before the ''=='' represent
                           the name of an _a_w_k variable; if that name is an _a_w_k reserved word (see _G_r_a_m_m_a_r) the be‐
                           havior is undefined. The characters following the <equals-sign> shall be interpreted as
                           if they appeared in the _a_w_k program preceded and followed by a double-quote (''""'') char‐
                           acter,  as  a  SSTTRRIINNGG  token (see _G_r_a_m_m_a_r), except that if the last character is an un‐
                           escaped <backslash>, it shall be interpreted as a literal <backslash>  rather  than  as
                           the  first character of the sequence ""\\"""".  The variable shall be assigned the value of
                           that SSTTRRIINNGG token and, if appropriate, shall be considered a _n_u_m_e_r_i_c  _s_t_r_i_n_g  (see  _E_x_‐
                           _p_r_e_s_s_i_o_n_s  _i_n  _a_w_k),  the  variable shall also be assigned its numeric value. Each such
                           variable assignment shall occur just prior to the processing of the following _f_i_l_e,  if
                           any. Thus, an assignment before the first _f_i_l_e argument shall be executed after the BBEE‐‐
                           GGIINN actions (if any), while an assignment after the last _f_i_l_e argument shall occur  be‐
                           fore the EENNDD actions (if any). If there are no _f_i_l_e arguments, assignments shall be ex‐
                           ecuted before processing the standard input.

SSTTDDIINN
       The standard input shall be used only if no _f_i_l_e operands are specified, or if a _f_i_l_e operand is ''−−'', or if
       a  _p_r_o_g_f_i_l_e option-argument is ''−−''; see the INPUT FILES section. If the _a_w_k program contains no actions and
       no patterns, but is otherwise a valid _a_w_k program, standard input and any _f_i_l_e operands shall not  be  read
       and _a_w_k shall exit with a return status of zero.

IINNPPUUTT FFIILLEESS
       Input files to the _a_w_k program from any of the following sources shall be text files:

        *  Any _f_i_l_e operands or their equivalents, achieved by modifying the _a_w_k variables AARRGGVV and AARRGGCC

        *  Standard input in the absence of any _f_i_l_e operands

        *  Arguments to the ggeettlliinnee function

       Whether  the  variable RRSS is set to a value other than a <newline> or not, for these files, implementations
       shall support records terminated with the specified separator up to {LINE_MAX} bytes and may support longer
       records.

       If  −−ff _p_r_o_g_f_i_l_e is specified, the application shall ensure that the files named by each of the _p_r_o_g_f_i_l_e op‐
       tion-arguments are text files and their concatenation, in the same order as they appear in  the  arguments,
       is an _a_w_k program.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _a_w_k:

       _L_A_N_G      Provide  a  default value for the internationalization variables that are unset or null. (See the
                 Base Definitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n  _8_._2,  _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n  _V_a_r_i_a_b_l_e_s  for  the
                 precedence of internationalization variables used to determine the values of locale categories.)

       _L_C___A_L_L    If  set  to  a  non-empty string value, override the values of all the other internationalization
                 variables.

       _L_C___C_O_L_L_A_T_E
                 Determine the locale for the behavior of ranges, equivalence classes, and multi-character collat‐
                 ing elements within regular expressions and in comparisons of string values.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of bytes of text data as characters (for
                 example, single-byte as opposed to multi-byte characters in arguments and input files),  the  be‐
                 havior  of character classes within regular expressions, the identification of characters as let‐
                 ters, and the mapping of uppercase and lowercase characters for the  ttoouuppppeerr  and  ttoolloowweerr  func‐
                 tions.

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format and contents of diagnostic messages
                 written to standard error.

       _L_C___N_U_M_E_R_I_C
                 Determine the radix character used when interpreting numeric input,  performing  conversions  be‐
                 tween  numeric  and  string values, and formatting numeric output. Regardless of locale, the <pe‐
                 riod> character (the decimal-point character of the POSIX locale) is the decimal-point  character
                 recognized in processing _a_w_k programs (including assignments in command line arguments).

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing of _L_C___M_E_S_S_A_G_E_S.

       _P_A_T_H      Determine the search path when looking for commands executed by _s_y_s_t_e_m(_e_x_p_r), or input and output
                 pipes; see the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s.

       In addition, all environment variables shall be visible via the _a_w_k variable EENNVVIIRROONN.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       The nature of the output files depends on the _a_w_k program.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       The nature of the output files depends on the _a_w_k program.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
   OOvveerraallll PPrrooggrraamm SSttrruuccttuurree
       An _a_w_k program is composed of pairs of the form:

           _p_a_t_t_e_r_n { _a_c_t_i_o_n }

       Either the pattern or the action (including the enclosing brace characters) can be omitted.

       A missing pattern shall match any record of input, and a missing action shall be equivalent to:

           {{ pprriinntt }}

       Execution of the _a_w_k program shall start by first executing the actions associated with all BBEEGGIINN  patterns
       in  the  order they occur in the program. Then each _f_i_l_e operand (or standard input if no files were speci‐
       fied) shall be processed in turn by reading data from the file until a record separator is seen  (<newline>
       by  default).  Before  the first reference to a field in the record is evaluated, the record shall be split
       into fields, according to the rules in _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, using the value of FFSS that was current  at  the
       time  the  record was read. Each pattern in the program then shall be evaluated in the order of occurrence,
       and the action associated with each pattern that matches the current record  executed.  The  action  for  a
       matching  pattern  shall be executed before evaluating subsequent patterns. Finally, the actions associated
       with all EENNDD patterns shall be executed in the order they occur in the program.

   EExxpprreessssiioonnss iinn aawwkk
       Expressions describe computations used in _p_a_t_t_e_r_n_s and _a_c_t_i_o_n_s.  In the following table,  valid  expression
       operations  are  given in groups from highest precedence first to lowest precedence last, with equal-prece‐
       dence operators grouped between horizontal lines. In expression evaluation, where the grammar  is  formally
       ambiguous,  higher precedence operators shall be evaluated before lower precedence operators. In this table
       _e_x_p_r, _e_x_p_r_1, _e_x_p_r_2, and _e_x_p_r_3 represent any expression, while lvalue represents any entity that can be  as‐
       signed  to  (that  is,  on  the left side of an assignment operator).  The precise syntax of expressions is
       given in _G_r_a_m_m_a_r.

                                 TTaabbllee 44--11:: EExxpprreessssiioonnss iinn DDeeccrreeaassiinngg PPrreecceeddeennccee iinn _a_w_k

                    ┌─────────────────────┬─────────────────────────┬────────────────┬──────────────┐
                    │       SSyynnttaaxx        │          NNaammee           │ TTyyppee ooff RReessuulltt │AAssssoocciiaattiivviittyy │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │( _e_x_p_r )             │Grouping                 │Type of _e_x_p_r    │N/A           │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │$_e_x_p_r                │Field reference          │String          │N/A           │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │lvalue ++            │Post-increment           │Numeric         │N/A           │
                    │lvalue −−            │Post-decrement           │Numeric         │N/A           │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │++ lvalue            │Pre-increment            │Numeric         │N/A           │
                    │−− lvalue            │Pre-decrement            │Numeric         │N/A           │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r ^ _e_x_p_r          │Exponentiation           │Numeric         │Right         │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │! _e_x_p_r               │Logical not              │Numeric         │N/A           │
                    │+ _e_x_p_r               │Unary plus               │Numeric         │N/A           │
                    │− _e_x_p_r               │Unary minus              │Numeric         │N/A           │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r * _e_x_p_r          │Multiplication           │Numeric         │Left          │
                    │_e_x_p_r / _e_x_p_r          │Division                 │Numeric         │Left          │
                    │_e_x_p_r % _e_x_p_r          │Modulus                  │Numeric         │Left          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r + _e_x_p_r          │Addition                 │Numeric         │Left          │
                    │_e_x_p_r − _e_x_p_r          │Subtraction              │Numeric         │Left          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r _e_x_p_r            │String concatenation     │String          │Left          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r < _e_x_p_r          │Less than                │Numeric         │None          │
                    │_e_x_p_r <= _e_x_p_r         │Less than or equal to    │Numeric         │None          │
                    │_e_x_p_r != _e_x_p_r         │Not equal to             │Numeric         │None          │
                    │_e_x_p_r == _e_x_p_r         │Equal to                 │Numeric         │None          │
                    │_e_x_p_r > _e_x_p_r          │Greater than             │Numeric         │None          │
                    │_e_x_p_r >= _e_x_p_r         │Greater than or equal to │Numeric         │None          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r ~ _e_x_p_r          │ERE match                │Numeric         │None          │
                    │_e_x_p_r !~ _e_x_p_r         │ERE non-match            │Numeric         │None          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r in array        │Array membership         │Numeric         │Left          │
                    │( _i_n_d_e_x ) in _a_r_r_a_y   │Multi-dimension array    │Numeric         │Left          │
                    │                     │membership               │                │              │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r && _e_x_p_r         │Logical AND              │Numeric         │Left          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r || _e_x_p_r         │Logical OR               │Numeric         │Left          │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │_e_x_p_r_1 ? _e_x_p_r_2 : _e_x_p_r_3│Conditional expression   │Type of selected│Right         │
                    │                     │                         │_e_x_p_r_2 or _e_x_p_r_3  │              │
                    ├─────────────────────┼─────────────────────────┼────────────────┼──────────────┤
                    │lvalue ^= _e_x_p_r       │Exponentiation assignment│Numeric         │Right         │
                    │lvalue %= _e_x_p_r       │Modulus assignment       │Numeric         │Right         │
                    │lvalue *= _e_x_p_r       │Multiplication assignment│Numeric         │Right         │
                    │lvalue /= _e_x_p_r       │Division assignment      │Numeric         │Right         │
                    │lvalue += _e_x_p_r       │Addition assignment      │Numeric         │Right         │
                    │lvalue −= _e_x_p_r       │Subtraction assignment   │Numeric         │Right         │
                    │lvalue = _e_x_p_r        │Assignment               │Type of _e_x_p_r    │Right         │
                    └─────────────────────┴─────────────────────────┴────────────────┴──────────────┘
       Each expression shall have either a string value, a numeric value, or both. Except as stated  for  specific
       contexts,  the  value  of an expression shall be implicitly converted to the type needed for the context in
       which it is used. A string value shall be converted to a numeric value either by the equivalent of the fol‐
       lowing calls to functions defined by the ISO C standard:

           sseettllooccaallee((LLCC__NNUUMMEERRIICC,, """"));;
           _n_u_m_e_r_i_c___v_a_l_u_e = atof(_s_t_r_i_n_g___v_a_l_u_e);

       or by converting the initial portion of the string to type ddoouubbllee representation as follows:

              The  input  string is decomposed into two parts: an initial, possibly empty, sequence of white-space
              characters (as specified by _i_s_s_p_a_c_e()) and a subject sequence interpreted as a  floating-point  con‐
              stant.

              The  expected form of the subject sequence is an optional ''++'' or ''−−'' sign, then a non-empty sequence
              of digits optionally containing a <period>, then an optional exponent part. An  exponent  part  con‐
              sists of ''ee'' or ''EE'', followed by an optional sign, followed by one or more decimal digits.

              The  sequence  starting with the first digit or the <period> (whichever occurs first) is interpreted
              as a floating constant of the C language, and if neither an exponent part nor a <period> appears,  a
              <period>  is  assumed  to follow the last digit in the string. If the subject sequence begins with a
              minus-sign, the value resulting from the conversion is negated.

       A numeric value that is exactly equal to the value of an integer (see _S_e_c_t_i_o_n _1_._1_._2, _C_o_n_c_e_p_t_s _D_e_r_i_v_e_d  _f_r_o_m
       _t_h_e _I_S_O _C _S_t_a_n_d_a_r_d) shall be converted to a string by the equivalent of a call to the sspprriinnttff function (see
       _S_t_r_i_n_g _F_u_n_c_t_i_o_n_s) with the string ""%%dd"" as the _f_m_t argument and the numeric value  being  converted  as  the
       first and only _e_x_p_r argument. Any other numeric value shall be converted to a string by the equivalent of a
       call to the sspprriinnttff function with the value of the variable CCOONNVVFFMMTT as the _f_m_t  argument  and  the  numeric
       value  being  converted as the first and only _e_x_p_r argument. The result of the conversion is unspecified if
       the value of CCOONNVVFFMMTT is not a floating-point format specification. This volume of POSIX.1‐2008 specifies no
       explicit conversions between numbers and strings. An application can force an expression to be treated as a
       number by adding zero to it, or can force it to be treated as a string by  concatenating  the  null  string
       ("""") to it.

       A string value shall be considered a _n_u_m_e_r_i_c _s_t_r_i_n_g if it comes from one of the following:

        1. Field variables

        2. Input from the _g_e_t_l_i_n_e() function

        3. FFIILLEENNAAMMEE

        4. AARRGGVV array elements

        5. EENNVVIIRROONN array elements

        6. Array elements created by the _s_p_l_i_t() function

        7. A command line variable assignment

        8. Variable assignment from another numeric string variable

       and an implementation-dependent condition corresponding to either case (a) or (b) below is met.

        a. After   the   equivalent   of  the  following  calls  to  functions  defined  by  the  ISO C  standard,
           _s_t_r_i_n_g___v_a_l_u_e___e_n_d would differ from _s_t_r_i_n_g___v_a_l_u_e, and any characters before the terminating null charac‐
           ter in _s_t_r_i_n_g___v_a_l_u_e___e_n_d would be <blank> characters:

               cchhaarr **ssttrriinngg__vvaalluuee__eenndd;;
               sseettllooccaallee((LLCC__NNUUMMEERRIICC,, """"));;
               nnuummeerriicc__vvaalluuee == ssttrrttoodd ((ssttrriinngg__vvaalluuee,, &&ssttrriinngg__vvaalluuee__eenndd));;

        b. After  all  the following conversions have been applied, the resulting string would lexically be recog‐
           nized as a NNUUMMBBEERR token as described by the lexical conventions in _G_r_a_m_m_a_r:

           --  All leading and trailing <blank> characters are discarded.

           --  If the first non-<blank> is ''++'' or ''−−'', it is discarded.

           --  Each occurrence of the decimal point character from the current locale is changed to a <period>.
       In case (a) the numeric value of the _n_u_m_e_r_i_c _s_t_r_i_n_g shall be the value that would be returned by  the  _s_t_r_‐
       _t_o_d()  call.  In case (b) if the first non-<blank> is ''−−'', the numeric value of the _n_u_m_e_r_i_c _s_t_r_i_n_g shall be
       the negation of the numeric value of the recognized NNUUMMBBEERR token; otherwise, the numeric value of  the  _n_u_‐
       _m_e_r_i_c  _s_t_r_i_n_g  shall  be the numeric value of the recognized NNUUMMBBEERR token. Whether or not a string is a _n_u_‐
       _m_e_r_i_c _s_t_r_i_n_g shall be relevant only in contexts where that term is used in this section.

       When an expression is used in a Boolean context, if it has a numeric  value,  a  value  of  zero  shall  be
       treated as false and any other value shall be treated as true. Otherwise, a string value of the null string
       shall be treated as false and any other value shall be treated as true.  A Boolean context shall be one  of
       the following:

        *  The first subexpression of a conditional expression

        *  An expression operated on by logical NOT, logical AND, or logical OR

        *  The second expression of a ffoorr statement

        *  The expression of an iiff statement

        *  The expression of the wwhhiillee clause in either a wwhhiillee or ddoo...wwhhiillee statement

        *  An expression used as a pattern (as in Overall Program Structure)

       All  arithmetic  shall follow the semantics of floating-point arithmetic as specified by the ISO C standard
       (see _S_e_c_t_i_o_n _1_._1_._2, _C_o_n_c_e_p_t_s _D_e_r_i_v_e_d _f_r_o_m _t_h_e _I_S_O _C _S_t_a_n_d_a_r_d).

       The value of the expression:

           _e_x_p_r_1 ^ _e_x_p_r_2

       shall be equivalent to the value returned by the ISO C standard function call:

           pow(_e_x_p_r_1, _e_x_p_r_2)

       The expression:

           llvvaalluuee ^^== _e_x_p_r

       shall be equivalent to the ISO C standard expression:

           llvvaalluuee == ppooww((llvvaalluuee,, _e_x_p_r)

       except that lvalue shall be evaluated only once. The value of the expression:

           _e_x_p_r_1 % _e_x_p_r_2

       shall be equivalent to the value returned by the ISO C standard function call:

           ffmmoodd((_e_x_p_r_1, _e_x_p_r_2)

       The expression:

           llvvaalluuee %%== _e_x_p_r

       shall be equivalent to the ISO C standard expression:

           llvvaalluuee == ffmmoodd((llvvaalluuee,, _e_x_p_r)

       except that lvalue shall be evaluated only once.

       Variables and fields shall be set by the assignment statement:

           llvvaalluuee == _e_x_p_r_e_s_s_i_o_n

       and the type of _e_x_p_r_e_s_s_i_o_n shall determine the resulting variable type. The assignment includes the  arith‐
       metic assignments (""++=="", ""−−=="", ""**=="", ""//=="", ""%%=="", ""^^=="", ""++++"", ""−−−−"") all of which shall produce a numeric re‐
       sult. The left-hand side of an assignment and the target of increment and decrement operators can be one of
       a variable, an array with index, or a field selector.

       The  _a_w_k  language  supplies  arrays  that are used for storing numbers or strings.  Arrays need not be de‐
       clared. They shall initially be empty, and their sizes shall change dynamically. The subscripts, or element
       identifiers,  are  strings,  providing  a type of associative array capability. An array name followed by a
       subscript within square brackets can be used as an lvalue and thus as an expression, as  described  in  the
       grammar; see _G_r_a_m_m_a_r.  Unsubscripted array names can be used in only the following contexts:

        *  A parameter in a function definition or function call

        *  The  NNAAMMEE  token  following any use of the keyword iinn as specified in the grammar (see _G_r_a_m_m_a_r); if the
           name used in this context is not an array name, the behavior is undefined

       A valid array _i_n_d_e_x shall consist of one or more <comma>-separated expressions, similar to the way in which
       multi-dimensional  arrays  are indexed in some programming languages. Because _a_w_k arrays are really one-di‐
       mensional, such a <comma>-separated list shall be converted to a single string by concatenating the  string
       values  of  the  separate  expressions,  each separated from the other by the value of the SSUUBBSSEEPP variable.
       Thus, the following two index operations shall be equivalent:

           _v_a_r[[_e_x_p_r_1, _e_x_p_r_2, ... _e_x_p_r_n]]

           _v_a_r[[_e_x_p_r_1 SUBSEP _e_x_p_r_2 SUBSEP ... SUBSEP _e_x_p_r_n]]

       The application shall ensure that a multi-dimensioned _i_n_d_e_x used with the iinn operator is parenthesized. The
       iinn  operator,  which tests for the existence of a particular array element, shall not cause that element to
       exist. Any other reference to a nonexistent array element shall automatically create it.

       Comparisons (with the ''<<'', ""<<=="", ""!!=="", ""===="", ''>>'', and "">>=="" operators) shall be made numerically if both op‐
       erands  are numeric, if one is numeric and the other has a string value that is a numeric string, or if one
       is numeric and the other has the uninitialized value.  Otherwise, operands shall be converted to strings as
       required  and  a string comparison shall be made using the locale-specific collation sequence. The value of
       the comparison expression shall be 1 if the relation is true, or 0 if the relation is false.

   VVaarriiaabblleess aanndd SSppeecciiaall VVaarriiaabblleess
       Variables can be used in an _a_w_k program by referencing them. With the exception of function parameters (see
       _U_s_e_r_-_D_e_f_i_n_e_d  _F_u_n_c_t_i_o_n_s),  they are not explicitly declared. Function parameter names shall be local to the
       function; all other variable names shall be global. The same name shall not be used as both a function  pa‐
       rameter  name and as the name of a function or a special _a_w_k variable. The same name shall not be used both
       as a variable name with global scope and as the name of a function. The same name shall not be used  within
       the  same scope both as a scalar variable and as an array.  Uninitialized variables, including scalar vari‐
       ables, array elements, and field variables, shall have an uninitialized value. An uninitialized value shall
       have  both  a numeric value of zero and a string value of the empty string. Evaluation of variables with an
       uninitialized value, to either string or numeric, shall be determined by the  context  in  which  they  are
       used.

       Field  variables  shall  be designated by a ''$$'' followed by a number or numerical expression. The effect of
       the field number _e_x_p_r_e_s_s_i_o_n evaluating to anything other than a non-negative integer is unspecified; unini‐
       tialized  variables  or  string  values  need not be converted to numeric values in this context. New field
       variables can be created by assigning a value to them. References to nonexistent fields  (that  is,  fields
       after  $NNFF),  shall  evaluate to the uninitialized value. Such references shall not create new fields. How‐
       ever, assigning to a nonexistent field (for example, $(NNFF+2)=5) shall increase the value of NNFF; create  any
       intervening  fields  with  the  uninitialized  value;  and cause the value of $0 to be recomputed, with the
       fields being separated by the value of OOFFSS.  Each field variable shall have a string value or an uninitial‐
       ized  value  when created. Field variables shall have the uninitialized value when created from $0 using FFSS
       and the variable does not contain any characters. If appropriate, the field variable shall be considered  a
       numeric string (see _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k).

       Implementations shall support the following other special variables that are set by _a_w_k:

       AARRGGCC      The number of elements in the AARRGGVV array.

       AARRGGVV      An  array  of  command  line arguments, excluding options and the _p_r_o_g_r_a_m argument, numbered from
                 zero to AARRGGCC−1.

                 The arguments in AARRGGVV can be modified or added to; AARRGGCC can be altered. As each input file  ends,
                 _a_w_k  shall treat the next non-null element of AARRGGVV, up to the current value of AARRGGCC−1, inclusive,
                 as the name of the next input file. Thus, setting an element of AARRGGVV to null means that it  shall
                 not  be  treated  as  an  input  file.  The name ''−−'' indicates the standard input. If an argument
                 matches the format of an _a_s_s_i_g_n_m_e_n_t operand, this argument shall  be  treated  as  an  _a_s_s_i_g_n_m_e_n_t
                 rather than a _f_i_l_e argument.

       CCOONNVVFFMMTT   The  pprriinnttff format for converting numbers to strings (except for output statements, where OOFFMMTT is
                 used); ""%%..66gg"" by default.

       EENNVVIIRROONN   An array representing the value of the environment, as described in the _e_x_e_c functions defined in
                 the  System Interfaces volume of POSIX.1‐2008. The indices of the array shall be strings consist‐
                 ing of the names of the environment variables, and the value of each array  element  shall  be  a
                 string  consisting  of the value of that variable. If appropriate, the environment variable shall
                 be considered a _n_u_m_e_r_i_c _s_t_r_i_n_g (see _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k); the array element shall  also  have  its
                 numeric value.

                 In  all cases where the behavior of _a_w_k is affected by environment variables (including the envi‐
                 ronment of any commands that _a_w_k executes via the ssyysstteemm function or  via  pipeline  redirections
                 with  the  pprriinntt  statement, the pprriinnttff statement, or the ggeettlliinnee function), the environment used
                 shall be the environment at the time _a_w_k began executing; it  is  implementation-defined  whether
                 any modification of EENNVVIIRROONN affects this environment.

       FFIILLEENNAAMMEE  A pathname of the current input file. Inside a BBEEGGIINN action the value is undefined. Inside an EENNDD
                 action the value shall be the name of the last input file processed.

       FFNNRR       The ordinal number of the current record in the current file. Inside a  BBEEGGIINN  action  the  value
                 shall be zero. Inside an EENNDD action the value shall be the number of the last record processed in
                 the last file processed.

       FFSS        Input field separator regular expression; a <space> by default.

       NNFF        The number of fields in the current record. Inside a BBEEGGIINN action, the use of NNFF is undefined un‐
                 less  a  ggeettlliinnee function without a _v_a_r argument is executed previously. Inside an EENNDD action, NNFF
                 shall retain the value it had for the last record read, unless a subsequent, redirected,  ggeettlliinnee
                 function without a _v_a_r argument is performed prior to entering the EENNDD action.

       NNRR        The  ordinal  number  of  the  current record from the start of input.  Inside a BBEEGGIINN action the
                 value shall be zero. Inside an EENNDD action the value shall be the number of the last  record  pro‐
                 cessed.

       OOFFMMTT      The pprriinnttff format for converting numbers to strings in output statements (see _O_u_t_p_u_t _S_t_a_t_e_m_e_n_t_s);
                 ""%%..66gg"" by default. The result of the conversion is unspecified if the value  of  OOFFMMTT  is  not  a
                 floating-point format specification.

       OOFFSS       The pprriinntt statement output field separator; <space> by default.

       OORRSS       The pprriinntt statement output record separator; a <newline> by default.

       RRLLEENNGGTTHH   The length of the string matched by the mmaattcchh function.

       RRSS        The first character of the string value of RRSS shall be the input record separator; a <newline> by
                 default. If RRSS contains more than one character, the results are unspecified. If RRSS is null, then
                 records  are separated by sequences consisting of a <newline> plus one or more blank lines, lead‐
                 ing or trailing blank lines shall not result in empty records at the beginning or end of the  in‐
                 put, and a <newline> shall always be a field separator, no matter what the value of FFSS is.

       RRSSTTAARRTT    The  starting  position of the string matched by the mmaattcchh function, numbering from 1. This shall
                 always be equivalent to the return value of the mmaattcchh function.

       SSUUBBSSEEPP    The subscript separator string for multi-dimensional arrays; the default value is implementation-
                 defined.

   RReegguullaarr EExxpprreessssiioonnss
       The _a_w_k utility shall make use of the extended regular expression notation (see the Base Definitions volume
       of POSIX.1‐2008, _S_e_c_t_i_o_n _9_._4, _E_x_t_e_n_d_e_d _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s) except that it shall allow the  use  of  C-lan‐
       guage  conventions  for  escaping special characters within the EREs, as specified in the table in the Base
       Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n (''\\\\'', ''\\aa'', ''\\bb'',  ''\\ff'',  ''\\nn'',  ''\\rr'',
       ''\\tt'',  ''\\vv'')  and  the  following table; these escape sequences shall be recognized both inside and outside
       bracket expressions. Note that records need not be separated by <newline> characters and  string  constants
       can contain <newline> characters, so even the ""\\nn"" sequence is valid in _a_w_k EREs. Using a <slash> character
       within an ERE requires the escaping shown in the following table.

                                           TTaabbllee 44--22:: EEssccaappee SSeeqquueenncceess iinn _a_w_k

                  ┌─────────┬────────────────────────────────────┬────────────────────────────────────┐
                  │ EEssccaappee  │                                    │                                    │
                  │SSeeqquueennccee │            DDeessccrriippttiioonn             │              MMeeaanniinngg               │
                  ├─────────┼────────────────────────────────────┼────────────────────────────────────┤
                  │\"       │ <backslash> <quotation-mark>       │ <quotation-mark> character         │
                  ├─────────┼────────────────────────────────────┼────────────────────────────────────┤
                  │\/       │ <backslash> <slash>                │ <slash> character                  │
                  ├─────────┼────────────────────────────────────┼────────────────────────────────────┤
                  │\ddd     │ A <backslash> character followed   │ The character whose encoding is    │
                  │         │ by the longest sequence of one,    │ represented by the one, two, or    │
                  │         │ two, or three octal-digit charac‐  │ three-digit octal integer. Multi-  │
                  │         │ ters (01234567). If all of the     │ byte characters require multiple,  │
                  │         │ digits are 0 (that is, representa‐ │ concatenated escape sequences of   │
                  │         │ tion of the NUL character), the    │ this type, including the leading   │
                  │         │ behavior is undefined.             │ <backslash> for each byte.         │
                  ├─────────┼────────────────────────────────────┼────────────────────────────────────┤
                  │\c       │ A <backslash> character followed   │ Undefined                          │
                  │         │ by any character not described in  │                                    │
                  │         │ this table or in the table in the  │                                    │
                  │         │ Base Definitions volume of         │                                    │
                  │         │ POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_‐ │                                    │
                  │         │ _m_a_t _N_o_t_a_t_i_o_n (''\\\\'', ''\\aa'', ''\\bb'',    │                                    │
                  │         │ ''\\ff'', ''\\nn'', ''\\rr'', ''\\tt'', ''\\vv'').     │                                    │
                  └─────────┴────────────────────────────────────┴────────────────────────────────────┘
       A regular expression can be matched against a specific field or string by using one of the two regular  ex‐
       pression  matching  operators, ''~~'' and ""!!~~"".  These operators shall interpret their right-hand operand as a
       regular expression and their left-hand operand as a string. If the regular expression matches  the  string,
       the  ''~~'' expression shall evaluate to a value of 1, and the ""!!~~"" expression shall evaluate to a value of 0.
       (The regular expression matching operation is as defined by the term matched in the Base Definitions volume
       of  POSIX.1‐2008,  _S_e_c_t_i_o_n  _9_._1,  _R_e_g_u_l_a_r  _E_x_p_r_e_s_s_i_o_n  _D_e_f_i_n_i_t_i_o_n_s, where a match occurs on any part of the
       string unless the regular expression is limited with the <circumflex> or <dollar-sign> special characters.)
       If the regular expression does not match the string, the ''~~'' expression shall evaluate to a value of 0, and
       the ""!!~~"" expression shall evaluate to a value of 1. If the right-hand operand is any expression other  than
       the  lexical  token EERREE, the string value of the expression shall be interpreted as an extended regular ex‐
       pression, including the escape conventions described above.  Note that these same escape conventions  shall
       also  be applied in determining the value of a string literal (the lexical token SSTTRRIINNGG), and thus shall be
       applied a second time when a string literal is used in this context.

       When an EERREE token appears as an expression in any context other than as the right-hand of the ''~~''  or  ""!!~~""
       operator  or  as one of the built-in function arguments described below, the value of the resulting expres‐
       sion shall be the equivalent of:

           $$00  "" ""  //_e_r_e/

       The _e_r_e argument to the ggssuubb, mmaattcchh, ssuubb functions, and the _f_s argument to the sspplliitt function  (see  _S_t_r_i_n_g
       _F_u_n_c_t_i_o_n_s)  shall  be  interpreted as extended regular expressions. These can be either EERREE tokens or arbi‐
       trary expressions, and shall be interpreted in the same manner as the right-hand side of the  ''~~''  or  ""!!~~""
       operator.

       An  extended regular expression can be used to separate fields by assigning a string containing the expres‐
       sion to the built-in variable FFSS, either directly or as a consequence of using  the  −−FF  _s_e_p_s_t_r_i_n_g  option.
       The default value of the FFSS variable shall be a single <space>.  The following describes FFSS behavior:

        1. If FFSS is a null string, the behavior is unspecified.

        2. If FFSS is a single character:

            a. If  FFSS  is <space>, skip leading and trailing <blank> and <newline> characters; fields shall be de‐
               limited by sets of one or more <blank> or <newline> characters.

            b. Otherwise, if FFSS is any other character _c, fields shall be delimited by each single  occurrence  of
               _c.

        3. Otherwise, the string value of FFSS shall be considered to be an extended regular expression. Each occur‐
           rence of a sequence matching the extended regular expression shall delimit fields.

       Except for the ''~~'' and ""!!~~"" operators, and in the ggssuubb, mmaattcchh,  sspplliitt,  and  ssuubb  built-in  functions,  ERE
       matching  shall be based on input records; that is, record separator characters (the first character of the
       value of the variable RRSS, <newline> by default) cannot be embedded in the  expression,  and  no  expression
       shall  match the record separator character. If the record separator is not <newline>, <newline> characters
       embedded in the expression can be matched. For the ''~~'' and ""!!~~"" operators, and in those four built-in func‐
       tions,  ERE  matching  shall  be based on text strings; that is, any character (including <newline> and the
       record separator) can be embedded in the pattern, and an appropriate pattern  shall  match  any  character.
       However,  in  all  _a_w_k ERE matching, the use of one or more NUL characters in the pattern, input record, or
       text string produces undefined results.

   PPaatttteerrnnss
       A _p_a_t_t_e_r_n is any valid _e_x_p_r_e_s_s_i_o_n, a range specified by two expressions separated by a comma, or one of the
       two special patterns BBEEGGIINN or EENNDD.

   SSppeecciiaall PPaatttteerrnnss
       The  _a_w_k  utility shall recognize two special patterns, BBEEGGIINN and EENNDD.  Each BBEEGGIINN pattern shall be matched
       once and its associated action executed before the first record of input is read—except possibly by use  of
       the  ggeettlliinnee  function  (see _I_n_p_u_t_/_O_u_t_p_u_t _a_n_d _G_e_n_e_r_a_l _F_u_n_c_t_i_o_n_s) in a prior BBEEGGIINN action—and before command
       line assignment is done. Each EENNDD pattern shall be matched once and its associated  action  executed  after
       the last record of input has been read. These two patterns shall have associated actions.

       BBEEGGIINN  and EENNDD shall not combine with other patterns. Multiple BBEEGGIINN and EENNDD patterns shall be allowed. The
       actions associated with the BBEEGGIINN patterns shall be executed in the order specified in the program, as  are
       the EENNDD actions. An EENNDD pattern can precede a BBEEGGIINN pattern in a program.

       If an _a_w_k program consists of only actions with the pattern BBEEGGIINN, and the BBEEGGIINN action contains no ggeettlliinnee
       function, _a_w_k shall exit without reading its input when the last statement in the last BBEEGGIINN action is exe‐
       cuted.  If  an  _a_w_k program consists of only actions with the pattern EENNDD or only actions with the patterns
       BBEEGGIINN and EENNDD, the input shall be read before the statements in the EENNDD actions are executed.

   EExxpprreessssiioonn PPaatttteerrnnss
       An expression pattern shall be evaluated as if it were an expression in a Boolean context. If the result is
       true,  the  pattern  shall be considered to match, and the associated action (if any) shall be executed. If
       the result is false, the action shall not be executed.

   PPaatttteerrnn RRaannggeess
       A pattern range consists of two expressions separated by a comma; in this case, the action  shall  be  per‐
       formed  for  all  records between a match of the first expression and the following match of the second ex‐
       pression, inclusive. At this point, the pattern range can be repeated starting at input records  subsequent
       to the end of the matched range.

   AAccttiioonnss
       An  action is a sequence of statements as shown in the grammar in _G_r_a_m_m_a_r.  Any single statement can be re‐
       placed by a statement list enclosed in curly braces. The application shall  ensure  that  statements  in  a
       statement  list  are separated by <newline> or <semicolon> characters. Statements in a statement list shall
       be executed sequentially in the order that they appear.

       The _e_x_p_r_e_s_s_i_o_n acting as the conditional in an iiff statement shall be evaluated and if  it  is  non-zero  or
       non-null, the following statement shall be executed; otherwise, if eellssee is present, the statement following
       the eellssee shall be executed.

       The iiff, wwhhiillee, ddoo...wwhhiillee, ffoorr, bbrreeaakk, and ccoonnttiinnuuee statements are based on the ISO C standard (see _S_e_c_t_i_o_n
       _1_._1_._2,  _C_o_n_c_e_p_t_s  _D_e_r_i_v_e_d _f_r_o_m _t_h_e _I_S_O _C _S_t_a_n_d_a_r_d), except that the Boolean expressions shall be treated as
       described in _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k, and except in the case of:

           ffoorr ((_v_a_r_i_a_b_l_e in _a_r_r_a_y)

       which shall iterate, assigning each _i_n_d_e_x of _a_r_r_a_y to _v_a_r_i_a_b_l_e in an  unspecified  order.  The  results  of
       adding  new elements to _a_r_r_a_y within such a ffoorr loop are undefined. If a bbrreeaakk or ccoonnttiinnuuee statement occurs
       outside of a loop, the behavior is undefined.

       The ddeelleettee statement shall remove an individual array element. Thus, the following code deletes  an  entire
       array:

           ffoorr ((iinnddeexx iinn aarrrraayy))
               ddeelleettee aarrrraayy[[iinnddeexx]]

       The  nneexxtt statement shall cause all further processing of the current input record to be abandoned. The be‐
       havior is undefined if a nneexxtt statement appears or is invoked in a BBEEGGIINN or EENNDD action.

       The eexxiitt statement shall invoke all EENNDD actions in the order in which they occur in the program source  and
       then terminate the program without reading further input. An eexxiitt statement inside an EENNDD action shall ter‐
       minate the program without further execution of EENNDD actions. If an  expression  is  specified  in  an  eexxiitt
       statement, its numeric value shall be the exit status of _a_w_k, unless subsequent errors are encountered or a
       subsequent eexxiitt statement with an expression is executed.

   OOuuttppuutt SSttaatteemmeennttss
       Both pprriinntt and pprriinnttff statements shall write to standard output by default. The output shall be written  to
       the location specified by _o_u_t_p_u_t___r_e_d_i_r_e_c_t_i_o_n if one is supplied, as follows:

           >> _e_x_p_r_e_s_s_i_o_n
           >> _e_x_p_r_e_s_s_i_o_n
           | _e_x_p_r_e_s_s_i_o_n

       In  all  cases, the _e_x_p_r_e_s_s_i_o_n shall be evaluated to produce a string that is used as a pathname into which
       to write (for ''>>'' or "">>>>"") or as a command to be executed (for ''||'').  Using the first  two  forms,  if  the
       file  of  that name is not currently open, it shall be opened, creating it if necessary and using the first
       form, truncating the file. The output then shall be appended to the file. As long as the file remains open,
       subsequent  calls  in which _e_x_p_r_e_s_s_i_o_n evaluates to the same string value shall simply append output to the
       file. The file remains open until the cclloossee function (see _I_n_p_u_t_/_O_u_t_p_u_t _a_n_d  _G_e_n_e_r_a_l  _F_u_n_c_t_i_o_n_s)  is  called
       with an expression that evaluates to the same string value.

       The  third  form shall write output onto a stream piped to the input of a command. The stream shall be cre‐
       ated if no stream is currently open with the value of _e_x_p_r_e_s_s_i_o_n as its command name.  The  stream  created
       shall  be equivalent to one created by a call to the _p_o_p_e_n() function defined in the System Interfaces vol‐
       ume of POSIX.1‐2008 with the value of _e_x_p_r_e_s_s_i_o_n as the _c_o_m_m_a_n_d argument and a value of _w as the _m_o_d_e argu‐
       ment. As long as the stream remains open, subsequent calls in which _e_x_p_r_e_s_s_i_o_n evaluates to the same string
       value shall write output to the existing stream. The stream shall remain open until the cclloossee function (see
       _I_n_p_u_t_/_O_u_t_p_u_t  _a_n_d  _G_e_n_e_r_a_l _F_u_n_c_t_i_o_n_s) is called with an expression that evaluates to the same string value.
       At that time, the stream shall be closed as if by a call to the _p_c_l_o_s_e() function defined in the System In‐
       terfaces volume of POSIX.1‐2008.

       As  described  in  detail by the grammar in _G_r_a_m_m_a_r, these output statements shall take a <comma>-separated
       list of _e_x_p_r_e_s_s_i_o_ns referred to in the grammar by the non-terminal symbols eexxpprr__lliisstt,  pprriinntt__eexxpprr__lliisstt,  or
       pprriinntt__eexxpprr__lliisstt__oopptt.   This list is referred to here as the _e_x_p_r_e_s_s_i_o_n _l_i_s_t, and each member is referred to
       as an _e_x_p_r_e_s_s_i_o_n _a_r_g_u_m_e_n_t.

       The pprriinntt statement shall write the value of each expression argument onto the indicated output stream sep‐
       arated  by the current output field separator (see variable OOFFSS above), and terminated by the output record
       separator (see variable OORRSS above). All expression arguments shall be taken as strings, being converted  if
       necessary;  this conversion shall be as described in _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k, with the exception that the pprriinnttff
       format in OOFFMMTT shall be used instead of the value in CCOONNVVFFMMTT.  An empty expression list shall stand for the
       whole input record ($0).

       The  pprriinnttff  statement shall produce output based on a notation similar to the File Format Notation used to
       describe file formats in this volume of POSIX.1‐2008 (see the  Base  Definitions  volume  of  POSIX.1‐2008,
       _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n).  Output shall be produced as specified with the first _e_x_p_r_e_s_s_i_o_n argument
       as the string _f_o_r_m_a_t and subsequent _e_x_p_r_e_s_s_i_o_n arguments as the strings _a_r_g_1 to _a_r_g_n, inclusive,  with  the
       following exceptions:

        1. The  _f_o_r_m_a_t  shall  be an actual character string rather than a graphical representation. Therefore, it
           cannot contain empty character positions. The <space> in the _f_o_r_m_a_t string, in any context other than a
           _f_l_a_g  of  a  conversion  specification, shall be treated as an ordinary character that is copied to the
           output.

        2. If the character set contains a ''' character and that character appears in the _f_o_r_m_a_t string, it  shall
           be treated as an ordinary character that is copied to the output.

        3. The  _e_s_c_a_p_e  _s_e_q_u_e_n_c_e_s beginning with a <backslash> character shall be treated as sequences of ordinary
           characters that are copied to the output. Note that these same sequences shall be interpreted lexically
           by  _a_w_k  when  they  appear  in  literal strings, but they shall not be treated specially by the pprriinnttff
           statement.

        4. A _f_i_e_l_d _w_i_d_t_h or _p_r_e_c_i_s_i_o_n can be specified as the ''**'' character instead of a  digit  string.  In  this
           case  the  next  argument  from the expression list shall be fetched and its numeric value taken as the
           field width or precision.

        5. The implementation shall not precede or follow output from the dd or uu conversion  specifier  characters
           with <blank> characters not specified by the _f_o_r_m_a_t string.

        6. The  implementation shall not precede output from the oo conversion specifier character with leading ze‐
           ros not specified by the _f_o_r_m_a_t string.

        7. For the cc conversion specifier character: if the argument has a numeric value, the character whose  en‐
           coding  is  that value shall be output. If the value is zero or is not the encoding of any character in
           the character set, the behavior is undefined. If the argument does not have a numeric value, the  first
           character  of  the string value shall be output; if the string does not contain any characters, the be‐
           havior is undefined.

        8. For each conversion specification that consumes an argument, the  next  expression  argument  shall  be
           evaluated.  With  the  exception  of the cc conversion specifier character, the value shall be converted
           (according to the rules specified in _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k) to the appropriate  type  for  the  conversion
           specification.

        9. If there are insufficient expression arguments to satisfy all the conversion specifications in the _f_o_r_‐
           _m_a_t string, the behavior is undefined.

       10. If any character sequence in the _f_o_r_m_a_t string begins with a ''%%'' character, but does not form  a  valid
           conversion specification, the behavior is unspecified.

       Both pprriinntt and pprriinnttff can output at least {LINE_MAX} bytes.

   FFuunnccttiioonnss
       The _a_w_k language has a variety of built-in functions: arithmetic, string, input/output, and general.

   AArriitthhmmeettiicc FFuunnccttiioonnss
       The arithmetic functions, except for iinntt, shall be based on the ISO C standard (see _S_e_c_t_i_o_n _1_._1_._2, _C_o_n_c_e_p_t_s
       _D_e_r_i_v_e_d _f_r_o_m _t_h_e _I_S_O _C _S_t_a_n_d_a_r_d).  The behavior is undefined in cases where the  ISO C  standard  specifies
       that  an  error  be  returned or that the behavior is undefined. Although the grammar (see _G_r_a_m_m_a_r) permits
       built-in functions to appear with no arguments or parentheses, unless the argument or parentheses are indi‐
       cated  as  optional  in the following list (by displaying them within the ""[[]]"" brackets), such use is unde‐
       fined.

       aattaann22(_y,_x)
                 Return arctangent of _y/_x in radians in the range [−π,π].

       ccooss(_x)    Return cosine of _x, where _x is in radians.

       ssiinn(_x)    Return sine of _x, where _x is in radians.

       eexxpp(_x)    Return the exponential function of _x.

       lloogg(_x)    Return the natural logarithm of _x.

       ssqqrrtt(_x)   Return the square root of _x.

       iinntt(_x)    Return the argument truncated to an integer. Truncation shall be toward 0 when _x>0.

       rraanndd()    Return a random number _n, such that 0≤_n<1.

       ssrraanndd([[_e_x_p_r]])
                 Set the seed value for _r_a_n_d to _e_x_p_r or use the time of day if _e_x_p_r is omitted. The previous  seed
                 value shall be returned.

   SSttrriinngg FFuunnccttiioonnss
       The  string functions in the following list shall be supported.  Although the grammar (see _G_r_a_m_m_a_r) permits
       built-in functions to appear with no arguments or parentheses, unless the argument or parentheses are indi‐
       cated  as  optional  in the following list (by displaying them within the ""[[]]"" brackets), such use is unde‐
       fined.

       ggssuubb(_e_r_e, _r_e_p_l[[, _i_n]])
                 Behave like ssuubb (see below), except that it shall replace all occurrences of the regular  expres‐
                 sion (like the _e_d utility global substitute) in $0 or in the _i_n argument, when specified.

       iinnddeexx(_s, _t)
                 Return the position, in characters, numbering from 1, in string _s where string _t first occurs, or
                 zero if it does not occur at all.

       lleennggtthh[[([[_s]])]]
                 Return the length, in characters, of its argument taken as a string, or of the whole record,  $0,
                 if there is no argument.

       mmaattcchh(_s, _e_r_e)
                 Return  the position, in characters, numbering from 1, in string _s where the extended regular ex‐
                 pression _e_r_e occurs, or zero if it does not occur at all. RSTART shall be set to the starting po‐
                 sition (which is the same as the returned value), zero if no match is found; RLENGTH shall be set
                 to the length of the matched string, −1 if no match is found.

       sspplliitt(_s, _a[[, _f_s ]])
                 Split the string _s into array elements _a[1], _a[2], ..., _a[_n], and return _n.  All elements of  the
                 array  shall  be deleted before the split is performed. The separation shall be done with the ERE
                 _f_s or with the field separator FFSS if _f_s is not given. Each array  element  shall  have  a  string
                 value  when  created  and, if appropriate, the array element shall be considered a numeric string
                 (see _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k).  The effect of a null string as the value of _f_s is unspecified.

       sspprriinnttff(_f_m_t, _e_x_p_r, _e_x_p_r, ...)
                 Format the expressions according to the pprriinnttff format given  by  _f_m_t  and  return  the  resulting
                 string.

       ssuubb((_e_r_e, _r_e_p_l[[, _i_n ]])
                 Substitute  the string _r_e_p_l in place of the first instance of the extended regular expression _E_R_E
                 in string _i_n and return the number of substitutions. An <ampersand> (''&&'') appearing in the string
                 _r_e_p_l shall be replaced by the string from _i_n that matches the ERE. An <ampersand> preceded with a
                 <backslash> shall be interpreted as the literal <ampersand> character. An occurrence of two  con‐
                 secutive <backslash> characters shall be interpreted as just a single literal <backslash> charac‐
                 ter. Any other occurrence of a <backslash> (for example, preceding any other character) shall  be
                 treated  as  a  literal <backslash> character. Note that if _r_e_p_l is a string literal (the lexical
                 token SSTTRRIINNGG; see _G_r_a_m_m_a_r), the handling of the <ampersand> character occurs  after  any  lexical
                 processing,  including any lexical <backslash>-escape sequence processing. If _i_n is specified and
                 it is not an lvalue (see _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k), the behavior is undefined. If _i_n  is  omitted,  _a_w_k
                 shall use the current record ($0) in its place.

       ssuubbssttrr(_s, _m[[, _n ]])
                 Return  the  at most _n-character substring of _s that begins at position _m, numbering from 1. If _n
                 is omitted, or if _n specifies more characters than are left in the string, the length of the sub‐
                 string shall be limited by the length of the string _s.

       ttoolloowweerr(_s)
                 Return a string based on the string _s.  Each character in _s that is an uppercase letter specified
                 to have a ttoolloowweerr mapping by the _L_C___C_T_Y_P_E category of the current locale shall be replaced in the
                 returned  string by the lowercase letter specified by the mapping. Other characters in _s shall be
                 unchanged in the returned string.

       ttoouuppppeerr(_s)
                 Return a string based on the string _s.  Each character in _s that is a lowercase letter  specified
                 to  have  a ttoouuppppeerr mapping by the _L_C___C_T_Y_P_E category of the current locale is replaced in the re‐
                 turned string by the uppercase letter specified by the mapping. Other characters  in  _s  are  un‐
                 changed in the returned string.

       All  of the preceding functions that take _E_R_E as a parameter expect a pattern or a string valued expression
       that is a regular expression as defined in _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s.

   IInnppuutt//OOuuttppuutt aanndd GGeenneerraall FFuunnccttiioonnss
       The input/output and general functions are:

       cclloossee(_e_x_p_r_e_s_s_i_o_n)
                 Close the file or pipe opened by a pprriinntt or pprriinnttff statement or a call to ggeettlliinnee with  the  same
                 string-valued  _e_x_p_r_e_s_s_i_o_n.   The  limit on the number of open _e_x_p_r_e_s_s_i_o_n arguments is implementa‐
                 tion-defined. If the close was successful, the function shall return zero;  otherwise,  it  shall
                 return non-zero.

       _e_x_p_r_e_s_s_i_o_n _| ggeettlliinnee [[_v_a_r]]
                 Read a record of input from a stream piped from the output of a command. The stream shall be cre‐
                 ated if no stream is currently open with the value of _e_x_p_r_e_s_s_i_o_n as its command name. The  stream
                 created  shall  be  equivalent to one created by a call to the _p_o_p_e_n() function with the value of
                 _e_x_p_r_e_s_s_i_o_n as the _c_o_m_m_a_n_d argument and a value of _r as the _m_o_d_e argument. As long as  the  stream
                 remains  open, subsequent calls in which _e_x_p_r_e_s_s_i_o_n evaluates to the same string value shall read
                 subsequent records from the stream. The stream shall remain open  until  the  cclloossee  function  is
                 called with an expression that evaluates to the same string value. At that time, the stream shall
                 be closed as if by a call to the _p_c_l_o_s_e() function. If _v_a_r is omitted, $0 and NNFF  shall  be  set;
                 otherwise, _v_a_r shall be set and, if appropriate, it shall be considered a numeric string (see _E_x_‐
                 _p_r_e_s_s_i_o_n_s _i_n _a_w_k).

                 The ggeettlliinnee operator can form ambiguous constructs when there are unparenthesized operators  (in‐
                 cluding  concatenate)  to the left of the ''||'' (to the beginning of the expression containing ggeett‐‐
                 lliinnee).  In the context of the ''$$'' operator, ''||'' shall behave as if it had a lower precedence than
                 ''$$''.   The result of evaluating other operators is unspecified, and conforming applications shall
                 parenthesize properly all such usages.

       ggeettlliinnee   Set $0 to the next input record from the current input file. This form of ggeettlliinnee shall  set  the
                 NNFF, NNRR, and FFNNRR variables.

       ggeettlliinnee _v_a_r
                 Set  variable  _v_a_r  to the next input record from the current input file and, if appropriate, _v_a_r
                 shall be considered a numeric string (see _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k).  This form of  ggeettlliinnee  shall  set
                 the FFNNRR and NNRR variables.

       ggeettlliinnee [[_v_a_r]] < _e_x_p_r_e_s_s_i_o_n
                 Read  the  next record of input from a named file. The _e_x_p_r_e_s_s_i_o_n shall be evaluated to produce a
                 string that is used as a pathname.  If the file of that name is not currently open, it  shall  be
                 opened. As long as the stream remains open, subsequent calls in which _e_x_p_r_e_s_s_i_o_n evaluates to the
                 same string value shall read subsequent records from the file. The file shall remain  open  until
                 the  cclloossee  function is called with an expression that evaluates to the same string value. If _v_a_r
                 is omitted, $0 and NNFF shall be set; otherwise, _v_a_r shall be set and, if appropriate, it shall  be
                 considered a numeric string (see _E_x_p_r_e_s_s_i_o_n_s _i_n _a_w_k).

                 The  ggeettlliinnee  operator can form ambiguous constructs when there are unparenthesized binary opera‐
                 tors (including concatenate) to the right of the ''<<'' (up to the end of the expression  containing
                 the  ggeettlliinnee).  The result of evaluating such a construct is unspecified, and conforming applica‐
                 tions shall parenthesize properly all such usages.

       ssyysstteemm(_e_x_p_r_e_s_s_i_o_n)
                 Execute the command given by _e_x_p_r_e_s_s_i_o_n in a manner equivalent to the _s_y_s_t_e_m()  function  defined
                 in the System Interfaces volume of POSIX.1‐2008 and return the exit status of the command.

       All forms of ggeettlliinnee shall return 1 for successful input, zero for end-of-file, and −1 for an error.

       Where strings are used as the name of a file or pipeline, the application shall ensure that the strings are
       textually identical. The terminology ``same string value'' implies that ``equivalent strings'', even  those
       that differ only by <space> characters, represent different files.

   UUsseerr--DDeeffiinneedd FFuunnccttiioonnss
       The _a_w_k language also provides user-defined functions. Such functions can be defined as:

           ffuunnccttiioonn _n_a_m_e([[_p_a_r_a_m_e_t_e_r, ...]]) { _s_t_a_t_e_m_e_n_t_s }

       A  function  can  be referred to anywhere in an _a_w_k program; in particular, its use can precede its defini‐
       tion. The scope of a function is global.

       Function parameters, if present, can be either scalars or arrays; the behavior is  undefined  if  an  array
       name  is passed as a parameter that the function uses as a scalar, or if a scalar expression is passed as a
       parameter that the function uses as an array. Function parameters shall be passed by value if scalar and by
       reference if array name.

       The number of parameters in the function definition need not match the number of parameters in the function
       call. Excess formal parameters can be used as local variables. If fewer arguments are supplied in  a  func‐
       tion  call  than are in the function definition, the extra parameters that are used in the function body as
       scalars shall evaluate to the uninitialized value until they are otherwise initialized, and the  extra  pa‐
       rameters  that  are used in the function body as arrays shall be treated as uninitialized arrays where each
       element evaluates to the uninitialized value until otherwise initialized.

       When invoking a function, no white space can be placed between the function name and the opening  parenthe‐
       sis.  Function  calls  can  be  nested and recursive calls can be made upon functions. Upon return from any
       nested or recursive function call, the values of all of the calling  function's  parameters  shall  be  un‐
       changed,  except  for  array  parameters  passed by reference. The rreettuurrnn statement can be used to return a
       value. If a rreettuurrnn statement appears outside of a function definition, the behavior is undefined.

       In the function definition, <newline> characters shall be optional before the opening brace and  after  the
       closing  brace.  Function definitions can appear anywhere in the program where a _p_a_t_t_e_r_n_-_a_c_t_i_o_n pair is al‐
       lowed.

   GGrraammmmaarr
       The grammar in this section and the lexical conventions in the following section  shall  together  describe
       the  syntax  for  _a_w_k  programs. The general conventions for this style of grammar are described in _S_e_c_t_i_o_n
       _1_._3, _G_r_a_m_m_a_r _C_o_n_v_e_n_t_i_o_n_s.  A valid program can be represented as the non-terminal  symbol  _p_r_o_g_r_a_m  in  the
       grammar. This formal syntax shall take precedence over the preceding text syntax description.

           %%ttookkeenn NNAAMMEE NNUUMMBBEERR SSTTRRIINNGG EERREE
           %%ttookkeenn FFUUNNCC__NNAAMMEE   //** NNaammee ffoolllloowweedd bbyy ''(('' wwiitthhoouutt wwhhiittee ssppaaccee.. **//

           /* Keywords */
           %token       Begin   End
           /*          'BEGIN' 'END'                            */

           %token       Break   Continue   Delete   Do   Else
           /*          'break' 'continue' 'delete' 'do' 'else'  */

           %token       Exit   For   Function   If   In
           /*          'exit' 'for' 'function' 'if' 'in'        */

           %token       Next   Print   Printf   Return   While
           /*          'next' 'print' 'printf' 'return' 'while' */

           /* Reserved function names */
           %token BUILTIN_FUNC_NAME
                       /* One token for the following:
                        * atan2 cos sin exp log sqrt int rand srand
                        * gsub index length match split sprintf sub
                        * substr tolower toupper close system
                        */
           %token GETLINE
                       /* Syntactically different from other built-ins. */

           /* Two-character tokens. */
           %token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN POW_ASSIGN
           /*     '+='       '−='       '*='       '/='       '%='       '^=' */

           %token OR   AND  NO_MATCH   EQ   LE   GE   NE   INCR  DECR  APPEND
           /*     '||' '&&' '!~' '==' '<=' '>=' '!=' '++'  '−−'  '>>'   */

           /* One-character tokens. */
           %token '{' '}' '(' ')' '[' ']' ',' ';' NEWLINE
           %token '+' '−' '*' '%' '^' '!' '>' '<' '|' '?' ':' ' " " ' '$' '='

           %start program
           %%

           program          : item_list
                            | actionless_item_list
                            ;

           item_list        : newline_opt
                            | actionless_item_list item terminator
                            | item_list            item terminator
                            | item_list          action terminator
                            ;

           actionless_item_list : item_list            pattern terminator
                            | actionless_item_list pattern terminator
                            ;

           item             : pattern action
                            | Function NAME      '(' param_list_opt ')'
                                  newline_opt action
                            | Function FUNC_NAME '(' param_list_opt ')'
                                  newline_opt action
                            ;

           param_list_opt   : /* empty */
                            | param_list
                            ;

           param_list       : NAME
                            | param_list ',' NAME
                            ;

           pattern          : Begin
                            | End
                            | expr
                            | expr ',' newline_opt expr
                            ;

           action           : '{' newline_opt                             '}'
                            | '{' newline_opt terminated_statement_list   '}'
                            | '{' newline_opt unterminated_statement_list '}'
                            ;

           terminator       : terminator ';'
                            | terminator NEWLINE
                            |            ';'
                            |            NEWLINE
                            ;

           terminated_statement_list : terminated_statement
                            | terminated_statement_list terminated_statement
                            ;

           unterminated_statement_list : unterminated_statement
                            | terminated_statement_list unterminated_statement
                            ;

           terminated_statement : action newline_opt
                            | If '(' expr ')' newline_opt terminated_statement
                            | If '(' expr ')' newline_opt terminated_statement
                                  Else newline_opt terminated_statement
                            | While '(' expr ')' newline_opt terminated_statement
                            | For '(' simple_statement_opt ';'
                                 expr_opt ';' simple_statement_opt ')' newline_opt
                                 terminated_statement
                            | For '(' NAME In NAME ')' newline_opt
                                 terminated_statement
                            | ';' newline_opt
                            | terminatable_statement NEWLINE newline_opt
                            | terminatable_statement ';'     newline_opt
                            ;

           unterminated_statement : terminatable_statement
                            | If '(' expr ')' newline_opt unterminated_statement
                            | If '(' expr ')' newline_opt terminated_statement
                                 Else newline_opt unterminated_statement
                            | While '(' expr ')' newline_opt unterminated_statement
                            | For '(' simple_statement_opt ';'
                             expr_opt ';' simple_statement_opt ')' newline_opt
                                 unterminated_statement
                            | For '(' NAME In NAME ')' newline_opt
                                 unterminated_statement
                            ;

           terminatable_statement : simple_statement
                            | Break
                            | Continue
                            | Next
                            | Exit expr_opt
                            | Return expr_opt
                            | Do newline_opt terminated_statement While '(' expr ')'
                            ;

           simple_statement_opt : /* empty */
                            | simple_statement
                            ;

           simple_statement : Delete NAME '[' expr_list ']'
                            | expr
                            | print_statement
                            ;

           print_statement  : simple_print_statement
                            | simple_print_statement output_redirection
                            ;

           simple_print_statement : Print  print_expr_list_opt
                            | Print  '(' multiple_expr_list ')'
                            | Printf print_expr_list
                            | Printf '(' multiple_expr_list ')'
                            ;

           output_redirection : '>'    expr
                            | APPEND expr
                            | '|'    expr
                            ;

           expr_list_opt    : /* empty */
                            | expr_list
                            ;

           expr_list        : expr
                            | multiple_expr_list
                            ;

           multiple_expr_list : expr ',' newline_opt expr
                            | multiple_expr_list ',' newline_opt expr
                            ;

           expr_opt         : /* empty */
                            | expr
                            ;

           expr             : unary_expr
                            | non_unary_expr
                            ;

           unary_expr       : '+' expr
                            | '−' expr
                            | unary_expr '^'      expr
                            | unary_expr '*'      expr
                            | unary_expr '/'      expr
                            | unary_expr '%'      expr
                            | unary_expr '+'      expr
                            | unary_expr '−'      expr
                            | unary_expr          non_unary_expr
                            | unary_expr '<'      expr
                            | unary_expr LE       expr
                            | unary_expr NE       expr
                            | unary_expr EQ       expr
                            | unary_expr '>'      expr
                            | unary_expr GE       expr
                            | unary_expr '~'      expr
                            | unary_expr NO_MATCH expr
                            | unary_expr In NAME
                            | unary_expr AND newline_opt expr
                            | unary_expr OR  newline_opt expr
                            | unary_expr '?' expr ':' expr
                            | unary_input_function
                            ;

           non_unary_expr   : '(' expr ')'
                            | '!' expr
                            | non_unary_expr '^'      expr
                            | non_unary_expr '*'      expr
                            | non_unary_expr '/'      expr
                            | non_unary_expr '%'      expr
                            | non_unary_expr '+'      expr
                            | non_unary_expr '−'      expr
                            | non_unary_expr          non_unary_expr
                            | non_unary_expr '<'      expr
                            | non_unary_expr LE       expr
                            | non_unary_expr NE       expr
                            | non_unary_expr EQ       expr
                            | non_unary_expr '>'      expr
                            | non_unary_expr GE       expr
                            | non_unary_expr '~'      expr
                            | non_unary_expr NO_MATCH expr
                            | non_unary_expr In NAME
                            | '(' multiple_expr_list ')' In NAME
                            | non_unary_expr AND newline_opt expr
                            | non_unary_expr OR  newline_opt expr
                            | non_unary_expr '?' expr ':' expr
                            | NUMBER
                            | STRING
                            | lvalue
                            | ERE
                            | lvalue INCR
                            | lvalue DECR
                            | INCR lvalue
                            | DECR lvalue
                            | lvalue POW_ASSIGN expr
                            | lvalue MOD_ASSIGN expr
                            | lvalue MUL_ASSIGN expr
                            | lvalue DIV_ASSIGN expr
                            | lvalue ADD_ASSIGN expr
                            | lvalue SUB_ASSIGN expr
                            | lvalue '=' expr
                            | FUNC_NAME '(' expr_list_opt ')'
                                 /* no white space allowed before '(' */
                            | BUILTIN_FUNC_NAME '(' expr_list_opt ')'
                            | BUILTIN_FUNC_NAME
                            | non_unary_input_function
                            ;

           print_expr_list_opt : /* empty */
                            | print_expr_list
                            ;

           print_expr_list  : print_expr
                            | print_expr_list ',' newline_opt print_expr
                            ;

           print_expr       : unary_print_expr
                            | non_unary_print_expr
                            ;

           unary_print_expr : '+' print_expr
                            | '−' print_expr
                            | unary_print_expr '^'      print_expr
                            | unary_print_expr '*'      print_expr
                            | unary_print_expr '/'      print_expr
                            | unary_print_expr '%'      print_expr
                            | unary_print_expr '+'      print_expr
                            | unary_print_expr '−'      print_expr
                            | unary_print_expr          non_unary_print_expr
                            | unary_print_expr '~'      print_expr
                            | unary_print_expr NO_MATCH print_expr
                            | unary_print_expr In NAME
                            | unary_print_expr AND newline_opt print_expr
                            | unary_print_expr OR  newline_opt print_expr
                            | unary_print_expr '?' print_expr ':' print_expr
                            ;

           non_unary_print_expr : '(' expr ')'
                            | '!' print_expr
                            | non_unary_print_expr '^'      print_expr
                            | non_unary_print_expr '*'      print_expr
                            | non_unary_print_expr '/'      print_expr
                            | non_unary_print_expr '%'      print_expr
                            | non_unary_print_expr '+'      print_expr
                            | non_unary_print_expr '−'      print_expr
                            | non_unary_print_expr          non_unary_print_expr
                            | non_unary_print_expr '~'      print_expr
                            | non_unary_print_expr NO_MATCH print_expr
                            | non_unary_print_expr In NAME
                            | '(' multiple_expr_list ')' In NAME
                            | non_unary_print_expr AND newline_opt print_expr
                            | non_unary_print_expr OR  newline_opt print_expr
                            | non_unary_print_expr '?' print_expr ':' print_expr
                            | NUMBER
                            | STRING
                            | lvalue
                            | ERE
                            | lvalue INCR
                            | lvalue DECR
                            | INCR lvalue
                            | DECR lvalue
                            | lvalue POW_ASSIGN print_expr
                            | lvalue MOD_ASSIGN print_expr
                            | lvalue MUL_ASSIGN print_expr
                            | lvalue DIV_ASSIGN print_expr
                            | lvalue ADD_ASSIGN print_expr
                            | lvalue SUB_ASSIGN print_expr
                            | lvalue '=' print_expr
                            | FUNC_NAME '(' expr_list_opt ')'
                                /* no white space allowed before '(' */
                            | BUILTIN_FUNC_NAME '(' expr_list_opt ')'
                            | BUILTIN_FUNC_NAME
                            ;

           lvalue           : NAME
                            | NAME '[' expr_list ']'
                            | '$' expr
                            ;

           non_unary_input_function : simple_get
                            | simple_get '<' expr
                            | non_unary_expr '|' simple_get
                            ;

           unary_input_function : unary_expr '|' simple_get
                            ;

           simple_get       : GETLINE
                            | GETLINE lvalue
                            ;

           newline_opt      : /* empty */
                            | newline_opt NEWLINE
                            ;

       This grammar has several ambiguities that shall be resolved as follows:

        *  Operator  precedence  and  associativity  shall be as described in _T_a_b_l_e _4_-_1_, _E_x_p_r_e_s_s_i_o_n_s _i_n _D_e_c_r_e_a_s_i_n_g
           _P_r_e_c_e_d_e_n_c_e _i_n _a_w_k.

        *  In case of ambiguity, an eellssee shall be associated with the most immediately  preceding  iiff  that  would
           satisfy the grammar.

        *  In  some contexts, a <slash> (''//'') that is used to surround an ERE could also be the division operator.
           This shall be resolved in such a way that wherever the division operator could appear, a <slash> is as‐
           sumed to be the division operator. (There is no unary division operator.)

       Each  expression  in an _a_w_k program shall conform to the precedence and associativity rules, even when this
       is not needed to resolve an ambiguity. For example, because ''$$'' has higher precedence than ''++++'', the string
       ""$$xx++++−−−−""  is  not  a  valid  _a_w_k  expression,  even  though  it  is  unambiguously parsed by the grammar as
       ""$$((xx++++))−−−−"".

       One convention that might not be obvious from the formal grammar is where <newline> characters are  accept‐
       able.  There  are several obvious placements such as terminating a statement, and a <backslash> can be used
       to escape <newline> characters between any lexical tokens. In addition, <newline> characters without <back‐
       slash>  characters  can  follow  a  comma,  an open brace, logical AND operator (""&&&&""), logical OR operator
       (""||||""), the ddoo keyword, the eellssee keyword, and the closing parenthesis of an iiff, ffoorr,  or  wwhhiillee  statement.
       For example:

           {{ pprriinntt  $$11,,
                    $$22 }}

   LLeexxiiccaall CCoonnvveennttiioonnss
       The lexical conventions for _a_w_k programs, with respect to the preceding grammar, shall be as follows:

        1. Except  as  noted,  _a_w_k  shall  recognize  the longest possible token or delimiter beginning at a given
           point.

        2. A comment shall consist of any characters beginning with the <number-sign> character and terminated by,
           but  excluding  the  next occurrence of, a <newline>.  Comments shall have no effect, except to delimit
           lexical tokens.

        3. The <newline> shall be recognized as the token NNEEWWLLIINNEE.

        4. A <backslash> character immediately followed by a <newline> shall have no effect.

        5. The token SSTTRRIINNGG shall represent a string constant. A string constant shall begin  with  the  character
           ''""''.  Within a string constant, a <backslash> character shall be considered to begin an escape sequence
           as specified in the table in the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t  _N_o_t_a_‐
           _t_i_o_n (''\\\\'', ''\\aa'', ''\\bb'', ''\\ff'', ''\\nn'', ''\\rr'', ''\\tt'', ''\\vv'').  In addition, the escape sequences in _T_a_b_l_e _4_-_2_,
           _E_s_c_a_p_e _S_e_q_u_e_n_c_e_s _i_n _a_w_k shall be recognized. A <newline> shall not occur within a  string  constant.  A
           string  constant  shall  be terminated by the first unescaped occurrence of the character ''""'' after the
           one that begins the string constant. The value of the string shall be the  sequence  of  all  unescaped
           characters  and  values  of escape sequences between, but not including, the two delimiting ''""'' charac‐
           ters.

        6. The token EERREE represents an extended regular expression constant. An ERE constant shall begin with  the
           <slash>  character. Within an ERE constant, a <backslash> character shall be considered to begin an es‐
           cape sequence as specified in the table in the Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e
           _F_o_r_m_a_t _N_o_t_a_t_i_o_n.  In addition, the escape sequences in _T_a_b_l_e _4_-_2_, _E_s_c_a_p_e _S_e_q_u_e_n_c_e_s _i_n _a_w_k shall be rec‐
           ognized. The application shall ensure that a <newline> does not occur within an ERE  constant.  An  ERE
           constant  shall  be terminated by the first unescaped occurrence of the <slash> character after the one
           that begins the ERE constant. The extended regular expression represented by the ERE constant shall  be
           the sequence of all unescaped characters and values of escape sequences between, but not including, the
           two delimiting <slash> characters.

        7. A <blank> shall have no effect, except to delimit lexical tokens or within SSTTRRIINNGG or EERREE tokens.

        8. The token NNUUMMBBEERR shall represent a numeric constant. Its form and numeric value shall either be equiva‐
           lent  to  the  ddeecciimmaall--ffllooaattiinngg--ccoonnssttaanntt token as specified by the ISO C standard, or it shall be a se‐
           quence of decimal digits and shall be evaluated as an integer constant in decimal. In addition,  imple‐
           mentations  may accept numeric constants with the form and numeric value equivalent to the hheexxaaddeecciimmaall--
           ccoonnssttaanntt and hheexxaaddeecciimmaall--ffllooaattiinngg--ccoonnssttaanntt tokens as specified by the ISO C standard.

           If the value is too large or too small to be representable (see _S_e_c_t_i_o_n _1_._1_._2,  _C_o_n_c_e_p_t_s  _D_e_r_i_v_e_d  _f_r_o_m
           _t_h_e _I_S_O _C _S_t_a_n_d_a_r_d), the behavior is undefined.

        9. A  sequence of underscores, digits, and alphabetics from the portable character set (see the Base Defi‐
           nitions volume of POSIX.1‐2008, _S_e_c_t_i_o_n _6_._1, _P_o_r_t_a_b_l_e _C_h_a_r_a_c_t_e_r _S_e_t), beginning with an <underscore> or
           alphabetic character, shall be considered a word.

       10. The  following  words are keywords that shall be recognized as individual tokens; the name of the token
           is the same as the keyword:

           BBEEGGIINN      ddeelleettee     EENNDD        ffuunnccttiioonn   iinn         pprriinnttff
           bbrreeaakk      ddoo         eexxiitt       ggeettlliinnee    nneexxtt       rreettuurrnn
           ccoonnttiinnuuee   eellssee       ffoorr        iiff         pprriinntt      wwhhiillee

       11. The  following  words  are  names  of  built-in  functions  and  shall  be  recognized  as  the   token
           BBUUIILLTTIINN__FFUUNNCC__NNAAMMEE:

           aattaann22     ggssuubb      lloogg       sspplliitt     ssuubb       ttoouuppppeerr
           cclloossee     iinnddeexx     mmaattcchh     sspprriinnttff   ssuubbssttrr
           ccooss       iinntt       rraanndd      ssqqrrtt      ssyysstteemm
           eexxpp       lleennggtthh    ssiinn       ssrraanndd     ttoolloowweerr

           The above-listed keywords and names of built-in functions are considered reserved words.

       12. The  token  NNAAMMEE  shall consist of a word that is not a keyword or a name of a built-in function and is
           not followed immediately (without any delimiters) by the ''(('' character.

       13. The token FFUUNNCC__NNAAMMEE shall consist of a word that is not a keyword or a name  of  a  built-in  function,
           followed  immediately (without any delimiters) by the ''(('' character. The ''(('' character shall not be in‐
           cluded as part of the token.

       14. The following two-character sequences shall be recognized as the named tokens:

                                       ┌───────────┬──────────┬────────────┬──────────┐
                                       │TTookkeenn NNaammee │ SSeeqquueennccee │ TTookkeenn NNaammee │ SSeeqquueennccee │
                                       ├───────────┼──────────┼────────────┼──────────┤
                                       │AADDDD__AASSSSIIGGNN │    +=    │ NNOO__MMAATTCCHH   │    !~    │
                                       │SSUUBB__AASSSSIIGGNN │    −=    │ EEQQ         │    ==    │
                                       │MMUULL__AASSSSIIGGNN │    *=    │ LLEE         │    <=    │
                                       │DDIIVV__AASSSSIIGGNN │    /=    │ GGEE         │    >=    │
                                       │MMOODD__AASSSSIIGGNN │    %=    │ NNEE         │    !=    │
                                       │PPOOWW__AASSSSIIGGNN │    ^=    │ IINNCCRR       │    ++    │
                                       │OORR         │    ||    │ DDEECCRR       │    −−    │
                                       │AANNDD        │    &&    │ AAPPPPEENNDD     │    >>    │
                                       └───────────┴──────────┴────────────┴──────────┘
       15. The following single characters shall be recognized as tokens whose names are the character:

               <<nneewwlliinnee>> {{ }} (( )) [[ ]] ,, ;; ++ −− ** %% ^^ !! >> << || ?? ::  "" ""  $$ ==

       There is a lexical ambiguity between the token EERREE and the tokens ''//'' and DDIIVV__AASSSSIIGGNN.  When  an  input  se‐
       quence begins with a <slash> character in any syntactic context where the token ''//'' or DDIIVV__AASSSSIIGGNN could ap‐
       pear as the next token in a valid program, the longer of those two tokens that can be recognized  shall  be
       recognized.  In  any  other syntactic context where the token EERREE could appear as the next token in a valid
       program, the token EERREE shall be recognized.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All input files were processed successfully.

       >0    An error occurred.

       The exit status can be altered within the program by using an eexxiitt expression.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       If any _f_i_l_e operand is specified and the named file cannot be accessed, _a_w_k shall write a  diagnostic  mes‐
       sage to standard error and terminate without any further action.

       If the program specified by either the _p_r_o_g_r_a_m operand or a _p_r_o_g_f_i_l_e operand is not a valid _a_w_k program (as
       specified in the EXTENDED DESCRIPTION section), the behavior is undefined.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The iinnddeexx, lleennggtthh, mmaattcchh, and ssuubbssttrr functions should not be confused with similar functions in  the  ISO C
       standard; the _a_w_k versions deal with characters, while the ISO C standard deals with bytes.

       Because  the  concatenation operation is represented by adjacent expressions rather than an explicit opera‐
       tor, it is often necessary to use parentheses to enforce the proper evaluation precedence.

EEXXAAMMPPLLEESS
       The _a_w_k program specified in the command line is most easily specified within single-quotes  (for  example,
       '_p_r_o_g_r_a_m')  for applications using _s_h, because _a_w_k programs commonly contain characters that are special to
       the shell, including double-quotes. In the cases where an _a_w_k program contains single-quote characters,  it
       is usually easiest to specify most of the program as strings within single-quotes concatenated by the shell
       with quoted single-quote characters. For example:

           aawwkk ''//''\\''''// {{ pprriinntt ""qquuoottee::"",, $$00 }}''

       prints all lines from the standard input containing a single-quote character, prefixed with _q_u_o_t_e:.

       The following are examples of simple _a_w_k programs:

        1. Write to the standard output all input lines for which field 3 is greater than 5:

               $$33 >> 55

        2. Write every tenth line:

               ((NNRR %% 1100)) ==== 00

        3. Write any line with a substring matching the regular expression:

               //((GG||DD))((22[[00−−99]][[[[::aallpphhaa::]]]]**))//

        4. Print any line with a substring containing a ''GG'' or ''DD'', followed by a sequence of digits  and  charac‐
           ters.  This  example uses character classes ddiiggiitt and aallpphhaa to match language-independent digit and al‐
           phabetic characters respectively:

               //((GG||DD))(([[[[::ddiiggiitt::]][[::aallpphhaa::]]]]**))//

        5. Write any line in which the second field matches the regular expression and the fourth field does not:

               $$22  "" ""  //xxyyzz// &&&& $$44 !! "" ""  //xxyyzz//

        6. Write any line in which the second field contains a <backslash>:

               $$22  "" ""  //\\\\//

        7. Write any line in which the second field contains a <backslash>.  Note that <backslash>-escapes are in‐
           terpreted  twice;  once  in lexical processing of the string and once in processing the regular expres‐
           sion:

               $$22  "" ""  ""\\\\\\\\""

        8. Write the second to the last and the last field in each line. Separate the fields by a <colon>:

               {{OOFFSS==""::"";;pprriinntt $$((NNFF−−11)),, $$NNFF}}

        9. Write the line number and number of fields in each line. The three strings representing the  line  num‐
           ber, the <colon>, and the number of fields are concatenated and that string is written to standard out‐
           put:

               {{pprriinntt NNRR ""::"" NNFF}}

       10. Write lines longer than 72 characters:

               lleennggtthh(($$00)) >> 7722

       11. Write the first two fields in opposite order separated by OOFFSS:

               {{ pprriinntt $$22,, $$11 }}

       12. Same, with input fields separated by a <comma> or <space> and <tab> characters, or both:

               BBEEGGIINN {{ FFSS == "",,[[ \\tt]]**||[[ \\tt]]++"" }}
                     {{ pprriinntt $$22,, $$11 }}

       13. Add up the first column, print sum, and average:

                     {{ss ++== $$11 }}
               EENNDD   {{pprriinntt ""ssuumm iiss "",, ss,, "" aavveerraaggee iiss"",, ss//NNRR}}

       14. Write fields in reverse order, one per line (many lines out for each line in):

               {{ ffoorr ((ii == NNFF;; ii >> 00;; −−−−ii)) pprriinntt $$ii }}

       15. Write all lines between occurrences of the strings ssttaarrtt and ssttoopp:

               //ssttaarrtt//,, //ssttoopp//

       16. Write all lines whose first field is different from the previous one:

               $$11 !!== pprreevv {{ pprriinntt;; pprreevv == $$11 }}

       17. Simulate _e_c_h_o:

               BBEEGGIINN  {{
                       ffoorr ((ii == 11;; ii << AARRGGCC;; ++++ii))
                       pprriinnttff((""%%ss%%ss"",, AARRGGVV[[ii]],, ii====AARRGGCC−−11??""\\nn""::"" ""))
               }}

       18. Write the path prefixes contained in the _P_A_T_H environment variable, one per line:

               BBEEGGIINN  {{
                       nn == sspplliitt ((EENNVVIIRROONN[[""PPAATTHH""]],, ppaatthh,, ""::""))
                       ffoorr ((ii == 11;; ii <<== nn;; ++++ii))
                       pprriinntt ppaatthh[[ii]]
               }}

       19. If there is a file named iinnppuutt containing page headers of the form: Page #

           and a file named pprrooggrraamm that contains:

               //PPaaggee//   {{ $$22 == nn++++;; }}
                        {{ pprriinntt }}

           then the command line:

               aawwkk −−ff pprrooggrraamm nn==55 iinnppuutt

           prints the file iinnppuutt, filling in page numbers starting at 5.

RRAATTIIOONNAALLEE
       This description is based on the new _a_w_k, ``nawk'', (see the  referenced  _T_h_e  _A_W_K  _P_r_o_g_r_a_m_m_i_n_g  _L_a_n_g_u_a_g_e),
       which introduced a number of new features to the historical _a_w_k:

        1. New keywords: ddeelleettee, ddoo, ffuunnccttiioonn, rreettuurrnn

        2. New built-in functions: aattaann22, cclloossee, ccooss, ggssuubb, mmaattcchh, rraanndd, ssiinn, ssrraanndd, ssuubb, ssyysstteemm

        3. New predefined variables: FFNNRR, AARRGGCC, AARRGGVV, RRSSTTAARRTT, RRLLEENNGGTTHH, SSUUBBSSEEPP

        4. New expression operators: ??, ::, ,,, ^^

        5. The FFSS variable and the third argument to sspplliitt, now treated as extended regular expressions.

        6. The operator precedence, changed to more closely match the C language.  Two examples of code that oper‐
           ate differently are:

               wwhhiillee (( nn //== 1100 >> 11)) ......
               iiff ((!!""wwkk"" ~~ //bbwwkk//)) ......

       Several features have been added based on newer implementations of _a_w_k:

        *  Multiple instances of −−ff _p_r_o_g_f_i_l_e are permitted.

        *  The new option −−vv _a_s_s_i_g_n_m_e_n_t_.

        *  The new predefined variable EENNVVIIRROONN.

        *  New built-in functions ttoouuppppeerr and ttoolloowweerr.

        *  More formatting capabilities are added to pprriinnttff to match the ISO C standard.

       The overall _a_w_k syntax has always been based on the C language, with a few features from the shell  command
       language and other sources. Because of this, it is not completely compatible with any other language, which
       has caused confusion for some users. It is not the intent of the standard developers to  address  such  is‐
       sues.  A  few  relatively  minor changes toward making the language more compatible with the ISO C standard
       were made; most of these changes are based on similar  changes  in  recent  implementations,  as  described
       above.  There  remain  several  C-language conventions that are not in _a_w_k.  One of the notable ones is the
       <comma> operator, which is commonly used to specify multiple expressions in the C language  ffoorr  statement.
       Also,  there are various places where _a_w_k is more restrictive than the C language regarding the type of ex‐
       pression that can be used in a given context. These limitations are due to the different features that  the
       _a_w_k language does provide.

       Regular  expressions in _a_w_k have been extended somewhat from historical implementations to make them a pure
       superset of extended regular expressions, as defined by POSIX.1‐2008 (see the Base  Definitions  volume  of
       POSIX.1‐2008,  _S_e_c_t_i_o_n  _9_._4,  _E_x_t_e_n_d_e_d  _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s).  The main extensions are internationalization
       features and interval expressions. Historical implementations of _a_w_k have long supported <backslash>-escape
       sequences as an extension to extended regular expressions, and this extension has been retained despite in‐
       consistency with other utilities. The number of escape sequences recognized in both  extended  regular  ex‐
       pressions  and strings has varied (generally increasing with time) among implementations. The set specified
       by POSIX.1‐2008 includes most sequences known to be supported by popular implementations and by  the  ISO C
       standard.  One sequence that is not supported is hexadecimal value escapes beginning with ''\\xx''.  This would
       allow values expressed in more than 9 bits to be used within _a_w_k as in the ISO C standard. However, because
       this syntax has a non-deterministic length, it does not permit the subsequent character to be a hexadecimal
       digit. This limitation can be dealt with in the C language by the use of lexical string  concatenation.  In
       the  _a_w_k language, concatenation could also be a solution for strings, but not for extended regular expres‐
       sions (either lexical ERE tokens or strings used dynamically as regular expressions). Because of this limi‐
       tation, the feature has not been added to POSIX.1‐2008.

       When  a  string  variable is used in a context where an extended regular expression normally appears (where
       the lexical token ERE is used in the grammar) the string does not contain the literal <slash> characters.

       Some versions of _a_w_k allow the form:

           ffuunncc nnaammee((aarrggss,, ...... )) {{ ssttaatteemmeennttss }}

       This has been deprecated by the authors of the language, who asked that it not be specified.

       Historical implementations of _a_w_k produce an error if a nneexxtt statement is executed in a BBEEGGIINN  action,  and
       cause  _a_w_k  to terminate if a nneexxtt statement is executed in an EENNDD action. This behavior has not been docu‐
       mented, and it was not believed that it was necessary to standardize it.

       The specification of conversions between string and numeric values is much more detailed than in the  docu‐
       mentation of historical implementations or in the referenced _T_h_e _A_W_K _P_r_o_g_r_a_m_m_i_n_g _L_a_n_g_u_a_g_e. Although most of
       the behavior is designed to be intuitive, the details are necessary to ensure compatible behavior from dif‐
       ferent implementations. This is especially important in relational expressions since the types of the oper‐
       ands determine whether a string or numeric comparison is performed. From the perspective of an  application
       developer,  it  is usually sufficient to expect intuitive behavior and to force conversions (by adding zero
       or concatenating a null string) when the type of an expression does not obviously match what is needed. The
       intent  has been to specify historical practice in almost all cases. The one exception is that, in histori‐
       cal implementations, variables and constants maintain both string and numeric values after  their  original
       value is converted by any use. This means that referencing a variable or constant can have unexpected side-
       effects. For example, with historical implementations the following program:

           {{
               aa == ""++22""
               bb == 22
               iiff ((NNRR %% 22))
                   cc == aa ++ bb
               iiff ((aa ==== bb))
                   pprriinntt ""nnuummeerriicc ccoommppaarriissoonn""
               eellssee
                   pprriinntt ""ssttrriinngg ccoommppaarriissoonn""
           }}

       would perform a numeric comparison (and output numeric comparison) for each odd-numbered line, but  perform
       a  string  comparison (and output string comparison) for each even-numbered line. POSIX.1‐2008 ensures that
       comparisons will be numeric if necessary. With historical implementations, the following program:

           BBEEGGIINN {{
               OOFFMMTT == ""%%ee""
               pprriinntt 33..1144
               OOFFMMTT == ""%%ff""
               pprriinntt 33..1144
           }}

       would output ""33..114400000000ee++0000"" twice, because in the second pprriinntt statement the constant ""33..1144"" would  have  a
       string value from the previous conversion. POSIX.1‐2008 requires that the output of the second pprriinntt state‐
       ment be ""33..114400000000"".  The behavior of historical implementations was seen  as  too  unintuitive  and  unpre‐
       dictable.

       It was pointed out that with the rules contained in early drafts, the following script would print nothing:

           BBEEGGIINN {{
               yy[[11..55]] == 11
               OOFFMMTT == ""%%ee""
               pprriinntt yy[[11..55]]
           }}

       Therefore, a new variable, CCOONNVVFFMMTT, was introduced. The OOFFMMTT variable is now restricted to affecting output
       conversions of numbers to strings and CCOONNVVFFMMTT is used for internal conversions, such as comparisons or  ar‐
       ray indexing. The default value is the same as that for OOFFMMTT, so unless a program changes CCOONNVVFFMMTT (which no
       historical program would do), it will receive the historical behavior associated with internal string  con‐
       versions.

       The  POSIX  _a_w_k  lexical and syntactic conventions are specified more formally than in other sources. Again
       the intent has been to specify historical practice. One convention that may not be obvious from the  formal
       grammar as in other verbal descriptions is where <newline> characters are acceptable. There are several ob‐
       vious placements such as terminating a statement, and a <backslash> can be used to escape <newline> charac‐
       ters  between any lexical tokens. In addition, <newline> characters without <backslash> characters can fol‐
       low a comma, an open brace, a logical AND operator (""&&&&""), a logical OR operator (""||||""),  the  ddoo  keyword,
       the eellssee keyword, and the closing parenthesis of an iiff, ffoorr, or wwhhiillee statement. For example:

           {{ pprriinntt $$11,,
                   $$22 }}

       The  requirement that _a_w_k add a trailing <newline> to the program argument text is to simplify the grammar,
       making it match a text file in form. There is no way for an application or test suite to determine  whether
       a literal <newline> is added or whether _a_w_k simply acts as if it did.

       POSIX.1‐2008 requires several changes from historical implementations in order to support internationaliza‐
       tion. Probably the most subtle of these is the use of the decimal-point character, defined  by  the  _L_C___N_U_‐
       _M_E_R_I_C category of the locale, in representations of floating-point numbers.  This locale-specific character
       is used in recognizing numeric input, in converting between strings and numeric values, and  in  formatting
       output. However, regardless of locale, the <period> character (the decimal-point character of the POSIX lo‐
       cale) is the decimal-point character recognized in processing _a_w_k programs (including assignments  in  com‐
       mand  line  arguments).  This is essentially the same convention as the one used in the ISO C standard. The
       difference is that the C language includes the _s_e_t_l_o_c_a_l_e() function, which permits an application to modify
       its  locale.  Because of this capability, a C application begins executing with its locale set to the C lo‐
       cale, and only executes in the environment-specified locale after an explicit call  to  _s_e_t_l_o_c_a_l_e().   How‐
       ever,  adding such an elaborate new feature to the _a_w_k language was seen as inappropriate for POSIX.1‐2008.
       It is possible to execute an _a_w_k program explicitly in any desired locale by setting the environment in the
       shell.

       The undefined behavior resulting from NULs in extended regular expressions allows future extensions for the
       GNU _g_a_w_k program to process binary data.

       The behavior in the case of invalid _a_w_k programs (including lexical, syntactic, and semantic errors) is un‐
       defined  because it was considered overly limiting on implementations to specify. In most cases such errors
       can be expected to produce a diagnostic and a non-zero  exit  status.  However,  some  implementations  may
       choose to extend the language in ways that make use of certain invalid constructs. Other invalid constructs
       might be deemed worthy of a warning, but otherwise cause some reasonable behavior. Still  other  constructs
       may  be  very  difficult to detect in some implementations.  Also, different implementations might detect a
       given error during an initial parsing of the program (before reading any input files)  while  others  might
       detect it when executing the program after reading some input. Implementors should be aware that diagnosing
       errors as early as possible and producing useful diagnostics can ease debugging of applications,  and  thus
       make an implementation more usable.

       The  unspecified behavior from using multi-character RRSS values is to allow possible future extensions based
       on extended regular expressions used for record separators. Historical implementations take the first char‐
       acter of the string and ignore the others.

       Unspecified  behavior  when _s_p_l_i_t(_s_t_r_i_n_g,_a_r_r_a_y,<null>) is used is to allow a proposed future extension that
       would split up a string into an array of individual characters.

       In the context of the ggeettlliinnee function, equally good arguments for different precedences of the || and << op‐
       erators can be made. Historical practice has been that:

           ggeettlliinnee << ""aa"" ""bb""

       is parsed as:

           (( ggeettlliinnee << ""aa"" )) ""bb""

       although many would argue that the intent was that the file aabb should be read. However:

           ggeettlliinnee << ""xx"" ++ 11

       parses as:

           ggeettlliinnee << (( ""xx"" ++ 11 ))

       Similar problems occur with the || version of ggeettlliinnee, particularly in combination with $$.  For example:

           $$""eecchhoo hhii"" || ggeettlliinnee

       (This  situation  is particularly problematic when used in a pprriinntt statement, where the ||ggeettlliinnee part might
       be a redirection of the pprriinntt.)

       Since in most cases such constructs are not (or at least should not) be used (because they have  a  natural
       ambiguity  for  which  there is no conventional parsing), the meaning of these constructs has been made ex‐
       plicitly unspecified. (The effect is that a conforming application that runs into the problem  must  paren‐
       thesize to resolve the ambiguity.)  There appeared to be few if any actual uses of such constructs.

       Grammars  can be written that would cause an error under these circumstances. Where backwards-compatibility
       is not a large consideration, implementors may wish to use such grammars.

       Some historical implementations have allowed some built-in functions to be called without an argument list,
       the  result being a default argument list chosen in some ``reasonable'' way. Use of lleennggtthh as a synonym for
       lleennggtthh(($$00)) is the only one of these forms that is thought to be widely known or widely used; this  particu‐
       lar form is documented in various places (for example, most historical _a_w_k reference pages, although not in
       the referenced _T_h_e _A_W_K _P_r_o_g_r_a_m_m_i_n_g _L_a_n_g_u_a_g_e) as legitimate practice.  With this exception, default argument
       lists have always been undocumented and vaguely defined, and it is not at all clear how (or if) they should
       be generalized to user-defined functions. They add no useful functionality and preclude possible future ex‐
       tensions  that might need to name functions without calling them. Not standardizing them seems the simplest
       course. The standard developers considered that lleennggtthh merited special treatment,  however,  since  it  has
       been  documented  in  the past and sees possibly substantial use in historical programs.  Accordingly, this
       usage has been made legitimate, but Issue 5 removed the obsolescent marking for XSI-conforming  implementa‐
       tions and many otherwise conforming applications depend on this feature.

       In  ssuubb  and ggssuubb, if _r_e_p_l is a string literal (the lexical token SSTTRRIINNGG), then two consecutive <backslash>
       characters should be used in the string to ensure a single <backslash> will precede  the  <ampersand>  when
       the resultant string is passed to the function. (For example, to specify one literal <ampersand> in the re‐
       placement string, use ggssuubb(EERREE, ""\\\\&&"").)

       Historically, the only special character in the _r_e_p_l argument of ssuubb and ggssuubb string functions was the <am‐
       persand>  (''&&'')  character and preceding it with the <backslash> character was used to turn off its special
       meaning.

       The description in the ISO POSIX‐2:1993 standard introduced behavior such that  the  <backslash>  character
       was  another special character and it was unspecified whether there were any other special characters. This
       description introduced several portability problems, some of which are described below, and so it has  been
       replaced with the more historical description. Some of the problems include:

        *  Historically,  to  create  the  replacement  string,  a script could use ggssuubb(EERREE, ""\\\\&&""), but with the
           ISO POSIX‐2:1993 standard wording, it was necessary to use ggssuubb(EERREE, ""\\\\\\\\&&"").  The <backslash> charac‐
           ters  are  doubled here because all string literals are subject to lexical analysis, which would reduce
           each pair of <backslash> characters to a single <backslash> before being passed to ggssuubb.

        *  Since it was unspecified what the special characters were, for portable scripts to guarantee that char‐
           acters  are  printed  literally, each character had to be preceded with a <backslash>.  (For example, a
           portable script had to use ggssuubb(EERREE, ""\\\\hh\\\\ii"") to produce a replacement string of ""hhii"".)

       The description for comparisons in the ISO POSIX‐2:1993 standard did not properly describe historical prac‐
       tice  because  of  the  way  numeric strings are compared as numbers. The current rules cause the following
       code:

           iiff ((00 ==== ""000000""))
               pprriinntt ""ssttrraannggee,, bbuutt ttrruuee""
           eellssee
               pprriinntt ""nnoott ttrruuee""

       to do a numeric comparison, causing the iiff to succeed. It should be intuitively obvious that this is incor‐
       rect behavior, and indeed, no historical implementation of _a_w_k actually behaves this way.

       To  fix  this  problem, the definition of _n_u_m_e_r_i_c _s_t_r_i_n_g was enhanced to include only those values obtained
       from specific circumstances (mostly external sources) where it is not possible to  determine  unambiguously
       whether the value is intended to be a string or a numeric.

       Variables  that  are  assigned to a numeric string shall also be treated as a numeric string. (For example,
       the notion of a numeric string can be propagated across assignments.) In comparisons, all variables  having
       the uninitialized value are to be treated as a numeric operand evaluating to the numeric value zero.

       Uninitialized  variables  include all types of variables including scalars, array elements, and fields. The
       definition of an uninitialized value in _V_a_r_i_a_b_l_e_s _a_n_d _S_p_e_c_i_a_l _V_a_r_i_a_b_l_e_s is necessary to describe the  value
       placed  on uninitialized variables and on fields that are valid (for example, << $$NNFF) but have no characters
       in them and to describe how these variables are to be used in comparisons. A valid field, such as $$11,  that
       has  no characters in it can be obtained from an input line of ""\\tt\\tt"" when FFSS==''\\tt''.  Historically, the com‐
       parison ($$11<<10) was done numerically after evaluating $$11 to the value zero.

       The phrase ``... also shall have the numeric value of the numeric string'' was removed  from  several  sec‐
       tions of the ISO POSIX‐2:1993 standard because is specifies an unnecessary implementation detail. It is not
       necessary for POSIX.1‐2008 to specify that these objects be assigned two different values.  It is only nec‐
       essary to specify that these objects may evaluate to two different values depending on context.

       Historical  implementations  of  _a_w_k did not parse hexadecimal integer or floating constants like ""00xxaa"" and
       ""00xxaapp00"".  Due to an oversight, the 2001 through 2004 editions of this standard required support  for  hexa‐
       decimal  floating  constants. This was due to the reference to _a_t_o_f().  This version of the standard allows
       but does not require implementations to use _a_t_o_f() and includes a description of how floating-point numbers
       are  recognized  as an alternative to match historic behavior. The intent of this change is to allow imple‐
       mentations to recognize floating-point constants according to  either  the  ISO/IEC 9899:1990  standard  or
       ISO/IEC 9899:1999 standard, and to allow (but not require) implementations to recognize hexadecimal integer
       constants.

       Historical implementations of _a_w_k did not support floating-point infinities and NaNs  in  _n_u_m_e_r_i_c  _s_t_r_i_n_g_s;
       e.g.,  ""−−IINNFF"" and ""NNaaNN"".  However, implementations that use the _a_t_o_f() or _s_t_r_t_o_d() functions to do the con‐
       version picked up support for these values if they used a ISO/IEC 9899:1999 standard version of  the  func‐
       tion  instead  of a ISO/IEC 9899:1990 standard version. Due to an oversight, the 2001 through 2004 editions
       of this standard did not allow support for infinities and NaNs, but in this  revision  support  is  allowed
       (but  not required). This is a silent change to the behavior of _a_w_k programs; for example, in the POSIX lo‐
       cale the expression:

           ((""--IINNFF"" ++ 00 << 00))

       formerly had the value 0 because ""−−IINNFF"" converted to 0, but now it may have the value 0 or 1.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _S_e_c_t_i_o_n _1_._3, _G_r_a_m_m_a_r _C_o_n_v_e_n_t_i_o_n_s, _g_r_e_p, _l_e_x, _s_e_d

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _5, _F_i_l_e _F_o_r_m_a_t _N_o_t_a_t_i_o_n, _S_e_c_t_i_o_n _6_._1, _P_o_r_t_a_b_l_e _C_h_a_r_a_c_‐
       _t_e_r  _S_e_t,  _C_h_a_p_t_e_r  _8,  _E_n_v_i_r_o_n_m_e_n_t _V_a_r_i_a_b_l_e_s, _C_h_a_p_t_e_r _9, _R_e_g_u_l_a_r _E_x_p_r_e_s_s_i_o_n_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x
       _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _a_t_o_f(), _e_x_e_c, _i_s_s_p_a_c_e(), _p_o_p_e_n(), _s_e_t_l_o_c_a_l_e(), _s_t_r_t_o_d()

CCOOPPYYRRIIGGHHTT
       Portions of this text are reprinted and reproduced in electronic form from IEEE Std 1003.1,  2013  Edition,
       Standard  for  Information  Technology  -- Portable Operating System Interface (POSIX), The Open Group Base
       Specifications Issue 7, Copyright (C) 2013 by the Institute of Electrical and  Electronics  Engineers,  Inc
       and  The Open Group.  (This is POSIX.1-2008 with the 2013 Technical Corrigendum 1 applied.) In the event of
       any discrepancy between this version and the original IEEE and The Open Group Standard, the  original  IEEE
       and  The  Open  Group  Standard  is  the  referee document. The original Standard can be obtained online at
       http://www.unix.org/online.html .

       Any typographical or formatting errors that appear in this page are most likely  to  have  been  introduced
       during  the  conversion of the source files to man page format. To report such errors, see https://www.ker‐
       nel.org/doc/man-pages/reporting_bugs.html .

IEEE/The Open Group                                    2013                                                AWK(1P)
