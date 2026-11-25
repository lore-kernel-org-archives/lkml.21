Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629636;
	b=5l3xMuwrhO/einihChA2v/AoqAH3oFGoedOYPpNrqasZQ0EIM/1Hj44XZ5EgAEhUzERq
	 5GCjM3txePN5/hWRvkEnQrQ3hHzbnkwCNygM1zY8mE0kdI4cR1V+NiHtLsMt2bluUBoO4
	 2ex0+IYCXIVPGdkEuv2D7/Nh1Oer2tM9c4lPi5J9F9LsiZsiW9KeuD6iHlGuXyQccMEjl
	 PvOobpqkwJpRXMT/Lz2pRXoLw6Lyc0i2aKNwr7iwYxe8d6pRp6ZjjOkFkhpzaY9r71Sft
	 XVkiC3VJ5IwwPs3Z+H7llOIUsHJ96tOs0V0A2R3MZOud5cdfjCjRrf/SOsz5zjG7Ctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3pm0NV4l/0E19QH1D7hyEXJVUZBwSAdff5s9WN+kmkw=;
	b=CI11dnOwykMt8PA9V6ck5L+VnLQcOpwMC+YMv52OPeoAR859UyA0sK5nxEjdvbLEPnAG
	 lpjLNWl40vIYZ7pVSkQmbFkeQVYLE1E3Q9xtpZy1u8/mTYXFyeaFbNRSN4T3Zbzcua0Ev
	 Q6UCSzlIb+JCmNvOM8yJbN51wfiRE4b63d+dFX8Cql1pd67VCfwu/Q6/oPsjeyJjMKHwY
	 Gk/iRGm2PV33CZXtxPVhcc2PTcPcVOus6o+DGgRRYLrMsxCKMJnUUw0RWDHy4Le1X9aNp
	 a6hrW65s0nvHEfQ1J4vVFTAB5Ix/zG1YGjrF78+flZ7wHSYl90D//qWnAV3ruC+QL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qBoKpS3Z;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA90606A687
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA90606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qBoKpS3Z
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde827b7b95so1832326a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629636; x=1796234436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pm0NV4l/0E19QH1D7hyEXJVUZBwSAdff5s9WN+kmkw=;
        b=qBoKpS3ZZAB8952Iym+pb8+MiwHIZecNThqHFY21LgH06n26HX/kC9kPbvCPXaIFE/
         WCgnQ7QIM3sXxomeD/2k6pk/fBFqYC6wH1584SXgaEGeXKmNHUtJZ4rpwWYjAROfU2uf
         eTLLkE06V1Af6gyF4ZujBdukvmLgr0BdMh6ixf952Sjs4aMfxux7oVFBt6yOWb4ILTxT
         /Bs9r17IDrmKZ38nrhrkmjkvBqXWIrLT3YcUCbLa1nwpu9jZCSrv2nmsGiOaKg87SjkG
         i3wL1QXraLDm+Vf2MRO6y5sjJeU9KaMvVE/Ewnr0NaqPXFBMoraDCkFy53K8+WrWXNnn
         DH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629636; x=1796234436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pm0NV4l/0E19QH1D7hyEXJVUZBwSAdff5s9WN+kmkw=;
        b=tsVPpvAGRkpiPVXwEEiGDzCmxr/Esc9plNV8vEtGbLfQRhFzHXAB6nBRkWyJeUzIxA
         eM7qPnd6/Nf5b7qAg1k8feO8ET7EXUfOLsKTnoiet7k1DDSgRBbXPlKL/4tAb15USDD7
         9iGluwuQm7psAMqZtdhAy6FN8vbXGHJSPLXjq2vtGTGwr7jZWaDlfn5vp170/JGD1YCg
         w6khM7gUZ4l39yoL1pKxvpYgrQk5UWd9A2O9tc1AeJOBaGBOXKV8hohhPG/xLAFKG/j6
         4HtYnNn2+uEeVaFMFs7QCPvwbsNqA0+sroi3IxmlyZ6gvl9oYEp050wovhr8SpSzGydO
         QMUg==
