Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302463;
	b=jZoIIUL/1ES26XfStPFXIZsICBDi4BybGGmBUpRvlXZsaMS3c9G7Agv+LsbQnkT/zb6L
	 TBGpVlvM2zv+ny2l/U6ztoTAaLWz/50ZYE3itLhHSRI8Dw2NnvzznnIH41SWwNw4Y0HsY
	 qlGo0+idzAhCqvumNVA4sVQs8qDjZeJ3ffNfZI5ElP+QFRNXXLwLCnRJgG3iCb0wegoV/
	 gjDk9AWiXi5YNceQWaHTnv60+HRYDYXTRw6dBjr9ZNZUejQeqcmY15dQCgx7oGanTT9g4
	 0/OQtWnp+1obiO8RwDjK5Fa0d6tpaFXAKqPh4dJi3bmiRWsPSYYE4D7x1oG29UjSrgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
	b=ObdfIVAWd5CRvxiY5v3spbqMtSqiptiiiE5bggVoQFLSl6DARNVu6+inEaLnKqO4jhDZ
	 WBiRPayklgNvk8a9MGiRh40RZg5AspPE5CnxQm4hY3Iyv84+h1SNPEswQmoL9xLu7O6Yj
	 ZrKQJxBnmNZDPTNjr6MCgHh9A7R40SWA/fHS8USwFW3eptZYB6blVKelYFnxTNJn9rFo+
	 hDQ5C2/JW2MkfHLkW8OpCV4e8mX/4YWxOOZbMfrGvGBS38LmsdAJyYmJ+kq5wqtUNLLOB
	 CKTKIhGDU/O76quOeWb3n78dFWEtkwH597Ux+RKtfxEG2/IlwkicAQw9ExHQPLP9KFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=perZYWZG;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F777606A682
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F777606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=perZYWZG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c515319dd89so205408766b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302461; x=1795907261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
        b=perZYWZGTcIuDNxZ1nNcXbkGt1MfSRoIGXrDThH6wtSW1YycsyCGWdVYa+8OuBNXO6
         ByG7Yz1v6eqxlhboGR+icRKs0jVlLpigyx6mYblj2e9H3NWI6bTyM7mAMa//h1PbvvqN
         qbdp8HCTVlfjOYtvRI7owdNEzwYziZUVpRt4bLhY+hrcUIqUl6wov4QxDpDOOIl6j6+U
         WYYXYWCtDJc5+IibQH7Y0li79LmE+YD62U6UiWoeKUUCgvcMXX+WbJ+d2qVAieGmPTKb
         ButlWGnvBQD02CRn72fKLE3d+3CT9ArjqFmVNGuWUzQDYYE3ZHSowxpPVCUXd6mXEvwm
         J7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302461; x=1795907261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzF4XgzG+OFQFl38cVbBCWJ0+gCFYYh6ZK+opbkd1ps=;
        b=yCxT6ydVrXDyPE53IK4dg4l3127PDIFd0b3z5RSrQj3DxwAjyX0X+jfG7afYT1hQYc
         v8Zl1BgdyFUjLYZEa6YKcVTyYH3eytPwc1aObt1ar8lg1PfLTnja/rT1otsQhHEc9Z9F
         oVZUESQ0WsLVw2jm3D1MHj0ee/vBQWDkBwBelIm43GJzn0rcrH8K1hn1DkZcJygotszF
         +S0pSiutg8h+2SNgTcoNIdBL0uG/wHNUTO6uXoqBzCwRgsxoasx5u595g2EqtirbBZlH
         MTpfADYhMAfJQ9ncqHz0f5mNX19JTacYL5OCbWIlpvkTIcwkzQcI3tMOOKrWge8ng/S6
         07HQ==
X-Forwarded-Encrypted: i=1; AL+hErHJWgf1cVXUacBnpWBjMM9wd0XAHeNwVgTvMFE8kEIpg+GgvL8UWTuDwfZSZqOrl0jv4gHb5U2ZUROkLi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MJnerSPoO4oikifFRt5TGmDX58PEV9dxojdqcU7qTCOy7NW9F
	vzy/yN354A1l/D+wqIJo4fqp0NgTErM5w7kjKj6VT6AkIXSjdJ96CZepwDdj5AC1dg==
