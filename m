Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697446;
	b=LC3MYKQYPqPWM4dSzGD/d0W1CBkrhCvCeD4Hh0BXMTPSP1TaR00yTxMN0euNVePCXOr4
	 X+oe/x5E9s6GWM7K1sgtHmqQGhWDXDFMR1CrUtBZKuNP7R40ZcjOGFCUuskq7ShxNeIe9
	 +WHYCxbF0fMmfRgwkAuDUsl7TSi72CUJ4jAdujktujxwAtY6vn5xsT98qITMTRuMJD2II
	 RVFP6r15fdbczr0n23qr3rSARPuWZhkDBYjRJHoT5qNsUuL2OjjfFSvRRX8i18hW2llGD
	 x8DedfO7K5jXrBT9I1hTtUIFVFObdipK7PnEgXyGt85TtJgWz/GPvOrvmGxb7ef1EzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697446;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=QIBz8TBojmEnLkECnbDASygJqcIsVTEAYkDyeLheQLw=;
	b=pfF0VFKe6c6IgK6YeX0/kRUNvv4MGQ/aG0jxsAkO0bxAReEcPnrauJ5WAVoPnhvPptaV
	 alvjDKzlvDqrzDInj8vCC3+Q5HXMvuH/yqng21VSkPT/13exNil/Hj8VIsTqyTk+Oo5/f
	 gJ0SQYlpfxe3NFx9fsQSBFOLtji0RJ4l4Kf5LybAAGIDzzgtS5KI1SIXdtAxbogNcL4IF
	 QuagTPTdH6Fm8dO9ocCQoureNJC2oCDqnG3+Y7vstJXQXohCio2nUoJ0xFV/vpt4GaX5T
	 /QfasQ4Se66fnuoQ1kz/NguNlSAvbKKliMEWiINqyJRkcxv8BxeaeSc57rD0RPK82hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNTiTXQl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAE4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNTiTXQl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795697445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIBz8TBojmEnLkECnbDASygJqcIsVTEAYkDyeLheQLw=;
	b=UNTiTXQlh9CTGpMu2cfkRmZDE7qtAUpIkRBpixyerpDw6b2Yya/PkU5TQkMR4GJTLCFJGz
	+7C72p8vtx0z28DoOvKbyKczW4sBym7FPYN6Wlk4e427Q8xLcynY0c6hUgTSkexRR0uBh/
	FfVwNMVKHKpSbNwr7KGMJBw8zhGun3w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-exFAA_g0N-GOjz0CX5RyHQ-1; Thu,
 26 Nov 2026 12:50:41 +0000
X-MC-Unique: exFAA_g0N-GOjz0CX5RyHQ-1
X-Mimecast-MFC-AGG-ID: exFAA_g0N-GOjz0CX5RyHQ_1795697440
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EA441955F2E;
	Thu, 26 Nov 2026 12:50:40 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 538FB1956087;
	Thu, 26 Nov 2026 12:50:37 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Thu, 26 Nov 2026 13:50:33 +0100
Message-ID: <20261126125033.1692064-1-jhladky@redhat.com>
In-Reply-To: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Commit fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
restructured __arch_clear_user() and moved the loop alignment inside
the function. In doing so, the loop label ended up in front of its
own alignment directive:

	1:	.p2align 4
	USER(9f, sttr	xzr, [x0])
	add	x0, x0, #8
	subs	x1, x1, #8
	b.hi	1b

The backward branch at the bottom of the loop therefore lands in the
alignment padding, and every iteration of the 8-byte zeroing loop
executes however many padding NOPs the linker happened to need (0-3).
Because that count depends on where the function lands, unrelated
code changes anywhere in the kernel can shift /dev/zero read
performance: an irqbypass reorganisation in 6.17 [1] left two NOPs
in the loop and cost about 30% of /dev/zero read throughput on
affected builds.

Norman Herms diagnosed this and proposed moving the label below the
directive, so the padding is executed only once on the fall-through
path and the loop body starts 16-byte aligned as intended:

	.p2align 4
	1:
USER(9f, sttr	xzr, [x0])

Measured on Ampere Altra (Neoverse N1, no FEAT_MOPS), reading 4 GiB
from /dev/zero, two otherwise identical kernels built from the same
tree and toolchain, differing only in this change (two NOPs of
padding in the unpatched loop):

  kernel instructions per MiB:	797.5k -> 536.4k
  throughput:			11.6 GB/s -> 22.3 GB/s (+92%)

The instruction delta is exactly the two removed NOPs: 2 x 131072
instructions per MiB at 8 bytes per iteration.

[1] https://lore.kernel.org/all/20250516230734.2564775-6-seanjc@google.com/

Fixes: fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
Reported-by: Luke Yang <luyang@redhat.com>
Suggested-by: Norman Herms <dockseed@proton.me>
Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>
Signed-off-by: Jirka Hladky <jhladky@redhat.com>

Co-Authored-By: Claude Code <noreply@anthropic.com>
---
v3: fix the diff header path, which was missing the arch/ prefix
(scratch repository layout mistake on my side when generating v2;
no code change since v2).
---
 arch/arm64/lib/clear_user.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/lib/clear_user.S b/arch/arm64/lib/clear_user.S
index de9a303..143d2f7 100644
--- a/arch/arm64/lib/clear_user.S
+++ b/arch/arm64/lib/clear_user.S
@@ -37,7 +37,8 @@ USER(6f, setet	[x0]!, x1!, xzr)
 	subs	x1, x1, #8
 	b.mi	2f
 
-1:	.p2align 4
+	.p2align 4
+1:
 USER(9f, sttr	xzr, [x0])
 	add	x0, x0, #8
 	subs	x1, x1, #8
-- 
2.56.1

