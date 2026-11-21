Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302461;
	b=bmyIgVXC1WCE8Wvf3VQY/w3Qw4WECMKXKiwahRSHyjXOzXfq2M42e2/23vcfTYziwxHu
	 Yt6BYEjfl+LsIh9wGA+d+Qa+Q4RbGBPiqQZFWOiF+PCcj/UjfRf+w5Cra4+gqopKnnX5r
	 Hbl+Y3pVNLBCIheQ9r6Z/3C9KRgDEn08FfME2Q/DKRw/JitMqQGKKMRn7iyWruiLNJDyV
	 N1JEcPb7tTj7cVsT/HAINKiRDR2EydSBkv3Ze9qlH0+bdEqR48+Pm8I6ZRv4IHSXCd/R5
	 yBXfhMPEibS0iFlfeXSAZm0A8bvjf+clV6N9Vm8jLP5u6vE8+rQoaTzFQD9usHX62JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zcSc726+ApkS3y0S6C44eyfA/ilxfVvvD1+ezXLb36Q=;
	b=fwN620OGlKPZaav5ooWY2HJ+B91PF951exb/a5IDCKXT1ES6kEpy2ve9nnLvrdRDjFUt
	 Sq/CUG6i5JaizZKPLO3TU3DpiyPrEtFRyceBM9D6nF0FzIpkNeM1UC6cU62jVNiGh9dEt
	 uKK/K0p0iStDBbbszTfbZ2q2Imz8xxVPg7kOltVXI0lCK8YhsEBPS1vMFXjYfFvJ8EqLn
	 Axa8nqCMJFYeGr6M/g9I4/T9Kw8e0gIcA5/J8bPnyrJOKercCLGUwojflgMnWBNG/DhUY
	 X5s9YiOUwEIivSEvqsynGEhfVCCIom4W46GxI5BLfrE914coBGb4G3asKaH8qq0eKgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r9MGaone;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332B606A6A7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0332B606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r9MGaone
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5118deebcfso310935866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302459; x=1795907259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcSc726+ApkS3y0S6C44eyfA/ilxfVvvD1+ezXLb36Q=;
        b=r9MGaoneRTSQq9HFtbgu5rMg05/5EDN0/4cGpdIzKtxTjj/jtlvEHTiJJjJOWnNMrf
         MD0kRgWKGukySP9etwtLKPPxHc1jG8SRvw5oRGSsrIbtxVsoV+N+KFjZX86QH1vU5Hua
         rw3tok7JW9P1qvpxD6PONN8SytZarfGveuM3Yi7GMTC2Wnig0nmjI5BfVTSCZZXjf174
         JOKhGT/5bseaLvHl4Op4wA5KAMm0C7WIYjFg5e/K+e6J3z5ZPtkxMP0EUgmB2Pd5cuGk
         jR8STs+QgPYnjLFNfRFT48+XMNo0Oibe+Z3WxaR0m/lFCSdOPkdXLWGp5/WBFElyZAp6
         fG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302459; x=1795907259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcSc726+ApkS3y0S6C44eyfA/ilxfVvvD1+ezXLb36Q=;
        b=XIdlWGtB3ZYpBdtkKteRHIZv3nMuV3vyHYlC7hPhBbnmbxwLX0hJWJHUCuzB5httCB
         s0kVQsPZc9HhJvn8ASDJraPYPK+f78r2pB2eS/PxMkeLUnKqOa2vpO6Wl//4IpzcGFxj
         b/KWzv6h4hdyRebDMrJzInV/j8hQ1P6AxjowdXBaOgpdzP2yY43/Petf7QZTFnqE30zz
         cIB4WVTx9dkwSEVPpSMeGygpOP27sJV2fL5AidLRwrUNf2qkmHqYSfOkS2zmFp/Y/IXT
         //zppjwWvJvw35/ldTUM67jIxY8fA7rGhBw0szbtr1n49XT3pc2ZcogHSD9Qq7vg0CEH
         zxHQ==
