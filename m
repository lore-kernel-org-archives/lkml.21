Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629632;
	b=aHIuNgvfEWsJd290KhgGKPiwJ6RjfTUYUoD/xktj5HnxDAQjmuirPUSKiwr9OvmzwvbZ
	 Qx3/RGu7DG/2anljTIFq5/P5rF4j6YmWCCi787DUBAaPt64s+KNZ0HRRUTmWADsOkvqVg
	 K1b9eLRTwDVhhbsVaTlWuy71IfUbFwpFGZ6FeGiqngQ1U3SR0lW2BrhJAiK79JnCsPw5d
	 joSmJa4LHMTLyQH07xls40Gw5TAeusrJKW2ebMKu+xUXffB7HjDDmapRyHZzjL2AFHLBf
	 n2bQ+ZrFCHvfLJv1kq5VovbswDlpfNbySmxXtGRBL9Cb+uunfb9JKcwhgtVY/S95rQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04zPH8pKbZgStm3VZ5cSIvhJbVCbZaL1fubS+I8F7Z8=;
	b=aN4EeYEKlZguRVmc/JVHQ32+ax76KC281Ea+edeujs8I2XLZXxKyaICXZo9HOE07satB
	 qD3gxGb1ghKg0tFHT7fA8Ai0mXnnamUChFPDStWZ2Q1Ue+5MMDpNSuBRlt/yl4Axrt2OU
	 8Xu5cnD8Tjk79ZfeVr1YwIwBVJy09KfCAJjfkZp5zMcn4v5VW9LgbhbcbYRkI9wdjcF+P
	 5wUfvUM007uFFq7HiZh/RwNnmzYosqol7naB5imgnoeUzx2IWvXYKxN6kSn5VQYJfVWS2
	 RumnyAS3OA+/en2CvgPv8xvU5kDq2LOFKp0Hgkvlc9AuIj4GfdI1mVryWrW2CFwobwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hi9CsyCU;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B3606A69D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9B3606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hi9CsyCU
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b413997581so4782845a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629632; x=1796234432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04zPH8pKbZgStm3VZ5cSIvhJbVCbZaL1fubS+I8F7Z8=;
        b=hi9CsyCUf/b/0VqLamSne6wspz7YbpnBm8Y1GiHDoxoAKD+Q+n68UBacSdCO/w40Lz
         QKAJPb7pNp57A4kkRCkKzFkyZ6DYXM06miTxqwk5MlAeNooOB9ZmH1D6lva6j3+XYsCI
         F1kWKTf/iOFRDShDnOINWpnaxlJh2ReLcgI7EqxyuR4W4cr/vzpIjibqysMZ04yz9Yw2
         SAPY0jcsa8SR0bJKRoNuvrUr/dSscDoCupnTwbuDO30RnopBYjgsmpSFdhYtsAEF7Y86
         lP8pxE/M9llm6kp9OOuA/TCba8nvEBxOZSSHQJSrmzxOGFhXSdC3tLsJGjW6nk5yS/KD
         NKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629632; x=1796234432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04zPH8pKbZgStm3VZ5cSIvhJbVCbZaL1fubS+I8F7Z8=;
        b=fXlgXgAGsAttvMI03MxzZ+1ebBJzx3bRk1SNP2/8EWJIWu1p2oiC65u54FCvOoIJ5O
         OUPMxGsqgEUkQtLtxy2BFgm++OC7OMJfDf/Xj8bTbhCfC0DoRzB1hWsm076wlNKjFqmx
         7PebllNVb/GvrJAiycslPKnM/ASeFRe9+HjrmSp5Sw1exWQjro49wby4YBc5qsq0yybC
         nTnW7S2SdTyiuqat6y+0L2HBqOD4TPMLv/p2wvVRF6MyXfj2hPHz2r1xFoX5cvk/7PAQ
         OCtvB6UOkmI8jH9jTgIkJEURpIzwNMwT4zxE8OtaJ9GkA3CjKlo4DnKltDQM6CeCC2UA
         8mRg==
