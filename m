Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629635;
	b=jmXE0PH3TXB0cpYG2umYrcd5nZG2ZzxTD0Yg03xs2CBgsU1TmLrhqt4cBVm5jDDl8iVE
	 y6NZXj8+srPAZ0unx9MWOrGc+i7rWO/kfgvi87webLKCA0oUrmS3VB48QqEpNj4fvDsJP
	 QKTnJr18ZFSLsCHfUc4M2ZxQv7ZPO5sbcCzjpeFVw79fX2b2/dX/yFOJnDJ4llEoxD/QQ
	 XS5S4ZN5Uyc4Xun/lsbIQA9xk6etXkkHi2zqTTSb1vkUMm+VJpFClj03haMTA16NSvihI
	 SNgwWz7cFwVVeg0rfRrJJs4F0ALXvwOeuCGt39nrkyMpl0vGF/52vgtita/5tdYNRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cRmLynzK4ejOioysRL27Skg0kFnrLFhNOhmGT0Ouyxc=;
	b=aFA0yq7G6cpxdtJr4I0B4Sz77nhUnqWF2cRZTNYYGOxfE5cBGizIY98zhJgzlPW4A8dv
	 mFz5rZcKI5H0zQd5Wdu3sNPNZicHQi76NVxFJmAFjyoktloQ4BcmLpIzqGdjW12QUqFdU
	 X4nrWzWdbqGT6tsNSIeJssczhMe5KTchYofoeSuUR/vP7k9tmnYTnDpoGt/DarIeUpt8L
	 /fL92rPqOBCunyLiuig+MPUmRG5JmKwGCUkDfAeCuLo1665gQ7J6mo1A8mv7EqRs0c/XH
	 ljRzAZXwVMPDgKJB6JrEhb/zUQ9dTUGD3Os2EqEWQseiLOm3N+Fvg21ZtgVR8ftJ0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SfVmCV9F;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB781606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB781606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SfVmCV9F
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efddf749e5so28678235ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629634; x=1796234434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRmLynzK4ejOioysRL27Skg0kFnrLFhNOhmGT0Ouyxc=;
        b=SfVmCV9F0rl7r2j3HbGnH7/OjiYUzQJOKc+XKB/n6k3FykPthLZncNln1T3OY6xoyd
         ff9PyEj6Fu3UOntn16gDjK8SVAgP/fD7WQHr7wSRdFjDj8VvkW2BRcvOX8c56MiCD5N8
         9P9+TwqS/+qmttPFLq0Vh9EHELG1iiH3EIdgKauYbuIAGdp/RoxwWJshzFm2xynNKJS9
         hXvW43gcWQLAKIfWYb/b2beSRPJwr0GHfPs9rKFXRWTVPZdidmA8ygqRJxxTZdVMXpDp
         G1RDJDxHHtWPMiOZS5q3BxaFYyVke05aB3Vtk5z5Uiar5rHt+/0js66z0NbCSH0HCrjN
         zmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629634; x=1796234434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRmLynzK4ejOioysRL27Skg0kFnrLFhNOhmGT0Ouyxc=;
        b=gWLFXKuWwxTg3LkRxNGsMp/bdLJ+0mEn148cUwZSOlK/7btJjZP/LFCrW3+C0T2ZeF
         UC2AQQLIojUwiv1ernuctaqBqYBWJ8vByli9o523lfZxODSl85Uxl4xe9rGlykxoC8DG
         O6Hx2hNW0nwSFRfvdtB4V5dCOZm0AW0p8yPXFvQb+PSDpXbgVm1ZwyBvYEbZRhEFJpV5
         LFL3IfWWALzbCHnUIHImHwSlzA1KP1BmKXwSIyiQNbgtnc3Ck4jbD254LFW8cdDtY2GE
         IbJmE6ngogwP8Zvwhkeukba6KYEeET4Xx0rSQOqREBXBM/8uycolufGbxKjvAGgozDsx
         k6XA==
X-Forwarded-Encrypted: i=1; AL+hErG5yX8Sd6suOJJXHNtZGYzxy7qjFowoWYfYenWBq7zCGdlGd/whmyEntHtOn9u7Y4cyB6GnbjDokklvVJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/myCEpcbPd159SeIOLHwagaSH7SN9BZfrcv9/KUvutaENDXQcR
	2/pH5aOHs4tdOtuypea5l6+N9IrjBSuoNVV5hObQEEDktD3YWrcuCol6IAZFoV2t+Fc=
