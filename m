Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994223;
	b=FS4wZ8ilisqmEt9Gn3J+JSXGKyHc58PZnARvuUeRHPftceHR4voyShb+2DPN1B8UBew/
	 k5vb/Zkdvf4s8vOImsTLvu8sDrQBc1AbMh+Eqd3/vqT2t8FwYZGNu5wn0gEuwwdmO/iqB
	 1tUfNi1qIeqpFKvLSkV+honAe23fkKRfWmPkw5UjJmlo8B+xaygeSAKGN5fKWiuD1rzru
	 6YkKTRccbPkBOMIB8AoyT4vUyawCgD+5LKawAYQArTYstFyLB1DkQNdzWzDWQ6HyFYRSq
	 erv5DFZhb923twcnAeGsrAizwMCzSTi99WDnm7Zra1EcPM2l1txzyU+bK2B2qquXIMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l4JokObtDzUrFl/pinDn1cdhUhPdmnO51ztdKRPM0bE=;
	b=iYl3KHFNat5UeZRt/cQmJfX0v+F0pdUgPn8iD7jPT8nEQ4wCOh7fma1vm7smw9M3sM/q
	 AiMNHkdfA+2WX90NYcVyP+Igyf4v0axtVHAOSlN/9+8nWQE2085GUx+hyC6y+HVYxOZ2i
	 4JELk0ZdMRjTgi5OS2PZiZTyXBL1u9ARUfWZiqrCuIPPYtoqLMGxIpNdeJnKnx4/9Ge6l
	 HyG2Qm7vVv7/JYYYuNMDUcek/MaHwCsXlRUT9TDGtb/eMjRqTwb532/qr+0S3KibIb7b0
	 CfPc/YrjgQuNL9RrFl4MU4kLXyCNMIEgyOrCzDq94+zIQPVH7e9Pya8rgmm1LxPGiiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYhDbjlU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A1606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYhDbjlU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5130805e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994222; x=1795599022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4JokObtDzUrFl/pinDn1cdhUhPdmnO51ztdKRPM0bE=;
        b=zYhDbjlU6WNKwwXizVO4t1TA/uCC+J2rMmefaOybcw5lad1TYYDHB2Rk56nymKxkw+
         qaJHNLumbuLSF3GWiUROmR5pAk4lXvxk1a8zkGRygJoxe/KLO6X8D16ew88+g3336AjL
         TRHPXSU4MXl6MqwjV4k2rgKHQABImgHuThq+MsXmAxnIZASK1bGlGGAVMztyJxvcupC6
         94lZfyDuIB2vrUQ1POmiZ37eCdTBrpw7E0M3m7FRry7Y0DXfqp61trsSw9g2vQxNJPvq
         6hnVKMyO17KTCUBM3D9PI/useezAwoGV7PJRtv6ygkNleQ7AVvgjGiuATXPrbWTunFYS
         7Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994222; x=1795599022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4JokObtDzUrFl/pinDn1cdhUhPdmnO51ztdKRPM0bE=;
        b=hiDnY3Ba3mrjYaNL87n9DCsKFVwy4UDEHn9EqIYuJ/ACl+xjhEPKQS3ihWdY4FUEGc
         +MVNUC+nvOn7qo7qXNiLTa4bqDfh2dTVmkh14raP0tDrhm5Eh4DnGtElHsVuTL/J034A
         q/76YVI2zK2GCGDJO4TdybWmI43wERykozgi7mjjlVt6CO2IA5cDg9SYk78zZL2CoOus
         2Wjw47XxOs02QITVeoN88J1tpWh/hxJdCyVmgXgjdGHKr73BsdMy/Z1IJvRJdKEEdL58
         6wX4l2+mUtZGZiRriIie2H+xuYRNQEufsfNP/tlDrm63k+ySC2OUo1weLzZCgk5kKC5C
         cXEw==
X-Forwarded-Encrypted: i=1; AL+hErFgImI7MSHNKvSruTST7IJ68YKfVgQZOVxYQKbL79Sk8fChT5oOLB90CIUUSOOaqPr3SWfAQ9TFPz16Wco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hAH5uvy8QY4PO9hmukDudZ9NHjD03K8O0m173uazRj16JCcz4
	xSmd1N6qq9959XDuv80UMZHqGwXQWK34S7chBiLEiudCdfs+KEOIP4qf
