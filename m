Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732906;
	b=c5yvv2qWfzigTWsZZaBAL6BVHAoLOwsk2Y7Am3rIHkITBYMl9lHzHnaKoKgFPkSa0vP1
	 OUbf/fY7qeZtCZLPcSCSD/V0T/9HkPB8Zt3wa36WNwdldFTVe21wk+Cs3MEbmpTDBg0Vp
	 aO5hMYxnE4Rjz1G5h/3hkUh/A1MFzy1QxveA4QvlNP5gksILjFAzTvkhA0/DLaYoLRgWf
	 SNe05EpEe1Z+pRO7L0/WOFPTT+YgTALcYu1uphgT+jJJ9swxejom4cRgIl2s/GZrnk9w+
	 hOBpoWG3yIwFlTHFpsON0ttv6Agz1k/mFp2oE2hXhFY3LtNf2gEMrj0Q4e9sXQe4U9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wbe8qmGR7CaI/J85PN2eS5B1PjlxJ4Y+2/7Z8JgkW/g=;
	b=fqc8UYPJV8U2NnEYL2g6YUaJ0TbPMPfJNgjiWss+C18VJN+V892Vsw3NLyPuDj997f8a
	 MhcsHzQKXQmleh5XRFNbDb1Zrx/DXtOOb2mM9oNrGGJXu4Q7b30fhciB5+gNYNc1KfaUw
	 dJ3Ctv+oGrXVQPnKylnyF9fMvFPkv71cmQ63KTtTyw76j33Fu4CPqZcjXpLBmxPZ88ME1
	 ryKpHnFLuGly7i62XxfnqXkglpQwsl8hHijWlYDMC7CJae46CH1mxByItylU834+8+y3F
	 DrmWtar8o0ULdeDzhKCjQ957UOmHg+/Ppz6+yoYmcKXkbtOir6qY1QWbk5T4xp45VmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=none smtp.mailfrom=stellman-greene.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JTmHMyAN;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JTmHMyAN
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5364042eecfso91059391cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795732905; x=1796337705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbe8qmGR7CaI/J85PN2eS5B1PjlxJ4Y+2/7Z8JgkW/g=;
        b=JTmHMyANPlI9jW7h9rI9H34UhqZmDzBwiUOu3ycs11iWGQT5Md3RPZwFn3jd2IEljK
         pJaoJVDmM1mrzByZq4yh5tgWnA+gSt60TVXrSZqt24cXxNJB59HODarhyXLJ/fZg+LU+
         O1UPL8IvJdZRHR5utR7CSYsoljA3YV0gEtukIMFzw3EF7ZvJTvuQXN1XVDFwv239lag+
         ytxJroSa76NKZ3c99Z7jAvuxArkW//3Wl0O2IMn0LE6nZaKTDmTA5Xhm5A0n7jBnTObv
         JFdm3qmeHF+PwOOQIpt238IjurWkJnVVXlzvW0OFLC7ILeGwwmnHC3Wfpa3hRFCDLz9D
         C6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732905; x=1796337705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbe8qmGR7CaI/J85PN2eS5B1PjlxJ4Y+2/7Z8JgkW/g=;
        b=lMLlaDP1CcvmKJnekB/xWZ7EkBqUbNkpbWuIlXOv6557jG5YyLMHTub3niu9a08LOZ
         OT423JCSb4CSydViCIZYXAkmmIdHNqDyJB0XEawOL61VTpskK+Lo+FaVf3Nphn5bbkCE
         T/+Tei0llsZpOZtPviU8gbcjzHKoijXYznNJVB9zS+ItcZSBRBaaI68SE7VKR/ACchAR
         SoSbE6RCm8uiA0uE/d1OvBYFGdl+CD9A7bw0TQ8JnNUYY3/ARXtS8lzGNoNutj/Eae6w
         jyv1Hc6Gk+06+d/VutGUVyrUNUWqQMdjE2Kl268dNZsqayE1hYgRZ/sEJnQ2aVbpa/cx
         Ob/A==
X-Forwarded-Encrypted: i=1; AL+hErGTFaVtsc9ROaOJloO95MkBXn+3nugJmjrz538xkf83ZnIQyJgwmbYYNs/Uj0zTesegXfI9MHpPf3g3pZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AArMe9OZ+BPzWEeuqk6NV+AWoQr3RLAxRD/DPUASyWEmzfxt5
	QPWEDfj4kr/1mvau7LiU/mxjuAGNFEaHQHaaZJUN/Pfr8B/H5sMby42ySktfvi/za30=
