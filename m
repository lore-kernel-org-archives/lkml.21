Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629630;
	b=JCPSufd7b2+kdZ9gwSvVezdT1m9obadTXizEh0zUvZ5yrwFQ06JLllfm9Z7ibrU98JL+
	 f3SuDtTkxLQgSZven3awcMfWkNISDbEFBayQBvLR8q17SVrDrTZWfjwiSImOSeDaoTPvP
	 jIJV7GckAkzM8nD/fV2NYkaLNZYOnt2Hgddj5Jxe1B+0wdjyz54TZY+8Q7mILjVY7hYLS
	 xhpUU5/PGsbZ+u35/0XeeJ2M/YlSwXQCsiIY1PSKCY+iOIfJT0viXnHgJvJg8H2Bu2dIB
	 BbhrxBjJhIIRdXVk21vLxYi4zBi5uemhatzpLHtv3Vkv8UZE8R6bhj7Gsl7yr3mMigQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ybq08NfCGGRDLgIcrDYKd/XJOpQjXuujh7BORjeX0cc=;
	b=BjFbkrpQWWt8bzJos3hOcJJrnLn5eATAjwPyR+EpgNfh0+rcjlyAizCAWN7O914+hEMQ
	 Y3RUX2rJxo20+TUDlsTJgmLfz6vbhYtdniUQegH23zil5x0xOVr3MeGxkV7anLonWQw1n
	 1fuiFpj3rg2u+1jj4MrY4omao/ppuGj/lxlHIyT46uPPk3yBJ53WPE3LAzDZV5i+wsxln
	 RLPzRE00Zq5wqr/CC52UO7+3n0X3XBD5ob6IUs7PTUJFYvxdXJm7IV1mHdCXKFFBkFsaL
	 M3HHTvFS1F9O631u73EqiCAP7YNNktfi8cfPWpuCKTt9kUq0d1/LBmyypw2ny+4eH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gq5yHQ9V;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75884606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75884606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gq5yHQ9V
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04244c3d0so49803435ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629630; x=1796234430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybq08NfCGGRDLgIcrDYKd/XJOpQjXuujh7BORjeX0cc=;
        b=gq5yHQ9VLcwYkwjr1vkTpEDyAlBQ4Sd3FCsFvzewZ+ebZZFnyePB8yPDif9oy3gME6
         ITa1WdI2UIk9dbCgxH0ruYuIf+nC9giMFawzjryr/7c5qDhxZkurJ8NGYfMNDMmGEoYV
         rl0E5COxhONIBIibPCroq2M1Lwdk0qQRPl4Mf1uYxEoeOcRwVZxyGODpxHmrtQdsKYnW
         FB1LazRC470fCGwZNUtXmV8rfPWeHW6sDHJ3Bg5K/bW7CtLSJZGTyHN8wM7D9rrJb1u8
         MMHKXygbp0655+fkMJPo42dk4PB8a99j0KRoM6au7Gcd8oDgG9NGAWijdbYFPS2N1KlH
         4xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629630; x=1796234430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybq08NfCGGRDLgIcrDYKd/XJOpQjXuujh7BORjeX0cc=;
        b=faBeWFu3ML8OkNIPXfUuKc7eLTUSGjcXxQdX/ZBBt+ZBKNyoOISgo46pLBazLd3OGy
         0jlV8X9BOfT9KSM3eun14kEniiwnG9SzF/xNQWk3ZstTLcRZLeXneLq3aGHtXr87vKDf
         0nmTS6wSbiXqg6EDxgim6DxlTUTqjfpuGoyjU5qEUCQA7NwYhSxyhbJLQ1ABYzWQXm1f
         spZragcY8krkZ+ujh/8DBETohPB7WKAt2BvnCMue3f0EOresBeuvIYCqGLefJM2NJl2a
         YMikp0rU4+WodVpy0qGwz1XDyj3SqeKWGM0EhWiyWIzqKdj+fVUwG6o3L23bYj8SsRuw
         oRKw==
