Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685485;
	b=UFwoT4oZOf8ikqLTxlp1/5pYj7BbaF0d7+R17ur8cAM7NiXL2hjkfpZPnaN+RpcWwvti
	 WCN9kJvf6jMkwxpq6+Mu5YM9T4tXcldjB7aFSJgN8iNxbYMtawzGAE8ugppAuVCINeuTw
	 OQchltft+6R8vWl0hp1X5wLo1QuMczlTC0GLoK0JOStX6hgf1Lh6NERIqUdS57d+MLR0z
	 zIWGddoeRsz/sBl2EXHoe9AURRs34nQPpvOcnjVkV9vlxMxd+Gk/69e5bbEuQn1vFkaKj
	 5ybFoLge/0HvSa8a4agQjOYUZMwkpFv9T5i3k0wEfgP+0+lPdYbLv9xyYXnWb/SXhRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9TO3Aq7knsuXUdH7NBurIbnP0YvlZ2ZwCn4tGtf47GQ=;
	b=lgB5MK/k3NMW36Eb0m7tNtdJPi/4X3ZQGJyygVayOSETWAtez0e2mnanuXRHMWj5h4Wk
	 cPTr7MDbHnGbiblUxoto5r3NXUDNdxPDrKB8+m+ZDyi/8gOnD/cTplrjQ6+HmcLEjTr5j
	 6MrSU/3AKPjpPPBZMJvukDalO5PgKbXyFThvigUUcQmrN6Tgs5q/KM3aBvGG+RAtExkti
	 +7wYQrqA7Ay1CB4IxMCPeqKJxXDUrLL7hhpobamtDFxGdH85ZD1itjAdpPNVKdlCnp4fY
	 JtV6V0Wb1iRt4v7NhTF7yDZLNJ/TBv5icmF1Am0UUGlhAel9DkzTG3z0dJRvUPJGngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E43HplFt;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9A606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F9A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E43HplFt
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so1158047666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685484; x=1796290284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TO3Aq7knsuXUdH7NBurIbnP0YvlZ2ZwCn4tGtf47GQ=;
        b=E43HplFtGOMrWrrUbPSnQUTjl/zR46WD34Dkq/2vWpUQly/l9mnDTQHLg/dWDh1u1x
         2qbK/SOnbyTjm6uiGdvvVObvQn4oBHyPVhgIkQZGZ97ZzOlesguUCA7czvpyU78TmK/W
         95IhtxBLTni3M7IBH+xtB4rKRIxHemytv7X+nxj0aylc8DXOWmvcG9RM1sMuNLRWQPgP
         pmAvsIYM1s7LM1fStCycGyIG77JCVydr7HOrc+0EO8E/nyqMX5bcExiinMlyAYU3CKjs
         f8xBU8pS16aLKsVbJmb+tU18V7XgnxIRpPuEf6NfP5zLYOYcTuFTRQ4V7B9GNhXu6BQ/
         pn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685484; x=1796290284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TO3Aq7knsuXUdH7NBurIbnP0YvlZ2ZwCn4tGtf47GQ=;
        b=zrONSg4ucImyPrqCh3ykZV6mOJ+2No+6qpbDUHD02OXD1WxDYtdP1tuJyEjQhMTDMr
         UKUCIB+Ix93DPZrjrreKselJcqA/bqEtz5U5dK2h581IrrqbGIqtBQGytnhgDkVIFrOl
         0OLlZkrF5NClOvW2nPm6WPsKony+FMBbFJHnzQItqPWjeLOXT0YjX3k8GV0jJHbACTq7
         jIjKomNzZe7AwQ9KkgINlkHes90PBvixSr5jO/jM8O6K/yDm1fUuhNnlJRgYPkYxmnHw
         W6h0uuCwM8653P9zLx7d2n2pgtHdyXQERoeako7djurtn/B9ZM5rYPF8SZb2ih9yCrVZ
         3w+Q==