X-Gm-Gg: AZFdTZdMprA1DN7LgqtWHYaB69d6Srk/DSSWcfoa5JmYDgSKN662MWt/54F1VLu77pa
	+aUTF/dRghtpofijiHiHujeK1AmbF+NoWRlhppJOYeRSqTOkl+XTUxUPiZk3g06ReTZcysX3ocZ
	4GcbR1deMJpDiCSouzE1DtPQBHHuz+6ob53gwLCf2Uo6IkKENQMuspFLRLa1Ka5RyBpyetnS620
	sqSIKTV21GYCgMxmaejacZhK76c6Eo+P4IIZcLqdvqzTb/sLWAyXnRqAyL5Yv7a9wyPTYXOet9h
	NDuGEoNK39StZ189MQmgUWQWPyGfaYtczJM/y/l3J6G01arMjTK+a5qix8KIdTVE99YeYlis9lH
	556Nh6HN8HHF9/Bt0QbuiZ4mcy24xCE8pzymcyc2S8QntcJ5p+dGAxxH1pudhVe2crKwRObCcc2
	KB7VMmex8XMzOK27wSgXFBTEyvGVymNKPQ3a+CmmwmSpBGVTywnAQau0WGnW0ioaAPFpEr0QKQ7
	GI6y6/PL+Dmf1Amo2gd3Jr5MhUepGEkUprOxYx2LMdkTiE+SUIYFyPWTLr8Rk64rVuTbQ726aHx
	qRHXj6xtg2DGVtQhBMCWMUigJKGK7WSuAf/LqCoZX44WhQFBn/q1XGhrbhAAnWY=
X-Received: by 2002:a05:620a:2b9a:b0:949:6d95:f63a with SMTP id af79cd13be357-949bac834c8mr3664200485a.78.1795732905223;
        Thu, 26 Nov 2026 14:41:45 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a9a3:d406:9193:c9bb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm1675981885a.23.2026.11.26.14.41.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 14:41:44 -0800 (PST)
From: Andrew Stellman <bugs@stellman-greene.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] rxrpc: Reject unsecured calls to userspace services with a minimum level
Date: Thu, 26 Nov 2026 17:41:37 -0500
Message-ID: <20261126224137.55862-1-bugs@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrew Stellman <astellman@stellman-greene.com>

rxrpc_get_incoming_security() doesn't check rx->min_sec_level, so a
userspace service socket that sets RXRPC_MIN_SECURITY_LEVEL above
RXRPC_SECURITY_PLAIN still accepts incoming calls with security index
RXRPC_SECURITY_NONE.

Refuse security index NONE in that case. Kernel sockets are skipped,
because kAFS and rxperf set RXRPC_SECURITY_ENCRYPT on the kernel sockets
they serve on. This changes behaviour for a userspace service that sets
the minimum and relies on unsecured incoming calls being accepted.

Tested in an arm64 QEMU guest built from mainline 9437ee8b6cf6, as uid
1000 with no capabilities: a service socket with the minimum set to
RXRPC_SECURITY_ENCRYPT received an unsecured call over loopback without
this patch, and with it didn't receive the call within four seconds. A
service with no minimum received the call in both cases.

The issue was found by Claude Fable 5.2 and Claude Opus 5.5 running
Quality Playbook, an LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix was drafted with OpenAI GPT-6 (Codex) and this changelog with
Claude Opus 5.5, and both were reviewed by me.

Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
This only covers security index NONE. I didn't test rxkad or rxgk, but
nothing in them reads rx->min_sec_level, so calls secured below the
minimum look like they would still be accepted. I can send a v2 that
enforces the minimum for those too, or a documentation patch if the
option is meant for client calls only.

A reproducer is available on request.

 net/rxrpc/security.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/rxrpc/security.c b/net/rxrpc/security.c
index 2bfbf2b2bb37a..52015c73c583c 100644
--- a/net/rxrpc/security.c
+++ b/net/rxrpc/security.c
@@ -138,6 +138,11 @@ const struct rxrpc_security *rxrpc_get_incoming_security(struct rxrpc_sock *rx,
 
 	_enter("");
 
+	if (sp->hdr.securityIndex == RXRPC_SECURITY_NONE &&
+	    rx->min_sec_level > RXRPC_SECURITY_PLAIN &&
+	    !rx->sk.sk_kern_sock)
+		return NULL;
+
 	sec = rxrpc_security_lookup(sp->hdr.securityIndex);
 	if (!sec) {
 		rxrpc_direct_conn_abort(skb, rxrpc_abort_unsupported_security,