X-Gm-Gg: AZFdTZdMFxLbb/AG7owTtYSWY5sHkJQxF2eYKt5YoSZpVGrCKhQ19BXMQUPQVvqV0hL
	ybEvwxd4BUMT0ySZH9Y8btnaVNEToCtZhLS4CRmKv8PWlvJfDo8jRPxwnHIlJNgyiKG0M5J7zGa
	WbEXf98ubgu/WXyAn/T41gSW5Xk/6eMvIb7jDf14GpEXqUGFq4yDRoU0Et0zfDYPPPRoM/QWcPn
	fNaMipgWDvskRx+V4TS1evpvFI7tAuAg6QYVwY846EPrlxNyeQ/2WJ/5hp9rmv/Fhwu6hqtAokZ
	btwa1VKN7Qb/YXVW4prjexUwpPCGbW0JcyCPtS+jK6QdALwhK9pP+TOFmdoAyMXUSnDpaCzsxN1
	M6tWrRfb9IfbY9OHvnwaOu+mbQdca/5z75akcHYn7wMNZHsryEXzHNKjnEMOsYZPbh4azl1ZIff
	VEKclB8KewRiUTaddI1xzHZjRrI3vquTwkqc3ukiRZ1NFJ5pvOKz4gzqVEs98l+yFK/dBLt7bId
	vciaP3piCW7to3zhbZznsWesy7yeWsmXMKGZHUwftN0CiAxp3DqGhl3FLjrqRKO5VsHRehhCFn8
	4Nhx6/doKF18AdxpqzRBaHYI3cNRMb1PSjTIAd7MiPg=
X-Received: by 2002:a17:902:e948:b0:2df:b510:cebb with SMTP id d9443c01a7336-2f03efa4028mr134937665ad.6.1795629633923;
        Wed, 25 Nov 2026 10:00:33 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b7be3347sm35552975ad.15.2026.11.25.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:33 -0800 (PST)
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
Subject: [PATCH net-next v3 4/5] net/mlx4: track whether a TX doorbell is pending
Date: Wed, 25 Nov 2026 10:00:17 -0800
Message-ID: <20261125180021.1804204-5-joe@dama.to>
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

When the stack sets xmit_more, mlx4_en_xmit() skips the doorbell and
relies on a later call in the same batch to write it. Nothing records
that a doorbell is owed, so a path that ends the batch without writing
the doorbell leaves the WQEs posted before it unannounced to HW.

Add ring->doorbell_pending, set in mlx4_en_xmit() when the doorbell is
deferred, so such a path can flush the deferred doorbell.

Place the flag in the cache line dirtied by mlx4_en_xmit(), next to
prod. That line has no room left, so move tx_dropped, which is only
written when an skb is dropped, to the end of the struct among the
fields not used in the fast path.

Suggested-by: Mark Bloch <mbloch@nvidia.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
v3:
  - Set doorbell_pending once in mlx4_en_xmit from !send_doorbell so XDP_TX
    doesn't write it (Mark).
  - Dropped Daniel's Reviewed-by

v2:
  - doorbell_pending moved to the area of the struct marked as cache line
    used and dirtied in mlx4_en_xmit. In exchange, tx_dropped is moved
    among fields not written in the fast path. It is only written for
    drops and is read for stats.
  - Update the commit message.

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 2 ++
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 40dc4f6a7329..8a43c86f815c 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -193,6 +193,7 @@ int mlx4_en_activate_tx_ring(struct mlx4_en_priv *priv,
 	ring->prod = 0;
 	ring->cons = 0xffffffff;
 	ring->last_nr_txbb = 1;
+	ring->doorbell_pending = false;
 	memset(ring->tx_info, 0, ring->size * sizeof(struct mlx4_en_tx_info));
 	memset(ring->buf, 0, ring->buf_size);
 	ring->free_tx_desc = mlx4_en_free_tx_desc;
@@ -1098,6 +1099,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	send_doorbell = __netdev_tx_sent_queue(ring->tx_queue,
 					       tx_info->nr_bytes,
 					       netdev_xmit_more());
+	ring->doorbell_pending = !send_doorbell;
 
 	real_size = (real_size / 16) & 0x3f;
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
index aab97694f86b..c28d5213cccd 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
@@ -274,7 +274,7 @@ struct mlx4_en_tx_ring {
 
 	/* cache line used and dirtied in mlx4_en_xmit() */
 	u32			prod ____cacheline_aligned_in_smp;
-	unsigned int		tx_dropped;
+	bool			doorbell_pending;
 	unsigned long		bytes;
 	unsigned long		packets;
 	unsigned long		tx_csum;
@@ -311,6 +311,7 @@ struct mlx4_en_tx_ring {
 	enum mlx4_qp_state	sp_qp_state;
 	u16			sp_stride;
 	u16			sp_cqn;	/* index of port CQ associated with this ring */
+	unsigned int		tx_dropped;
 } ____cacheline_aligned_in_smp;
 
 struct mlx4_en_rx_desc {
-- 
2.53.1-Meta