X-Gm-Gg: AZFdTZflNzMbOOCxIHXp4XGVq2APxkd6m2poaMq6XoL7TD3AasQlkiNtAyCXHk2rwyM
	Fben4rA979AjHBoyAsZ04xrYxcZn08JCFA7wdf+Fb1ZvHUIL0mhHgGiUzn/0D8ae25UsDQnTylz
	ldmbkuJ2qec+Prb6qJWQIfNyy8xxmWy1c/DaC1UCfXlCpDtGZIZ5hiB5ws3wL6YZEZQi6epFltf
	5BDnkpoihi8F/pSbhLwodugj5KaqGe9yt4w1OQidNarbNIOlDwlkFWTNMkTuOrH5ZHFjstU4mKW
	tYcE/dTaya1rnqqB4qBWKeJ8jOi7I2BT5cn+BCt3e4aI1OdEJ1wrOO3KdddcWQUr8HWxHO2S/qu
	z7lvrLo0K0aSbkHHUFrqwhAsJU6FDwyNmZv74wxWOIq5qNMKstYklSJ0ZTDxwoVxYYLipOd7A3e
	UVNrybKduDxWJy/ZxvKIFyfl7T4YC5NSIT3N8LTzNC0KaVwSGeYpk/jEEk5EAPz9LdTaFX4ZaY5
	rKEbLy/kkdmiBVsQNTLY/gSIt6LsqX1hp7FkATwQB/+tbWsSjqvXunb/JyDDO89kTRXzQFQge4c
	1sRFhmY3+cfyIzYbD5IMJjbH4V3BvRkmTL4k1arhEMTy5AtmaP7JePQaGP8SfdyyEs40ZXtHs4C
	FLknCdh/Y4sIxvh+kJB+cIPGmR86+ApXB2A4jbSYMWJRcZWsX9okol2bst77rrAr7MpZ65T/IAd
	6x9ia8Eq+cr10KIA5d/gwGy2esuo8Vy1xCINMKoQRldhHZBB9QOoSLI/cqEzQRb3m7mrJXtd3IV
	v+JkNopY73Ul3cF7LzWSnIRua6PI6vP2pLWCCpkCoxC97YfYl62ov5Frax4BX5NhQLSybUChrNY
	ajfISdZ72Ffg4E777f9D1gi9NvOfyJ1qEUDx4ZtRbVWszyRtSikUByz1Ud1CMZmAad3ZifgsvsA
	=
X-Received: by 2002:a17:906:4750:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c513a88a462mr502393666b.22.1795302460965;
        Sat, 21 Nov 2026 15:07:40 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:39 -0800 (PST)
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
Subject: [PATCH ath-next v3 04/13] wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
Date: Sun, 22 Nov 2026 00:07:22 +0100
Message-ID: <20261121230731.1206043-5-julius@bairaktaris.de>
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

ath11k_core_reconfigure_on_crash() clears ATH11K_FLAG_CRASH_FLUSH right
after ath11k_hal_srng_clear() zeroes the rings, but
ath11k_ce_init_pipes() and ath11k_dp_alloc() rebuild them only later. A
WMI command sent in between passes the CRASH_FLUSH check in
ath11k_ce_send() and dereferences the NULL tail pointer of the cleared
ring:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_ce_send+0x114/0x350 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_htc_send+0x188/0x3c8 [ath11k]
   ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
   ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
   ath11k_peer_create+0x138/0x500 [ath11k]

Clear the flag once the rings are rebuilt, before ath11k_core_start()
sends the first HTC message.

If ath11k_core_start() or ath11k_core_pdev_create() then fails, the error
path frees the data path rings with the flag clear. The stations stay in
ab->peers, so removing one later, or removing the driver, makes
ath11k_dp_tx_send_reo_cmd() write a REO command into the freed REO
command ring. Set the flag again before ath11k_dp_free().

On targets that do not restart the firmware after the cold boot
calibration, the QMI FW_READY handler clears the flag as well, also
during a recovery. FW_READY follows the firmware start, so it arrives
while the restart work is still rebuilding the rings. Clear the flag
there only on the first boot, before that handler starts the firmware
itself.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: set CRASH_FLUSH again before ath11k_dp_free() in the error path; clear it
in the FW_READY handler only on the first boot.

 drivers/net/wireless/ath/ath11k/core.c | 5 +++--
 drivers/net/wireless/ath/ath11k/qmi.c  | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d6346e0ee047..7456a8422654 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2298,6 +2298,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
@@ -2323,6 +2325,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		ath11k_mac_destroy(ab);
 err_dp_free:
+	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
 err_firmware_stop:
@@ -2354,8 +2357,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b957..a176e6498ec9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3291,10 +3291,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ab->hw_params.cbcal_restart_fw)
 				break;
 
-			clear_bit(ATH11K_FLAG_CRASH_FLUSH,
-				  &ab->dev_flags);
 			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
+				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
+					  &ab->dev_flags);
 				ret = ath11k_core_qmi_firmware_ready(ab);
 				if (ret) {
 					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
-- 
2.53.0

