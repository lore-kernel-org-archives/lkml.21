Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645496;
	b=2+XajZmTuDPswPCq0vU35/OJIEv9z+Xnh3e0HM0gkHFmwxiWPIQ8UJ2CZ2KNNLDK2FbX
	 35vp7myY4uNufi2QxyD/Uq/WrBNCKC7Z4Y6qVpyxgipH/Hkd06ILj342HNbUMHT/VcwyN
	 SPqR74L6yMy13gC+UklH6zZkwTzKL1CrIeHVrPSIWl+c+E1oFDW7u/NPxGIgBSZxrH4B8
	 UwQxwbcp6vuHq37Hvl6G6lOQLIOEs3ApIn0hqHjmt3FS4F/Q2C8NsKgGEq/YOx5bS9k+z
	 bDp9pADO+/Jz/NEDWNCp5h4udUnOf+oWNy7Vc0CRfBfydl95xnxO3AF+/XGzUs1ypYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=StPN5XiJsDNFXskzUTREunGJkezS8LFSBeJOfH/7nFE=;
	b=csg/NzvnnfAUCE2Zko/B/Xv8jIlcJFwzy5K0br5WA7dX7P5uTHJWqGhTYA5w8MeV9Kvg
	 GqjbNUVlorZH9qq2DAOUvJ34/aLfgZq7d3Z+bXDwKbvJo9km4QRRJel0Jzsa9bnVbwpQ/
	 9e0W/AIXoyKjVHzo0U9in7zdxhbNHJ1n03DRoO7b9A73n7d9fFvpMMzq6xzPfmLvL7yQH
	 tPRD2Ufkrlm6JKFB6nKmuROEGDuYx5VEweD9Q5LK5x+GakiaFIOeka/M1zvkcvaO4yYDs
	 g9PZ4Ey51vTVJQMZ1WyVp89vA8CMBJ9sPvb9HD+mAPAj8jV1JwWOAXle/Km1bJpmQZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+eElF2E;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13544606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13544606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+eElF2E
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso10352293eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645495; x=1796250295; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StPN5XiJsDNFXskzUTREunGJkezS8LFSBeJOfH/7nFE=;
        b=F+eElF2EclGDEmxecz7yQqtdiXMxmJTI3NZBJXwafwjYKooxYToDdgnbrendVLm/MO
         5l6qdkdZpEh729y5gvRuJNCgA/nbt9oyQmc67XHkuuhXRXGigh59fm2Rnjmq3Or+jd4m
         5SLuWydrhpvTA75Tz4n5LHKAo6h+OoW0zrR/AlF4Y0L1cO2IyEFIWvE2MFocifxElD5L
         +RlM7A9EOEePUTNsZJISgfOyAIDMmLO7DYeAny+99wUMtpKKZGrBQz753DjiVSbledBE
         1GAY8dcqMexRpM2JJb98gH9kiRk+SDO53gSbWASoiC54G65to9thZDrz5Gt8IEIVOw/i
         WomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645495; x=1796250295;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StPN5XiJsDNFXskzUTREunGJkezS8LFSBeJOfH/7nFE=;
        b=UCtmukgm98MmqCLwG8wyrduf0yvpynBuZ9REFWIxsADzUJmEKW8zba1SMmixZUKdFR
         YP6eNFP6bj9zWSZ8PM1cKcMMp7csfkr8bnOLUr63K8MmFsubemL4SqJnr0cJ8f+Y/KXl
         PhLHUf685Jbhs3AuA+KztUvUqGrwA7YvqwJmTDwIWAO5R5Zwzaqse5KAjGBNiec/Cu2u
         llKI9uk8E5FBn/fuzL2Ik6aUF8vm47NxuYKlWMvTZ/rVXmOBB+F64ggnzeIPkfe10BIX
         96Rcc/aHw8FG25M2kI23/Bnp8N/wbfs3XK2bqZCF28+0b/qKa6ZKz+fx4jKoKfklXTOf
         8XtQ==
X-Forwarded-Encrypted: i=1; AL+hErEbFV+bb7GC6Xqco804SPLUCFluMcpwRbbU6CMKilPY/HeVOxcI209KPPe6v1GLjZezjfKWgTcfBaVxfuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xti/V2qPyzsc9DV2HT0p/4AMu7ulGpLNudnz7SpMiLXc089Ua
	mHLWG3n4muxZiH4n57Zse1FiSHLiQ95glg2mAW0BHFwlBKv3zeEjo2mP3g2Rfw3vkRh/2jJE+2L
	SFg==
X-Received: from dldz13-n2.prod.google.com ([2002:a05:701b:418d:20b0:1a7:3390:92b0])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1708:b0:1b2:3742:828e
 with SMTP id a92af1059eb24-1b5567b21c1mr17035858c88.3.1795645494904; Wed, 25
 Nov 2026 14:24:54 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:42 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222442.1443878-1-elkin@google.com>
Subject: [PATCH] iommu/vt-d: Initialize prq_complete before requesting PRQ IRQ
From: Elkin Cruz <elkin@google.com>
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In intel_iommu_enable_prq(), request_threaded_irq() is called before
init_completion(&iommu->prq_complete). The interrupt thread
prq_event_thread() invokes complete(&iommu->prq_complete) upon receiving
events. If an interrupt fires immediately upon registration or after
enabling PRQ in DMAR_PQA_REG, the thread can access an uninitialized
completion structure.

Move init_completion(&iommu->prq_complete) before requesting the IRQ.

Fixes: 66ac4db36f4c ("iommu/vt-d: Add page request draining support")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/intel/prq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/prq.c b/drivers/iommu/intel/prq.c
index dddd3b51b657..7bf22ce7978d 100644
--- a/drivers/iommu/intel/prq.c
+++ b/drivers/iommu/intel/prq.c
@@ -318,6 +318,8 @@ int intel_iommu_enable_prq(struct intel_iommu *iommu)
 
 	snprintf(iommu->prq_name, sizeof(iommu->prq_name), "dmar%d-prq", iommu->seq_id);
 
+	init_completion(&iommu->prq_complete);
+
 	ret = request_threaded_irq(irq, NULL, prq_event_thread, IRQF_ONESHOT,
 				   iommu->prq_name, iommu);
 	if (ret) {
@@ -329,8 +331,6 @@ int intel_iommu_enable_prq(struct intel_iommu *iommu)
 	writeq(0ULL, iommu->reg + DMAR_PQT_REG);
 	writeq(virt_to_phys(iommu->prq) | PRQ_ORDER, iommu->reg + DMAR_PQA_REG);
 
-	init_completion(&iommu->prq_complete);
-
 	return 0;
 
 free_iopfq:
-- 
2.56.1.839.g22a8290db9-goog

