Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302479;
	b=0WBzx9uwnGkZC/WtjTOqeilXLDLl5dcNzfEKmoa5SkD786XyIzwsFgmbcLvf1yIj3od5
	 hb6APoE5dIyRFP4uFo3J+AeV5ArDei1ENCvD50sfcmRLk2fi3YYDqbczBIgj0qHtAQgJU
	 Iuz1t9MqU95kxxXNmieS1J2c9rmz5JiQ4PnqIJad3/g1NGfT5vJj6GB7sfgsvTzwXEc2L
	 ol8HpSJ5jzHA+VKMkEglIEF7IGYjOeuRik+j4GB3SXUrd+VQQVBKaU+POihZbl/MrRRpj
	 M79YliTFxCopaDghW8nWnl55Lcbj3n2NZuIKGzXguPslIQ2w6K54kQlVvNzygpncQ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
	b=32SATi6m8DzGVgGUt0KMulK74MvXgo8fZemMCg3lKk+uMtVOKHl0VEvsK2FI9Z8CnyPI
	 +DDnouf3CVCSkY5NSDR44PQDsndQTD43lihh0VVhAsssIVOH7T+D66xPIh+wc9j7aK565
	 keCZ/OjUWUTn+YR6f849G/xZiVH/+dFLbd8kUSVE74cSAOFFfQZGoFLPxFKd7Y1zyBUA2
	 f+xUjxR+vWyOeKEyiAkeXTb27rrHxdGj8e9L0p98JaPKqGgArzjC3n2SkJDSAl/e1Ty3y
	 Ki2GHe8l26UdwStwtZ/cnWzOXKqn/Hu13CZeT/BNITkJ4iwDl8fWZRngR64TRyNGofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Y4DSGDzW;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977C60A5BC7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1977C60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Y4DSGDzW
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso477295966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302476; x=1795907276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
        b=Y4DSGDzWNrPyJqrxTJ0lhKrSAz5dkggFsvVp8ZiyzuBH4JqzRQmwoc6DgZHpcvehiL
         iUbMNef6MIxzHOfL11EFzsKVrP/M0aBGWJxaeUgmj4dz4xDbAbzDU1C5z5ZJFEyLDEJQ
         s6zvSZBRqCks5EQt29Vj9H2Z/7m7LmteMeEGqMc2xdWPde0/DhJHeoGGIkQQbENhRf8Q
         9vUKu9rps8MXskdv36TFGMaGe1/xABojop4Nx8y9mSw0VQ+KSYu3u9MjkRg78OR8GDhi
         3WTWfVCqRFUswal7fmVf6OYDCBrUSg5h+ZadrvugMkkYfeHptfu8t17sWuf0nWah84Zy
         mXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302476; x=1795907276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jfrh1uIU+/waSgkZCGYbAyxAmQdxTwCrEPYnNRV069U=;
        b=QgIPHjADmGglgO+juX/f4npS5bmBNx/+OequgwBB4HeRpmfAjv62hEaAUCdXg9ZVVv
         6wiB7VJA9bvZWQ2SrxZSEe+vV1ZKJA4VTgUa/h7Zt5CoDGBveJnAk4rIZ0LeaAxZtp8K
         01VTs/NsE5i3Pzyg2MYPg0CQRteuDw/6dNHPF+CFdo2MgA5uuJmO9zLL0WKAzpbE1BYS
         kCS7Njxkml4kprUTHt6NY3QsGAHI0VBghTi/yVF2g0jfQG8ullzyXXM2KYze8DPca603
         nEkwnu2nU5+tVi1SoynBgoDnVfQNRF0UJkdUjQK436qSqKEB9zLUK3VWNrFKfSoyIUNm
         YejA==
X-Forwarded-Encrypted: i=1; AL+hErEHi4mzNS4PTUiEZ6x+P/cG/6jOC19CSKZciwAylHBEiA79qNt5CeVS9mo5WoGQ1TSoBhdpQiYY+F42x5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VSfXKyLOx8gC8UGXom0KfzuqJ/CO+xIRdyDrJhGeIpvo2bl5d
	1Y7UChsfMV1SvMT6lGMkFHFllUuO4ooRdXMB2pQDIG+5/GtxwwUWTTO7sJgqNHgBhw==
