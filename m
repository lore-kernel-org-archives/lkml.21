Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996548;
	b=1AbOkaCxSBT7/WWrkl796eNPQdlaWXyK98Kje1DJdGzEAcB8NhcL357aiU/xwzEoibie
	 mEuv+vp1DdJlS08rvJP0npjDrjkBrY8KZ+SbwiltLVgPMcJblFGD1Z3IQUAxkRk1ssfxZ
	 3l0o4pQUmoitaa8Kl47ZRAmKnS8+qvOs3uue1tG1I8WOJOfXHTgqVVmpzftT9NbYpuZ8G
	 k0OIlKlxC4tp72L0fEA38z6fIgrnThKa3nrTfX7H1DyBiHu5ml+GzxXMliZZ2rxeQvBOe
	 Y//ATN8dKieaDeIF/cSdt/PT+tyJIx9eV4JJJ89JXHUFmz7bpBRVNqrxKMnWXlpCcOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+B1TOH9oUaUU/yKHKlpMG2Fg0rcqqVsIpnka2NiH2/I=;
	b=fgAeMrN7A5lGVPvnF1pby6X8k08AcoxHspwx+igMNqNS/ybaJMDRyx702SF8SOEI1wYQ
	 vb2/POO3b5nap3ZQ7hzmYXPv+pj2T8o4fAkVUrw2VJ12FpXs+ZLQiNt8TY1kjSSoeNOgv
	 u+GnoexKoIBT8PqjNKYiy6zPHn2pxLKxgh65Vzb4Vwp7GCZOctFo6J1Vt0EINb/EvBY3d
	 oLQde4ZhKf7OaG15jxAaWEZRZWpCRfKs1i6FuOjqOXuOSjWCQxVALvXDQmMs9b+KILe1O
	 asLbHt8pvWvZJnLfV5kskSy+2A3pJi8bqhIHXlxm0DE1IskZHMthLbsZ1KuN8mfifWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G14vOFv3;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G14vOFv3
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b203b0c139so645903b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794996547; x=1795601347; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+B1TOH9oUaUU/yKHKlpMG2Fg0rcqqVsIpnka2NiH2/I=;
        b=G14vOFv3Ujb4z9LNJX6zHgOB/CiwYIy9Oy8Jt5I6Gz3ApMFDg7KvkQ6RdNztHu3C8c
         qziMNmi2uJwjjaGR1vEA01vJ0dWRcsexxdNVY3WbxuuoGZ00IDI5nfaFpfm2TOVvOmEv
         v6GBlsjWXLTtTTxV/GBDpFeJg3Lnac74OjZ1x9PjbqKwQWKRLSbDHwJkWH1Xbwre/Oyq
         daIGMoFrDrnzXyHsjznsigqT+tDVSneoU1pbr0wCyfdQRCZrV/uqPnvH3EesfIHdEkK/
         q1rQAwwD0IsLN3y5YmG2rO3PFMh07S/0ZSqHrTRr1v6g7FbtivSzK02Bzn0XmTaGF8je
         T/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996547; x=1795601347;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B1TOH9oUaUU/yKHKlpMG2Fg0rcqqVsIpnka2NiH2/I=;
        b=JCi8oGocJTPDU5yNZIacVmCLXE0X4RFU4PHJyFYsxt1TCEHRWn454cnJbSuAoh7Mmq
         fDPQx44dLVkoFoCJlJsv4X6hRz5IQNjReKRvBCdkSJmpJtSBuiINo6/bbbBezSltx3CT
         eJN6XEA+cdYzLOAU88LU046moVbhU/HKaVEfwE3Foun/WqzlsYv1xwsydCfR4syGdS7H
         M1P+ATR+wOi2pIP2GRcfCsN7rnuFz5nzbEhvg6w26V7GFEr6JWHsJAcTCoCPF7PEAZYp
         GgxCfBJUtxfxxW7FJ5o3kXs8ianZINGDHDcnpLZ0rV9kAyffZM0+jF8lEKEHuHLrNBVE
         3/RA==
X-Forwarded-Encrypted: i=1; AL+hErFgSsADJ0g8CEP70qPh5qzN8lf6QtQlWs/rBMOnH5oif0YN07i+lMorTkUJp4H3Ue5zJG+x7ok3INYougk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sptME5SppMrFPJdkUNeOGIKvHtPimtnX80PEy0FkM2/b0y7ns
	mIkReKpiqr4P8xkgPhmN9NTQ78BRkt7v4vDDKC1WCBs4OejY9M6gK9NHGJ2fd+sVQrYfjLXq0R0
	n/l1QC9PxS1g9YbjA8TPP1Mgqdw==
X-Received: from pfdf8.prod.google.com ([2002:aa7:8b08:0:b0:8c5:fdd3:6020])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1c8e:b0:87d:ee98:606 with SMTP id d2e1a72fcca58-8c5d45de9a8mr1864339b3a.23.1794996547074;
 Wed, 18 Nov 2026 02:09:07 -0800 (PST)
Date: Wed, 18 Nov 2026 10:08:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118100839.3090172-1-amitamishra@google.com>
Subject: [PATCH] dmaengine: dmatest: terminate channel on timeout or error
From: Amita Mishra <amitamishra@google.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Dan Williams <djbw@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Amita Mishra <amitamishra@google.com>
Content-Type: text/plain; charset="UTF-8"

In interrupt mode (!params->polled), when wait_event_freezable_timeout()
times out (!done->done) or dma_async_is_tx_complete() reports a
non-DMA_COMPLETE status, dmatest_func() jumps to error_unmap_continue and
calls dmaengine_unmap_put() without terminating the DMA channel first.
Channel termination via dmaengine_terminate_sync() only happens later
when the test thread exits, unlike the polled path which terminates the
channel immediately after dma_sync_wait().

If the DMA controller is still actively transferring when the source and
destination buffers are unmapped, an IOMMU-backed DMA engine will trigger
use-after-unmap translation faults, or overwrite the buffers while the
next iteration reinitializes them. In addition, if the timed-out transfer
completes during a subsequent iteration, its callback sets the shared
per-thread done flag and wakes done_wait prematurely, causing the next
iteration to fail with "completion busy status".

Terminate the channel with dmaengine_terminate_sync() on both the timeout
and non-DMA_COMPLETE error paths before unmapping the buffers, skipping
the redundant call on timeout when params->polled has already terminated
the channel.

Fixes: 4076e755dbec ("dmatest: convert to dmaengine_unmap_data")
Cc: stable@vger.kernel.org
Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 drivers/dma/dmatest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..950b7a9e7769 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -852,6 +852,8 @@ static int dmatest_func(void *data)
 		}
 
 		if (!done->done) {
+			if (!params->polled)
+				dmaengine_terminate_sync(chan);
 			result("test timed out", total_tests, src->off, dst->off,
 			       len, 0);
 			goto error_unmap_continue;
@@ -859,6 +861,7 @@ static int dmatest_func(void *data)
 			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
 					 dev->cap_mask) &&
 			     status == DMA_OUT_OF_ORDER)) {
+			dmaengine_terminate_sync(chan);
 			result(status == DMA_ERROR ?
 			       "completion error status" :
 			       "completion busy status", total_tests, src->off,

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.703.gf848ed807c-goog

