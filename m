Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429398;
	b=UImQPlm+VX9dv9eido9NMgbh/kArGZw/By6/mtuOkTd4MbWE60jCFJ9E4Y5vm8aMnn9a
	 0LbHx0SXk1K00nDVdHD+vRqNAphT1ECZjHd/yxBVLhTsHNcybdiwPjsRxRk/z77sc1JvZ
	 Vj36/KyLwObFNPdGYEoZ4xGqKuXsu7Ppbb1zDz/vMF7MEF4yXVL+q/blAIFhlmi2Gqtf1
	 +xtkPHc6+Pr2o74Gwws82Jo5NS/UpBuewu8sS4UN6RT5/lg+YErc2uyKlnNFEvQavyauo
	 3IqY9ecVCpQdvVRDW3y+ytqbg3bhNfrAXrO9+UKNGMdWXntrvQ6VmMaoEgSturcGEDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429398;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=EsQD7tZ4Wf3L72FOJTqSD89P27ihkIdGjp2ayczfW8w=;
	b=UVAq4LBjgax+cowbACGfwGyqaJohkC2w3tZ3xRUEwGFBy+Esc25vVHUhe5XhuhZYtvfC
	 WE011a+WBTN0FPVtuGSpDddbZPOQSDTWtJ3lHQYJTBJi98z0xYS/OSD/DVL/d9AC1vbS3
	 SaCSW8YuijfUaR6LnIz8kGzmzMyzBKZ5ZSYXUKr1gADgTL5tQTq9KAZUdCtacJ78FS28S
	 Q7s2usipoULq71RsbCdv6MXQc6u5OwVoDvtSwzu9MoLTToTc8dHcsp7H9lsQ6bejDT+u+
	 AaAtBV+ZBuSVHlSyzT0GYtsCQiOjFGqwzyaFA+u8TDUv1rAm6vdJr0BTmhL5XxlQYpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ntPDN1M0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xG2+8Afv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7681606A683;
	Mon, 23 Nov 2026 10:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7681606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ntPDN1M0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xG2+8Afv
Date: Mon, 23 Nov 2026 10:23:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795429396;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=EsQD7tZ4Wf3L72FOJTqSD89P27ihkIdGjp2ayczfW8w=;
	b=ntPDN1M07DPKJkERe8OjznhYmPU1O8b9ICvlwpo7vcqC4Swfny0i/0FqB7DJYrl7+RDwTH
	dcglNyMnJXHILZ8wESxs2iYwHOJka0gwJvW/DOEawepd1xAZ78QTBv3GQNDWLXqKXS9tZw
	sLkoMKt0sExGoaZ1Vq98apvp0XJL2KMDqWzvu8Ll6rJtfTvNfn5AGHM06hDdnOJG0LElKb
	lc1L07+L33/znuWEbUVRAXVPzJVzGM6deotKdsyMuZZRqEKumQjwOqIET6qMaKpk0fsuXb
	PD1scdRQNJtMTDQsx13fxmjzogksTjDMnI1cqL5U4rmdP4S4spLTtC5oiF5nmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795429396;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=EsQD7tZ4Wf3L72FOJTqSD89P27ihkIdGjp2ayczfW8w=;
	b=xG2+8Afv7CmXPTe3Oc+WlT6aaOERMXx6vInbC8cyJlNZBOu73a72XnxgGioTHSVleq0brz
	l9I31SXfOVwka7Aw==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/core: Convert perf_mux_hrtimer_restart() to use guard
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542939435.92412.5469861104022866543.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     2981602e99451e209b64803d45c97537e76c6154
Gitweb:        https://git.kernel.org/tip/2981602e99451e209b64803d45c97537e76=
c6154
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Wed, 18 Nov 2026 14:18:03 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:56:49 +01:00

perf/core: Convert perf_mux_hrtimer_restart() to use guard

Simplifies the code a bit.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org
---
 kernel/events/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index d971c05..38dac15 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1324,15 +1324,13 @@ static void __perf_mux_hrtimer_init(struct perf_cpu_p=
mu_context *cpc)
 static int perf_mux_hrtimer_restart(struct perf_cpu_pmu_context *cpc)
 {
 	struct hrtimer *timer =3D &cpc->hrtimer;
-	unsigned long flags;
=20
-	raw_spin_lock_irqsave(&cpc->hrtimer_lock, flags);
+	guard(raw_spinlock_irqsave)(&cpc->hrtimer_lock);
 	if (!cpc->hrtimer_active) {
 		cpc->hrtimer_active =3D 1;
 		hrtimer_forward_now(timer, cpc->hrtimer_interval);
 		hrtimer_start_expires(timer, HRTIMER_MODE_ABS_PINNED_HARD);
 	}
-	raw_spin_unlock_irqrestore(&cpc->hrtimer_lock, flags);
=20
 	return 0;
 }