X-Forwarded-Encrypted: i=1; AL+hErGQ1BSXTk4OMGn93fM4HVuLOavmQ2Xqgb12x54rOAJrZfFkFk9I2DvoQJC9p17Ai0Gs0gYLJSEqqyAIFUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X40qBL4IfQ6S/p7RyKuConAWN0K7D11PYsfgnHYSGorwXzV/9
	6dV8XhcUPNLSUhHg52LyAm5Etn5Pi22Xn0oBABPCXRWiJ/gq2lWrY+etS/iOJdQA
X-Gm-Gg: AZFdTZdWHkt/jZlhgPhjCYV0lyFRW2HjJPywo2IRhoEhLtErn54jlrFd6F9XP3vJP77
	4Lh1Pqy4J1SGnUN8vdHpwRe8d1dRmaWdiUmkymfqIBFe01TakByw+pMMVR9umJtKJzH92QzeSgm
	I5Y9krFAhPXjcREHXiChqeUu27pktKN7VrbnP2lvsMOtPkcwxghCOSMxOGOHeslj/S23fgGC0FG
	YbadkSybpAGS5u0UU6XwVsShsdtfI3LbIwYu39ALLZ524mMKQRs6ICD9+EQVkg0bgFwTXblp14j
	QCv1k5qLTG5Cn4z3wo181JCu9x+oLky6kdnM4DCtjlI5lrZi7LZ4x6TmanmsuSiW3txj1bLiWVu
	4BvguvLaqg/RlZVeosYOYX/blVeeG6zUJeHpf4pRPVuLCGJAQ+fBZrjyCEFd4e3mbDn3d6LvWkz
	Os8FqWvkyZXzOg0KngtGdE0XZT8JDREJbHS/ElfueakTdBd5pt+YVxVWc8MT+awYB2vXMgggCKA
	XFc7eAYFQBfrgH1njSCmBf57HN+PAiDBPsIVDVlFRkgTADsnyoekOWTzH0PUttEEAGdyQ71+ZzK
	vxo4T3Bel7/zk9ZYTOB6Z8Rx0kczVqFDCWpVtIIOm51YEF0Yb9ZMEIllZaqiTwKMhHzbhk6Js6Y
	3HE5eGn7JNsJ7qhsedA==
X-Received: by 2002:a17:906:c14b:b0:c35:babe:ab44 with SMTP id a640c23a62f3a-c513a1e0076mr2020213366b.0.1795685483801;
        Thu, 26 Nov 2026 01:31:23 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:23 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 04/18] sparc32,leon: avoid nested IRQ accounting in the timer handler
Date: Thu, 26 Nov 2026 10:30:09 +0100
Message-ID: <20261126093106.1345825-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

handler_irq() enters hardirq context before genirq dispatches the LEON
per-CPU timer. Entering it a second time around the clockevent makes
account_process_tick() charge idle, system and softirq ticks to hardirq
time. As a result, htop shows idle CPUs as busy.

Remove the inner irq_enter()/irq_exit() pair. Commit 2cf9530420e4
("sparc32,leon: per-cpu ticker use genirq per-cpu handler") removed
it when LEON switched to genirq. The clockevent conversion restored
it. The sun4m and sun4d tickers enter through dedicated traps and
still need their own pair.

Fixes: 62f082830d63 ("sparc32: generic clockevent support")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/leon_kernel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/kernel/leon_kernel.c b/arch/sparc/kernel/leon_kernel.c
index a43cf794bb1e..e560f0237165 100644
--- a/arch/sparc/kernel/leon_kernel.c
+++ b/arch/sparc/kernel/leon_kernel.c
@@ -289,10 +289,8 @@ static irqreturn_t leon_percpu_timer_ce_interrupt(int irq, void *unused)
 
 	ce = &per_cpu(sparc32_clockevent, cpu);
 
-	irq_enter();
 	if (ce->event_handler)
 		ce->event_handler(ce);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

