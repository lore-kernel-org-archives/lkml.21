Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188535;
	b=RtGRemvJ/IHodm5Vfp0uwhdw0rFOp7otTbmWFnTWfej0PTrrQPounWjJzbWDKK17BqQn
	 0Ue9++/kEFhce0PdRbMEixtJQYXk1GeYxE3cCaROaNo98YrAntOeXWSnSDgyW3v7ZN2N3
	 gYbYeSscRN94QLihNhitrdPDQZJxlhAcEt3Gv9UslC5pbuJ8HiqkArkPhYICKauEHXZEL
	 fmbTYcmhQSXtEbF8lFh+ljfNol5dUIw/zi/KP1wQaByyLP5NmoZOyv6xXNg4ae6mkXGRa
	 ySb8BmQquGw6fvGQO0H6Ag+MuCNltLh+1ipExRlMgfYgBf+FZ7XbnuQmY3l7hrVhegA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hxpLjtj7QP+IYBWsy1XSO9tGe0BNcI3vqQsQIXeopWA=;
	b=JQtJTQzH+PqyD8Hj84fFTiuTZ4QIonyD+HlIkqdbqu7Ldil2YqE8PnHos3Paf2ZyZvMF
	 dS4f0brZTDbNVTVqCJurBt41ba4qHDo3TD2pd3+WvTDAP3pjkoBRg2Bm6+Gnobsy0YElr
	 dd/t1tgQsSNXv+oZ4vVa17mh1bF/leUIU31bjJ1mAJfAxb3J0U60hmNjjq5iCfA/rjgyD
	 sXsuTiwJGBGgPyNgZdnJiCRzrUmAk1USIQi0a9qQskWfgC6Nd0whaalKURskgTYNoM1qV
	 p80ItHusRWuF6d6s5HaLR/ETZZf8VvmNuBPqmLKZfZdarRpvwS5XiHiCAsaWKOwqJGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wb8If9wa;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC05606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC05606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wb8If9wa
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04244c3d0so8248045ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188534; x=1795793334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxpLjtj7QP+IYBWsy1XSO9tGe0BNcI3vqQsQIXeopWA=;
        b=Wb8If9wajhSMgOESDJx4EPU/lX32S0Q5QTIiGjX8phHFe9wS5MPo0M7swaiGwPnltV
         /J9PkufWLU5VZZ+dOWKwpZQNQM9nM66t3Y3m4ysFLCJzATTpTHo63yRWJaYFHGfaQ8aY
         4ofbZzT6X7Z9GRkX+2a+VtIWT0js9bel0YG9+6LFJCQq9MRqr/WbcjjBMnqZfTVkQD95
         tS7blTqopDD9jY7yOE8MylobDG3goobtnNTOI3Xwb/6vfBCOWom4Hz8l2s1a9WQGNbMb
         m7uwaV4lZhj51vOlVFICRozPKsKbQzvrymPiKMIJsnVJwD7STUTmsOTwxajZHk3C85cD
         XG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188534; x=1795793334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxpLjtj7QP+IYBWsy1XSO9tGe0BNcI3vqQsQIXeopWA=;
        b=CzkqZ2dfS5zdLFO1lshtp0d4bytSkW3IGur8XWtVginloGljpTbuB34u1WdHrxCJW2
         YGjZhvnYQWJwQuxqG2b3nlGDkxDw4yNxh/xtaGx6wnVXb7Ku8JabYGTv/ipTYnvGJINW
         d2SuJFCaO+eN0DmEQcYPfarc4B3bmsRzggdIXax5v2J7mJKN1ir/j/WFCjrDywrFmaCh
         wbaL6tXJwyDVU6t2ZvKVIed4wQIXRzXm8G2al2SW/r0tARtlBJWgmxbFTQXMrIi7dQqM
         IxKHgymbaMrkMunDONYkH3LP9y8+bTNiqhuQwyoR9mr/d97nwNt2sX3sh25pRWoCxQPQ
         gBVQ==
