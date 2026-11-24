Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563139;
	b=zlxAbyFTZx/oFPUsgWBFvcE2fEYzZ0nmDSrjkYvnvae/1BJvkkBlh3hNLH4j7kGBTbYA
	 MjFejtswN0ijl6XWw3HyHEAlOAV4wNoVhhOYRR/XpLw5beCOtqoz88ylkaequIKVAZGsq
	 IVYHB7h8Ov4d1pI6E1kMqiu9hB8yaIvvUW5vyhjzMFDGRU2HL5m65q9JtXsJXqpdlJtK+
	 LGZzMOaAmEf1aMJiMTeTC7lowmHViDFiAuGYDMIoK8+t2s4Bz/XfHVdFESqDTn5vUmmiM
	 qcWZzFRQ+lQQ9r565tQATWvU7c5Q8eTClReVz5n9MNVvPgcqkwHNuZTIgcLCqK9VCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563139;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=;
	b=km4Dv3TNinVf49ei3ut77LFIwUyznk41icVg1xn9e4ObkdPB2pAGKUjRCfeZLba6F/u6
	 ZnX826ZDpzDaAhSb84llfxhbqSFlho4XUozCexf0XBsMvwhGkyDWIE5tqK7GqzSTkqTr4
	 OD4nJYnSmvdqynq3le8PXeCUw9+S9Ssjoi9dV4D6lPoSlUMuWxbR86hcM48Ds3OBTZdjj
	 SsHd9TsLGx5mt5wQf1JwJVOUtcdFEv5IqKhrPZuVhO3yxNwA+gHVkV4zy1LPZavGpdfa4
	 oMN4JLogCn18TeXePNYP5VhSHWkz3jnR6pW4wew/QAeLxWj5itTrraXGXRcJpRGLMZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XgpwDRCk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CDE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CDE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XgpwDRCk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795563137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=;
	b=XgpwDRCk7rEGvBz+HEr3VVzEqS/ii5UXdkUFugLyayhsLq+gI2Nef/NRBJFD7QvMs/kSXw
	j8O3LDhGyBxyA8XvcKhAjQt1ug3aCNC1vradVAX/UDNcFx9XS86AK3XqxxFAuKSFcpmZ93
	H9sfcNan1bHHl4xedtY6RKBw8375x2s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-pWqOji_oPDew5nJUdOXeKQ-1; Tue,
 24 Nov 2026 23:32:14 +0000
X-MC-Unique: pWqOji_oPDew5nJUdOXeKQ-1
X-Mimecast-MFC-AGG-ID: pWqOji_oPDew5nJUdOXeKQ_1795563133
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 211D01954235;
	Tue, 24 Nov 2026 23:32:12 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E88141F;
	Tue, 24 Nov 2026 23:32:09 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Claude Code <noreply@anthropic.com>
Subject: [PATCH v2] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Wed, 25 Nov 2026 00:30:43 +0100
Message-ID: <20261124233043.1289050-1-jhladky@redhat.com>
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
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

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
Signed-off-by: Jirka Hladky <jhladky@redhat.com>

Co-Authored-By: Claude Code <noreply@anthropic.com>
---
 arm64/lib/clear_user.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arm64/lib/clear_user.S b/arm64/lib/clear_user.S
index de9a303..143d2f7 100644
--- a/arm64/lib/clear_user.S
+++ b/arm64/lib/clear_user.S
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

