Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439347;
	b=s7j3weQOvfofNl7phesqnTsPShP8evpktvseI9kQIzDu7EZsV6yJY1bja3iRrOdbfauY
	 CM6NlLN7n2WG4UxOOQZbCIINBE+2Z2yIoEefMPZqAW2G/kPQNeE5A9tX1CVgky7nCgFlb
	 2BMb7ABSVrZ33yyNUN/ApyowHfSLhiq9HPQe/DK0oYPZJ7qlvO3VCBxqidh8JUa5uPgEA
	 CUBdG/jU3YNTnvqYAa++A7SUo+OgNCbd30PU592G5Lvb4BBHUiQOA2AmSC9sogwl1TjgB
	 qPtYNiv+tuLXdRj6Ersdie44NRhhhqI1G9dBXcLAgrSjEQHz60bCZTcmZyBOjiwcnzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ANfkCzqxV9oez3uXmoRvr8M+fH7rHon0FntvlHoB7hs=;
	b=Po5kT2CRTjSUyC49OKFV2JIrZMglVb3XS1kLpcZYEW1mxMvt9A6aXfbTzI713QstaH+s
	 r1iouLOZ60jsV6a7wGYTtaOaRwT2OX0UKE5GEvAr2oapllDQaVop2LO8WtLjR/+yc72dT
	 SQJ3iD91utH83ICWHTQBRkcEzb3mXYlufOUHZWMGna274QhqBKWHkLnPkT3sj+iDrJUZK
	 K5c1LE3bQ7AE5y60Bn+WuFOyZhTYT6TYknjffuVJKjYmWBf6pWB960imyHo67q58TPKUs
	 6Ah/0Vh/aK2PuJSbhAO/I1gUGRH7ob8SwW7IZXktVhNonDy/jhfwYhhoYB75INUuAWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AbTHWCCK;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D996606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D996606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AbTHWCCK
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so25062765ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795439347; x=1796044147; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANfkCzqxV9oez3uXmoRvr8M+fH7rHon0FntvlHoB7hs=;
        b=AbTHWCCKL9FRd4nQFbmZri/ixJuUevL13q7H/QK/lmtrTDh+y3XSr5+CpS/Ic/X1Xu
         OcMgWSeHBRU0N+SGtba/pDfvH+vKAjys4h1IDxUq4ruPjQdSFbrO7KLNGsgeMHxUqSP1
         ykxCexA1fY6aXPup+nBefcMdNy4kAc1laEUBaL29qdOPlyRujEYMOUgCjI+1tpW0FJm2
         NYWk6z6LK2gHt7/NVDM7V/HGAg2b+ew3RKz9iJ3Rnehh0v3j9ltMBKFhejiapYO6jVnu
         NGSTv6ojPcZy7eqOhfueoqMo6fEFrk75DrmXeRuqTPdsd+oA1nvO+ylPWdQQZ54AbKx7
         NaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439347; x=1796044147;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANfkCzqxV9oez3uXmoRvr8M+fH7rHon0FntvlHoB7hs=;
        b=ous1fdEplqPeEMV7itmHfwXg8Y/fhar4Pf8tGVPqp/mkgpya7zzo6cSoNbSvrrW8ke
         BUQv0LACDQmph+eOrNetqQXaAL1KcEn2h6bIxPNmuSNnoHeIrpOA7FF/Q3G8rYv3k5TA
         L7tlWa47EWrH15emhS9sInDyfeVdpuBst10HobXscdDn5NcZKVABwAFIfYTJD0AOTG0I
         4M3RBW0ecF+QnpVe6Z0wndniUwlWcW/dEOjhYUxImVT9mrQQcDgIVng0Ugz0SIV5JZuv
         D1sbpHo4weNPqBbI4pRyuMHXrlFmvsNy8P8pm70SPdrPLJE6DAt7CkWB+tQDk472fVMC
         CwIg==
X-Forwarded-Encrypted: i=1; AL+hErE8fkxIT2egPy45zbOPUK8R7sUpdTt5P27y1iIjpxM2i/gvD38iZuZcugeZicBz6R+gBqSSEydV3JChRbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ydXWZte6FxUh/6knp9xDhNWRg1hwDpA1aQXsYSSUr7zhUdFj7
	m2Zi4KRRKsa1wl44c3kikev6G5q6EA6euju8rDmwWb8mQnelZdRJ7a76j9OpYCMB3twJd8N2J+s
	tBKSGXIfpq50LMUKzsHYr+fFR3Q==
X-Received: from plkh14.prod.google.com ([2002:a17:903:19ee:b0:2f0:31b2:9171])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce0d:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2f03f1537bamr103175945ad.21.1795439346390;
 Mon, 23 Nov 2026 05:09:06 -0800 (PST)
Date: Mon, 23 Nov 2026 13:08:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123130859.3487100-1-amitamishra@google.com>
Subject: [PATCH] iommu/arm-smmu-v3: Support IOPF for masters with multiple StreamIDs
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Amita Mishra <amitamishra@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently arm_smmu_enable_iopf() rejects stall-capable master devices
with more than one StreamID because arm_smmu_page_response() hardcodes
master->streams[0].id when issuing CMDQ_OP_RESUME instead of tracking
which stream originated the fault.

Save the faulting StreamID in fault_evt.fault.prm.private_data[0] in
arm_smmu_handle_event(), use it in arm_smmu_page_response() to target
CMDQ_OP_RESUME at the stalled stream, and drop the single-stream check
in arm_smmu_enable_iopf().

Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 100b34f07032..53c396d3187a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -954,10 +954,11 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
-static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
+static void arm_smmu_page_response(struct device *dev, struct iopf_fault *evt,
 				   struct iommu_page_response *resp)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	u32 sid = evt->fault.prm.private_data[0];
 	u8 resume_resp;
 
 	if (WARN_ON(!master->stall_enabled))
@@ -977,8 +978,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 	}
 
 	arm_smmu_cmdq_issue_cmd(master->smmu,
-				arm_smmu_make_cmd_resume(master->streams[0].id,
-							 resp->grpid,
+				arm_smmu_make_cmd_resume(sid, resp->grpid,
 							 resume_resp));
 	/*
 	 * Don't send a SYNC, it doesn't do anything for RESUME or PRI_RESP.
@@ -2164,6 +2164,7 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu, u64 *evt,
 			.grpid = event->stag,
 			.perm = perm,
 			.addr = event->iova,
+			.private_data[0] = event->sid,
 		};
 
 		if (event->ssv) {
@@ -3313,10 +3314,6 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
 	if (!master->stall_enabled)
 		return 0;
 
-	/* We're not keeping track of SIDs in fault events */
-	if (master->num_streams != 1)
-		return -EOPNOTSUPP;
-
 	if (master->iopf_refcount) {
 		master->iopf_refcount++;
 		master_domain->using_iopf = true;

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.750.gf70dc682cf-goog

