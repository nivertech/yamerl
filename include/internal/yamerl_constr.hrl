%-
% Copyright (c) 2012 Yakaz
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions
% are met:
% 1. Redistributions of source code must retain the above copyright
%    notice, this list of conditions and the following disclaimer.
% 2. Redistributions in binary form must reproduce the above copyright
%    notice, this list of conditions and the following disclaimer in the
%    documentation and/or other materials provided with the distribution.
%
% THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
% ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
% OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
% OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
% SUCH DAMAGE.

-ifndef(internal_yamerl_constr_hrl).
-define(internal_yamerl_constr_hrl, true).

-include("yamerl_nodes.hrl").

%% -------------------------------------------------------------------
%% Options.
%% -------------------------------------------------------------------

-type yamerl_constr_option() :: {detailed_constr, boolean()}
                              | {node_mods, [atom()]}
                              | {schema, failsafe | json | core | yaml11}.

%% -------------------------------------------------------------------
%% Representation state.
%% -------------------------------------------------------------------

-record(unfinished_node, {
    module = ?MODULE,
    path,
    pres,
    priv
  }).

-record(node_anchor, {
    name = ""
  }).

-record(yamerl_constr, {
    options              = []         :: [yamerl_constr_option()],
    ext_options          = []         :: [{term(), term()}],
    detailed_constr      = false      :: boolean(),
    mods                 = []         :: [atom()],
    tags                 = []         :: [{tag_uri(), atom()}],
    docs                 = []         :: [yamerl_doc() |
                                          yamerl_simple_doc()],
    docs_count           = 0          :: non_neg_integer(),
    current_doc          = undefined  :: [yamerl_partial_doc() |
                                          yamerl_partial_node() |
                                          #unfinished_node{} |
                                          #node_anchor{}]
                                       | undefined,
    current_node_is_leaf = false      :: boolean(),
    anchors              = dict:new() :: dict()
  }).

-endif.
