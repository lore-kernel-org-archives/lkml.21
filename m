Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196476;
	b=x6JwPBGX50IyOSk0+oJ6nEGdlB3/saK/h0DimB6gbwF31zXRBApZLRhFtdkdG4voQISA
	 IA0Tsw/T9hlTCm+tzgcBhPmgX2Po8VbwqJLbZl0Q1W80GYhPJjiY3Ert7vCLLmgD1t0fM
	 SZbc6SCWnK3pepe8DofN/cWRGkruR2FfM0uiCl4YXnNwCZkDc1fqgCnuXE/eRZqHR267H
	 kJArFppROBgqyIUaK04DZodm1rMSa0hejPer//WOAKNbIVhuQLsc2ZG+S1qeRdQ5fJ5mR
	 ohxYOXlPW7J/s9VvnyrzLnSbN+foaDMAMxd6U/fTA8ephCuODLdhAEv/R4dzWjJMLtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196476;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=TSlE+GLf+lDREfxgE5u8VqL7MalTQsg/oY4ltcTrXjA=;
	b=Ci9eqk9TcMe0dLC6uwbgloJy0+ho+17F1fjo+as9XyvjcNnzfNMUt1HJ5IibRF0NXmzz
	 /4wa725rJktFNRpwPcVXGoeNkknJEvTE9/FQYtvGh3e/NISDU3U/WsJPASWdbyRZns8fk
	 nIVpUPwCThH8hZL9VnY2uIgykfnmAwJlmfkXRDNByqhnYvGIfYd3LGAZAZ9bFpXuGRo17
	 9sSk9yQMbMGVn4eSvXnG3RpCMXkpeXg1iLuwHSo37lm3Gd939kHMrc1aShaG56YpoGcTC
	 Nji5kDFrVOGhKIQludohyvRakB3SkLN2TCFpIhi+1fNyuviovG4O3PuKsHHEp0pomIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UAJ/aYoT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D736606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAJ/aYoT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08DD1F000F4;
	Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196475;
	bh=TSlE+GLf+lDREfxgE5u8VqL7MalTQsg/oY4ltcTrXjA=;
	h=Date:From:To:Cc:Subject:References;
	b=UAJ/aYoTt5KSae6g8jL3IKU6ewz5YAeGbIPfjcNLDm2T4v+T17TviewEcLlM3jPAP
	 2Gx6rx/0flm5kbbeSYrbqhssATp4h7HklxvR73YHhRJI7ETvpnVI5AbnOglTFmaPqt
	 BniUjG9gFIRaoqU8QJKBy3GyXg0YsW3cGbtnUOWAd7dC07lS9aLftvXTDyVsPJcmeq
	 uWndFNWTo4bc8y00r469Ntexh8Ogj25141gwxtfL5YjSZ2Nk1/RuZFSDx2Um804TJq
	 48jqcoJBUeiFwjXDl+nXSpbPJd97bBHEQ+B/YDxhkoHb5dtBVquB3VsX19oZDp71ng
	 c8sMt3mO+uEaw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbr-00000004aGy-0hF3;
	Fri, 20 Nov 2026 12:41:15 -0500
Message-ID: <20261120174114.986285656@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:38:57 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Carlier <devnexen@gmail.com>
Subject: [for-linus][PATCH 05/32] tracing: Define common event fields before enabling boot events
References: <20261120173852.687189370@kernel.org>
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

From: David Carlier <devnexen@gmail.com>

event_trace_enable() parses trace_event= filters before
event_trace_init_fields() has defined the common and generic fields,
so a filter on common_pid or comm fails and the event stays off until
event_trace_enable_again().

Link: https://patch.msgid.link/20261022204218.1222647-1-devnexen@gmail.com
Fixes: 084100a1b579 ("tracing: Parse filter from boot event string")
Signed-off-by: David Carlier <devnexen@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 49d135bc2fbf..c9d31c9f3fca 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -5026,8 +5026,8 @@ void __init trace_event_init(void)
 {
 	event_trace_memsetup();
 	init_ftrace_syscalls();
-	event_trace_enable();
 	event_trace_init_fields();
+	event_trace_enable();
 }
 
 #ifdef CONFIG_EVENT_TRACE_STARTUP_TEST
-- 
2.53.0