X-Forwarded-Encrypted: i=1; AL+hErHRFR5EEIHiPSuuXdUPqISwACuBaTGQMkvd9FYOVUD00y5bYmupiTDA04LM2c2/QmYb/cVwLpZCIT3fqU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s/i+b24ZWONspjryiShFOFFCo/OZ1oTKu4ZzBqs+qtS5gIq2W
	IPb2I60KgUWx/hI6jm7mEl/9yiNiEPzM8JHDCAo/hgPQfoSuM3n3Ff4v5wOBW+62EQ==
X-Gm-Gg: AZFdTZf6wbEdYvByb5dxMar9mmr7Y+zPrnwULh+oY1bTB446JCdVkJ51XNMjAfRYsPB
	xUFprF0KsEyngj4Sm7Lv03cDYSblH58FCZukeeGJnM/OsW21O1p50VVS4eAgOmeaKcUNCW6Fkd9
	C3UiBd5U/uJPTZ+usZDGh1G26qaE51bHRcOab1J6UD87f9+3P2Uxk+v1wOzNKyKu7lKszKqPnAl
	9XYRZKn/5Xbqubo4dyraO3Zxmnq4elTQBk5zR+wivaN6mvtIbsGGWvsSdoCSckNBNFYGsqHDeqB
	5/cSliFPAa0YL+clpdKUx3IbwLekZZyPQ5AzF+g29btV+EIvl4HqsuD6b0U4mYaZkO3xSCDTlOF
	ZaWnIHucug/7eUuPHjJeOQQBJ6O1zNZ1NsIgkbFsY2+3FetSJ/AGV1dVPcJsEeOUS+ZPZFAZWSJ
	zmeX+d6quX390mmofVaS/NH36+G7/x0NzozuiP7aFhb0ruCtNZx860ZAxW3mDpNZTgmqSt95GFk
	n1iaC7/opcLMOYgTnjlepOiMftMXu5dJfEJ+qtTVQW/feYtQi80w6MMDK96M5vTrgBcrBNJ9nnc
	/hSX+OQ+Crfi5Ko9OJi6sOdOq7aUlu8vUn9RKyg0wsQXyx0Zikfd+Aa0kwyJVnJaM9V9JmBcmGQ
	qkM11oStuU2CSl306wkfMbn93s5moSZ2/R5gkr26qkWil6THKd/bss96Q16JMWy8W5EezzN8ZB4
	G+FpgP/vof1H15RkBR2iTk14f0iXqQzWyczkXOtDFZEZ5nPq/Z3qJW9KShTiztl6Te6ARYE3r2Y
	DofNG5MLM+Lib2b0bSk0os2cqfxeWH+0vGeyj3HdiLfMiLxZxXAwmit0oinuRP0CtNNH/VPMbwI
	5P7xJwDKlWsjIFzJ2MTn++vn8GpdHPiT5oxq3CreIJXVCbEKhT7EqjYztVj6JQIeDcC5P9IZnXY
	=
X-Received: by 2002:a17:906:b009:b0:c29:4fcb:2886 with SMTP id a640c23a62f3a-c513ab47ff7mr440549966b.39.1795302459360;
        Sat, 21 Nov 2026 15:07:39 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:37 -0800 (PST)
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
Subject: [PATCH ath-next v3 03/13] wifi: ath11k: keep the srng allocations when a firmware recovery fails
Date: Sun, 22 Nov 2026 00:07:21 +0100
Message-ID: <20261121230731.1206043-4-julius@bairaktaris.de>
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

Since commit 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize
and re-initialize again") recovery zeroes the hal state instead of
freeing and reallocating it, but a failed recovery still calls
ath11k_hal_srng_deinit(). This frees the ring pointer buffers and the
ring configuration, which only probe allocates, while the rings still
point into them. Driver removal then walks the copy engine rings through
the freed buffers:

  ath11k c000000.wifi: failed to reconfigure driver on crash recovery
  ...
  Unable to handle kernel paging request at virtual address
  ffffffc080ee5090
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_ce_cleanup_pipes+0x16c/0x4cc [ath11k]
   ath11k_ahb_stop+0x2c/0x3c [ath11k_ahb]
   ath11k_core_deinit+0xec/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Return the error and keep the allocations for ath11k_ahb_remove() and
