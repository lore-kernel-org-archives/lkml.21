Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143313;
	b=zW5nh5Nj9qWZ4mfYRZHRcf+Q/X7U9fAG5lBdwqTYn3oJPpD9lGk1IgmXEMjRU8dBOna9
	 u5NhfI76eGnKfFVyIgBvk6pV1QaJIHdC2PdRMCrwHMUjm+0Znui2BIP3w8M2tViPhFjBg
	 UfpN0rZTRNMs/0U7ri4WOV1/jQTm72UxNrRfpWDTSQV67Ohf6CimZUsOr316+2PZoZ13q
	 EJG1Z+PXLVxHs6vqNGdOX29e39qMcok7JcotR9rpTNa9qmc/f83fVu5PgqMBqptWxrTpH
	 7DBlxXyQ42ZXu3t474osksrFWbIDimbY7S9Hk1Ak/ZEVcoTLAdkcAlsqfd0igARvW5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rjhg0kwaD/wTpUnBxoXJn8jVRPigfkaeSmbsFggc+7k=;
	b=0kpUUw19wh8U3Bs4cbv52MMrKJJ2dJXYXmeag/KoYbapsr/zGjvJIBI7rDjsuCU/JgPE
	 TGBkH2owC8xulMcU66b/IcHsM27bI4/KnEG7VqUHywq9ouMRd7aPvJbmofZcmMBrRK0Wv
	 ZAFgi0qf1OsoG7gB+whbq9oTFI62vqOxLcKKISRzYCEubAx2EfzfBAMffo/qNpulFIXxM
	 /7feF/G6xw1i4dSR9wc/Ly6cC3qB0BoBPnFB0NJfeDE91aewAD0+/ImnFup1bFKVwOmdh
	 KknyGP1TlHb87lhZ9VoI1G/6iwJa8K0xNs15ifpJ/yiDOKOvH3T9t0ZqCMk0ZWcJPIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuorWREu;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1D606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuorWREu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5366ae57896so4731871cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795143311; x=1795748111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rjhg0kwaD/wTpUnBxoXJn8jVRPigfkaeSmbsFggc+7k=;
        b=JuorWREuLl5FNO3te+6cIjPitDzDBIbPtyfeVNd8KLBi51kMuC3ztk7OY44XqKV2I+
         VLYGQfX+Nbj7E3ZcoRVB13yC8yjGxM4UVrLXoqkwVnpahRjK4ppu0/wC/9AWwDpmmGIK
         66KxBcnLuF4VJDVPHtA3N+h2H8HKBWIvMMyNKFxWm/2ETCPKQmr/gMNrjqlHaqq2LnQz
         PHuH0PKKyqndCP9ITzjafVc+u70bvGCQp1T6GixnL4MIndq9alftttlwMWsO8H3nFrJE
         zw6R5JU1hV1k1re17nA/Tcl1Y6O3IsidZtgNFLHqSodAXQqihZqIdcWgVTRGxohHo/TE
         uHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143311; x=1795748111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rjhg0kwaD/wTpUnBxoXJn8jVRPigfkaeSmbsFggc+7k=;
        b=yKh6ln+pIq44gSVzDsMDkL2hQUdZtxThS8VaQ86HgstYl6GPei1yUXheVAMSF3CLdY
         T51L4ZmjrR18uhcN8wzTy4ZisXXHg/L9GDuYKPVYUgD5F7cuQX4ILz5H194Hs+YGQbJm
         aK+YrULsrCho3rN0LiYLpoiMNO3Cfj8JAVeLW9GyJ0GO61euJcFywHhTf+kXF0nsUwGB
         H65V9mhlAxKURRepWSbuPoJ28eQpTwTJKugzCaBAwKgH0Kcj0sLZliNt7UWyGJvx6bJI
         Y7KeuSnhXeikWYABsc7P9Kt1V983yF8jBky3NXtHOUlzdeCtGus3CiecUAaa0U4L+zcy
         4rhw==
X-Forwarded-Encrypted: i=1; AL+hErFUXjdMXC/yZgElFfBEjSQso7Phkq1PzhYg2wPQhn0L5l7qcX69InHl5dKDYfxJsN0YccaubO7jtOkdcck=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rdu+5yk02PU5id3zMBRjbrPU29lbGGMLIobwVgyCfI9/GBDTq
	MP7XPbOhWL8nyMrryrkfjMMm95egUDAbLB8vm3hIqQ31AtcscjwUcU5P
