Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710286;
	b=Afy5P9PEQzMjD5+xjJhjc4qJaFRtGFCURGdbyfI6no7ODaqGRtjFZt11ZTP6RhnhARHi
	 fa5l4w/YsDmj4qLt0J9OWJHeGL0Vgg2Bw5tNpgc5LjYQzVIGTPxPKeAzqIJFLHMzDhawd
	 L0cI1vX6G1nVNvDHZ+OLisBWRD26yAhIJxpikXC8ZB3vCVxC6Od4gbrMML/yNBjKANNSs
	 kxfEerhh49jifunrTnoi9l0EyERQp4NTXNZ5dM+VlzuZ9b80DncQ60MRpYYcrrka4J/UB
	 /l2plVtZSq2KOjMO08W7VEeMaDTw4XpzMKKSED2WAEdhs2poh1fecv3XWR7VgEuk7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710286;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=cDzWhLbak4bgU/Jb7tmfOS8t0GVGPGczgp7BVlC2UfQ=;
	b=scI4RRokZWjKI4Scqo8FHXCXR+Jqfji6kjaQEDo2zzq1Z0YDZDtW3kxvg+VssNdWKZvb
	 qbzKS9ww8bZNg+Hf+/GqJuZ97tNzHQWGj0erdsE2ok8XfahVLkhkI66lZseik5bHqHpXt
	 DhXepuQwxpZP/TA7kfaXMiy6RchpM/SMhg7fBwRdUoX8lMEtLIHS3+mxEu0NHlcNhR4Us
	 iqiwXJ8/yjf0NJBRHpBEOsQBTu9igXTYWCm6N1C1eNdt0x8INBM8Vi6RwMoQkiDyt7aQM
	 KbgxP3n8eTbaD9k167ARzgnJMpEWePp9H3EKFMgkCwcDUrKTV1L48eHeb+2M8mYDL0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qq0I4Aqm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B117606A695
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qq0I4Aqm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6651A1F00A03;
	Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710286;
	bh=cDzWhLbak4bgU/Jb7tmfOS8t0GVGPGczgp7BVlC2UfQ=;
	h=Date:From:To:Cc:Subject:References;
	b=Qq0I4AqmzI45yBhMAQ9+39GwGOzF0ylsJBxntOV2zAD5aDGiw21DGuxmLmQkxBdaU
	 QimkwMgmCzx27FoxwU7kgfi2GyHLYz08IZ+ToqUTAsZhQNox8awK96dY1NCglZPOJN
	 q7lDOQ8dqF8y8C4qQc76WUaCPwtVy8pyV87pVCuEeU5jyuxdV1T7vQGu8x8jvjM7YC
	 k9mUYLkpnX2B9cPkGlkiohxaDHxZ8SeYVHXYckJmAXKwyvG/IywDLgZae95VneTptW
	 fwozhINxoEpxdUkmv5o/JfA4ijpxKt+6Qp9i/Ca2yTt+n03/aHu2cX3t8pOT2fnOnE
	 vCVSk9oJqg5nA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH7-00000007bnF-2quz;
	Thu, 26 Nov 2026 11:24:45 -0500
Message-ID: <20261126162445.494571221@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:31 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leizhen Zhang <lzsx618@gmail.com>
Subject: [for-next][PATCH 08/15] tracing/scripts: Do not reuse section pointers from a previous file
 in tracing-update
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

From: Leizhen Zhang <lzsx618@gmail.com>

check_data_sec and tracepoint_data_sec are static and set while scanning
the section headers in process_tracepoints(), but are never reset. When
tracepoint-update is given several files and a later file lacks these
sections, the pointers from the previous, already unmapped file are
used, which crashes:

  $ scripts/tracepoint-update --module a.o c.o
  AddressSanitizer: SEGV ...

Reset both pointers at the start of process_tracepoints().

Kbuild currently passes a single file per invocation, so this does not
affect normal builds.

Link: https://patch.msgid.link/20261008164117.3670267-1-lzsx618@gmail.com
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/tracepoint-update.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index c70c0b076554..ad5f691c150c 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -163,6 +163,10 @@ static int process_tracepoints(bool mod, void *addr, const char *fname)
 	int idx;
 	int done = 2;
 
+	/* Do not use the sections of a previously processed file */
+	check_data_sec = NULL;
+	tracepoint_data_sec = NULL;
+
 	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
 	shentsize = ehdr_shentsize(ehdr);
 
-- 
2.53.0
