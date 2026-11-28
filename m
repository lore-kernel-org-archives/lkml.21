Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834348;
	b=oTW+8S1jfuEi+TT+h1NmS5lVrzKRwJui+oRkWvQ+emZjlV0Qol/AV2zm0siHZyEigx+T
	 vARu+owWdoo+uWqykVYO91HAptA4pSPVsVsOujKDuz4bbMGG5wvEpl82ITamZlAONjZW1
	 hCXBPoNFiH3dlaAgH5c2GdtwHLClUXaAgpWvrluHGM6GoSMl1ZxHetyImsXvBggocjuN/
	 8SPTRlPas+oYpS7c58PjBe3GLqUiBqIvqW9pqjyOCdk3XoxUslezJWpHtl3Q1LvIEjmVS
	 TTdpcyh5LhnjMoGrKKhcqjo7/kCVIQReE3HlMybILfB4YLIPah6Nxwy43P2syc52g9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tZEOAosPCU3HmTotZCFirLF+uBDQMvQZe2sF1tiSxjc=;
	b=cfft1vd/nH2FuN8HLh8H9jlkkp+buo9ES/itekAs9XObnaPatQVZV57K+SG4IXwNPbNi
	 TC9CNxhydm9KbWAnL6Uov9w7MGQt0xAbmcFcMUZMJTVlRZ54Uywbu8670vVZb68A4Vq3J
	 5BwkVYgbJ0Br7QnybEsczXZE9l4eHNlBQy/HSACmDO3nogU5xS+tHF5B+q2b2e44vIxNv
	 4a4P7loVVNtyK0RGcu//wDd6FH8SGRCGnb0zr8Cy3kUgH324tSuu9lZ5I0AcemPlZ7Nqw
	 fVMgU9jVR3gm1zOsEXskuULtHDEIlGTDy81gNDiwA3sOFn9WwPMQYWQuM0eG9tvq5tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AXor6nH1;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5A606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E5A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AXor6nH1
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so3159478a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834348; x=1796439148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZEOAosPCU3HmTotZCFirLF+uBDQMvQZe2sF1tiSxjc=;
        b=AXor6nH1PIBipL0ECKldgFBbuc/w4NGi3Wy/tr0lpnvUj8lZqUCraIZxfY9SEcEWsE
         auQZU32U9ERANQHA3IX0UrGJL3ZZs3zMTaeIlL8TQ4Mg0weNGSj+NxYUm99UwJVHwpV4
         /qecSAEN62hR7yibRb9yKqQvuuWbtdgJ69s/IZYjiomM6H8SZPJ0ubb/BOrBNi+9/5PG
         /JHxfpIZJRmntWQomFhr21JpSgif3ZwNSpsI/zGK8USTkjTAOuA1XNh6BlvZylLzuR3y
         Ob/7qLhyVHFAFyEhm0AKSqHsPvLyZ6do6j3K4PnlTIlvapOb5mf5qAgd0KDAB3W+ltFM
         zppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834348; x=1796439148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZEOAosPCU3HmTotZCFirLF+uBDQMvQZe2sF1tiSxjc=;
        b=qX4xEV79dgtTbfXHggFlogYYXFMFE1puLx0f+lqBInf4y/GVUXTS3awK95DPYHnGel
         Y7dhxw8oF6gX+2nWwQR02c6LQlG48Q9qWYapSg4qK2WG9YoSc5YMxvIGWhWC+dwQQpWh
         yNpKyC98PIRK7Qa9iWlhgkZegcqB8fzHbLyxaf8wvkwzuoT3zlI2yBoo1Kb2PsrQ9SBb
         wGsy0lDhLnmjCQHFxYL4WrBMaTdHovTM0qeCwt/LTRVUDXkpi4OtL8IBCHwVh0sGdISb
         bJMdrsBFq+Jy0P2gniGAQgmBZVLQdkG+6QV69cUMptNOYWW5/WEm6ywLq3TgOpWLFJkM
         dt2Q==
X-Forwarded-Encrypted: i=1; AL+hErGrXmSwngDKMKKbO6Oa8JW99BFOr9vcV2rtRO6yBYFTeHeCa7orS06gWiYaCe6HV75TbrvQIAfv4TC4Bd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gMc4GuRjNz+OaYMaWqNP2uf9ikHt7rMGnvP4qvfVGWU2y5IMe
	034ceKGoHWEAtsIvKzNZ4P+Ixy869LuZU+Oxqlbue7GCeMxQ4lv0fb+u01uEsi7fB9A=
