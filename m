Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645483;
	b=A0ZH+03aFQSMZ5qPIh7QnZdRl4KtDgyIVFx8EH2RqIpdAYKEjWgPCTC1I+5mP4co3dNj
	 kk9++tCK62H3zTTb+maDFoZpvTIbt1vyredMWsqXYfUTnp2W5/fx9VDGq5smV+enf8luF
	 r6Ojhn2cQ+ZXtJlgTn9tqJ68RxVuIPM6E9COm0il2JU8IWCDx3PbN2hmpXTo2GNC9p/Zl
	 eQvaNzvcwwOWVbUHxTAFWu4MBasDo1Yv2a+79RNLDPP9WUMlcdDZlADjWWskLQeSV8+FY
	 X8LiOMmyG48aNDg4yIHX8xav1iAngDC6uMh+8XVUNz+QQlQsL1KbpqIXbfh2cchbxvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
	b=a0E4V2VbEvoSlZsdNw4XUy87invXghY4kqaTA55ic8hlMnyY9efhKaP94KwR8Bb52989
	 teYwqqC0iT/vR5BEDKUHjxZGvINsq7KDd+CcyQ71qCZGs+Pt/YD7VPRVFaVYR/VEk/goM
	 cKwSV9PhjropGqX3CluKgMxjSCq9dKbkHkGWqXQPCoxA9PlNguYeFFn2LXT26VEyELwdq
	 mTZ1b0A7lvJs8yX7slEF4lNZIxThIpdveO+HMAc7YyioT5o5aLOhUh/HE5HCNNMq4UuSO
	 +gyJ+dJE2ygB0xUnMP0F7XwiCU9El2C3+yLRfWGapiN1CONPUtRsUG+L10xf4/SrQcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXRLJNAt;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA53606A696
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA53606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXRLJNAt
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8369460eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645482; x=1796250282; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=JXRLJNAtqY2xrrTdJrj1OwqP8qcbbDOO/xgOwggr4RT/JkRo7IusUASaRTFh+44RR7
         6ti/rmoDIQtVOlH6Rnyc/zrJ0NOi88npY2ptZpdREQQrMhjNe+XisDkcxNWjNYVcsaDn
         PeO0ABd2Qk2g5u0QB4T2RqGnFntRv+fNKY7b5R5fy+3HlisMC/d5yizhHs/5LMLe3vF8
         29lS3FyHAN8/d0+LBtNBvuaAPYzu/fv09ZtO5X07hzvTCJ2QYxtTRVQYMonbjesh+xE+
         oyjb0w8wV4MtzSPUsWuzGS1/lIWvH1IFXZEHfpDnR95A9mL+w9HWkD47zWmgruRR9aRm
         fDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645482; x=1796250282;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=sXcdTXv4jWUUbhYW34Q3MfquqvfH4LsQ+TG72sE9qL3p2iE5mVzEhjVSkJG1dIeOTK
         NIk5PsA0i4yxmKuRurEjaoWqyCY5eJUUCC3e+aHGHuj825ezM/1wdz+DpD3DTLvm1vt/
         Fzp4Vo+ESRcb3Ulyixes8ieYBMCgCkyp2tpfl+OOyFK1O9d6PEH68TizfTuZWstKSZv0
         mvULbQ5/q9iCYphrgU1mWwPJSE+kZ3dhaccNIsoSXvAJIFEVdbYdOwMg5jsj6ySUO6TF
         QXALjt8Ih2/s9TOSowchurIO7trBIVXBu46SkiiGMIL0C+GnWSnpyHvhB6l7tuKbQzsY
         l1Jw==
X-Forwarded-Encrypted: i=1; AL+hErFWRTLPr7ACstLH80HDQXb4Xj/7xXOhvClUuuudpaROH8FzMGxA261x/8Royo8WG34643cWYYNOZA+R6dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hqKqxrLszIbG+WwB5lr/dx5Zn39co/HTcaN4uXPHCw7q/C4h/
	U66iOiJu6gyS2vW9NWNAGkXCnold5afh+/3wIdC5ErFEwv5k8w49nnNW1ReEf234EB5vxLyEhxh
	Q/g==
X-Received: from dycuf5.prod.google.com ([2002:a05:7300:105:b0:386:9be5:2d95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18955075eec.40.1795645482015; Wed, 25
 Nov 2026 14:24:42 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:33 +0000
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
Message-ID: <20261125222433.1442338-1-elkin@google.com>
Subject: [PATCH] iommu/arm-smmu: Fix use-after-free in nvidia_smmu_impl_init()
From: Elkin Cruz <elkin@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Krishna Reddy <vdumpa@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nvidia_smmu_impl_init(), smmu is reallocated with devm_krealloc() to
embed it within struct nvidia_smmu. When devm_krealloc() moves the
allocation, the old smmu pointer is freed, leaving nvidia_smmu->bases[0]
dereferencing the invalid pointer.

Read base from nvidia_smmu->smmu.base instead of the stale smmu pointer.

Fixes: af9da91493e5 ("iommu/arm-smmu: Use new devm_krealloc()")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 2fce4f6d4e1b..a3884966dc29 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -319,7 +319,7 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 		return ERR_CAST(nvidia_smmu->mc);
 
 	/* Instance 0 is ioremapped by arm-smmu.c. */
-	nvidia_smmu->bases[0] = smmu->base;
+	nvidia_smmu->bases[0] = nvidia_smmu->smmu.base;
 	nvidia_smmu->num_instances++;
 
 	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
-- 
2.56.1.839.g22a8290db9-goog