ath11k_pci_remove() to free.

A recovery that fails before ath11k_ce_init_pipes() rebuilds the rings
leaves them as ath11k_hal_srng_clear() zeroed them, lock included, and
the same walk then reads the NULL tail pointer in
ath11k_ce_completed_send_next(), at removal or in the next recovery.
Nothing in dev_flags tells such a recovery from one that failed after
the rings were rebuilt. Set ATH11K_FLAG_CE_RINGS_SETUP once
ath11k_ce_init_pipes() has set the rings up, clear it where
ath11k_hal_srng_clear() zeroes them, and let ath11k_ce_cleanup_pipes(),
which every copy engine teardown goes through, return while it is clear.

The rx_replenish_retry timer posts buffers to the copy engine rings and
ath11k_core_reconfigure_on_crash() does not stop it, so it can fire on
the zeroed rings too. Stop it before the copy engine cleanup, as
ath11k_ahb_stop() does. Also test ATH11K_FLAG_CRASH_FLUSH in
ath11k_ce_send() before it reaps a ring rather than after.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: record whether the CE rings are set up in ATH11K_FLAG_CE_RINGS_SETUP and
let ath11k_ce_cleanup_pipes() return while it is clear, instead of testing HAL
srng fields in the CE layer (Baochen Qiang, v1); stop rx_replenish_retry before
the CE cleanup; test CRASH_FLUSH in ath11k_ce_send() before reaping.

 drivers/net/wireless/ath/ath11k/ce.c   |  9 ++++++---
 drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 1e08b0970b14..af08a2a24c6d 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -718,6 +718,9 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 	u8 byte_swap_data = 0;
 	int num_used;
 
+	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		return -ESHUTDOWN;
+
 	/* Check if some entries could be regained by handling tx completion if
 	 * the CE has interrupts disabled and the used entries is more than the
 	 * defined usage threshold.
@@ -740,9 +743,6 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 			ath11k_ce_poll_send_completed(ab, pipe->pipe_num);
 	}
 
-	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
-		return -ESHUTDOWN;
-
 	spin_lock_bh(&ab->ce.ce_lock);
 
 	write_index = pipe->src_ring->write_index;
@@ -866,6 +866,9 @@ void ath11k_ce_cleanup_pipes(struct ath11k_base *ab)
 	struct ath11k_ce_pipe *pipe;
 	int pipe_num;
 
+	if (!test_bit(ATH11K_FLAG_CE_RINGS_SETUP, &ab->dev_flags))
+		return;
+
 	ath11k_ce_stop_shadow_timers(ab);
 
 	for (pipe_num = 0; pipe_num < ab->hw_params.ce_count; pipe_num++) {
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5f4e7fbe0b25..d6346e0ee047 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2290,6 +2290,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	set_bit(ATH11K_FLAG_CE_RINGS_SETUP, &ab->dev_flags);
+
 	ret = ath11k_dp_alloc(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init DP: %d\n", ret);
@@ -2340,12 +2342,14 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
+	timer_delete_sync(&ab->rx_replenish_retry);
 	ath11k_ce_cleanup_pipes(ab);
 	ath11k_wmi_detach(ab);
 	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
+	clear_bit(ATH11K_FLAG_CE_RINGS_SETUP, &ab->dev_flags);
 	ath11k_hal_srng_clear(ab);
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
@@ -2354,15 +2358,11 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
-		goto err_hal_srng_deinit;
+		return ret;
 
 	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 
 	return 0;
-
-err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(ab);
-	return ret;
 }
 
 void ath11k_core_halt(struct ath11k *ar)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..593e54c59737 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -288,6 +288,7 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_DEVICE_INIT_DONE,
 	ATH11K_FLAG_MULTI_MSI_VECTORS,
 	ATH11K_FLAG_FTM_SEGMENTED,
+	ATH11K_FLAG_CE_RINGS_SETUP,
 };
 
 enum ath11k_monitor_flags {
-- 
2.53.0