X-Forwarded-Encrypted: i=1; AL+hErGRulVHskjZPUqccN9KK4U4lMH8WGNWxJa2A9d9rzujfZE1/bFukG9T4pvPNG+hkJOuYcESpGrNanUF4vI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/N0PjmvRkK9T4i+xPN7nujB4c6sy+gR+218j5hn7JnyugSrTw
	6mR6XIKrtxliAukKWotkbUMwPtSMTY1w0/GqbcmnpkqmYvIBjSNxwIW+Aj1WwrAZPro=
X-Gm-Gg: AZFdTZcVZOJN+PnggKphlgbm34xy77ZYfZ1OiXPAnxYfJ+leyOFaxUJ0d3CmdJI2hRB
	jGgIz/Y2lXiYDzObe0npilQOIrSkMyBkwigc4t9uO1AOFPVGOM16TR2+SaP58xFgLEkjqNKJXYE
	RqE9Qiahp28/Smj0WsS8MdSblDPlfx7+p0swwnLK29iJEVmfaji65SQkclkaDiqMgal4jguMW+2
	A9+imtubiedYFD5uqafc7LgYBVhXvqBu6rVb0HhoCbsQF19Lesx8XvDRAsnBXStFTqld0tcnw6l
	1Kl6Ya7knN/ebuGWkJWuIz+COz66mNo0cojfrTIDVprWMDo2QWrpT0DcCBZIvHx82ZiJ5pYWs5Y
	UwgM17us7pl/jgb5w+ALHts43cUbL4jVHE8ZEA5cPPvwloww3nEnFlWsCMjXOqXw8UU1z2BnVsv
	RrQKg6mWMlTf05sr6UxrjG711891veuIpqDNgtauFyeQ552GuluL16v28MG2Jkvy+PyZcOvxTQV
	y4iF2LH3iZYv5LJoiZ5RL8Iv8tGqySh5x5SADNGaheOIuSoQ10OejmEt/g8PZvuI0vtb1pgWKw0
	NfNYJZD9IK9u2YE2XAv8k2ttXmWGVQoFyQRt4JEGFiU=
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr17223800a91.54.1795629631705;
        Wed, 25 Nov 2026 10:00:31 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm13401830a91.3.2026.11.25.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:31 -0800 (PST)
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
Subject: [PATCH net-next v3 3/5] net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
Date: Wed, 25 Nov 2026 10:00:16 -0800
Message-ID: <20261125180021.1804204-4-joe@dama.to>
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

Extract the code which copies the destination MAC into the WQE for
eSwitch loopback into a helper. This helper will be used by a follow-up
series implementing software USO, so USO packets between functions on
the same port are looped back too.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 28 ++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 1fb265a30a30..40dc4f6a7329 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -870,6 +870,23 @@ static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
 	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
 }
 
+static void mlx4_en_set_loopback_dmac(const struct mlx4_en_priv *priv,
+				      struct mlx4_en_tx_desc *tx_desc,
+				      const struct sk_buff *skb)
+{
+	struct ethhdr *ethh;
+
+	if (!(priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK))
+		return;
+
+	/* Copy dst mac address to wqe. This allows loopback in eSwitch,
+	 * so that VFs and PF can communicate with each other
+	 */
+	ethh = (struct ethhdr *)skb->data;
+	tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
+	tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -1007,16 +1024,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 		ring->tx_csum++;
 	}
 
-	if (priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK) {
-		struct ethhdr *ethh;
-
-		/* Copy dst mac address to wqe. This allows loopback in eSwitch,
-		 * so that VFs and PF can communicate with each other
-		 */
-		ethh = (struct ethhdr *)skb->data;
-		tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
-		tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
-	}
+	mlx4_en_set_loopback_dmac(priv, tx_desc, skb);
 
 	/* Handle LSO (TSO) packets */
 	if (lso_header_size) {
-- 
2.53.1-Meta

