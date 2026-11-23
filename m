Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409401;
	b=L+XLyb0p+TE1f9MeN7oE/7gYiIxo2uhtQuS05UcZiVIUMPX+u7heBXVYAd7w/vwqKkVe
	 aL1YVBXFeSEdX7KsvX8XDMwYYcK6UjGaSW2p9psHMpHDF1BZ2rn60U2SaRyCN0mqlw/Vf
	 ItDO2UkhLfCqX09Aey/2zCzZB2WvE0wWiUU2cEowwcBIxyol9GPbjNBrSXiZCLoBhTpeJ
	 YVWl0H1FAaWgTdr043+b177Cvph5GpZo4FLY2i1I7cqxyMxoTWzNhepC3H9ZqddNLzcqv
	 PpImd4Ju16WquhJ6Mjm0QtC2SZ7TWCIIxqWc4gfkU3pINShx9J06f30mJ2ymj88yyvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6MNIHKKL1TyoX4SD1X7Fi8nLR6k5WbA5DIiwx/onbm8=;
	b=RHZUu2irgMNq6jPCeI13eg2+rFnalvYiO++5xn/hCrK1G/T2IV1AV4BAp0kNDERvQTGv
	 +ShA4h1DlFTzewGooz5/3LeFk1sDU7ktDHUGlfve6CQEgmqOd4dKRYSLPuY6bKsLqt4UD
	 gh8GalVCebTT97TQs7pt/jVXe4WYDzgyu5yDhMgcT51HFXgb6DzbC+E3yR+LVvNQzKhLz
	 wxN4llTVT5p+GYjLY4BsuvsqY06ddT2fU4dq/eKhbf3tWppOIiABYY2NTo1ZZzt7JkCCe
	 G4nH/6oi1WwC81DjCGQIljwBFb2YHRHn9b1E02hpYykrBdZmlBZ8OX7pCLByd8pgGwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F/iechIZ";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995860A3834
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3995860A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F/iechIZ
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so2487905a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409401; x=1796014201; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MNIHKKL1TyoX4SD1X7Fi8nLR6k5WbA5DIiwx/onbm8=;
        b=F/iechIZ9xmGmpfgIyJioQgsJhXIRg9iZKOByW+DyVeqdpS347g1w1MorLxW/0skT4
         OvnaBtAbE5BikM4MPLIkcDVV/oJwF94I/yegtvVp+58KNQL+AVvjzAo9eWnqk/ChDF70
         nUJY7+nQ7jLuw1sUAY0VR01yWT8iwwmTuhhdTlNoXC/EmyrNjCFCPBpznZ6We4PRrZvA
         EDEP+UfUlHpNygzmvgHJut7CMv6IJMhS/tEh+sGjxygAldMcmp8vvxzSDhFB9xJ/0vi/
         q1pLs6ioiVlLPPSH0UQeXQc0H+SHfQp5s+biHX7DcwBNiaAI50QfFmXZBJhgrbNnAury
         AGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409401; x=1796014201;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MNIHKKL1TyoX4SD1X7Fi8nLR6k5WbA5DIiwx/onbm8=;
        b=Sm+w0DmlzcHXiZsJG7lfchgLV9FSSahUH3BPYbc2zcQDNuECDeFN8cE0BjaWQYLuvX
         QciVnV1O0yp8JT5mZovwbW4igNbziXBGZTVvvIxc+5Wx4Mez5MaxUox40/LDi4J1ru7Z
         72V8sy38yEwfHBm5GAP60V3wto1UTkKFoKyh6o/OMQy/j+RXGvTZxNsP88Q7hlcAqUMB
         1VRDNlM6uc0mVTdxYKm/3ZLSCWDLRCJ2QFvqZjX4ehOtkd748FJwPvmVytHBSz3lFP/A
         /GzECQE88OtUD1mH4jQGrDr5K2HQuAD7bpya0MRnQ1kZCPU/nSMhy7BkD0z5AP/WgXBH
         f6Dg==
