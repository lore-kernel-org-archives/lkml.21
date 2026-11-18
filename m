Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978772;
	b=ckN9dSG/TjzfI82ZmEns6HUhIz2dwBPk/Nd9Z+zN5xUn8MftwXfbI6QjfLKHTiY7RGbZ
	 6Q67lC+8R8O1EBUiMb4v1wAE5oKS/5SStV9VIjVtDbMhBlC8bx/be4yLyuIa/ebkCWm6r
	 iBdeLOK1ZnY0NzjoJEdhkJa8DE69WX1xvk218oUVzBBbajBlMM8W9Ot+S1xkPI0ULONhQ
	 ZaiMtAZc4VRyfBI7NOS5kQbMjwFiBZCwYr2yVFk9UOkpB42PTaQbP8J97fM0+xETDi+r1
	 1M+ugw45G96e2SqI1U7bldoV4+SZ6DI1AMyuVgCQwudyVFC03b3OnF5gf958W6RgBbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9I/hVi6WR1uXMNLiaaICSMrOG3A3Cvvh+eTe+Y8iRDE=;
	b=J8R6PHKowX7Ov2sqhJNM47GCn1Stv6i9ClKsu5oNPncqtZvYbrl4/W7996CEEefpFgoY
	 FjZfCu08IW2tVk5k556/3eWoYk8K05tDVlXi4G3CCGzXD9pFNtcawakq93em7r/ykuQws
	 1pyka8FV92BnkUOWcXZb+jQiBYMx8sdgpqoAMoVGOlJ3ZsbZBcFReuD+HrFgFhECVTVfl
	 4LGOTVJyPVZ/f9Ohrm7/ywBG9gpgXlcKoTH9FpmcwtulO0IGPT5MW3sC9k/fcRN6gg/30
	 OdDsEGzRIoFyg+r9iit4UlGIEa5uv5CieBPTZXDPRxa82acjwQxIZ6rVTIwSwLJleVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciYKEnL6;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B78E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciYKEnL6
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94965745d92so64881885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978770; x=1795583570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I/hVi6WR1uXMNLiaaICSMrOG3A3Cvvh+eTe+Y8iRDE=;
        b=ciYKEnL6tN9Cbe2SrzIAdyXmOVkWx5M2NSiY4dZnY12moQKFQUR8iU/6wgFRkSjd3v
         JQ5VbASNb+PFxxdbJ5S69gN2OjKr17CnQ3SlsNgqN1FfMX72q7o79JmRrefAWAL7NP0/
         xr960MjUqeO8dGSd9rbpWUZCmtaZh3prBsDFnHVPtWONMpWE0alVByPapHyi8oRg5AiK
         hobouqYTUKa3JlPjW1G3QVw+cvBoKTJRdZb7AJ85WYgHhqdNHcIXOo1NyLMbC9sKcfWF
         SC+bcg9Lp8z/w486uv2uH8efmGWbJROBSOy4trYcNoXgjA6ge6eiHO/gLgExg9AIvbOf
         q/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978770; x=1795583570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I/hVi6WR1uXMNLiaaICSMrOG3A3Cvvh+eTe+Y8iRDE=;
        b=vndVPQ4RTd3G/pHRXEdVD6YGJrtiwfNFBciW8qK9nEkaH5kF/sK/Mm8R5ImvY1oAg8
         Q4ClO9rzJn0Gwbf7eYTqd1g7Nk6PAyQwdk+1J3FYYt4TEsE9uSGqcp0ccafUJPZTgHU0
         BfZUvDv3yTLXA/SEAqNPI7kXbRqYK6R5rN5JeNy83B+cEXwwKqqGWh77oQlI6MjowWmu
         FbVzO4d0n3f9u1V+376/DDl644rOXzSxhoTrftYygCp7p0oBYuLOOvuhKHmD2X7O9fUe
         GYzBJSFMt9aBPbpGOYu52T7uJmyFMsaWwN2kz97evbAbsVqEDEC5yy4cC3r1L0xCw7Ve
         CSfw==
