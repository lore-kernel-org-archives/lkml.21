Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302458;
	b=dDjreBo67Z681UAkWdJls1WKQNgcurmTH+iLR0bUF8WEcU5xbVA1gOGBhJgGpL+7uAfN
	 l0ZMC2fOI+lq1OcJ7LWxzKGOgEWJuiZbabUXwQFGnUEx2oYdOSyAgapJ5gd9Fa6cyev88
	 QW52SUZ2mrnNGANO3wAxIjNNxyg4sCN20PCo+XgNrIijO7By0nF4GA7nMhPWPHu2g7VWH
	 4ffqqtKROxgjUX+famyOXEa8fVgHddMd3WdmnWOKuMPfV7afj2/k/x3MaTjxr4LHSZkpu
	 sZnDm+1ZxSV3z64AndOXPUEEBR3kmEvPsEPKiCojWBS1QIG8Z5mSDhnZ3G9of1seMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
	b=oJlxf6tZgn95QVA4y9MvIqYGsrXwl2nAu/sWt/ggivKZZiK/q2rsmmWRjo8EZ1nHwDpA
	 dewigenO7mq5KhiRuRZFtYXZ8HaydTznqb5bbUCfnKQGeedokDDymSDmek40EZKM0OGud
	 tsu0YI1MZN1WJggzdKe3/vrhVm0JbbSxDR+FRsSXk4tBBcSwUAa8Fb4I18BaY+pvfNwfC
	 RRjRAop3bKisrMHso6sBx4x73fQlRrBBscnX8WTUvZvZAc6E4LdtIqQsxQKs7U+JQcsKA
	 CeMAt58F/wKEm8+xucgTmsovo4CpIIKWFNW6g4yUUWB42C8dZc+H3iOmAD3Fw+jlrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AKZubi4o;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA5606A680
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AA5606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AKZubi4o
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c516a160f91so25235766b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302455; x=1795907255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
        b=AKZubi4otobKsA3C7KNDJTnh2xGTU6QkmoaLoeya3i0adiyTgnlv/EAJdwbueF2IYQ
         C9ChBOEaPMStkaQe4K/JWdNFSSdc3t/XjyZJdagWdnM6VjOlSGbYa/dwyHkfDuxuCJRF
         3Tf++Hn2NFeU8zgvkjtMKTD+KHlly8/2vLa1aiVtSZp7kd6peIjTKroQVeMKQ+1xEnRs
         0Y9uAPRtWvTMMI0cGmKetxwHQViblVZDN+8HfcyNB2ctGfnZvzDn2HXFkYmwJ4h20Um8
         LfMpDTgZ1s0BeqOoZAb0s8+5h4WtN0pw+oUh3/Y44NGLBU4GLcKbskB/zCI9f0tkpZoa
         kWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302455; x=1795907255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
        b=d4r//r4LgBMqCWfmU1l+EyJFi1TWkIwqMTUecF9Xhha+UZ5Djt4p80LhLsX2NM4nob
         Iayxl73FEW/bRCejDX0+8lKGa/uEFuBSyWbxgA8DqPha2AWbCHpyg2DquPEzwB30M7Iy
         NUjlIe93a3DBpf/ILalM61OJlNTOQIW0FldvIJxU1f4kZisUKfimEg9B53ojfgv9zmEi
         3EUZuladOdA0v6tyWMl9QTjiu6DcGAY55QESdQM2x3e7Y4mF7nhU/1U3CI3NU/XYItl9
         oNRQRa/DWooaltvmDXw7l6/94lQ4MYSIfecplK+q20RwKbTO08/ck/X/sfxaZG2yuwFa
         6UEA==
X-Forwarded-Encrypted: i=1; AL+hErEReyRa56W6Q/l6wDQX7uH2XC6JXIE7IBWiUOclmxLMF7h7QTNOy2TJ/ppbbABhPO5DcZuDu8/IjOIaq4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WECnKbj3KROutdEijUDs33KMOC8vgVLbVjY1cTTrV718Qn1Mn
	P9sHnMW+RSY5nVl3oVwuvduRSW+caauW+CM+IJe/lDF3Ykay0tf+dr5UTGPmrgMyfw==