X-Forwarded-Encrypted: i=1; AL+hErGv0SWWR3L52dcm85OhZOC54IbJ9s1Q7ERVKcxlT1A8hTyf6FNTboXJdiSp8VgpXmq0oESFFbpkMffMz9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y8RhNlMcCGD5ulSeEwk6LKzDfS2C/x/p4WE0NmlAjvrI79qil
	GJr0NeZrdlyw1Pp9xlPnngTO0haP2LHir0c02z4SSR332e6CtfClKRz1+uJ18S1/97yUf1FNShI
	UEBA73RiLf/GB4g==
X-Received: from plho3.prod.google.com ([2002:a17:903:23c3:b0:2ef:a836:c1be])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f87:b0:2ec:ff7f:6f8 with SMTP id d9443c01a7336-2f03f268843mr97692615ad.57.1795409400082;
 Sun, 22 Nov 2026 20:50:00 -0800 (PST)
Date: Mon, 23 Nov 2026 04:49:41 +0000
In-Reply-To: <20261123044949.3610702-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123044949.3610702-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123044949.3610702-11-skhawaja@google.com>
Subject: [PATCH v8 10/18] iommu/vt-d: Combine disable_dmar_iommu() and free_dmar_iommu()
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Pranjal Shrivastava <praan@google.com>, Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

Every caller of disable_dmar_iommu() immediately follows it with a call
to free_dmar_iommu(). Combine the two helpers into release_dmar_iommu()
and simplify the teardown and error paths in init_dmars(),
intel_iommu_add(), and dmar_iommu_hotplug().

Also drop the early return when
WARN_ON(!ida_is_empty(&iommu->domain_ida)) triggers so translation is
still disabled before freeing the IOMMU resources.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d31d2d5845e6..6c86c155d12b 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -985,21 +985,17 @@ static void iommu_disable_translation(struct intel_iommu *iommu)
 	raw_spin_unlock_irqrestore(&iommu->register_lock, flag);
 }
 
-static void disable_dmar_iommu(struct intel_iommu *iommu)
+static void release_dmar_iommu(struct intel_iommu *iommu)
 {
 	/*
 	 * All iommu domains must have been detached from the devices,
 	 * hence there should be no domain IDs in use.
 	 */
-	if (WARN_ON(!ida_is_empty(&iommu->domain_ida)))
-		return;
+	WARN_ON(!ida_is_empty(&iommu->domain_ida));
 
 	if (iommu->gcmd & DMA_GCMD_TE)
 		iommu_disable_translation(iommu);
-}
 
-static void free_dmar_iommu(struct intel_iommu *iommu)
-{
 	if (iommu->copied_tables) {
 		bitmap_free(iommu->copied_tables);
 		iommu->copied_tables = NULL;
@@ -1867,10 +1863,8 @@ static int __init init_dmars(void)
 	return 0;
 
 free_iommu:
-	for_each_active_iommu(iommu, drhd) {
-		disable_dmar_iommu(iommu);
-		free_dmar_iommu(iommu);
-	}
+	for_each_active_iommu(iommu, drhd)
+		release_dmar_iommu(iommu);
 
 	return ret;
 }
@@ -2280,12 +2274,12 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 	if (ecap_prs(iommu->ecap)) {
 		ret = intel_iommu_enable_prq(iommu);
 		if (ret)
-			goto disable_iommu;
+			goto out;
 	}
 
 	ret = dmar_set_interrupt(iommu);
 	if (ret)
-		goto disable_iommu;
+		goto out;
 
 	iommu_set_root_entry(iommu);
 	iommu_enable_translation(iommu);
@@ -2293,10 +2287,8 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 	iommu_disable_protect_mem_regions(iommu);
 	return 0;
 
-disable_iommu:
-	disable_dmar_iommu(iommu);
 out:
-	free_dmar_iommu(iommu);
+	release_dmar_iommu(iommu);
 	return ret;
 }
 
@@ -2310,12 +2302,10 @@ int dmar_iommu_hotplug(struct dmar_drhd_unit *dmaru, bool insert)
 	if (iommu == NULL)
 		return -EINVAL;
 
-	if (insert) {
+	if (insert)
 		ret = intel_iommu_add(dmaru);
-	} else {
-		disable_dmar_iommu(iommu);
-		free_dmar_iommu(iommu);
-	}
+	else
+		release_dmar_iommu(iommu);
 
 	return ret;
 }
-- 
2.56.1.809.ga0b61035b5-goog