X-Forwarded-Encrypted: i=1; AL+hErEk224bypPICQdny42CdH/abQOMIMOuDlaQDQN0pGVTyw8GzCmhkdPjyoBcKUOBkyTR8FWBLUrKX3sCGWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z92nrrM8Jg1gtdOwG8szfwuL2cXGNa4MkdQ7eqLp+mEf3UnJvyg
	ttLMSy+mB4MWfsitU7Aq0tdNd117Zzgd4wiq1vW9cd8jWB16sN2Kt9FFFXL8fQa03IY=
X-Gm-Gg: AZFdTZcqRaZLPkox2myPNGAX4WWSdhswyoO3rPXQta+/A99E584jOhCkmxBMNasBOyK
	fnqow2QzYloLtHZpoETH9daYM2qsmj6yGvwL8tWJ2teySGzjemMZ7z7bi8n3OI9Ll2ZxSkV7kSM
	1Qd3nxCkh0WIyVbNr4kE/UHb3bQBV87CIqao2QVWZwwX65aWPZl0mkuHI7PSQLUWZTieE80Z0S8
	KbQys1TACJST3DinXbF91Zn0MvK1HfB1/CS1Fr01aAkT6WkR3ypG98Kk6ofwIXMXayLWvaCmJDh
	zP1VALpY+M9h6rQdQp1K0/PH0oOKau/v8/tUacbbNr55WqqJ5daOLLWvBHNxs+zigH0jR44a9bl
	McDYIL/nYTESDwVOXJTKbDjezl6oFORW5MvShmWCFAQLizx/cwseiPAXvwTm42jtNwgvg3kvAcZ
	CEWevg2BJ7D+yOh/9AW/CNoNfJG2sWMZQtqxLB3huU5BSNOh0EJspR/lvv1meqK86Px4OXPHZ1E
	SxsMNxA4JsBvq1q10RVc+xDt6SQekJm0dmQGyKfdNUqIeOdOL15tpimEgv8VTbnHF8T8B4pkvj5
	SVvIJy8dPGISCitTKK/zTyJvm6v67+ZjKyyNu69+47A=
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr175723835ad.35.1795629629861;
        Wed, 25 Nov 2026 10:00:29 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm91189495ad.63.2026.11.25.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:29 -0800 (PST)
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
Subject: [PATCH net-next v3 2/5] net/mlx4: factor csum flags into mlx4_en_csum_flags()
Date: Wed, 25 Nov 2026 10:00:15 -0800
Message-ID: <20261125180021.1804204-3-joe@dama.to>
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

Extract the code which converts skb csum fields to WQE fields into a
helper. This helper will be used by a follow-up series implementing
software USO, to reduce code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 29eda78b9977..1fb265a30a30 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -860,6 +860,16 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
+{
+	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL))
+		return 0;
+	if (skb->encapsulation)
+		return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -890,12 +900,12 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct mlx4_wqe_data_seg *data;
 	struct mlx4_en_tx_info *tx_info;
 	u32 __maybe_unused ring_cons;
+	__be32 op_own, csum_flags;
 	int tx_ind;
 	int nr_txbb;
 	int desc_size;
 	int real_size;
 	u32 index, bf_index;
-	__be32 op_own;
 	int lso_header_size;
 	void *fragptr = NULL;
 	bool bounce = false;
@@ -990,12 +1000,10 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Prepare ctrl segment apart opcode+ownership, which depends on
 	 * whether LSO is used */
 	tx_desc->ctrl.srcrb_flags = priv->ctrl_flags;
-	if (likely(skb->ip_summed == CHECKSUM_PARTIAL)) {
-		if (!skb->encapsulation)
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM |
-								 MLX4_WQE_CTRL_TCP_UDP_CSUM);
-		else
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	csum_flags = mlx4_en_csum_flags(skb);
+	if (csum_flags) {
+		tx_desc->ctrl.srcrb_flags |= csum_flags;
 		ring->tx_csum++;
 	}
 
-- 
2.53.1-Meta

