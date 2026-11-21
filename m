Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258641;
	b=AVmbIvpVZI01dishgB2T+ViOE9gcV5K6OVL5c2TeNNWJqjDm9hARlN8h1pGZTOMBx83W
	 OQGGeHOInwyrOw1I7ewaKEqDeRNfBf9V0luQME10jrU5KMYSD+RW7PYc5eBhs68axzHwQ
	 S5ZpDISCdwLZw7sJBHGfYVxH744a2pTmkvuHejUYJHK4uiASoVMCnvABYd+Wbj3YzFBce
	 6Mw7YKcjRzQwIIjyK2A+Kv67LsoEdSspG2GFiLLtVdIUPpSkmYTsKWpnVlO3OdfP78flK
	 cnIwfjbbC2zH2XSsZPSDwSRpNYGfnX44GyuS7LXL2MPdn88cQy/8xF75xepDezL7xVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1m48DwzUGi6gFDDhXUxXisAF/EvcOOcumTNdjVePDOI=;
	b=F24NOJIehquL1xYjBE8zCWFitw0DgvGGR4301NkIBpqNzYoHiKDBh5GtgUCHsZ3atiAr
	 7xh6tmi4V/ePzF+QJ2982rEl8Twkq+c7PS5E9IuAAObeluxVEeVl1Zq1C+wWE5XK8SF4h
	 vjEwX3ufDa4TEV77kYOGtvgrGBZx9DmtHgVNzlkPpLYlN07nAIoMYUbKTfT+ExUpCx+yc
	 XvrfnLNvIWBeGwMr4eS8RJciZTCz+jgMkxRY4KWhyJTTR5DUGbMhUpjWvd5WJkaWql4Zf
	 Qj4N9j9o6ULvOmE54qeWXa4z1nZoLBp4d/rDGD26bH9XG5tEGH9/6HwiO2AP61OLbaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7mvumBZ;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DEF606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7mvumBZ
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1230562a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795258640; x=1795863440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m48DwzUGi6gFDDhXUxXisAF/EvcOOcumTNdjVePDOI=;
        b=F7mvumBZSNwUedRX/cSE3MAY0k3rNpC7uDfmktW6cnOKvRDx4tyOqsu2K+I4l7l3T8
         3aLhuFewdglnMdpfLouXvldpnLhlvesV0G0vpHu1pC39SIWYn+oDXsGZW190OsixRSiI
         AGnagRozSnXHHL8NmYZOFhoZauduuxONZs2GJ/9XDck7Ex9DPNBI5Zy6sR0HeKxNI2Bg
         IpxKUT1OiQuFIamfv7PcsQz0/xYydfgBDy72p6aubxM17XB03tqvjmR2GFxL7HPG8pHd
         iuPVijjBShiSsjqlU+eJLkv7B+2sUqEzhzKfPxBruIEZDf9tBBMgJ6gJZB+EBsGIErzd
         ktdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795258640; x=1795863440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1m48DwzUGi6gFDDhXUxXisAF/EvcOOcumTNdjVePDOI=;
        b=qLOrHX7dYF6kKeqs5WeGex58drmfalB6R9ZBnwD8UTJXZFdrC2X0osBWukRobhGKC2
         w7YQRfXYjaDfMgzXIZshuWy0cx+3nxAdtzRjspPF6Iz/WeSfj8VE26qK03tYj7gZYrz1
         wopu3gPDcux6I3D2NfbfmXMa8K5YzPU8T9g+nm0PsnosUN8JRqKSwRVwzO1JA9Gv1x64
         i/CHEHdFPrPNf0YkpD2eeXM0TT8HwHx+gSobBdEDlYADmpX5vwMC440as5z/k7jwQ/k1
         hrM55aofEzzAvqAf32Ryf23nPvPUEYbtuLYvWJY1eRwyKDLZP2dlkki1+Nr/3e7Kvv0m
         S68w==
X-Gm-Message-State: APuU4Z+n7cMKgxHc3FAO5yZHjKLRZWpzr65d2Sj0wOPj6BZztKAM/5WB
	MT3qc0Rbr87sNQ2biH/hBwHg3mcriOhz29dSAmHm5rOQ/FkplSrGmnUV
