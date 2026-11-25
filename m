Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629629;
	b=aErOm2pgTMRG4DJQ19ffplhxo7Kc6kbIQO7PMvIwEVu5qeRAIRwp51Fs1YE6CYo0NiD9
	 jCrMkatiU9mKhFuityZd5PN7kM9yOLU686kMCrRR38PR3WKxT6teUsrEUmXGrRqYhJt3n
	 yqW0RidS3+HCbVEbz5GwfVYiwz/ukotYhD2Fl0v0QAlB/MsEzcJZhTbc/7bv019dzVfFC
	 O45nLLL+Jpj679N4reIiUfhBtonLD5zjSQOzW0SoSTQLgS+dk/e1Zb9CmeY66FHyFArGw
	 5pwFmH4GF5VaJqZcJXou7Q+zg/qKhgyA/5dQifv/5lkdMgT2ASDCDjHMglAChUsfZEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pKT68XtEZZ8Qs2Socjc73mf40QmJchDPGMQ2JHov2P4=;
	b=EbjcL+qsm8Fahh6bjJENmUwmGjnSbgPziiJSQkk4qd6Rv5skLcs3FI2g0jcFQb+uQjqN
	 ntcx/MbT78DzvEtUHDLG9YV3SHcS80rk7v8TtFnByqGRElv9+cHT9Kk73IypndpIIf9ii
	 GCHxDBWekRObk5w28iuTNMl6awVe1GCf3E40PraKhq/5g4+rLmIwl+vXWqKM4Cg9l86Ey
	 eixPe8Jr1+UV30eaEKP8GB/XwCHtZKW0WCK7cTE8yJxtaMDd0EcQxg1wV0tiiA6JpdNCy
	 /b047vZ+6vmjReGYWlJXxqrA13jwR0DJsrq9yP9ktGadiStwFVivMA7yweeDsexbuPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BRdggDeG;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E4A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BRdggDeG
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so3354008a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629628; x=1796234428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKT68XtEZZ8Qs2Socjc73mf40QmJchDPGMQ2JHov2P4=;
        b=BRdggDeGyPI3UAIylfVeo6IPUlWp5GXsBc9dN7tVIt1+q+QcKd/tXzoK1yOhY4oXUM
         QZe8g21+sEL17dtTwJGcXqTyR7QoruWYRHw76cSONFuZe+4vei8242A3W/hQ9FaEDqdi
         s/50x7AmIe+h/CQZ7Yl6BOhoBzNfbphR2P3en6MEovWrnMtd/aPK7Kx97iVjtfhkqGhE
         abBAvgWOWgyw0xA8ukIa4zKDtpB1B6l+IBt/gSs9hSGV19uuAqkrtlXtbEvC8zwQSViM
         0JSEIAl+7OBl273nXhhkgWtMWSEdvCqky/27/enl4E+lIO2Zpzm2VCnck2+xBiExoMUx
         RaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629628; x=1796234428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKT68XtEZZ8Qs2Socjc73mf40QmJchDPGMQ2JHov2P4=;
        b=KBHKzscz8x8VT5Ox9wvSXJZTJLsgp0yh23R5MgxLcAtet3u9ZR84/Pbhyc/lVLQ82E
         U8n6+87lixF6k6xDnbrrGwrU36g1/wAVGMWQjrOd4iH60Orbj3egJhXaTuqdb29w+NYg
         rOvj5ijazetJUp7TYNVi8FqQdh09DGBAISyiHRO7dzGbq1cg2a39qM0DCkUkQNvt5vQ2
         d0mK+m5jnNQg7NCHjMKNDJI7GuB/VFSs466Ii9n28anF4J9fWtjzwS9a+eJsE4ypBwFj
         tuIQsJY6GyQ5PkHI/9eq8ymQUX8dC+H5QArsiuzmBdV0BUx4pAidOMTKdRCHiFMMUjmM
         YHTQ==