X-Gm-Gg: AZFdTZfCKMO4NgnHI8Ez6jQOZaRuQpzJujqxlh8B6Lg5QL1iGXt6LqmG9yIy7dCgFQ4
	IEEc3maSbDRz7sLUg2dr2E25xnfsuDhJ0Xi6hALfyU9Qp/kXXML/OO6rB840BAmXnj9Wii5DYax
	LB4RRHteyaZWUfq0MODwR9wccwkb83MjoP8RmL7x8uPvhhEdyycmqogMWUzL+I52y/ojav8LWDG
	gtprfWltsIX5HCo23XqpBXcrD9STMZRmv/N0QXgay70UaNVMSsoRZ+j1tSFeC/F7vzfaYujUSb2
	fDLoL5o5Pd1FLwWNAOA1hbKVRLF2389Mogd/vghly2kvTg+dIzrh22pzv6vUJCI0KQb4/kcyPig
	rYv6Xw9wtYIQI4efzmvcbDMMwqXTHrWnMjLTjJM6y1I02yCW588qTolxbYIe+rEU9fCMPU8BK09
	AP+tlHqX7v7VzZ96p6xe9pn6+RomLcT93n2RHwRGzptI1KOrfMMdonkPv/XWgudD/tePswqEnVn
	wneNYztROCC21uw5cM34qMijlxObxyQ3ansCkTsL43adQlGUKHAkUQ7j9pKBigG+waXbr0JmM8K
	UzI1/M7LKhfv5icfgSJeioCgOPVtZdXf4JoktIA4d5OIaOrH+9grQo4tmyv4WASmZGT9SSKkQsV
	kOcnQr3Vx3hLlC6Z2kDA5SfTPOekKrgG/19IZ2UOIIC/BHwVn9BnbJ7PSI1+qd+zaqSmbLk9irR
	6oDlpNotDzJpGQscR9X/Dhbsh9GB0HIRdc8M0udLRE9IqVIKUmhGgCDt5HuOEGryIvLcK9XtsPo
	E1DgsPqCFX3KggiKirqQSkc07MOA9Q4xU60zKvQPfMarm3vj3IRQRfowoUxTrwT/h0tgWm36wGb
	e2aZG7PfJwhSK8L/7uVOrvMOzfc0WbEdPig6iFjnjo4pH3MvP19iKFvaH2KPTEB9JMm3CO/u0PM
	=
X-Received: by 2002:a17:907:d406:b0:c41:8e21:4d5a with SMTP id a640c23a62f3a-c513a47e37fmr603561966b.5.1795302455657;
        Sat, 21 Nov 2026 15:07:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:34 -0800 (PST)
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
Subject: [PATCH ath-next v3 01/13] wifi: ath11k: initialise the CE descriptor waitqueue once per device
Date: Sun, 22 Nov 2026 00:07:19 +0100
Message-ID: <20261121230731.1206043-2-julius@bairaktaris.de>
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

Firmware crash recovery reinitialises tx_ce_desc_wq in
ath11k_connect_pdev_htc_service(), reached through ath11k_core_start()
and ath11k_wmi_connect(), while a WMI command on a device without credit
flow can still sleep on it in ath11k_wmi_cmd_send(). finish_wait() then
unlinks the waiter from the reset list head:

  list_del corruption. prev->next should be ffffffc084293648, but was
  ffffff80075109a8. (prev=ffffff80075109a8)
  WARNING: CPU: 2 PID: 1782 at lib/list_debug.c:62
  __list_del_entry_valid_or_report+0x134/0x174
  CPU: 2 UID: 101 PID: 1782 Comm: hostapd
  Call trace:
   __list_del_entry_valid_or_report+0x134/0x174 (P)
   finish_wait+0x68/0xb8
   ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
   ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
   ath11k_mac_op_bss_info_changed+0xe8/0xf6c [ath11k]
   drv_link_info_changed+0x128/0x180 [mac80211]
   ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
   ieee80211_change_bss+0x1bc/0x250 [mac80211]
   nl80211_set_bss+0x1a0/0x328 [cfg80211]

Initialise the queues once in ath11k_core_alloc().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Tested-by: Florian Maurer <fmaurer@disroot.org> # IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146 (backport to 6.18)
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: no change.

 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..8e4dab61a300 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2743,6 +2743,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
+	int i;
 
 	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
@@ -2769,6 +2770,10 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
 	init_waitqueue_head(&ab->wmi_ab.tx_credits_wq);
+
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
+
 	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
 	INIT_WORK(&ab->restart_work, ath11k_core_restart);
 	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df481cb..5f2412982229 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9102,7 +9102,6 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
-	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }
-- 
2.53.0