X-Forwarded-Encrypted: i=1; AL+hErGuyF+LTxqhJ5F5hCFvh3RFFo9vtM+jO4ugyE1McWm0429vD0ZoJmcSR3axVB34IiifWeBQqmTslfcuwe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/58OCBQmwvo43PjTGmz16O0ojrwmrp+gV3W9WZFjRUhDxLtSWc
	YvAb/buqBJ+LijSBHA3zIX4s5GDkJhFyX1s4d8ZbcmKLe11/1PT16oD0
X-Gm-Gg: AYBFou0T4AmnlZaYzpqAT2Lo7hYvM+JXbaSNFf17fp+gmWjJ2T5lfj3idcMLJmP5Wa3
	vKDDacpI579FYjTi4I87OWRJ+O1fe3t76AhdLZgqicTZs75pTuwYgU6WD0Rm3lHajB7cl5OPzQH
	/mQ1fgtgMgyliuju92qLJTKFW6tREdlYmUqMKrP0OKy5QcLY8sxeGUBOKbQn+D76mcCmmjtOjyn
	/TXq0Ee14P5ateL8a0Y6dcSGXc1f5nz6w7NMerv1aA5GsmxZVODgYmt4toAuI3cHln5gYCCv8FN
	lbuna94IoYsYU/HH+BI3oRO6+6dJA/T6gs/W0xHliU9GZH84K5Mp+qkOCY6Juh066Q0Har3WdY0
	SksCWIF/EXmrPmABo6xbvUPoCO7BDmQLysbQoDpXOYDSq3bWI7z59k69d6HY/5cjBvu+LygNuZw
	S0wgH8z7ZoSSIRDc5kqTikDnt3Ii8B00Ny0Cjo/+bUICnDSSU9QX/US2XlJkwRb+OKL8TD/DriP
	FSjw51LxIlQsY2d7a/qiCUAiORt3oOawJ1PQKsavDOLxqC1L/aDcr+whhFtqcYA2sLnfw/KZO1A
	mdGZ1eTH3wQD+K4rqK3DddAi76FSJgb93E7XvUZbYpVWz7LtcBDdXXiskqzVJtRtHbf4zvmRSUg
	=
X-Received: by 2002:a05:620a:2718:b0:949:7781:6a31 with SMTP id af79cd13be357-9499962736dmr286507385a.76.1794978770597;
        Tue, 17 Nov 2026 21:12:50 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm95547485a.31.2026.11.17.21.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:12:50 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jianbo Liu <jianbol@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5e: IPsec, Fix RX mapped ID leak when adding a rule fails
Date: Wed, 18 Nov 2026 00:12:47 -0500
Message-ID: <20261118051247.3885308-1-lcy8047@gmail.com>
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

Remove the mapping where the modify header is freed, as
mlx5e_accel_ipsec_fs_del_rule() does. The modify header is set only after
a new ID was allocated, so the copy that mlx5e_accel_ipsec_fs_modify()
passes in never loses the ID of the original SA. Outside switchdev mode
rx_mapped_id is 0 and the call does nothing.

Fixes: 91bafc638ed4 ("net/mlx5e: Handle IPsec offload for RX datapath in switchdev mode")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN, MLX5_ESWITCH,
MLX5_EN_IPSEC and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
index 5c69e89b13a7..ef858374ae11 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
@@ -2161,8 +2161,10 @@ static int rx_add_rule(struct mlx5e_ipsec_sa_entry *sa_entry)
 	if (flow_act.pkt_reformat)
 		mlx5_packet_reformat_dealloc(mdev, flow_act.pkt_reformat);
 err_pkt_reformat:
-	if (flow_act.modify_hdr)
+	if (flow_act.modify_hdr) {
 		mlx5_modify_header_dealloc(mdev, flow_act.modify_hdr);
+		mlx5_esw_ipsec_rx_id_mapping_remove(sa_entry);
+	}
 err_mod_header:
 	kvfree(spec);
 err_alloc:

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.43.0