X-Forwarded-Encrypted: i=1; AL+hErENi/VSiNB91vXCzuvfPx61AIr45gLJ0O+ELGNP/YX+vzUNKdQVGJzKbGRVqXx+dbmQAhc5SWkXMHzlHO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iI5UskWSChBam6E8eVzfXBJj8ok8WZLzZLOX30tYUe8talf4O
	agelmkLJuOT5OMsj+qhjXYN8sJG9MGUUwNQ5wnb8z4qAy8DOPrrtd/DgP43r9ggB5uo=
X-Gm-Gg: AZFdTZeB6eXQ4pwFW+FbrcD8bIsYhgTKt1gJEjzjpKz3KvLc9Dt/HQspdZiyox/18/x
	hYpbklfPAUHR0FOFW6D2qaNwatuY5cTOF2Mo/rb5tXzJUa7OOPQxrXLjdjg++MMv0f2a95InFGG
	8tLPg+BEiGnflbk/yXQfo7NbSq3LaNV4wiWtO8q+jmwNPrMGqnY1n9SMTAVvFBrbRztTryJ6D7t
	NmspRNp4EdXMiMAEbgdUTtzB3G3r6LRbwlvTuDHNDRtJ627CalAlh4NMJNiklkkSf59qWjaXqUO
	ibux6ouyCMhEmSFcv/EM0peO6/wR2K83xTN5Qt3wKZkMw4B9HyGEbnPF96GStPl14gofDzBlEAy
	p9Vy6B4fD/2rqlEIKMPlI85jOAKvICQsLfguaxhTECGD0pGz3tAcATU185DMJsPKoisIt7WgH2g
	BCkEnyR3W/4ckNZ3LFUX5xLbMHfreEg4dG7JliXANeJ/eXR2qb3i+sP9nlRnCKX0bYFWo6SAyBX
	wdS0fdQ/kKtO4gMpG351J7x8Bqx/q1AUEzBikgbjwKS4x3uxX3jy5Os7kc0o+th+4OH8cI1wvZa
	OStx0jqaHb9Gxnf/1JVYhUZWuQe2
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr18279550a91.49.1795629627796;
        Wed, 25 Nov 2026 10:00:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm31254202a91.16.2026.11.25.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:27 -0800 (PST)
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
Subject: [PATCH net-next v3 1/5] net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
Date: Wed, 25 Nov 2026 10:00:14 -0800
Message-ID: <20261125180021.1804204-2-joe@dama.to>
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

Extract the code which converts an skb VLAN tag into WQE fields into a
small helper. This helper will be used by a follow-up series implementing
software USO, to avoid code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 9865ccd8d6e9..29eda78b9977 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -860,6 +860,26 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
+			      union mlx4_wqe_qpn_vlan *qpn_vlan)
+{
+	u16 vlan_proto;
+
+	if (!skb_vlan_tag_present(skb))
+		return false;
+
+	qpn_vlan->vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
+	vlan_proto = be16_to_cpu(skb->vlan_proto);
+	if (vlan_proto == ETH_P_8021AD)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
+	else if (vlan_proto == ETH_P_8021Q)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
+	else
+		qpn_vlan->ins_vlan = 0;
+
+	return true;
+}
+
 netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
@@ -901,19 +921,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	nr_txbb = desc_size >> LOG_TXBB_SIZE;
 
 	bf_ok = ring->bf_enabled;
-	if (skb_vlan_tag_present(skb)) {
-		u16 vlan_proto;
-
-		qpn_vlan.vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
-		vlan_proto = be16_to_cpu(skb->vlan_proto);
-		if (vlan_proto == ETH_P_8021AD)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
-		else if (vlan_proto == ETH_P_8021Q)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
-		else
-			qpn_vlan.ins_vlan = 0;
+	if (mlx4_en_prep_vlan(skb, &qpn_vlan))
 		bf_ok = false;
-	}
 
 	netdev_txq_bql_enqueue_prefetchw(ring->tx_queue);
 
-- 
2.53.1-Meta