X-Forwarded-Encrypted: i=1; AL+hErGXCtq5Qw8ozPtuQLCa+wITs0uPB4jmE8z4LqGI871Tu2Fyb6gzr+k+ILAGYER3ud2MGKIT3CbAFtg7bqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mqYdlicbBGY9mW2wF4ekz20tBoN2ndIPDEzKer6LbcuH2cdBe
	WJLaShURt7K5NXCbOi/lEsM9JK3H5xuXMKiZAid6WBHzXA6OZ3lQF63sO4Sd5+FlClE=
X-Gm-Gg: AZFdTZfjPt/zPyD7dqW2ZGfARzZKtVDhHSTVzLANI/RMqb8JI0ZaXRbU1zui5FJPN8z
	MpYy2bUOjrjOeQ1MSNs/anxYLyeQHgAN7YkD/rHCffpg84wBnkWJesRB/rBWgQqfecg86t+d+j1
	qozEua+4cv9DmX9wKH+r7cUijNKzW68N50JDXTVNKc5+a0RiXq6kverkjPFDkk+Y8z9kR9xCQdZ
	JeLMu0T2FdtTsCBJYdpEjhjQaJYuVeVWmzTORsofuy9FNquQAcgDcvQPIhlJLknO40Oh1JCIEEy
	bytkl/Zq4JdCYznZcNImv78alTOmYrAxHCSEQchY6vFScHwaTedSQWeM19alpHTvWKWzKIV6bxV
	yBJLNvOVHAch+SD8tzikp+J6/5df6RURojy7tGRMGbFU8aURcuxVryh2X5kYsa0RU7YRi74ANoS
	PHbGuvX2HeBih0fzpn+pt8EuVnYp5W04887Omp77ySKHSP5D+HPtI+mi69/LcP8csnwMhny4zZc
	GaThwiZ1azqgZpO5VQceGXbnj33mJCvbeuMufOrA4nLSK2ihQOroporm8PEZr6F0o9jLaWEb6ZJ
	sd5UDvZqASWdK2oP/grxz7UssZeOidKgO/jQJMLw5pc=
X-Received: by 2002:a17:90b:2f8c:b0:3b0:b556:ba9b with SMTP id 98e67ed59e1d1-3b41c9b227fmr3089477a91.23.1795188526303;
        Fri, 20 Nov 2026 07:28:46 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm7998673a91.5.2026.11.20.07.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:45 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 3/5] bnxt_en: stop DMA before releasing rings the firmware did not free
Date: Fri, 20 Nov 2026 07:28:25 -0800
Message-ID: <20261120152830.699712-4-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
References: <20261120152830.699712-1-joe@dama.to>
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

When HWRM_RING_FREE is not answered, bnxt_hwrm_ring_free() clears
fw_ring_id and __bnxt_close_nic() goes on to call bnxt_free_mem(), which
unmaps the ring memory and the RX buffers that the FW may still be
using.

This is reachable in production. On a BCM57504 the first sign is the TX
watchdog; the close that follows times out a subset of its RING_FREEs and
the driver releases those rings anyway:

  05:30:12  NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
  05:30:12  Resp cmpl intr err msg: 0x51                  x20
  05:30:12  hwrm_ring_free type 1 failed                  x12
  05:30:12  hwrm_ring_free type 2 failed                  x8
  05:30:12  AMD-Vi: IO_PAGE_FAULT  x3

Count the TX, RX and AGG rings whose RING_FREE got no response and
report that to the caller, which stops DMA before the ring memory is
released. This is skipped during a firmware reset or after a fatal
firmware error, where the reset path already handles the device.

The device stays unusable until the driver is rebound.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 61 ++++++++++++++++++-----
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index c3413354e758..600a8c866f3c 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7774,21 +7774,31 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
 			memset(cpr->cp_desc_ring[i], 0, size);
 }
 
