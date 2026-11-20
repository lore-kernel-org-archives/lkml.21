Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140963;
	b=Ia0BHqMrc0IVkl4UczX0+y/xvz1IOImisXdhFj+winWxdHQ65Ki8XTZ8n3VT652w4twY
	 xYyTMtaBmuJ00ilAGAXg0/gxRYGKF5Yi+iSLACKjj1JaRZ6N0jSU77rvl+c1GoPpvA/9G
	 45xLCaOc+m6ePSvvL6V+RXhsiQORUjz9zdJ+w1Xodxz7AddfYzeMnlnItgmYpyV4Xt7TT
	 9oD3wJK3LLgV6ADc/mfKLjUn0NPh5xk7p2oY6lK8MZlcDU7LHpjb1gh6lvoEboSuJeaiD
	 dB1kq42cLuiCP4aRLr1Xp7ycnDoiuRkDO/gos8T9qjYKPgYSpNlWf0mheCuW0ajunlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wNFHaznprkYFxrl6N69NiI4gThn5TQVVfoHkGgTnqYU=;
	b=UxiIyg5TYXS3DOJs4aylYroRoKwPfygrGdsoE6O3uS1fg82WerzPP3E5upLQkJCyyuux
	 3ElUegZ//pTYyKeQXKwTWKhgpfmuVhkngpicc2nkxfpsjm2K6Y2Wo1Z5sA2ZPM++zpc5x
	 WOnORK8aV2EVbf/3sL6IT0K24GE0GPe7NYGcYnv104MFEDaGlRX3ys9aazBWzOZ87zeeL
	 Ai1bBTdAl/st55da41tPFV1KMI3pY6Te+QDQsQBlIG21b3XC8oJ5AIupBgJndNW7pyD9f
	 FaRd8DYPndLr9o7kwFXzd2GAFtrXj73WgQQ6l6kDK5mV7HF+sey62jWdFgC07AnAHkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uuu1/tF0";
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E966606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E966606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uuu1/tF0
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-94961bfe1a0so28756285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795140961; x=1795745761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNFHaznprkYFxrl6N69NiI4gThn5TQVVfoHkGgTnqYU=;
        b=Uuu1/tF0lfIbNcFFA5RelpnOOFHlqPgFEyge8uGAAcpVNHYb7VRu86qDPllD877b9H
         b9JCgahf7j9nr9Wk6YQR7CItht+a7kIhxujCe3BohcxwygPWFJZ2BLNQOlPk6Z9Sp6fG
         2f69HceylDSJmVPnPVb3gKoEUOjeQR/gqbHI4crJrVMh4s0FET4VBwA2pkyZDP9aBRph
         CKimzSVZH7kKCxujyQvrrNOBVYCipYLA3h4TrVcYRdX7pltjiL2jCFYhhSdyAqQlh5XK
         JJ9ZfEOb2S+rumA8JkDSIAnQFPcEuCbZTJ4QgokWnZUfWzABlTrNAdzdGY1C6ZJ/6gyr
         21nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140961; x=1795745761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNFHaznprkYFxrl6N69NiI4gThn5TQVVfoHkGgTnqYU=;
        b=RFKuuURs6tEDsKwRMA8Pgr9yYbBL58gmjYd+5I/VwMnrWwYOx9rjuk8Y2Wyo/nTvVO
         krrMSaxvePnYVZndXXirt+IUaKwvzbJ6QFViemHWJli7/En8n2cigl38hBH4CXtXqeWb
         qSUYGE2AeoCtSz55ovqKcw273ikbfOyeX4AzRUYoDSKm0y8XghAlvik33CsBaUMB1chO
         O5ydQuQsNkZpY3hjyBL/NYNBi0weEu3oLjg/SASIW2QATJRD26iVA/VpMNCuLlh7KbYq
         oqxX8lhWI6RKEwNMlAuOFsALlLpW8cpmRn75JeU/N+MUgNSeKb2GtaPUf+Ek76k2mvuM
         1AZQ==
X-Forwarded-Encrypted: i=1; AL+hErFGxILT2Iqlaibw0e5jpzVYnIKGSqvqsMTSrAB5g9RqbnveixqLo06wJA3Fefd3NO1/oXH2B7lTzDCfcsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NAFwBVfZfC+kwe/CMN4AvT/LCkmiG1iSw8QASQmYSqR3UzDRw
	60cH1fkqNM9L3/PGvaUrzNrTQWKPM/9GjU2ZeYR+O2SZvvmwS5mO6ixn
