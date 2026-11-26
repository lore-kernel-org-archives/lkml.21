Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710287;
	b=Es281rh1xC5i7RLSQvrXIqDEiyFyJmLG2LtIPuWekSeEm2hmWT7d8tszzclOgPWqyYtS
	 QJPG/EpcCtXvWpumXijXWSzmfs9iE0+cDklNhW1xj9B0c4wfgnBJgsbUBvZ83dL7lRf7s
	 XpIWDSX5bamvc0njMWrH1jfALyozdGZjNPcyHpDyCTaAJxBXxv+ZpkjtGpfMdv2XtB1Yc
	 xAygM+mGc2xlsZmUPxr+Go40v/jNB7sDsDG74eeyuX1fPd+l86tVgz6QRYj1oqcGIUsCq
	 Ata+Vthr9I1LcroLSfhNELfmXtFZquMlEFX8kZROoTrMfBT1kqydCtFtfN+MIrvX4xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710287;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=IiCOJkr0Ya5EfVPZOjlqlsGSszfJ2jEsZU9/eWtKbpQ=;
	b=lr7qWEbK+ehjedQxTFXkOw1O4GygVhQJ7LnroiX4z0WbRK/7LQTt8ScYSUwzm4nb7N0Y
	 XBaR2obiXwCDLhx1bP7+MS6gbhSGmFdOocCAvJdhu+4lOCL6pkHiQcbzKv4NrGnJJSxKM
	 2/NkBQDIADfYcxu7Q/igecUvpYjXcBWD6Z/2Vk2R7w6F0lPaaql7yDBGfOPImENcbG4od
	 sOfnyM81joo1ilxPwpiCy9NreKgiDe+EliZNf5UsGi8marC6HwFfpZNRF5G/Nh+nCDgJe
	 dZ442TbqyHdL41f8t04FTaF3bEmqZBJY2oOzlraN274lYi57tY1FhY707L9qjftQZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRA50jpd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35768606A6A6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRA50jpd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41E51F0156D;
	Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710286;
	bh=IiCOJkr0Ya5EfVPZOjlqlsGSszfJ2jEsZU9/eWtKbpQ=;
	h=Date:From:To:Cc:Subject:References;
	b=TRA50jpdg88rVLEh8T1BQKJjdM5TxzDMFQ0mYP+2wDHhoseLtE51Bjq0du66dlwTx
	 QRYSyzhRd44+C5EtieqDM4fz32eDsjNEPRqKmSZM3TdPDEUryqv7tUgODFDVXq5IVi
	 3mIi7JDM/CJTqNYsNTfUOuo3dgM6KIpyQsxCF/cjqiqVIKXUaGEJcKJwM0QdevZS/J
	 0OndZSRH/FHPCPTNEBlNwkAYVZEZB/2WR5e1e8ykyTikifuIqQQiKqBjUahngCrbcc
	 N60B9Rl/HCWdTmMX7axKJLr+QHEgz19uwHju5u+0xxY1w0j1h++M8lzVlsfQsS9hMI
	 hTkncSRJIomOw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH8-00000007boM-0Kvv;
	Thu, 26 Nov 2026 11:24:46 -0500
Message-ID: <20261126162445.893133896@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:33 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 10/15] tracing/filters: Fix quoted operand parsing in function event filter
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

In parse_pred(), when parsing a quoted operand for function events (e.g.
ip == "schedule"):
1. The loop 'for (i++; str[i]; i++)' breaks when str[i] matches the
   closing quote, but 'i' is never incremented past the closing quote.
   As a result, parse_pred() returns 'i' pointing at the closing quote,
   causing the caller predicate_parse() to immediately re-parse the
   closing quote as the start of the next token and fail with
   FILT_ERR_TOO_MANY_PREDS.
2. If the closing quote is missing (e.g. ip == "schedule), the loop stops
   at the NUL terminator without reporting an error.
3. The loop started with 'i++', which was intended to skip the opening
   quote, but also unconditionally skipped the first character of unquoted
   function operands.

Fix this by advancing 'i' and setting 's = i' past the opening quote
before the loop, starting the loop at 'i' without unconditional
increment, reporting FILT_ERR_MISSING_QUOTE if the closing quote is
missing, and advancing 'i' past the closing quote.

Fixes: 80765597bc58 ("tracing: Rewrite filter logic to be simpler and faster")
Link: https://patch.msgid.link/179323790096.740114.15868280894145147902.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 17064fa4a063..bce80a2c677a 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1865,22 +1865,27 @@ static int parse_pred(const char *str, void *data,
 		 * Quotes are not required, but if they exist then we need
 		 * to read them till we hit a matching one.
 		 */
-		if (str[i] == '\'' || str[i] == '"')
-			q = str[i];
-		else
+		if (str[i] == '\'' || str[i] == '"') {
+			q = str[i++];
+			s = i;
+		} else {
 			q = 0;
+		}
 
-		for (i++; str[i]; i++) {
+		for (; str[i]; i++) {
 			if (q && str[i] == q)
 				break;
 			if (!q && (str[i] == ')' || str[i] == '&' ||
 				   str[i] == '|'))
 				break;
 		}
-		/* Skip quotes */
-		if (q)
-			s++;
+		if (q && !str[i]) {
+			parse_error(pe, FILT_ERR_MISSING_QUOTE, pos + i);
+			goto err_free;
+		}
 		len = i - s;
+		if (q)
+			i++;
 		if (len >= MAX_FILTER_STR_VAL) {
 			parse_error(pe, FILT_ERR_OPERAND_TOO_LONG, pos + i);
 			goto err_free;
-- 
2.53.0
