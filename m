Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413872;
	b=k/NE6z8KDhxk8GpdP6uXzvIkwqBcMxMVri/z6gkHcQDk71pkDn4QAmWvW93vBy+P2/pO
	 yr/dP2nrNDxMzic7/6LH1Muw10M1kuEWGvb5ATAGxpRsDFzVi58/5fCp76HbHzHpIdHRd
	 6nnpmEqTAdLNju1pD4TMNkdIyW1Qz0K+fVD2Wrkh0xsJX1sR0aw+GlEmXdBa2eb7UvC6m
	 VsLc5unofrBEtY0HwPhp7+qpY1y2pi6pUOPbIWakYkSWl9Lr6XYq75CabhbEsnjifSdAU
	 TenrLGRuUuvTZovnycMnxIo0rrocA/v+YaxvenQGikMvwMTwZ6X3/2y9KWmuBWZvwWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GVQ2P8AWX362fj3fL2PAz+/e6GDEOziBkBiUeIWv0MY=;
	b=47tWW7bNY/CVhNS3y7tAXMqKsp593OGO1vbHXB9xwrYaJb4amJrMGIxe9ohP2AsMBmLh
	 DsimAMz1Jm0fDGQz0EIzUmj/dsmfX2jeMe68lr0hz29PQI/dMB+6iwvshshh1h20UOAZ7
	 JlSq60uUduJqkPinvKqy+75bJPYci1i7qiIaXXp++tbpeIWyf/xfJqxTaTcZVwmg3Sgxm
	 fL8rReIoqf4MfegCL8vixoINiBZrbyTSJEJyg17h5X9rLmPLmlzfh/rgDYniFVfw5Tsfq
	 fMbr7Jg/0kDqXQfSan8meT+srly68i6U2pQ46+FAKBCX/3YgHSnfr9HKH+TdlgSV2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvmFOEGh;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvmFOEGh
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8470d7d430fso1407553a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413871; x=1796018671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVQ2P8AWX362fj3fL2PAz+/e6GDEOziBkBiUeIWv0MY=;
        b=YvmFOEGhY34VoGni3QxiaW5xDmILPAm1avxaCIA7DhsR8+vGIyiivljap3xcJhoObu
         cIhAXJen4ulRivUQZ8LRBQhLDBpbdsp6uFCXvKd14KxdNMfxec5kUqOnOT4idpHPhbpm
         YHOAEOdXc5jm9PTA9y854tr4zC8pwEVtKnoMfOWE3m9fR8/zAObnTUTuabWFoRk6eCSQ
         LeEr75YYAN0qnjxkMoXMnPLUamJBmSS7QafSwcIG2SyLvCyqhkamIn+cmAZNRpSn4lPZ
         qrPq4lJ628LoQOfDRfyR2pVg3PZkApTVQ/gNb7ui32oscTPtTyDzxIYM7AVEL10+VI0u
         uUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413871; x=1796018671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVQ2P8AWX362fj3fL2PAz+/e6GDEOziBkBiUeIWv0MY=;
        b=N25uoC+R/lXeT8Yj17lNvfZwn4opzZWt03bH5EoTz51Ynsq7PfMDoLSr16r24ZerOY
         aRUerPXBjoh7/kLRq6lHYIRoD6UwNsCkNPiSku+8x9NNmnGIYCVneJz/9O60AgZCXSLK
         zJWnyhndOAKtkqde4ZzYQAXMXMoQ8aG9+z6KaCsJFXFMhjbHvgBemRspXnROx6vNcrHg
         KM5jnb2itUULKPgYQ6EP/Fma2YCLBv/TSHHBbT9gPit3/ISHldySr48jHzaXA7op0d6n
         3/GYvYp27D4thGAfAVTOsiVxWHMlbtBamVEXAGRhEPARGi3FlanKth81OMQpNNflLGwB
         ndGg==
X-Forwarded-Encrypted: i=1; AL+hErGSijywGewfd1ZggQdqQlEb36/8C6RzU2qhgqdPf0padYfAx2sFE4fiK7F6aRtVZdhGXUeOBPQBSfX/z4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N6JXBWo4EpMudYTqe58EoaaykOBCnX793CSvevKJTtsAiW1yC
	j3Z115XI6iKpC3Wba+dk7cfKCMSZxBArLgUND2XotYKPLg58sXO4bBlD
