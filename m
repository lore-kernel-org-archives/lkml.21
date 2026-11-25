Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=139.138.36.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567193;
	b=RI8Dr/Umu0v8ulHrB7Evng0h5jKppAS5Hq5pBoMNkMqkXqYR55/4bXldQEnTgoKItmNO
	 uhbn/NTJmGJQF5cv//kLaOQFDk/wO0PPYZiCIhjSUvhUwZ4WAYjk86wjlwoOPC6lYspPW
	 VZuPGM2b/V3lEsCqKtUgKHGepCKcUTBxWzFuKwalD80vzC4Ly6YRpTzFKk8de5v5kHoUK
	 ujdyIXc/4cT7u2IUxYVtYHlVPCH63HprTx1lJFXFdcgEziUlIORbsFyhCBBbPI/89j9Wq
	 2W7VTwbyozk6s7tgaEdmsqntRHKRQAWbSn2TEBCy+k6SGVu175SKvewSK7Ythp75oJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FIByHlTPNo6yonGSdO2RYDduoUN+XoU6L/TvYdP6w/E=;
	b=gyHjqrgE823LI5RwT1asGifR7ibp5fhPS3Mszsn6wLAEAPMK0O6Shu8VDMwet74QdV0U
	 XhCgubD9RnYIOD8gtpWFnbRgbrzOJbI6Db9fQSSOYCJbQyCFv71OAwoeCyQ98zvHazjXn
	 CqPZ5/UFvMHprZdN0gF8iWf+SKKqK+KrXFBvJE++K2IUF/ue+riOT/wlAR0TNNawo5K03
	 XcfdSV8fVgPx6ew9rHnLDQoxstX83GAuKzLaxUQcE6GGv0ZvsQzmK1V39KOpPR1l7HDwH
	 I9Hz4FL5TYBZLxNt+ze7GeSYm0vZEZibn8n254urvkRF8MdlYH/ys8F0b8S3mS+4/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fujitsu.com;
	spf=pass smtp.mailfrom=fujitsu.com;
	dkim=pass header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=WyFfwkEM;
	arc=none smtp.remote-ip=139.138.36.223
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=WyFfwkEM
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795567192; x=1827103192;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=9zVoKV2VBSnVaNWOGCXlH1YLrznYJ/CwSJb8o0cmF1o=;
  b=WyFfwkEMEx9Pj+LlfdWbFVMz6Dyx+ni6F5hBiuUe52QUHzFftLTNeMjk
   jKFNe0YrM20SMEABKECz63goAUGVH1HtAdDjAoVSaGZvO7mEQCkUuGRCd
   MS5xl/vE5rb1qKGYXOhfuW/I8jsC+W2WWaRZPxouSlve/YMJNg+vPkqGO
   WHNoLZzsOfT5tK1W3LmuVbLUPt2bXUKlXKRE/rxL6Lv4458gACGf9x7Dm
   9BR6a6xga5Cpb5Qy7zttDpqFFH3ByIZZBPYPCU2vjOAUhd4dbFYrY/664
   z0gE0en+jErvFRI4+9Q8Cdf/Vsgld39tutGHkyCJxnfoMHxG0YTURoWNY
   g==;
X-CSE-ConnectionGUID: YHhOD2s2S0KPyvxr4b/1qw==
X-CSE-MsgGUID: YegCySV3Qwqso9z5HrFnqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="250507207"
X-IronPort-AV: E=Sophos;i="6.27,231,1786978800"; 
   d="scan'208";a="250507207"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:39:50 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7361F42A316
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:39:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 268B71004141
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:39:50 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EB5B51400271;
	Wed, 25 Nov 2026 00:39:46 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Wed, 25 Nov 2026 09:39:31 +0900
Subject: [PATCH] dma: swiotlb: Use system_percpu_wq for dynamic pool
 freeing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-swiotlb-replace-system_wq-v1-1-83807c6afb75@fujitsu.com>
X-B4-Tracking: v=1; b=H4sIAEMuBmsC/yXM0QqCQBCF4VeRuW4gBZPtVSJi3E42YWo7Wyriu
 7flufsuzr+QISiMjtlCAR817buEfJeRv0vXgPWaTMW+OORpbKP2sa05YGjFg222iOdlfLE4V4p
 UVekglP5DwE2nf/t03mzv+gEff0Fa1y9Z/TeefQAAAA==
X-Change-ID: 20261111-swiotlb-replace-system_wq-a995aa7759ea
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
 Petr Tesarik <ptesarik@suse.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0

system_wq is deprecated, and queueing dynamic SWIOTLB pool teardown work
on it causes the following warning:

  workqueue: work func swiotlb_dyn_free_work enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Use system_percpu_wq instead, which preserves the per-CPU workqueue
behavior of system_wq.

Fixes: e13d4d9a4915 ("dma: swiotlb: free dynamic pools from process context")
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 786954bc5e6a..4060d9ad5b24 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -926,7 +926,7 @@ static void swiotlb_dyn_free_work(struct work_struct *work)
 static void swiotlb_schedule_dyn_free(struct io_tlb_pool *pool)
 {
 	INIT_RCU_WORK(&pool->dyn_free, swiotlb_dyn_free_work);
-	queue_rcu_work(system_wq, &pool->dyn_free);
+	queue_rcu_work(system_percpu_wq, &pool->dyn_free);
 }
 
 /**

---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261111-swiotlb-replace-system_wq-a995aa7759ea

Best regards,
--  
Kohei Enju <enju.kohei@fujitsu.com>