X-Gm-Gg: AYBFou03PI2+vRbbsKSCE4U9o/q6JRD4uXJKQ3CDsJ3aoIX9wtTrMKVF3dlBk6sMGRF
	p8BxV7ha+0EOuY3HvteGtmu2Xnkov9Hhc36H4OB5J0S5rqsVE4AorMQ7vBYZJtFatAB4VKYe1Fn
	pr3BfstNEzhdZhtHWz7ZfSn+QW9qhwL2esH18YelO0tZ6rWHyiuMlNLxMT1tCMlA/utZeJyJdtB
	ySAf15b3co7HaO/x9n2tmo8HliEEKsjeYEzefNkdLvUcxVKwQtu3+Ns/olEVNvdtHSICcyOOe9e
	YiTPYzxbcv44LveEhRi031Txjov4RMSzqOrLBy0WfH7QevHoeYXibWKB484fwqShdWmoSmFk5NE
	yG5o0HmwvSjHqI3k2o5pcdDyF7QoiqhKj6KLTUlaDWQv+9/wnUVULjO/PBrIxUcahpBV/y6OoeE
	VYVNT0fiBLJTZJCp/sA4djQs49c5Y1mtiu7ErQOnwP35jfLSJR2PCgnmDQ+IcqaRTPG2aq+HoQN
	wVplw+8PLdnp5IsCbckyLceuAk3JLwiBp+dhRpFILMRUqJXdlVY1Se1nppu4L0QgaijUEel36Jh
	U67zxEEzKON8yZmAMsBXeWbtwmhJPCumVbRTe+FdeTWmkEJKUE5Ux8Ehg1NBvojpZRtOxEdWjk4
	=
X-Received: by 2002:a05:620a:2b9a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-949ba8246e2mr284773685a.12.1795140961426;
        Thu, 19 Nov 2026 18:16:01 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm91755285a.23.2026.11.19.18.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:16:00 -0800 (PST)
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
Cc: Gal Pressman <gal@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net v2] net/mlx5e: Skip hairpin entries not ready in debugfs dump
Date: Thu, 19 Nov 2026 21:15:57 -0500
Message-ID: <20261120021557.1630138-1-lcy8047@gmail.com>
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

mlx5e_hairpin_flow_add() adds a new hairpin entry to hairpin_tbl and
drops hairpin_tbl_lock before creating the hairpin, and sets hpe->hp
only after mlx5e_hairpin_create() returns. Other users of the entry wait
for res_ready, but debugfs_hairpin_table_dump_show() does not, so
reading hairpin_table_dump in that window dereferences a NULL hpe->hp,
or an ERR_PTR when the creation fails.

Skip entries whose res_ready is not completed or whose hp is an error.

Fixes: 8a0594c09610 ("net/mlx5e: Add more information to hairpin table dump")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
---
Changes in v2:
 - Point the Fixes: tag to 8a0594c09610, which added the hpe->hp
   dereference to the dump (Tariq)
 - Add Reviewed-by from Tariq

v1: https://lore.kernel.org/all/20261119012707.555494-1-lcy8047@gmail.com/

Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN,
MLX5_ESWITCH, MLX5_CLS_ACT and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..c6623f13261b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -1067,12 +1067,15 @@ static int debugfs_hairpin_table_dump_show(struct seq_file *file, void *priv)
 	u32 bkt;
 
 	mutex_lock(&tc->hairpin_tbl_lock);
-	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist)
+	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist) {
+		if (!completion_done(&hpe->res_ready) || IS_ERR(hpe->hp))
+			continue;
 		seq_printf(file,
 			   "Hairpin peer_vhca_id %u prio %u refcnt %u num_channels %u num_packets %lu\n",
 			   hpe->peer_vhca_id, hpe->prio,
 			   refcount_read(&hpe->refcnt), hpe->hp->num_channels,
 			   BIT(hpe->hp->log_num_packets));
+	}
 	mutex_unlock(&tc->hairpin_tbl_lock);
 
 	return 0;

base-commit: 342e62fd34c2674e82bffc89cb5c7091924986d9
-- 
2.43.0