X-Gm-Gg: AZFdTZfBZTpvWttUShAAmJTVMyZBqQyjyH9lvlkHvNA2HDGOP6y2pbmoWvqu2L94iwV
	djfC3tuXimZRnywlyYG8NjslQHjtGwcgAesQrnizF90ky77YOhfz89FnuBJj9pDmvwNmMJz04nG
	zyBhBDwhc4ONkT+ktDg7xk0+M/RNfmtGSf+WeLaHTBk4016ixk8bC933U4W3rl48yS0f1fsAhqQ
	nJhoCf/zV16oscVRe+MbqBKQIqk03ACCmzfp68h/fuglFM4WEpYD7Vn1BtgYMdeVXuvUVIi44ee
	o1EI/5Xij2GtXINtcHujyxeCB3YRRoeJRPgwHT6C60hQ126fND4qp6cWzjhiEYsOB4KhQRjxevK
	UoK3Lp3THjlYO4S2Y5fCjTcjpPWJnyK4iy3PLhUhUZ2QwQ4ijyC/fQUwf2I9ez8Voy/lWIr6MCL
	HLUpU7QAwUXm+I6nDKBAZrbWGbzaKQrHJpaUcqaK0AMeevRrLfHU4VIkhH+ZSQI5Dn8y1zF5ZFz
	OHqS05KvRSOuIW5jgFoHU86QEnQSpp8cVjA1L5JoXL0Ff6JtsLtYATxnSRyVrJWbamm+AE9eguN
	ADVoTJLuNLObA6ISdu2iNbFtSwVQVpJsMKwH4yWdkLJBz9M5klvBKuS6I21aAXxUrp5xNVF7JvE
	DRPl+j4fbXnq0515xpehlbYH/FvCiIJ3nVO5du1C6D1J7Cze/l0vkTUn4SugArTrafag=
X-Received: by 2002:a05:6830:640d:b0:85b:c75:dc65 with SMTP id 46e09a7af769-86315611616mr13072110a34.7.1795413870968;
        Sun, 22 Nov 2026 22:04:30 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631681f30asm7644864a34.1.2026.11.22.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:04:29 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 1/2] iommu/hyperv: Don't free a paging domain the hypervisor did not delete
Date: Mon, 23 Nov 2026 06:01:55 +0000
Message-ID: <20261123060419.119078-5-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123060419.119078-4-oss.patchbox@gmail.com>
References: <20261123060419.119078-4-oss.patchbox@gmail.com>
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

hv_iommu_paging_domain_free() frees all page-table pages with
pt_iommu_deinit() and only then asks the hypervisor to delete the
device domain that points at them. If HVCALL_DELETE_DEVICE_DOMAIN
fails, hv_delete_device_domain() only logs the error, returns the
domain ID to the IDA, and the domain is freed anyway.

The hypervisor then keeps a device domain whose page tables have been
freed and can be reused for anything. The ID is also handed out again
by the next paging domain allocation, while the hypervisor still has a
domain with that ID.

Delete the domain before freeing its page tables, and keep the ID, the
page tables and the domain if the hypervisor fails to delete it. WARN
when the delete fails, as the domain is then leaked.

Fixes: 2690d4156b51 ("iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest")
Reviewed-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Yu Zhang <zhangyu1@linux.microsoft.com>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/iommu/hyperv/hv-iommu-guest.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/hyperv/hv-iommu-guest.c b/drivers/iommu/hyperv/hv-iommu-guest.c
index 9f4fa4315091..aa1db9db1e97 100644
--- a/drivers/iommu/hyperv/hv-iommu-guest.c
+++ b/drivers/iommu/hyperv/hv-iommu-guest.c
@@ -107,7 +107,7 @@ static int hv_create_device_domain(struct hv_iommu_domain *hv_domain)
 	return hv_result_to_errno(status);
 }
 
-static void hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
+static int hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
 {
 	u64 status;
 	unsigned long flags;
@@ -122,11 +122,15 @@ static void hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
 
 	local_irq_restore(flags);
 
-	if (!hv_result_success(status))
-		hv_status_err(status, "HVCALL_DELETE_DEVICE_DOMAIN failed\n");
+	/* If the domain still exists, its ID cannot be reused */
+	if (WARN(!hv_result_success(status),
+		 "HVCALL_DELETE_DEVICE_DOMAIN failed: %#llx (%s)\n",
+		 status, hv_result_to_string(status)))
+		return hv_result_to_errno(status);
 
 	ida_free(&hv_domain->hv_iommu->domain_ids,
 		 hv_domain->device_domain.domain_id.id);
+	return 0;
 }
 
 static int
@@ -466,11 +470,16 @@ static void hv_iommu_paging_domain_free(struct iommu_domain *domain)
 {
 	struct hv_iommu_domain *hv_domain = to_hv_iommu_domain(domain);
 
+	/*
+	 * If the hypervisor still has the domain, it may still use its page
+	 * tables, so leak them.
+	 */
+	if (hv_delete_device_domain(hv_domain))
+		return;
+
 	/* Free all remaining mappings */
 	pt_iommu_deinit(&hv_domain->pt_iommu);
 
-	hv_delete_device_domain(hv_domain);
-
 	kfree(hv_domain);
 }
 
-- 
2.56.1

