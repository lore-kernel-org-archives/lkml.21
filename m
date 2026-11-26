Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710286;
	b=Ar+d2AeHxKEroD/IYeLQ22uBxF1e7cTqJBHrOkgYoohMQSR4RKADgQAwA1aRou394NlX
	 TZUQbyzn7npfLv+b+1WIS8Zwxgu6P26SaHQ3s/nJTlkF0q4YEz9IuVqwkn/8IKf2PnEo+
	 j9DgMe1HQQGuw9nb5hyWlzI27OszPARF+99486iDsirzcTvQzh7g1LU2FblmvOENElY9O
	 fmlEsvnjRnXvTaySf0zSqj9fzE7z+8ALsTpiwOMrKcLZpxK70nKKzyXv5juqRQdnoy4P9
	 ojczn9JRkcSdwOxc5C15pxVniucYt5mCy8X+/Jo3M0BGOlq9r+2fvACBgqUpC2h0crQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710286;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=1HGVy+WEj+ELv3TABRLj7M69dv91akjBbD5aA7OOGmM=;
	b=jwlC4KjGE+UL1D+dbPzL/RkZLqwMUJd2arTw/eCwpBCYm4TvyfcQrABknYJDTXnIUel+
	 VcH22oQX6GEF9/sVdm/jLPrvihuZfqKyWvisOzztmucQOOdDiX2bF0esBoxG1z/iuFApZ
	 01GqStWPXyq1FvYJPYu7UvJQAgT5MMHp+V5OyLxU+PR1946MQ5SQbO7Yu6226Kjp8H5QF
	 Ylkjzgh29X6PkFXy+WpW8rtOnV1YiPUagwZgfRNXM4hGv29xxJQ/4x/++XY5NkaQhFKj/
	 nyv26I8KNqNXvsU21btOJnllv7q9N8ZyMjuy5Ace85qojyrg3IqceKtXJOkgRb8aUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIbsq1yd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6894B606A689
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIbsq1yd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB741F01564;
	Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710286;
	bh=1HGVy+WEj+ELv3TABRLj7M69dv91akjBbD5aA7OOGmM=;
	h=Date:From:To:Cc:Subject:References;
	b=cIbsq1ydXbdElmiOziqPCzPxs+PoqnIKrMqmd+CDr3i5Uc/0OiX98zBU9oG/cnbgB
	 7QbteOiUVN9IzC7IBKfAyYcdb2iEO9CIwptt8yJs+D1SDGCGDzSHgmjObS6enwuEWs
	 eWy1sC/sYDzSyJHRJBwKmDuUqYUAhNy0+0y3Gxxi5aM8EkrVKfIXmBhxJWcVx+ZaMA
	 KF7MGZsqyU+3QhV4+vaCiCQiAL10Z7bAxOvAvfFW+M3F78mPAJnRF577far+wNGiLZ
	 8vl/JmEfcbS+coCQrCY3eM4T5y7zrlecxa8fTPQUv/fEmUO5AqnrDD7q5lHsjYFXbO
	 QBpFP+a2WiQTA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH7-00000007bmf-1zHE;
	Thu, 26 Nov 2026 11:24:45 -0500
Message-ID: <20261126162445.281794686@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:30 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leizhen Zhang <lzsx618@gmail.com>
Subject: [for-next][PATCH 07/15] tracing/scripts: Check the section end before reading a string in
 tracing-update
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

for_each_shdr_str() evaluates strlen(str) before checking str < end, so
after the last string of the section it calls strlen() on the bytes just
past the section. Check the bound first.

Link: https://patch.msgid.link/20261008164117.3670267-2-lzsx618@gmail.com
Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Assisted-by: Claude:claude-opus-5-5 ASan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/tracepoint-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 5cf43c0aac89..c70c0b076554 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -74,7 +74,7 @@ static int add_string(const char *str, const char ***vals, int *count)
 #define for_each_shdr_str(len, ehdr, sec)				\
 	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
 			*end = str + shdr_size(sec);			\
-	     len = strlen(str), str < end;				\
+	     str < end && (len = strlen(str), true);			\
 	     str += (len) + 1)
 
 
-- 
2.53.0
