Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710287;
	b=oLOpIxfNdGUNKbqejZbc2l3SHOxFsCI2N8XEdhkq56GLvl5AXRhvvieHmcNnWawj8oEQ
	 WdyQcPQK5QqsCCLZ7KjiB4aLcviZDo64AqgCKNnlLJnXbmFg2b4IudtWHj4TeAvUPos7Y
	 oeHU2raS4uB36pB3AbQfiB5SIe3XpIAnawY1+Rv5vtiBHL5A2wFiIZ+nlEyS5VJRGHBrf
	 C7MXcu1FlXPg2BUCRnbmyViiu9+g23EmOD2H/9Rx5XrW7rozxnxSpw+flPAH7WN0CazBK
	 /VV0mPexLVBMnjJv5hzBgnh2bPCfIQQUvM2uQW9iOV26Q8YYU0/6+H+4HYFuYpZpe4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710287;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=aq2MROccW9VvgwnjEz0Bl1AraRkNChapWE48Yh3jJFk=;
	b=B21azNFHly1E8rR20fPl30SvW8LwyDVVlw18ob3CtgoMhDTuXZRvsCqwlp3pZ/uPsqPP
	 16hkJSRMoDlnjobd0rk9rvZD3/9f61tYSbq5TRYRLxsYFKC8b5yDT94qKOs6PBsZp+ysX
	 H2PGgNMdh9AqeVhY7xw8fECdeGZxEtxvuwjz/jRj4QZUrgWJfa3Lww3QWEd2Plkrnh49F
	 FnH/2BSkcrSi6Bb9Tnx4Zmauv2akE3SnYHj8cKj2A6T8klKIrpkBPk6y4ITlNNFWFkMbL
	 FpyzUHQisLPq21DAcdMpUL+ru3uUF7sIErvPJUU6W66sBUNxTfJ9fsDTYzUxZY0hJBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHTPUteb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C129606A6A1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHTPUteb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA78A1F00ADF;
	Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710287;
	bh=aq2MROccW9VvgwnjEz0Bl1AraRkNChapWE48Yh3jJFk=;
	h=Date:From:To:Cc:Subject:References;
	b=NHTPUteb5vKLdPAhBHWB270AFl6LoBUiZUBkyqGQ6E8CkYlIxK8xfzjdkNO+g613V
	 fXXfEWjvabX9USA0DkT9VbGUdNTalNN7CG2JP56ov3sfrCxu7U/21XfLOe4ec+nEGe
	 cOk/9UHTP/ej1YrO/8DiKGg5PhyZhAnPHT+k4Sh1fvbArcjR7zWeb0tH5yvvocdhhu
	 od4ArhENn44WoPCOSLcsv7XWCM5REamkF2OuWC8nLY2ZueUxXlIEEI+E9gIwNv0WU5
	 pVxE2yFkf5nU7bitQgbOFUOJYiH+LHWQnD5++82z4eWaqDz8k4M2SXBpUl5dteYdSE
	 slUsCnr1nLhdg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH8-00000007bou-1Fs4;
	Thu, 26 Nov 2026 11:24:46 -0500
Message-ID: <20261126162446.102860319@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:34 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 11/15] tracing/filters: Reject empty unquoted operand in function event
 filter
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

In parse_pred(), when parsing an unquoted operand for function events,
if the filter expression has no operand before a delimiter (e.g.
'(ip == )' or '(ip == && x == 1)'), the loop terminates with len == 0.

While an empty quoted string (e.g. 'ip == ""') is syntactically valid
and denotes an empty pattern, an unquoted empty operand is a syntax
error where an operand was expected before the delimiter. Previously,
this accepted the predicate with an empty pattern.

Reject empty unquoted operands by checking '!q && !len' and reporting
FILT_ERR_INVALID_VALUE.

Fixes: 80765597bc58 ("tracing: Rewrite filter logic to be simpler and faster")
Link: https://patch.msgid.link/179323791027.740114.822862076687011726.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index bce80a2c677a..79eb187be39d 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1886,6 +1886,10 @@ static int parse_pred(const char *str, void *data,
 		len = i - s;
 		if (q)
 			i++;
+		if (!q && !len) {
+			parse_error(pe, FILT_ERR_INVALID_VALUE, pos + i);
+			goto err_free;
+		}
 		if (len >= MAX_FILTER_STR_VAL) {
 			parse_error(pe, FILT_ERR_OPERAND_TOO_LONG, pos + i);
 			goto err_free;
-- 
2.53.0
