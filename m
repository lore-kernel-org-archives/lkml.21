Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710286;
	b=1KH3kFBcEHJYGKLGPt1CpznOtLfoBLsuC0l9eRFid4dRQG80j00YHV6UTrJdew2jONbu
	 xp5VuQGMvfg2woQAZsXcPDeTzwEzTf5Jwt+hYwEph/lAPOHj7Qbg9FD8xcE1M5zN+yhAM
	 oFcIrk9uZegiLx08HXkRWe4sU+1b/0QpeULwidqN7l4trfsreY5sco7YLLd8bgKTqNRAi
	 8jm5FTUSfI7Ww+TAwEGjVJttI3/pexhnmJNVwH302HK3ROqKodcvx5H0rrOtF93m9L++1
	 71ketdpYGiuLf7Ttd3A1tsW3xSsA8QEWHcbD7LfeIjTXvwrATkDWztWsPvNdlr3AWTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710286;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=6RLiPEICwMgNodF45avDQ2KMLgeuTUrfxnxbRVi1/64=;
	b=D5IM8vKILLJz5TxocKrHyOJU7z2hCD5K8YnIoqSUuFSf/Cafj2HLMpiGYyvm3tjMRWk9
	 4m3TUV3mCMGx4LkqBz3Nz5EbPtfozA+w9jks2l4Oqf5ImgqxfLx1QdNOhX6gyLQn9VqFi
	 1HPAwmXcU1twfauba2R+D1b798PnAjaFess1XjxZLid1CBPnV8YteufJQqLHUNa0V5fUX
	 g800qMh1fAYLNX3q3revXW/HUPapA+da/ynUP18/xcphtD/pGHBfg3DEjSCtSwDXkdC+A
	 drPDrOifTrywgId83ib+6VjoHhRC67EQVruRfxC+d9c89hYibGUAWoDuwcZ+E2jkYKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1w8LWSf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D852F606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1w8LWSf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8247F1F00A19;
	Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710286;
	bh=6RLiPEICwMgNodF45avDQ2KMLgeuTUrfxnxbRVi1/64=;
	h=Date:From:To:Cc:Subject:References;
	b=H1w8LWSfd/Ep1K3qVaOx9rs3XdfoHvurq1jSHpGeWDlFHzf+lVQwNocFkB0QgykEZ
	 IgtF0Nf3SJMc4TMD8W6BJdHnhnbT5XmcIJntvs2uMmH8bH7gbAvBMuPwjMAaL961xh
	 bNp1YW3vF4te+aeBMQFQNrxHb90QIgDDJiwh/6o4oR+OqI8cqBsrhzyrrdY2o0xGqC
	 ckfa0odFIHFlAiXXJeFHaK0+qQF4AyEsyXQzYwLmwC1XPtO3EVtkbVZ+RWNH9OdNHF
	 kxQcfkZl+vvRWrjLGQnTjOq7m79FXyaAm6fT4iMixP9sOaCcpGvJ7Hc57BxGrVJGsU
	 7oMgKN/qo2mpw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH7-00000007bno-3f1l;
	Thu, 26 Nov 2026 11:24:45 -0500
Message-ID: <20261126162445.699374590@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:32 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 09/15] tracing/filters: Report parse error on all -EINVAL paths in filter
 parsing
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

Several error paths in filter parsing return -EINVAL (or -1) without
calling parse_error() to set pe->lasterr:

1. In parse_pred(), when an invalid token is encountered where a field name
   is expected (e.g., "common_pid == 1 || (common_pid == 2 && )"), len is 0
   and it returns -1 without calling parse_error().
2. In process_preds(), when !nr_preds (e.g., empty or whitespace-only
   filter), it returns -EINVAL before predicate_parse() can set
   FILT_ERR_NO_FILTER.
3. In predicate_parse(), when op_stack overflows or the jump target check
   fails, it returns -EINVAL without calling parse_error().

Because pe->lasterr remains 0 on these paths, append_filter_err() falls
back to printing an uninformative "Error: (0)" instead of reporting the
diagnostic and error position.

Call parse_error() with the appropriate error code on all of these paths.

Fixes: 80765597bc58 ("tracing: Rewrite filter logic to be simpler and faster")
Link: https://patch.msgid.link/179323788261.740114.13501865461835259995.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index a9d77df3e19a..17064fa4a063 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -514,6 +514,8 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 		switch (*next) {
 		case '(':					/* #2 */
 			if (top - op_stack >= nr_parens - 1) {
+				parse_error(pe, FILT_ERR_TOO_MANY_OPEN,
+					    next - str);
 				ret = -EINVAL;
 				goto out_free;
 			}
@@ -637,6 +639,7 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 		prog[i].when_to_branch = invert;
 		/* Make sure the program always moves forward */
 		if (WARN_ON(prog[i].target <= i)) {
+			parse_error(pe, FILT_ERR_INVALID_FILTER, 0);
 			ret = -EINVAL;
 			goto out_free;
 		}
@@ -1713,8 +1716,10 @@ static int parse_pred(const char *str, void *data,
 
 	len = i - s;
 
-	if (!len)
-		return -1;
+	if (!len) {
+		parse_error(pe, FILT_ERR_INVALID_FILTER, pos + i);
+		return -EINVAL;
+	}
 
 	field_name = kmemdup_nul(str + s, len, GFP_KERNEL);
 	if (!field_name)
@@ -2317,8 +2322,10 @@ static int process_preds(struct trace_event_call *call,
 		return ret;
 	}
 
-	if (!nr_preds)
+	if (!nr_preds) {
+		parse_error(pe, FILT_ERR_NO_FILTER, 0);
 		return -EINVAL;
+	}
 
 	prog = predicate_parse(filter_string, nr_parens, nr_preds,
 			       parse_pred, call, pe);
-- 
2.53.0
