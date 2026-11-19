Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107982;
	b=rcBTYDdvdzuivrOqMmrF4flEDA/7fUlz0aWrFbJZ8PeNZ7huPawD365mOB839/kCbskC
	 ldszbyD9EQ2eA2tfGWgtUzp+O+R/KydV1onkgwIIeryDwuOzFvi4mevRVMKcW8C/MuNyb
	 aGqxZpBJ2JF/de4YUrH1fRL0CcnLM/XFTWKAbOIYNyhltIzzPSWp3CuPw4ilTlSUVWu0m
	 ybvOakSUpP3BPmmj81FKK1D7R8Bqz+DkVDE+vbwBWHOC90h7JdducseNEVsg/suyN8IF7
	 zfJwtMoUSJ2qbpsB1sYXlArJCraCmAoN25i+6Jq8F8/pO8t8hSDzzT/dIzlFK1Qav4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
	b=Jh3wvc1x7FyhwQkaZg0g5/wsF+tAniQGZ7zUaU0ExWrZ6M8mSmwoR6Mu6Zwy8rX6n0kd
	 jpYkFdlallrirveeFIFwsAaa/kh37U4HJK5hsUSvzzhvqHp4pVsQbgJvzH4goHhnxDVln
	 2WgODTqVHRzpXrKHkZt3rfKrcMGy4HsIhCPuhRQXsHum7nxlW55AzFEKZXFYpfe1Vh4uR
	 xIOkGS01cBZFrI7EvSeq+kmAKdnY2cgou61Jk1FQInufeCszziHKNpGutrB+V2NuksDCL
	 qgl/G1KN0N8eSPSWa84/cPDv1ldSRzZzA/2MLlip3WZtpNFjmrS5woQ0yVbD6/eqK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5FJymWa;
	arc=none smtp.remote-ip=209.85.161.72
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A01E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5FJymWa
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71ad76c01c1so2815301eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107981; x=1795712781; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
        b=I5FJymWahfLuJDZXebyzmrFVvBkmVjnDX5f2Cvw4WPshTFoe+pi6Mx1gtWyo7iJrCq
         6SIOUcUxLS8BuHgtZ464JDqdVSzT6zZdICyDCrPKmkygqoqM9qg8b4FY/TS0zc7gn41A
         V4Yar6nR+/wP51HHdqSGMA7elccd1zdhAbcTpNpggWQ8SwZSwJlDIqCj1QxoOsGGGSaW
         2QHwa63ih/r8iH4RI8tg7bDyTKBmQakMdAZcuELWJgt3lABcZ9A+O5ePIPTVQK/NQn8i
         4l8H0y9KLXI6BrBy+XyjqlS3A88T1vg3DVRUiZuzItLjJaa7JIiilz63wJgf8dECm64K
         pfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107981; x=1795712781;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
        b=oK+jaqF/J3Z1y4tbL4Yx0fh8HUP4b+A6rU5M+SHYrVstnwqNstPXrNcjThofgZmV2v
         VQUFhyRUjrbrWCqYSNy9R6CB1VV0fxGPOge6TxWvm/BGGOyIu2Nh6KE2X3SIQO4xHOt3
         RKNn+QMtN0V0UO1l2zU7iD20Uc/WJgUhyMrEH5rlRAjBxYlZZTphazmyanF8nFAv+Fzv
         xOrwfFgMuSsLX2bAcZ/qcvHUyHEkm3ZodK4jTarOyM4NS1lZxfElSXogcBQEiUDPGS9j
         T7SFSs+myOX6L20oD24aGThOP9c+NhYyF9FjZKX7TohNdQpzf3Akuzmu1D4CmftxDazb
         Wfcg==
X-Forwarded-Encrypted: i=1; AL+hErGwwr9lZ21lO0cyKANFgzmAQujKZX29GpTOf06zacHniH6c8TYGZMF+TNs/ou7223GlCbvf3Xd8JDywPIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uU4xM2MitIZUNY25Ra2yAsPqAyt0F+yo3ZNz0g0HEezgrtXpo
	Ejth2T789aoygLgxpB2oREXUq7+USZbd7mhmNNqQRz4LZdyuPitTZgEM1ZAvzi9a53igJ1IqbQO
	C2JKSUydy7Q==
X-Received: from oaccw5.prod.google.com ([2002:a05:687c:2705:b0:4ad:bde3:7f14])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1620:b0:716:d2b4:f895
 with SMTP id 006d021491bc7-71b395258b4mr197475eaf.62.1795107981165; Thu, 19
 Nov 2026 09:06:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:13 -0800
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
Message-ID: <20261119170613.1519353-1-irogers@google.com>
Subject: [PATCH net] eth: funeth: Include FEC stats in fun_free_stats_area()
 DMA free size
From: Ian Rogers <irogers@google.com>
To: Dimitris Michailidis <dmichail@fungible.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

fun_init_stats_area() allocates coherent DMA memory for
(PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
64-bit counters (632 bytes), whereas fun_free_stats_area() omits
PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
triggering DMA-API debug size-mismatch warnings on teardown.

Extract a shared fun_stats_area_size() helper used by both allocation and
deallocation paths, and cast the leading enum constant to unsigned int to
avoid cross-enum arithmetic.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wenum-enum-conversion; not tested on Fungible Ethernet hardware.

Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
index bad8276d26b0..e0d4e69abfa4 100644
--- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
+++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
@@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
 	}
 }
 
-static int fun_init_stats_area(struct funeth_priv *fp)
+static size_t fun_stats_area_size(void)
 {
-	unsigned int nstats;
+	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
+			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
+
+	return nstats * sizeof(u64);
+}
 
+static int fun_init_stats_area(struct funeth_priv *fp)
+{
 	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
 		return 0;
 
-	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
-		 PORT_MAC_FEC_STATS_MAX;
-
-	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
+	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
 				       &fp->stats_dma_addr, GFP_KERNEL);
 	if (!fp->stats)
 		return -ENOMEM;
@@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
 
 static void fun_free_stats_area(struct funeth_priv *fp)
 {
-	unsigned int nstats;
-
 	if (fp->stats) {
-		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
-		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
+		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
 				  fp->stats, fp->stats_dma_addr);
 		fp->stats = NULL;
 	}
-- 
2.56.1.708.g77570a6a1d-goog