X-Forwarded-Encrypted: i=1; AL+hErE2l7H05gZ86GrWoXk37Eod/87hCT0M9YTYTY8dCnajjEX6lyIOuQpx5MaW+EXcirxsnNr0fHZfZ0sOOUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pdYXipwAxLw2Jji41NbTEK3bezpbRXoza9og+SuWLDKQsMaMB
	kEWFWjEzeQqCaN4g8MszGLyn0pnyuf2KJZmzfoUvipvsCO5eFF5LC4MopY9x7IcLJFs=
X-Gm-Gg: AZFdTZfjlDEsYe+mbXG0nx/fA97Elr3pgy6mbf98ULKuqO6CgD2SPgiV93BHoV7l4Tf
	BQx3oY2JRT9ZqY2G20k8S4iGYP6iggD+P8rL9Lz4p7eVJxtauXW2xcTOsLXBGvsg4F9rAsd8XXj
	kA6/E3F8IQbMeVy/+C3C8OcOL8oNZFZtLTkLzhFbnsl8cTHwGim9bvwH9L3T0zTLlhseTFgumnB
	vGWy+hCgpXiPtXzIHfNMkVBsEz98K13yfdTUXUgYgWyiz3f+ZdUXM75L1bOUgVzWu3zPm24TNJl
	G7ItqxxXDy995G5dzd6+P65ijLARAm3s3hFeZ3mBfkP8z5bNpJyZ+zrCsG+NBRTb4tdF9wzyasV
	BRBHkARSz0kUB0EymSe9CHFISziPrpD4p4DEa9pjz0egWW219Auj4Oom+TMd93kapyRiWTU+CrJ
	Mow2DIU6uvqkuWKehF2Clo8h84vztMdzCV/m0bcY9OdIZ+uNwQqjZeuMyDipoHmcFcBQ+qwRt0p
	LaTeBhN9s9p+rACdGCqU4uclyc2NAcJ0rt4ZTOI+WJ1gPlJzCJa+0c5j0szD5ylxZVGgWB5/dpz
	q8T4WeZWBkrcAemVmYwiVaS7AxgHMv3zJtczCZlrnCui
X-Received: by 2002:a05:6a20:6a04:b0:3fa:df2d:d3e2 with SMTP id adf61e73a8af0-4014c756bc9mr17912134637.16.1795629635828;
        Wed, 25 Nov 2026 10:00:35 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm9446318b3a.27.2026.11.25.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:35 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	mbloch@nvidia.com,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v3 5/5] net/mlx4: flush pending doorbell when dropping a TX skb
Date: Wed, 25 Nov 2026 10:00:18 -0800
Message-ID: <20261125180021.1804204-6-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125180021.1804204-1-joe@dama.to>
References: <20261125180021.1804204-1-joe@dama.to>
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

If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
that skb happens to be the last one in the batch, the doorbell for the
WQEs posted earlier in the batch isn't written.

The queue stays awake, though, so those WQEs are eventually announced to
the HW after the next TX, but that depends on traffic and could induce
latency.

Avoid all of that by writing the pending doorbell in the drop path and
clearing the flag.

Suggested-by: Mark Bloch <mbloch@nvidia.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
v3:
  - Add mlx4_en_flush_pending_doorbell which clears the flag.
  - Call it from mlx4_en_xmit (Mark).
  - Dropped Daniel's Reviewed-by

 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 8a43c86f815c..8fd1850ba756 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -759,6 +759,14 @@ void mlx4_en_xmit_doorbell(struct mlx4_en_tx_ring *ring)
 		  (__force u32)ring->doorbell_qpn, ring->doorbell_address);
 }
 
+static void mlx4_en_flush_pending_doorbell(struct mlx4_en_tx_ring *ring)
+{
+	if (ring->doorbell_pending) {
+		mlx4_en_xmit_doorbell(ring);
+		ring->doorbell_pending = false;
+	}
+}
+
 static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
 				  struct mlx4_en_tx_desc *tx_desc,
 				  union mlx4_wqe_qpn_vlan qpn_vlan,
@@ -1131,6 +1139,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 
 tx_drop_count:
 	ring->tx_dropped++;
+	/* an earlier skb in this batch may have deferred the doorbell */
+	mlx4_en_flush_pending_doorbell(ring);
 tx_drop:
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
-- 
2.53.1-Meta

