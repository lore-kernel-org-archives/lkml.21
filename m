Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630720;
	b=wlRe2lCJ5p206ncDbr8kpawm0hkujE67eg/U12EWoWxff3rS277R7FSWFHzDK9HUQzBC
	 VPR3nvQpcw9txEjuc5gIYpxuCFpfZXpqNQk8s7qbLNLL6paUFIvjcShYR6P8MY0dFgTnP
	 Z7+2fj8ctYouNm4Yj24Lq+jM4oMozPCi5B2omJrPOt6wXjEuGplY1/bL/v7887rU/woeG
	 9FLhHdzUSv14liW0El7n9lsWd+ge+ddNvlYpU24AbwIcl9cnbcatCCFJcE3CZMZKE3cU5
	 izuIxmibBu0lBMRbNjO/Ca/0v+CubDCSyOMXNDh6imq3x0Wr3uBWbr9YllAIiy4VdUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630720;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=dH9gvZ5qNqPQgAlxI1HRT4BPIQCqQGfSZywf0McOI4Q=;
	b=wxH+PO+JzZvcGl6xNnJSo0ZJqaL/mgFNLy/B5+gMid6qxevudfXBJlcBEe3WOoOphXe9
	 JGPoyF7EObSgry9fXQMkmNQqRFyW6QlYEDSb8eCTSeUzh2KXAsHV7CTtu4o1VLTbz/cxE
	 wQ75Rbigez6vQ7XYvnsN+u0SC2j4vNeGg+HR0ecT1GNqq/XUo08lHJOckg3v3iZybTrzt
	 VkHEc5BOcoCntTII9rNXbm0tbSA1JQRw/CG2qoF1QLqR8HesWH86HcCn3cIdL3myw0vYI
	 OgY1R0n4RnPMt98c3jImVf7DHJJIZb8rTU6H0trw9OslVyTV3dmtGkCBcF+bSzUfc3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TTcl14oe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bLebZ10M;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6838D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TTcl14oe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bLebZ10M
Date: Wed, 25 Nov 2026 18:18:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630716;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH9gvZ5qNqPQgAlxI1HRT4BPIQCqQGfSZywf0McOI4Q=;
	b=TTcl14oer57ohrS9hUSZuZnLtaR+cLCR7XYuMH7Cu3VH+nfg95agRH4J3n61j3buAR5aCv
	koMa0sblWwzi0AqTSpS7RPyqcr1SccZSSW2K5r8+4yszplaPLH8cup64ram3j6H697FTeb
	5hLEIXHr8ReTYUwCHMBgjeHNLYcTxxs2fpvMPsek1/vbJs6IXMYHMnL/5fOKpl0JE98WUs
	M5i59f/EOBoYysBYbWd4eI9QnNQiW1jf30ocmOjberrPGj6fml++c6MX673l1OV4b495eT
	DUY1Rh8fSpEE5/eVS2ldwW/bmY68MidfmEP/7fDbEbrCgfB0aXv+A8O+S+m9Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630716;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH9gvZ5qNqPQgAlxI1HRT4BPIQCqQGfSZywf0McOI4Q=;
	b=bLebZ10M1Y1vN3xJCcPYGEu/zq2OPhAz4bZWfFYDAGsrXYPaA0caHxDW6+NhdwdDMsuT9X
	OTuYIah6xMomyaCg==
From: "clocksource-bot for Luca Leonardo Scorcia" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-mediatek: Fix "no-cfi indirect call" warning
Cc: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
In-Reply-To: <20261101095538.1046918-1-l.scorcia@gmail.com>
References: <20261101095538.1046918-1-l.scorcia@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563071502.92412.6445904557293763310.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     4b949fed24d8ad8fa0b046391869c37a9b1c213f
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//4b949fed24d8ad8fa0b046391869c37a9b1c213f
Author:        Luca Leonardo Scorcia <l.scorcia@gmail.com>
AuthorDate:    Sun, 01 Nov 2026 10:55:31 +01:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 18:16:45 +01:00

clocksource/drivers/timer-mediatek: Fix "no-cfi indirect call" warning

After converting the driver to OF probing, kernel-test-robot reported the
following new warning:

vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!

This occurs because of_device_get_match_data() returns NULL when
CONFIG_OF is disabled, which results in LLVM dropping the kCFI setup
since it knows that there is no valid target for this call. Adding a
check for a NULL timer_init avoids the warning and it makes the probe
more robust since of_device_get_match_data() could return NULL even
when CONFIG_OF=3Dy.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probi=
ng")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel=
.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://patch.msgid.link/20261101095538.1046918-1-l.scorcia@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer=
-mediatek.c
index 558bc75..764c30c 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -366,6 +366,9 @@ static int mtk_timer_probe(struct platform_device *pdev)
 	int (*timer_init)(struct platform_device *pdev);
=20
 	timer_init =3D of_device_get_match_data(&pdev->dev);
+	if (!timer_init)
+		return -ENODEV;
+
 	return timer_init(pdev);
 }
=20
