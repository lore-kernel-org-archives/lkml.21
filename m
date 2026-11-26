Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710287;
	b=J80Csub6lWvmY3koXH3BooHH1MmjlnlYhmOK5fFYPJs1lp/8ns6YktKdVTbwT3xNHQl5
	 5V7sNXbLZfI5YB4EIAu4Tc7cd9ZvSy2D0v+BcjyZIFvxSHHcFWE/aGqCB3ZtEK2WK0ZFn
	 jYcMk+XNtw3zdiauQCrTINkVhTnanjEcnjCXe1lBttiZ70w38lc+g708zS+wKQOeXBDCN
	 JzCjAwjdmkt+yS2mPyj/ptlAIlejkH+GA5J9XbuxG4phGSvNez6m9698IBdXmlMr2+1GP
	 hjNhA6YPotlaVsPS3n1W9rPUt9oiGH4c2oHfFgsLDZnE+aRmGPGEQeSce7gvOnIL4jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710287;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=lLk7Oy+hllPQasBd0V/2uNji/28IQaEx2KJT/WDxgAo=;
	b=yHdRUfFIiRnnlT7FFO1Ojw/PXxUe0FmG6GS6AP5gb6JFVFTA4Wty0dobcG4CFNgFCW8l
	 fH41Z+WaaHA/c3PDos5kPqEps6vd8qFzhLkp42Po+8lnt6dPDzbo1kZAr1A06RcrMHrUL
	 6TiJEWayZjwEK/6SYlGBwC11noHh8fBFQBIcHOkP4EXoPQbem0clgFz5WMw1IZd+EepMq
	 CpS59XNvIdprseDHDWizERA6EpNDLUxXgsn878hKZsFO7VJuc+TiGZKeYrE+8FHQlCInw
	 YWugzeSxhy4hip3FJQzTD7D1SIgLkS7WeMNFaHmhVntPzfnrnGJM6xMO6+MSXzfjI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eBgdXNhW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F76606A6AA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eBgdXNhW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9851F000ED;
	Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710287;
	bh=lLk7Oy+hllPQasBd0V/2uNji/28IQaEx2KJT/WDxgAo=;
	h=Date:From:To:Cc:Subject:References;
	b=eBgdXNhWxlHuY9XvJWn2i1GWxevlaoqGJ+FWap2QZGndMmSnxM3gY/opnvdsM2Z9O
	 cYNiRkhQznnK+Pd0H7UZw9Ww6vGTsuHBE/UwP6yuLPII8kceKNUWdi45pao5OiDEG7
	 y7+O7LwOOmaxJ54V8mlKFgai+4OOnLU3vGGrc1no/RrhUsehsaq2Jm4PpVtQS49D3A
	 kqcFzeCwWVS2Qg2JxQXkfz+h0S6DHw208j5M/3uUJpdwUhkEVDqty/jR4ud2O3Q55X
	 z8Ayxu1pF9Pu183TqW9yzjfL6FD2QS2/JkUaNzyjwCf0PEa0jfKNyQpe1EyF/w5XTS
	 fULA6VmHwvDaQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH8-00000007bpV-24yh;
	Thu, 26 Nov 2026 11:24:46 -0500
Message-ID: <20261126162446.319124241@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:35 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 12/15] tracing/filters: Reject unsupported field sizes in parse_pred()
References: <20261126162423.442922469@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Prior to commit 80765597bc58 ("tracing: Rewrite filter logic to be simpler
and faster"), parse_pred() checked whether select_comparison_fn() returned
NULL and failed with FILT_ERR_INVALID_OP and -EINVAL. That check was lost
during the rewrite, and commit 3cbec9d7b93d ("tracing/filters: Enable
filtering a scalar field by a cpumask") similarly omitted a default error
case when matching field->size for CPUS{} comparisons.

If a non-string field (FILTER_OTHER) has a size other than 1, 2, 4, or 8
(such as a fixed-size integer array field), pred->fn_num remains
FILTER_PRED_FN_NOP (0) and parse_pred() returns success. Subsequently,
update_preds() rejects FILTER_PRED_FN_NOP via WARN_ON_ONCE() and returns
-EINVAL without setting a parse_error() message, triggering a kernel
warning from user-supplied filter input.

Restore the check for FILTER_PRED_FN_NOP in both the numeric scalar and
CPUS{} branches of parse_pred() and report FILT_ERR_INVALID_OP.

 ~# cd /sys/kernel/tracing
 ~# cat events/raw_syscalls/sys_enter/format | grep args
	field:unsigned long args[6];	offset:24;	size:48;	signed:0;

So this event has args[6] array field. So filter needs [] to specify
the element. However,

 ~# echo 'args == 0' > events/raw_syscalls/sys_enter/filter
 ~# echo $?
 0

This passed, and

 ~# cat events/raw_syscalls/sys_enter/filter
 args == 0

After this update:

 ~# echo 'args == 0' > events/raw_syscalls/sys_enter/filter
 sh: write error: Invalid argument

 ~# cat error_log
 [   23.864399] event filter parse error: error: Invalid operator
   Command: args == 0

Fixes: 80765597bc58 ("tracing: Rewrite filter logic to be simpler and faster")
Fixes: 3cbec9d7b93d ("tracing/filters: Enable filtering a scalar field by a cpumask")
Link: https://patch.msgid.link/179323791927.740114.2174706496595446472.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 79eb187be39d..fcdd4c552569 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2019,6 +2019,10 @@ static int parse_pred(const char *str, void *data,
 				break;
 			}
 		}
+		if (pred->fn_num == FILTER_PRED_FN_NOP) {
+			parse_error(pe, FILT_ERR_INVALID_OP, pos + i);
+			goto err_free;
+		}
 
 	/* This is either a string, or an integer */
 	} else if (str[i] == '\'' || str[i] == '"') {
@@ -2172,6 +2176,10 @@ static int parse_pred(const char *str, void *data,
 		else {
 			pred->fn_num = select_comparison_fn(pred->op, field->size,
 							    field->is_signed);
+			if (pred->fn_num == FILTER_PRED_FN_NOP) {
+				parse_error(pe, FILT_ERR_INVALID_OP, pos + i);
+				goto err_free;
+			}
 			if (pred->op == OP_NE)
 				pred->not = 1;
 		}
-- 
2.53.0
