Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660574;
	b=5bUoDAgwQaZt6lwO06gxQ/r7OlGpj3ltsRr0jNtXIyligu85FfKqFwJGceGt5qJiHzIV
	 cy8O6Z//X3HBtbyYpXZd+ADa/PPanw2UmL7AwhVJhfUgvlZupPefsYy97fKrWn+iEUyAB
	 6nD/MTpXmQ5aF/s8LWUHPqda23eQ2hDdZsonmCtcjzClXmO7hxeXFPUrr6uiGItC7P6gU
	 ZfcqdI4jfz4yNsyLOQzaNR9rfZmDteE7h0khMW3IobV8WYiHeIR5Rdstn42L3soL/5ACM
	 IfDPmSwdfNnbvqwlsZ9RqnLBu1flDSD1zGMVN4g7VPLtp4Nixp6mdPGMkroef7425Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660574;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/QPB6KdEon9Hls7KBc1ZetoO1hG+IGhWAru13tWVszM=;
	b=IXTTTI2q5y9aujw4suj+tm+yiCJgIlT4Kd4MXcSTKeeR4ri/jgnoGnIg1GiexNYs5Jb6
	 x5GiU2KHw4aBg6Ho/ASbIQzeGawRQFLMeRXo1lZG100lWvbL20JRw0HwFfhRAiCnZL/SB
	 otIqQHY6+AwcHvm/bfhex/V4jGAac/Oprxb6/ID/2GgORC7aRFqWzsca5LpPQfLkLaVGd
	 EVfdT6ocJQXbdampusKY5U6yoO6/5Mh0cTfyTKgxiNydXVxeeVh+MhirVEwK8PvxYnM6O
	 PUULTQ1NqeUGAaefBLQNPxIJuA3dg4FAu+oH7bWJvMlB6Xa5p1xysOFGpXvc5YcOMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2467606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2467606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so7981853eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660573; x=1796265373;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QPB6KdEon9Hls7KBc1ZetoO1hG+IGhWAru13tWVszM=;
        b=FxhThV3CGYAuKREnVx7p9K5R8S6jjQlvQdmpzzh01hImy1gSGxsmQzcxUIUHxc2ydG
         cH+yblRnubDOc0dtAtXuagTFGmg6fWnoj6QGxIEP/UyH0UWqz0g1BiGHmBPLnfW+I+iJ
         b9gzimRYKdckTHMzgS2o7K3B1I2gL2HqC9m8nTSA+mUbVeIGbIx7juSHPEbpU6ivpJkY
         18rl2domCUSWViW5ir/FEDql5vTyUVICDmwKnmdmwi6OLmH+80uOvgRxRY117w56ETXB
         cBveBI3vBCR6Dzda+ELPkghnfp5tSJr81+IByCebAnff+8iPOgPSThjBeGi2IoNyAQO9
         3axg==
X-Forwarded-Encrypted: i=1; AL+hErGguykk/zfYRfe3EddJPW9IDKbgsY42qykL7RGtNp6JbmWNrOUBHJEIZo5pspTnLC+oU1RQLfMg9P+saso=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HEsfey/lSkXjiVhJtSmx+5kSZGgOiZhxwwS9qWpT6ZmmbIInC
	tNQwosiNUIvthXaRqyeRRnxUrX4qcKBsktnTNnTj/DhHdeTgn0qhYZwc9/o1r9Hkoiyb
X-Gm-Gg: AZFdTZcIa4N/9yqgT2jMQa9PbEdaXQG5IoiiHCBjyvbrAnV/OdrCekTemd27MSgtvBy
	yM/rJLGz6PmQi7FRQcF5UvtpGNwuMiKuEexrIJWnw8RzaDghLpx2x0Ko1urouG5TAUa8Nf3vkMO
	Un3Lyxxc3nClbHcC3Pg+d9GIJghFxrFsJHtOugi6QNV09kRw2PWMOKUgt7sgqr1IgSHOKF3UdaN
	EeHZw71bjz1K6Fbgj/G9122Ez3KNxJxID0o52dyRdXyBinmFwup4xKtg3WSGHT3c9+XK07/R56W
	/AiFm5DHR2LPqKb2QO9WPLYczW6n5dKOrfhLU/ns3qsCzgtektPRkumrENvRuGbcITdEuIb5sD3
	sP2R8o6E2LapQ6gujzHNexSIqJNMfGHhrUj2Km2ZMNxl8ALifUrGHcnhrfuD2ylh3ExOpTGPVRe
	wPMD/xKJ6bwBxcqzeKd0pzvIeNVhbwep6Sg+BQrPqRQhKSub4Iv9u4gNF9nKjVb87vUvJCFqh3V
	0l9lGF6TC7aTam1f1eoYDUPKai57dc/ngxNV2Qj/rKto9deK7hZlxYoxgp7nX3T/Is6aPRdw3x1
	hZRrE/oVNTpURW+VboahBjAlncXpnRLxWD610uvg2A+mESIgdg==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr22802373eec.3.1795660572514;
        Wed, 25 Nov 2026 18:36:12 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.35.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:36:11 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>
Cc: Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
 Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
 Ben Cheatham <benjamin.cheatham@amd.com>,
 Michal Schmidt <mschmidt@redhat.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] cxl/edac: Mask DPA flags in the event record cache key
Date: Thu, 26 Nov 2026 11:35:23 +0900
Message-ID: <20261126023520.39368-4-ai@linux.com>
In-Reply-To: <20261126023520.39368-1-ai@linux.com>
References: <20261126023520.39368-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The low bits of the DPA field in General Media and DRAM event records
are flags. Bit 0 is VOLATILE and bit 1 is NOT_REPAIRABLE. The trace
events print the DPA with CXL_DPA_MASK applied, while
cxl_store_rec_gen_media() and cxl_store_rec_dram() use the raw value as
the xarray key.

User space takes the DPA from the trace event and writes it to the
mem_repair dpa attribute. If the record has any flag set, xa_load() does
not find it and the repair fails with -EINVAL.

Use the masked DPA as the key. Records marked NOT_REPAIRABLE are still
rejected, because the lookup skips them. This patch depends on
"cxl/edac: Skip event records marked NOT_REPAIRABLE" for that check; if
this patch is backported, that one has to go with it.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Reviewed-by: Li Ming <ming.li@zohomail.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 7aaf1242ba2f..411d586c3484 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -925,6 +925,16 @@ struct cxl_mem_repair_attrbs {
 	enum cxl_mem_repair_type repair_type;
 };
 
+/*
+ * The low bits of the event record DPA are flags (VOLATILE, NOT_REPAIRABLE).
+ * Records are looked up by the DPA user space writes back, which comes from
+ * the trace event and has the flags masked off, so key them the same way.
+ */
+static inline unsigned long cxl_rec_dpa(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_MASK;
+}
+
 static inline bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
 {
 	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_NOT_REPAIRABLE;
@@ -1141,8 +1151,7 @@ int cxl_store_rec_gen_media(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_gen_media,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_dpa(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
@@ -1171,8 +1180,7 @@ int cxl_store_rec_dram(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_dram,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_dpa(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
-- 
2.55.0