-static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
+static int bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 {
+	int stuck = 0;
 	u32 type;
 	int i;
 
 	if (!bp->bnapi)
-		return;
+		return 0;
 
+	/* -EBUSY means the firmware never answered, so it may still own
+	 * the ring.
+	 */
 	for (i = 0; i < bp->tx_nr_rings; i++)
-		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
+		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
+					   close_path) == -EBUSY)
+			stuck++;
 
 	bnxt_cancel_dim(bp);
 	for (i = 0; i < bp->rx_nr_rings; i++) {
-		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
-		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
+		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
+
+		if (bnxt_hwrm_rx_ring_free(bp, rxr, close_path) == -EBUSY)
+			stuck++;
+		if (bnxt_hwrm_rx_agg_ring_free(bp, rxr, close_path) == -EBUSY)
+			stuck++;
 	}
 
 	/* The completion rings are about to be freed.  After that the
@@ -7818,6 +7828,26 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 			bp->grp_info[i].cp_fw_ring_id = INVALID_HW_RING_ID;
 		}
 	}
+
+	if (!stuck)
+		return 0;
+
+	netdev_err(bp->dev, "Firmware did not free %d ring(s)\n", stuck);
+	return -EIO;
+}
+
+static void bnxt_stop_dma(struct bnxt *bp)
+{
+	/* A firmware reset resets the device, and the fatal error path
+	 * already disables it.
+	 */
+	if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state) ||
+	    test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
+		return;
+
+	netdev_err(bp->dev,
+		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
+	pci_clear_master(bp->pdev);
 }
 
 static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
@@ -10852,16 +10882,19 @@ static void bnxt_clear_vnic(struct bnxt *bp)
 		bnxt_hwrm_vnic_ctx_free(bp);
 }
 
-static void bnxt_hwrm_resource_free(struct bnxt *bp, bool close_path,
-				    bool irq_re_init)
+static int bnxt_hwrm_resource_free(struct bnxt *bp, bool close_path,
+				   bool irq_re_init)
 {
+	int rc;
+
 	bnxt_clear_vnic(bp);
-	bnxt_hwrm_ring_free(bp, close_path);
+	rc = bnxt_hwrm_ring_free(bp, close_path);
 	bnxt_hwrm_ring_grp_free(bp);
 	if (irq_re_init) {
 		bnxt_hwrm_stat_ctx_free(bp);
 		bnxt_hwrm_free_tunnel_ports(bp);
 	}
+	return rc;
 }
 
 static int bnxt_hwrm_set_br_mode(struct bnxt *bp, u16 br_mode)
@@ -11383,15 +11416,15 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
 	return 0;
 
 err_out:
-	bnxt_hwrm_resource_free(bp, 0, true);
+	if (bnxt_hwrm_resource_free(bp, 0, true))
+		bnxt_stop_dma(bp);
 
 	return rc;
 }
 
 static int bnxt_shutdown_nic(struct bnxt *bp, bool irq_re_init)
 {
-	bnxt_hwrm_resource_free(bp, 1, irq_re_init);
-	return 0;
+	return bnxt_hwrm_resource_free(bp, 1, irq_re_init);
 }
 
 static int bnxt_init_nic(struct bnxt *bp, bool irq_re_init)
@@ -13462,7 +13495,8 @@ int bnxt_half_open_nic(struct bnxt *bp)
  */
 void bnxt_half_close_nic(struct bnxt *bp)
 {
-	bnxt_hwrm_resource_free(bp, false, true);
+	if (bnxt_hwrm_resource_free(bp, false, true))
+		bnxt_stop_dma(bp);
 	bnxt_del_napi(bp);
 	bnxt_free_skbs(bp);
 	bnxt_free_mem(bp, true);
@@ -13541,7 +13575,8 @@ static void __bnxt_close_nic(struct bnxt *bp, bool irq_re_init,
 	if (BNXT_SUPPORTS_MULTI_RSS_CTX(bp))
 		bnxt_clear_rss_ctxs(bp);
 	/* Flush rings and disable interrupts */
-	bnxt_shutdown_nic(bp, irq_re_init);
+	if (bnxt_shutdown_nic(bp, irq_re_init))
+		bnxt_stop_dma(bp);
 
 	/* TODO CHIMP_FW: Link/PHY related cleanup if (link_re_init) */
 
-- 
2.53.1-Meta

