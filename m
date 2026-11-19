Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107910;
	b=VqqMlBotN9Ps3jav2yiEPHKyudmJCJ/SFSOpSPpfYLwinHWM81vQzCyfvZqzvj6ZXwYQ
	 rp7ecceuyCuflzdGMuuBam47pqY8BRNu+ssA559IVRzcFqxRXBIB+cFuMvqVGetxe+Zep
	 pfPnVBwZgG746FvaX50y2Z8SX2jXRDsjC+UJd4YpEi1VsSsc6cCDSFRnk7vvbQK2PV0wt
	 87lo05q3ueAthDRg0pMC4at6uBVWzY3JtlRSCIF/ttEb0CTXeLIcLFEZhfarci+MrFUeW
	 0rfyMwtxPZq+dP5a2kG6t5BNr62B7gsn13rSNBg2OzVZ+IM0NS8rMZC9IVEjIHTjf3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rx1BIBm+pFF9M2IDaKvF8w7SnrBT54mjfoNt8Z1QDIY=;
	b=CSIoybiuv8MV5zbWbETCmrpvFc4qTGdFbkDbBlcjUUxApkCIRaLF3XB/hHh9aNKuKmIZ
	 88njrBXGabFAwusH+8/x76H8WclwBqdMUilqBYhw+0kJui4EWK0BQHB6Y6Y7K0SZOmYcG
	 TeQJQQzWWCZ8/g37gUQVkWYhXIIPqMx0DACluzBTU95VfhCOryoGTF9KaA043OwpaV26W
	 8g6r0tYNBCfBt9KNtMHjlCkv1AowNeohwQI+QmrmjF61YqnfZO3dk8QEGXF+Vmp76JogD
	 sfRreiq2T7b/7jbBewimhO7Vh5c799NTuDv1ODViCtB252/v5JablpPGjC7CCfSZIRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XypShG+m;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF080606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF080606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XypShG+m
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1026366eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107909; x=1795712709; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rx1BIBm+pFF9M2IDaKvF8w7SnrBT54mjfoNt8Z1QDIY=;
        b=XypShG+mg7PEmJ2lUqwxibs2QIjo7Al4LepDjreh9bc0ocD5/CkpN/FlYJro2OfmE5
         i2WyTSAyZxPBy2Kzlgx2jBngy33k7qmLyFM0Qp7mjO7PXG4zWtI7spG6B+22hyY2U+8G
         709+/VX8gySbnE9VPHiJXC5ksCEsje630BDjHKoFuNw57C3vpcsEe4sRFe0R4pycvEy+
         DgwE3nRUxAXRrAgxQuFsE0oXgDPG279pqgvGjX3n+7W8jvdQC81HknT8W0lMv/GY6LuF
         yUi1l/QSX/yCOiS+Csp6LrcBwNM+9Tw9tTHcAIY8rBx/eQZO19mkteSzEy7c5/u5DB0c
         6pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107909; x=1795712709;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx1BIBm+pFF9M2IDaKvF8w7SnrBT54mjfoNt8Z1QDIY=;
        b=rngCTNlc7Ptd3tAgaclW3JGRGysPnWY9SZ+GqD5XdnoexiIJ9yUuybHHK+iACKa7Kd
         XOialycLuHfILlt8tRiqK1SVDAkccSpHLoxd0MQyix3OtZN10kYJkwGN5g1wKvDpqIbH
         KqhCOeXgBJLcOKG6DN9AlVhp6ghGJ/y/p7tPbL8Qc/mgamVFIw5TDUstxcMnYyjthRbM
         gz9pJrearXOE4RASKRq1E/Ho15s3tDvXKzD665IB+I3NeapTfgOEJWTtYEJxj34D90df
         7WgOowwboRJvZNgqvGiNr1PinuWrHXVm7lqmjmkvBVIqhRnTEH1Fwkn06N+6dRzwvw3h
         E4Fw==
X-Forwarded-Encrypted: i=1; AL+hErE/WVcF/tJV+0ZyKcFDcgWNMySaI8EBfN7ph/mZWXQto7BNJxTzQr1wVHQyC9FUmrCrBFy+WbfTR41VbKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XpfRdlUpH230p3Bcm6lSBBYSaeMsxW50wDOKKcbMlv6r/VeLh
	7UHZQ72t3vEuoRs13znkEbc1DjLiQO18DHOAm9GxWH+Ib/6Z03mw4UDoVhBrQVtwWrM2UdW1mrV
	UYR3/qt+T7g==
X-Received: from dlbts7-n2.prod.google.com ([2002:a05:7022:b047:20b0:1b5:4b48:ba2f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b056:20b0:1b3:ac53:da84
 with SMTP id a92af1059eb24-1b5568e371bmr272053c88.32.1795107908743; Thu, 19
 Nov 2026 09:05:08 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:05 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170505.1515029-1-irogers@google.com>
Subject: [PATCH] remoteproc: core: Format firmware carveout rsc->name with %.*s
From: Ian Rogers <irogers@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rproc_handle_carveout(), rsc->name is a 32-byte u8 array inside the
firmware resource table. It is passed directly as the printf format string
to both rproc_find_carveout_by_name() and rproc_mem_entry_init() (which
call vsnprintf() with zero varargs), and printed via "%s" in dev_dbg()
without verifying NUL termination within sizeof(rsc->name). A malformed or
corrupt firmware resource table containing '%' specifiers or lacking a NUL
byte in rsc->name can trigger out-of-bounds reads or invalid vararg stack
accesses.

Pass "%.*s" bounded by (int)sizeof(rsc->name) at all three sites in
rproc_handle_carveout().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Verified with an ASan/UBSan C test and build-tested under
LLVM=1 W=1 and -Wformat-security; not runtime-tested with remoteproc
firmware images.

Fixes: 72029c901a02 ("remoteproc: add helper function to allocate and init rproc_mem_entry struct")
Fixes: ffa5f9c84810 ("remoteproc: modify rproc_handle_carveout to support pre-registered region")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..1b1743093edc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -837,14 +837,17 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
-		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
+	dev_dbg(dev, "carveout rsc: name: %.*s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
+		(int)sizeof(rsc->name), rsc->name, rsc->da, rsc->pa, rsc->len,
+		rsc->flags);
 
 	/*
 	 * Check carveout rsc already part of a registered carveout,
 	 * Search by name, then check the da and length
 	 */
-	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
+	carveout = rproc_find_carveout_by_name(rproc, "%.*s",
+					       (int)sizeof(rsc->name),
+					       rsc->name);
 
 	if (carveout) {
 		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
@@ -866,7 +869,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	/* Register carveout in list */
 	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
 					rproc_alloc_carveout,
-					rproc_release_carveout, rsc->name);
+					rproc_release_carveout, "%.*s",
+					(int)sizeof(rsc->name), rsc->name);
 	if (!carveout) {
 		dev_err(dev, "Can't allocate memory entry structure\n");
 		return -ENOMEM;
-- 
2.56.1.708.g77570a6a1d-goog