X-Gm-Gg: AZFdTZcTpy++wJjH4tT3jJLtoYMBCgsqJV5XGK8n0dZwbtHKTCYHTQJNq5HN9FMnv7W
	bMMqA8c/KVmv29elEGICjgjED5PJpOwWZXXu/aJE66/P68CQ02hmMREfXVylITipQt8D8VpHiCl
	6bNGPlWs5Z+Dj8S9c6S71Ws0STAuV7yUhDUfidxFyh521EEnxPFbX1nR4iroqJmXysPZOGrqjBC
	EKiqvJqddNvExxbtxsXvpGS/Z/4faOoaZhRsIcIaLPfgaky6nJII4eU0pNwaKTOBqMr/eN9FETR
	lrVIovj4z7iZOKA1+F0MgiS5sk6UCKAGT008vQBWWopYTd9WAO5H/1lO1rM923aZ6p7Lz4o2TD0
	vLrqjtzzclGayPUcG5AxBefk6buua04/efsKDVZLacc+1/cjVq/l9y0lxAydoMxBfEjrCjtrEUk
	FpMTzPRTgCOJ2uliVK7hineES65jDYe4+acQXJO7u7lVCG+3jg3llMADfE2HZdA6uWRdixwZrpu
	dW5B5FWx3s+u8NI/4+MuI+WgfJWXdcSpn6X7upF9ti/qeXVdZ3ocj7Ev7oUN9C/il6FKeUVPZqC
	7Nvyta532uQhfrGXkZNWLLEWXEVkKfYbw5k/38qiDsQCIO4aCPB+kQEtj7BaUarRDakVZdo9VW/
	rzOkxuo65NfhuUA==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr23863138a91.32.1795834347869;
        Fri, 27 Nov 2026 18:52:27 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492413a91.17.2026.11.27.18.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:27 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 2/2] clocksource/drivers/timer-npcm7xx: Register timer1 as sched_clock
Date: Sat, 28 Nov 2026 02:52:24 +0000
Message-ID: <20261128025224.2680046-3-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025224.2680046-1-william@wkennington.com>
References: <20261128025224.2680046-1-william@wkennington.com>
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

timer-npcm7xx starts timer1 as a 24-bit free-running down-counter and
registers it as a clocksource, but never calls sched_clock_register().
sched_clock() then falls back to jiffies, which leaves
CONFIG_IRQ_TIME_ACCOUNTING disabled at runtime and gives coarse
scheduler and printk timestamps.

Register timer1 with sched_clock_register() using an inverted
readl_relaxed() callback matching clocksource_mmio_readl_down(). The
counter is the one the clocksource already reads, so its 24-bit wrap
(about 1.3 s at 12.5 MHz) is not a new constraint.

Tested on an NPCM730 BMC, where sched_clock now has 80 ns resolution.
The driver also binds nuvoton,wpcm450-timer, which was not tested.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/clocksource/timer-npcm7xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index c7377f30e95a..f4b828d7c183 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/clockchips.h>
+#include <linux/sched_clock.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include "timer-of.h"
@@ -166,6 +167,11 @@ static void __init npcm7xx_clockevents_init(void)
 					0x1, NPCM7XX_Tx_MAX_CNT);
 }
 
+static u64 notrace npcm7xx_read_sched_clock(void)
+{
+	return ~(u64)readl_relaxed(npcm7xx_to.of_base.base + NPCM7XX_REG_TDR1);
+}
+
 static void __init npcm7xx_clocksource_init(void)
 {
 	u32 val;
@@ -184,6 +190,9 @@ static void __init npcm7xx_clocksource_init(void)
 				"npcm7xx-timer1", timer_of_rate(&npcm7xx_to),
 				200, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
 				clocksource_mmio_readl_down);
+	sched_clock_register(npcm7xx_read_sched_clock,
+			     NPCM7XX_Tx_TDR_MASK_BITS,
+			     timer_of_rate(&npcm7xx_to));
 }
 
 static int __init npcm7xx_timer_init(struct device_node *np)