X-Gm-Gg: AYBFou05HxmBfg8CE9pJXxJ7a68RDUVwCSzSViPifkbML/prZGJ+Ll7KHk46XrCkHSG
	aNj0zyoTpgxpozQffQnbxMPATEKCHdkSlAI4TR3JdYSW1Dhi04dQXE/iwKmww+Dvf6IgmIGsNZI
	0sIUUCNCu1KVriJdWOvCcnV6wBkl6WdD5ODCxs/sjTmBwm+iZ0KZNmv9Z++PQLkwSCZmew5mLEj
	WA5G7KPZzsMwEORyrU4Pq8T1QV1YC3y2r6uVNFwnCctQX6h85W1kXDJzJSMzrsTwkxBFn73D8U2
	nCy60SPLetWBdhjcoBk08mPc2kMniV6YHt8j82CQgwe6KAL4USLGbgDfpzUN6E428el91pKM38N
	zDKf5Qm/UJWqqbSPrZhhDHTpcsyDCQqW0zmZHyJe0/2MXhY4mv/AdYRPwPe2FqADOT8fLLDS3c/
	mLqbtKiDrekWjv6qAndszT6QFtIg94JGy5L9pb+p7IyNFvFzBK4w5ChbMonNa4h4XqPjHVR6xGw
	Q55ooED/UPpPGZ7Hs8BBpVCG+xIi5GdRy8vpo60Zr/XFVUtlVGZ8KDT9hk+boyaXW2ipEZpoxzW
	whMRAWhWrF9i14hay8kxs+ih8t/QwIuyGAo04d6H3rx43aCinUhbDWYzW1IZDpxvDONTYC8qqZE
	=
X-Received: by 2002:a05:622a:58b:b0:533:3192:7a8e with SMTP id d75a77b69052e-55d76a76454mr34189001cf.43.1795143311326;
        Thu, 19 Nov 2026 18:55:11 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b456csm14398686d6.13.2026.11.19.18.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:55:10 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Boris Pismenny <borisp@nvidia.com>,
	Jianbo Liu <jianbol@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net v2] net/mlx5e: IPsec, Fix RX mapped ID leak when adding a rule fails
Date: Thu, 19 Nov 2026 21:55:01 -0500
Message-ID: <20261120025501.1675212-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In switchdev mode, rx_add_rule() calls
mlx5_esw_ipsec_rx_setup_modify_header(), which allocates a mapped ID for
the SA in ipsec->ipsec_obj_id_map. If a later step fails, the error path
frees the modify header but leaves the ID in the XArray, and
mlx5e_xfrm_add_state() then frees the SA entry. Each failed inbound
packet offload SA leaks one of the 2047 IDs. Once they are used up, no
new inbound SA can be offloaded until the IPsec context is cleaned up.

Release the ID on the error path under the same condition that maps it.
This label is reached only after the mapping succeeded and stored the
new ID in rx_mapped_id, so the copy that mlx5e_accel_ipsec_fs_modify()
passes in never loses the ID of the original SA.

Fixes: 91bafc638ed4 ("net/mlx5e: Handle IPsec offload for RX datapath in switchdev mode")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Changes in v2:
 - Release the ID under the same condition that maps it, as suggested
   by Jianbo.

v1: https://lore.kernel.org/all/20261118051247.3885308-1-lcy8047@gmail.com/

Found with a static analysis tool we are developing.

Jianbo tested the same change on ConnectX-7 in switchdev mode with fault
injection on one RX SA add: 46 of the 2047 IDs were lost without the
fix, none with it:
https://lore.kernel.org/all/96a5ce67-89c8-4010-bfc4-4553e1aefe87@nvidia.com/

On our side it is compile-tested only, with x86_64_defconfig plus
MLX5_CORE_EN, MLX5_ESWITCH, MLX5_EN_IPSEC and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
index 5c69e89b13a7..1f0ed8ab75d5 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
@@ -2163,6 +2163,8 @@ static int rx_add_rule(struct mlx5e_ipsec_sa_entry *sa_entry)
 err_pkt_reformat:
 	if (flow_act.modify_hdr)
 		mlx5_modify_header_dealloc(mdev, flow_act.modify_hdr);
+	if (!attrs->drop && rx == ipsec->rx_esw)
+		mlx5_esw_ipsec_rx_id_mapping_remove(sa_entry);
 err_mod_header:
 	kvfree(spec);
 err_alloc:

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.43.0