X-Gm-Gg: AZFdTZcbeRtpmafMmiebd0yUrNyD9Yfbest3ckxVG3V68bIT8hfQ3iyAAZJISDoxwPj
	nlfSpkSvMm9lcNHGyLKUSgxoyHr8pkNnBFuiH2rnYkiEx4Vn2Vj4mH92yy2OdvxgvvKUuMkxFZL
	fh9g/K3pTIAMq21tO2A+L+ocORsQ4dxlxpBsW2/efeli7hWo+japQeJiz7yleziC+sJ1l3uZQ7g
	QWVuLTqvtVLLQucBoMROL1Gy8mtjUSeOeVrgRrEmW1CNVi9gU+tiTr9Om14zgxOQf6ELvRf6dje
	/mexmTHf5xTmuOze7e2yXdDPWzVGwOd7t6gp7SPJx5oyALM4lUr1DtyTZzRJnkia7REixRYDHHc
	gEvhVOC7zmsJt9ldcfO6Fn2FijZgG9ZPyo1zlhaNlBBNE02xYJ3rHUumzJCt17wc6bPDdBiYMVQ
	47gduoip1uQiBLa1FJVeIx9CVTPHMW78rPnFMi4w0r7F0ZFQmgsghxosSYBm0We+sOF5Ufd9l8V
	iNWQuHYzXp8Wy35LJ17t4Os82yEiyZq/5iAx4mB/SGtt5ow9/a+f8ShBWkxyy4s/UtJR63jHRYt
	K8/O14RK2l1whXMlhvZdwJJYyRhqWzV8VhbpQLkI4OJE7L/yGVFePsoKQTLnxhILx+tQmzzg7lm
	VJ81P+L5pV8/yv7bspXJPDUFhmtWi9gBvcKntmAtro/TVvOe9pavesdksnfI/fquWTnyOtTRWnG
	GvHykh2Gx+mV4vhlqlhrqOr6izkieYUgGIY8dRSVlMj+TbeoKpkcGpyEK4xjZap47wzG8W0vM+q
	UeVcdptojHW8uFBxoeaVdDtpWuwqzB2/7A3rMvkCoQN4oxC/eRDpSCeRjByFSY70o4Z3fEooCF+
	FQPmUZNEGvF9/u0dvVxs9Fk276+sfDedxkzCAF/UJDVzmFSWBRcPpOVzmTwbroL25kskrnnlluk
	=
X-Received: by 2002:a17:907:3f0f:b0:c41:9a35:17a2 with SMTP id a640c23a62f3a-c5131a6ef04mr809669266b.31.1795302476575;
        Sat, 21 Nov 2026 15:07:56 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:56 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 13/13] wifi: ath11k: keep the cooling device across a firmware recovery
Date: Sun, 22 Nov 2026 00:07:31 +0100
Message-ID: <20261121230731.1206043-14-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

ath11k_core_reconfigure_on_crash() unregisters the thermal cooling
devices of all radios, but ath11k_thermal_register() returns early once
ATH11K_FLAG_REGISTERED is set, so the recovery never registers them
again. After the first recovery the cooling devices and the phy's
cooling_device link are gone, and ar->thermal.cdev still points to the
freed cooling device.

The next ath11k_thermal_unregister(), from the second recovery or from
driver removal, passes that pointer to
thermal_cooling_device_unregister(). With CONFIG_THERMAL_DEBUGFS,
thermal_debug_cdev_remove() takes cdev->lock in the freed object. Without
it, thermal_cooling_device_exit() only compares the pointer with the
registered cooling devices, so it unregisters a cooling device that was
registered since and allocated at the same address.

Since ath11k_thermal_register() is a no-op during recovery, the cooling
devices stay registered like the radios: do not unregister them in
ath11k_core_reconfigure_on_crash(), and unwind them in
ath11k_core_pdev_create() only when this call registered them. Their
callbacks do not reach the firmware while it restarts:
ath11k_thermal_set_throttling() and ath11k_thermal_show_temp() return
early unless the radio is in ATH11K_STATE_ON.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 50556081e09b ("wifi: ath11k: thermal: don't try to register multiple times")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0795ba7e038c..4aaac5200ed2 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2072,7 +2072,8 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 err_spectral_unregister:
 	ath11k_spectral_deinit(ab);
 err_thermal_unregister:
-	ath11k_thermal_unregister(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_thermal_unregister(ab);
 err_mac_unregister:
 	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		ath11k_mac_unregister(ab);
@@ -2342,7 +2343,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_lock(&ab->core_lock);
 	ath11k_hif_irq_disable(ab);
 	ath11k_hif_ce_irq_disable(ab);
-	ath11k_thermal_unregister(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
-- 
2.53.0