X-Gm-Gg: AYBFou3FTOoIhLy6BQ3wGYJNG+h3zLn4NJGqy9xrEaQG4ZG6jCaY9/cQkXe2B77uSLw
	MNne33t0h8JfJCXEyB3gQiPor8XHCpfcUWkFPlMc9HH0QuYka6bPpnXPmJXJa301Zk99rJegYUg
	nBvqQWeP2xHDszRooCNwo2/j7320eljeufGpOZ+Ng1zsgc+FVTJAMuqaVdKNOrkq1eDtl1Q0X/M
	3nikijEkLy4+8QD5FXFUJUia2xll48y4hSc7JQjb44k9/wtorbMZLlXX6wGh7V2I6yDZHHnPGbj
	HxBD6nTYEH7SAlJRpLk0dL4t6IBgWEJSThITUYfakPW/9EngHRrSbM++soRk2QmDif7qmeRBRdh
	LRL2BxAc56/i1Aqh6nh/hd0hkSWFTx2VFOU4QJTYMSVC4UREkCaM7GuC92CKGoKT7Er5fNdeAQm
	R1JpRwAqqGz7lTSCuqPurkUwth5K9VLv3Y69zXtn9XhtJofvYFuD77OQlH4IXWvcTpmr7z91vwV
	FypQvnhM+6Wh+n6Kl1iahkfZsi2JT2VyG1LYxfPpl617I9NKpOErGuc2g7cZtAJZqshMWnZQ6KJ
	L+BPk7iTfRSbxJgaE2z/sAuVo64ujZ28OBQNKyYR34BarxzusdIBnYNbYU65rtsFgYR1zFkQ2v7
	6vFKnaLJa8LFEGdU2VILkJMXzwXrGpzJM1fsRvOFZJaBU75KTRlAGiH5qSYoLauxnb9WnvfaIMb
	40JNttBMsFCAAd9VHQaKoDD50DQ2cc4atuNFu5SxKhTXF4YOC3G8/h
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr42618135e9.11.1794994221580;
        Wed, 18 Nov 2026 01:30:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 4/6] net: mvneta: keep the TX rate limits across open and MTU change
Date: Wed, 18 Nov 2026 10:30:10 +0100
Message-ID: <20261118093012.90121-5-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
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

After the interface is brought up again or its MTU is changed, every
per-queue rate limit set by mqprio runs at 10.23 Mbit/s, whatever rate
was configured. tc still shows the configured rates.

mvneta_txq_hw_init() writes the token configuration of the legacy rate
limiter for each TX queue. On the Armada 385 this also sets the refill
value of the queue's token bucket to 1023, which is 10.23 Mbit/s at
the refill period that mqprio uses.

Remember the refill of each rate limited queue and program the rate
limits again when the port is started. Resume also starts the port
with mvneta_start_dev().

Found by an AI code review agent while working on this series, and
confirmed on a Turris Omnia (Armada 385) with 1 Mbit/s limits on a
100 Mbit/s link. After down and up or an MTU change each busy TX queue
carried about 10 Mbit/s. With this patch it is back at 1.0 Mbit/s
after a burst of about one second, and the limits also survive
ethtool -r. Resume was not tested. No kernel selftest covers the
mvneta mqprio offload.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v4: Moved before the validation patch, so it applies without it.
Discovery statement added.
---
 drivers/net/ethernet/marvell/mvneta.c | 31 ++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 76dfbc484269..58453c69be36 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -683,6 +683,9 @@ struct mvneta_tx_queue {
 
 	u32 done_pkts_coal;
 
+	/* Bucket refill of the mqprio rate limit, 0 when not limited */
+	u32 bucket_refill;
+
 	/* Virtual address of the TX DMA descriptors array */
 	struct mvneta_tx_desc *descs;
 
@@ -3752,6 +3755,8 @@ static int mvneta_config_interface(struct mvneta_port *pp,
 	return ret;
 }
 
+static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp);
+
 static void mvneta_start_dev(struct mvneta_port *pp)
 {
 	int cpu;
@@ -3760,6 +3765,7 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
+	mvneta_restore_per_queue_rate_limit(pp);
 
 	/* start the Rx/Tx activity */
 	mvneta_port_enable(pp);
@@ -5212,8 +5218,10 @@ static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 	/* The token buckets still limit the queues, refill them at full rate */
 	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
 	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
-	for (queue = 0; queue < txq_number; queue++)
+	for (queue = 0; queue < txq_number; queue++) {
+		pp->txqs[queue].bucket_refill = 0;
 		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
+	}
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
@@ -5239,11 +5247,32 @@ static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
 	val |= (MVNETA_TXQ_BUCKET_REFILL_PERIOD <<
 		MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT);
 
+	pp->txqs[queue].bucket_refill = val;
 	mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 
 	return 0;
 }
 
+/* The TX queue setup overwrites the rate limits, program them again */
+static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp)
+{
+	int queue;
+
+	for (queue = 0; queue < txq_number; queue++) {
+		if (pp->txqs[queue].bucket_refill)
+			break;
+	}
+
+	if (queue == txq_number || mvneta_enable_per_queue_rate_limit(pp))
+		return;
+
+	for (; queue < txq_number; queue++) {
+		if (pp->txqs[queue].bucket_refill)
+			mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue),
+				    pp->txqs[queue].bucket_refill);
+	}
+}
+
 static int mvneta_setup_mqprio(struct net_device *dev,
 			       struct tc_mqprio_qopt_offload *mqprio)
 {
-- 
2.54.0 (Apple Git-157)

