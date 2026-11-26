Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710287;
	b=1t3DRmnM8qUIvwhF/Wwy2l4z8fL7pu11gGHtq+9vQ/Zf0PeazmtP9iCW8MxGqmgS2Jfy
	 0i9zfdiAwDmK5fVQAy/MU58e2Az7DWbXYIuF4YGpF/UUVayiKMRmR3953Kr8FoIgyx/i4
	 GOF0DMqsymXkD+W3ZIoLj1IX4u0fZiUd6a3f4CbU014CeVJcsKlW3WJ0bTvRpdHX7Y0kY
	 cie/ynVzC3iaRFBOvhxDf59R9+tWovhZQ5PwrnQFuXzKKrxcSy6nVMYvdWk7doLHrFss2
	 vDmSDmyqG/2QkM2EtG5u5SZy48forfthOThh2YXwFlbvJ3N5RT7uKiPTttfXicXLeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710287;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=MXfnLQc8QqSlSv99NQlnF4nC+p/fImJWA5CTJ0l45W4=;
	b=QQlElkI51M5D5kJM1Psm00Y9gAR6EsPYzI9ppI2RZG0A6Ci1YzgO+sUjwtGpX2SKjpNh
	 wtt292EyCOsfYoQCSUJT0LTLD2R88VUsGtorE09KRaEEvDmzx4zeiY3erosmg5J2lHVlo
	 NtKZ8WIE1Zwun1AoflwJ6mSOeE+5yJ9DtT0IMvL8FkXL6KRXZT1kbnV5TXvYhmeCdLqRX
	 YXJQ/faOWZIwzMkFX6KTS71LODJahMt+sb8nmky+3Zs4qXEzASpmBX+b8vdTvecTulTIh
	 WY+/U/nrho2dC/OMIc0WiihUq1dnLpYHplcMxB2hbtzCdbDXsUOjV+ZL9Q/jvx4hNMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nE51W2Em;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3311606A6B6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nE51W2Em
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913041F00A3C;
	Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710287;
	bh=MXfnLQc8QqSlSv99NQlnF4nC+p/fImJWA5CTJ0l45W4=;
	h=Date:From:To:Cc:Subject:References;
	b=nE51W2Em4Sv8ORYaJ5MR9iqLTebgPcxE9SB2Av62ZxecYTm/dTXDFROopndn83pLu
	 tSKosQUMFw/HQ151gzVSWdJc8EjZ6iMkp0oOM+dlpMPXUC7BRKi0+ydG+oTwkY63rR
	 3HIRLWvv7ItxxB3F5N3aY3+yUmC7LU8m0rdrBxLbf0kwcHUDa2qKWFugKWBF5wCMMs
	 uzNxZG7p7jDsO/9OCh4tmBZaaJ5EkoOgN6jvLwsCvO2Y3DISSpB4aLCuYWElC6dNCr
	 /t9S52KyEHbLZXN8V+3dM/Dq3tQaWvVy0OWeddehAxtFm0ZMcvweGMS7LLH8GGfst4
	 6GR7oaIUpkHHg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH8-00000007bqb-3j2s;
	Thu, 26 Nov 2026 11:24:46 -0500
Message-ID: <20261126162446.718174269@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:37 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 14/15] tracing/filters: Reject stray quotes and parentheses in unquoted
 function event operand
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
the loop only stops at ')', '&', '|', or the NUL terminator.

However, calc_stack() parses '(', '\'', and '"' independently to
determine stack depth and string boundaries. If an unquoted function
operand contains stray quotes or an open parenthesis (e.g. "ip == foo'bar"
or "ip == foo(bar)"), parse_pred() consumes them as part of the function
name operand, causing parse_pred() and calc_stack() to desynchronize.

Reject unquoted function event operands containing '(', '\'', or '"'
by reporting FILT_ERR_INVALID_VALUE.

Link: https://patch.msgid.link/179323793740.740114.16357488115964317102.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 097b432647fc..588215f7252f 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1875,9 +1875,17 @@ static int parse_pred(const char *str, void *data,
 		for (; str[i]; i++) {
 			if (q && str[i] == q)
 				break;
-			if (!q && (str[i] == ')' || str[i] == '&' ||
-				   str[i] == '|'))
-				break;
+			if (!q) {
+				if (str[i] == ')' || str[i] == '&' ||
+				    str[i] == '|')
+					break;
+				if (str[i] == '(' || str[i] == '\'' ||
+				    str[i] == '"') {
+					parse_error(pe, FILT_ERR_INVALID_VALUE,
+						    pos + i);
+					goto err_free;
+				}
+			}
 		}
 		if (q && !str[i]) {
 			parse_error(pe, FILT_ERR_MISSING_QUOTE, pos + i);
-- 
2.53.0