X-Gm-Gg: AZFdTZfqJBUQvX/mh435w67/hRCoQ8BdFyKy/LKibqZGDcVFYtckKQ5ifkOIzc73j5P
	YnbcE3QaAhzagXKqjtNcIiKco+4rQu/LqshL2ylXHVKrBwC0Fo6X0Z0Y1rq3HDvNNrcPQdnhqUU
	yyo7pqm6w0FBtO0IVPNhMzVVEeuEfyeEahsrTWExIpieKzDkz1QQq89OjeFTA+WUzDHXQvewFgf
	QydnmPwceJoJ2OR4eaGhFXjbVYysUUZuquPdxnwoBm4SVED8+E62jtMISdpO50rBa2UQ8PGbdIo
	l8K8xdzcCDhy7RtQXQxMnqwCKYqzYD+Ew/kYWq6MHCBOGjWDLKBHg3jh0EptotgqNpLEgpaf8Q/
	NeJIyLOlO8R2vulKgxKS+WmZUypj/NHBmpm6VxLq01aXlniPYVpebthwxLgipLsNz3STlrCK4RQ
	UCWVlbNVUFG6fQRmrGLPkyYpwh5W1RZweQTtYq4V6YGPz0QRXLQuBUnPCsYZukVhDQocIAq3WmB
	3aD822t44EM0uxcLMoVqu+2e4TWNPzjghJc9x/dbEQStSZlKTJX5f/DB3ilm0NBLHhY8iWWfumt
	aCQ6FOtbbYme1tqcNr0wFypLMlD1VG9f0YniNCCfQvf9NqJDyBil6mbk2abQNmIg
X-Received: by 2002:a17:90a:d2cf:b0:3b0:9781:ee8b with SMTP id 98e67ed59e1d1-3b41c9e46b9mr5178411a91.26.1795258640080;
        Sat, 21 Nov 2026 02:57:20 -0800 (PST)
Received: from localhost.localdomain ([121.134.184.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b21e19fsm1494739a91.0.2026.11.21.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:57:19 -0800 (PST)
From: Unsung Lee <unsung0317@gmail.com>
To: linux-cxl@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>
Subject: [PATCH] cxl/region: Fail region creation for a root decoder without a CXL window
Date: Sat, 21 Nov 2026 19:57:14 +0900
Message-Id: <20261121105714.1542859-1-unsung0317@gmail.com>
X-Mailer: git-send-email 2.34.1
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

add_cxl_resources() expands a CXL window over a conflicting resource
and then removes any following window that the expanded one contains,
or trims the start of one that it partly overlaps. pair_cxl_resource()
only sets cxlrd->res when a window still contains the whole HPA range
of the root decoder, so the root decoder of a removed or trimmed window
stays registered with cxlrd->res == NULL.

Region code uses cxlrd->res without a check. Writing a region size
under such a decoder passes NULL to alloc_free_mem_region() and oopses
with resource_lock held for write, which then stalls every other
resource tree user:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:get_free_mem_region+0xfa/0x360
   alloc_free_mem_region+0x1e/0x30
   size_store+0x1d5/0x300 [cxl_core]
   kernfs_fop_write_iter+0x13f/0x1e0

Auto-assembly of a committed region under such a decoder would do the
same in __construct_region() and cxl_extended_linear_cache_resize().

Both the sysfs and the auto-assembly paths create the region with
__create_region(), so reject a root decoder without a window there,
next to the existing check for a dead root decoder.

This was hit with cxl_test in a QEMU guest whose 64-bit PCI window
overlaps the cxl_test mock windows: CXL Window 0 is expanded over
PCI Bus 0000:00 and swallows Window 1 and 2.

The problem was found, reproduced and the fix tested with an LLM coding
assistant driving the QEMU and cxl_test runs.

Fixes: 23a22cd1c98b ("cxl/region: Allocate HPA capacity to regions")
Signed-off-by: Unsung Lee <unsung0317@gmail.com>
---
Notes:

- How this patch was made: an LLM coding assistant found the problem
  while running cxl_test in QEMU, analysed it, drafted the fix and this
  changelog, and drove the reproduction and test runs below. I reviewed
  the analysis and the fix against the code.
- Reproduced on v7.3.1, v7.4-rc3 and cxl/next (32af781935). With the
  fix on cxl/next, all four root decoders without a window fail
  create_pmem_region/create_ram_region with -ENXIO and the guest
  stays up; the ndctl v85 cxl suite gives the same results as
  without the fix, except cxl-poison.sh, which now fails instead of
  oopsing the kernel.
- Only the alloc_hpa() path was reproduced. The auto-assembly path and
  the case in the add_cxl_resources() comment (System RAM spanning two
  windows, the second window trimmed) are from reading the code.
- With the trimmed window, its decoder now gets -ENXIO instead of
  using the remaining tail of the window for dynamic regions, as that
  comment suggests. That matches what pair_cxl_resource() already does
  (no window, no cxlrd->res); making the tail usable would need the
  decoder range to follow the trimmed window and is left alone here.
- An alternative is to warn in pair_cxl_resource() or not to register
  such a root decoder at all. Rejecting in __create_region() is the
  smallest change that covers every user of cxlrd->res.

 drivers/cxl/core/region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 27e63e6da..a2cd18571 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2792,7 +2792,7 @@ static struct cxl_region *__create_region(struct cxl_root_decoder *cxlrd,
 {
 	int rc;
 
-	if (cxlrd->dead)
+	if (cxlrd->dead || !cxlrd->res)
 		return ERR_PTR(-ENXIO);
 
 	switch (mode) {
-- 
2.43.0

