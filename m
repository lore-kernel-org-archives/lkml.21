Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360095;
	b=R48a1T8inO67WNib9VF3Fw+XstdWSEtjloxUaDTdgy4Jze3Al7RBeuPt3PSiNJrfPSdc
	 7XpTLVBHaL83pZcWdeykSJwUyCfZ6sqJ1FcPna7r3iU5jdXtgPaPeWjb4B6NXNVfMXiY1
	 QitLE9RjdjO1VI85qW97aZYOCJn/0Sz5pGYLKzSvGQmvo7UfyZhqlrPcVujoGM6Tu+WnS
	 K2gfvmCp4vwXQHAMFQ8u4sstiTtVxktkHC0FO9ZTSgA25BL81fnn6eNimnjsPrn3g9Fbz
	 Mw3U3i5uizMNSfQl/oc+fPFGH1SixoXRR3jR+pbNiKRPIN5KtFnz0fCcv+irYflIK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
	b=uyO6A/WIIbwrgRKG8FW/qC1WeTJg3aLkP6uChVSUYRJGr2ozIXiA2w6DRk6YAyI/xibW
	 E+aoM6WJMbieFwugU5SfX8tTfuC++9Orv0XqTpbt5mjnPDTGKbOPSMy0MxrPxZUAB6gdY
	 CH03iEdujIPf7itBxlBifbcYTpuNZ0uNijroFu8UdNjYyBZeIKmExhRyRo/2YGYachk3m
	 2VqZB2bqe/zbcqB1b/AlXEikJ3VFOgogBZyE7vZo1z1ytIGYJHoqSZIvOF8gY5Cf0PQZJ
	 CXF49Fpv5VwQSKB54+9jzldwlkbzwhzxpVe01M5GRrNQxp5dZnpHMQTNu+P0q05KQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=un7UH8aJ;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58C606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D58C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=un7UH8aJ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5118deebcfso355866666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360094; x=1795964894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
        b=un7UH8aJukSK+gfTizYDoiUz4CMM0wzYjdMrFag1Qn+EdK6k5cr5T+beuNWTgILxM8
         TmoXCOYKYrW55JwNOSPLYJkVDIpy7zKdmu00qWG5QyQxMUcrBwYwhdtVtMUPoS/qFObb
         Z3/hUSIuBl6O3kWCXsiL5+wjSdrC322yCAANqJba9tB6Jd+QhPDFDZO5dICfmUlyPbf2
         eweRelqUJtB3mw9W41AFDbEGU99UzmFyD3wXQZjaUpMh40xkuO0faBGE9e4Ov3oUYJcI
         VL+NU3WFIS5w14FykUitHeoTRX26bQVnH3EGA2DOgWJIJFUc1yVgGRrb6QSVC0jPknHX
         58+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360094; x=1795964894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
        b=R7UT7RE4KhOuxJonDIe37bKpAP50Kxu2K/TVyh3gH9Olvu88BfWql/cAIRRDS/LLSp
         hQM9FaGp51Ko0rodUGgtBP6GeLwqlqAktvGClL59lbb/Uu8DOIYWFruXRHZzlGK2hGG3
         Pym8SnI7LIWUZGiSLLBJFGe4B7DPpsbZr+nHWAN26TsezKOA61W3Zh7qdaBLKAJUarEH
         Sp3NPp5thvx2lDv+KlDQHDIEYi1LfBrPKWB5TYIpModmEi0oVQVmzPKjm9OMKCbMmLHR
         99nIjhE7q/tpOBmcFr/kvzjCv9TXSV0f9TEm9ZHIAcnzy4hTxXG+JYgFnL9eEU//Huut
         3YRQ==
X-Forwarded-Encrypted: i=1; AL+hErHoJnsL0QR4VZz0zQucFzuvCKQrIdkuo9Tnm7+qf0cThAMtDDq4J08aWaF1E2wjcjmSzyWg90tiywbynHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L4q6wf++8cR4Jt4s3POQJRnynEPG1gOykYVwQD6bQsEt6jKSJ
	LhRwUEuy+DXA5SC14aNEpnBHXN6gBKqPKc15Ird+FmsL6DkVhY3nwceD/dIFabAn7A==
X-Gm-Gg: AZFdTZedoO+TVV2uN4sX4HGz7O9TtZ+V+O4xBqKoeDzY2edAwBXLV0Wxv6N+Aw2eEEE
	oZlpO2Ap1oLcok6zi9ENVBZMvZp4Cz5Teb9Rr96HxpJtFy6Guu17ZqxSePHPfGZW2YcOYpq2tTW
	3zLfL6hnUlRXDY+/46TAwc3UluRfIY+ln5zQZttZoc8MuRlYpaJxa/b/eINgHYNehoo38esfjp4
	+lGEfV92oLx6meVOk0T6trmxnmAQzZZtfSafNtLA9VQ+FCop4Zz7PbvCfjrcBpMT7I3QH8K2+J8
	bj/svSS3YmmSocLOyVqMEmEGy483wd+hS41Sv5DuHqzbhzEGfNoIWHIrd1AoEuMkxQFnYc9op89
	f6rSQFzR2lnm7Smbv8bcpM478B0R3Tv6KB65YXM2BGVwPzewzUtYQmFNPwdzUyKtqHwMwbKRwk7
	sgosv6noq8mUVjf7EL0MO58tsuat/Zx0d+098HtQGpBGXt+7ZqXe04WtQxSrN7iW4DBm9672Nrl
	6VToo/mxNezUM2d1CQ9l9ukNeXS0BoU9dZv57BrNjDSnI+HOCvc4RtFwCVrX/4+fMU2zMCLhCiv
	blQx52qHOncNGcMB6IDYDrVzGc8mN72Fv9IiXO5CdiWqmylbjU9zpPNb0NQZzfwIHqj9WaE0x6C
	OE8o3fG/zkKvxb3YGWIaD+kX6NBW3qUmOnLNG5SouSva58JJNABdZVQqxyV12/JsFfgzrDtaiRY
	MtXt0fymTL4jhcKWuOz/wAHIQtVBDmPLyH4y6n4uUDQtHuGbQLdNNpPS8omtybwy5fGHMslLRYD
	9oAahnHYRgboXXCspGi+G9t4YnKGJD0Rze2bAhV/iXT7SaTKFXbBMrAac6jOZaDczeGKy8MWjxU
	GEbfM61VDs8x
X-Received: by 2002:a17:907:ea5:b0:c3f:8c92:3b5a with SMTP id a640c23a62f3a-c513a88aa78mr749156266b.12.1795360093814;
        Sun, 22 Nov 2026 07:08:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:12 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 2/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sun, 22 Nov 2026 16:08:11 +0100
Message-ID: <20261122150811.3135445-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122150811.3135445-1-julius@bairaktaris.de>
References: <20261122150811.3135445-1-julius@bairaktaris.de>
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

mac80211 requires sta_state to succeed for down transitions and warns
when the driver returns an error for one. ath11k returns the result of
WMI commands for ASSOC -> AUTH and NONE -> NOTEXIST, and these fail
with -ESHUTDOWN while the firmware is down. A station removed during a
firmware crash then triggers, for the disassociation:

  Driver is not allowed to fail if the sta_state is transitioning down the list: -108
  WARNING: CPU: 1 PID: 5952 at net/mac80211/sta_info.c:1561 ieee80211_sta_eosp+0x119c/0x1668 [mac80211]

and for the removal:

  WARNING: CPU: 2 PID: 2080 at net/mac80211/sta_info.c:1652 sta_set_sinfo+0x1118/0x1144 [mac80211]
  Call trace:
   sta_set_sinfo+0x1118/0x1144 [mac80211] (P)
   sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
   ieee80211_del_station+0x1c/0x54 [mac80211]
   nl80211_del_station+0xf4/0x174 [cfg80211]

Two of these failures also skip host cleanup. On a non-AP vdev of a
device with vdev_start_delay, a failed early vdev stop returns from
ath11k_mac_station_remove() before the DP peer cleanup and the station
accounting, and ath11k_mac_op_sta_state() then frees the peer with its
rx_tid state still in place. For a non-WME station, a failed RTS/CTS
update returns from ath11k_station_disassoc() before the peer keys are
cleared.

Warn and carry on with the host cleanup in both, and return success for
every down transition.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v3: none.

Changes in v2: continue the host cleanup after a failed early vdev stop and a
failed RTS/CTS update instead of returning from them.

 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 48795c72d2982..b87b15492a8fd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4987,9 +4987,7 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath11k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		ath11k_recalc_rtscts_prot(arvif);
 	}
 
 	ret = ath11k_clear_peer_keys(arvif, sta->addr);
@@ -9925,10 +9923,8 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 	    arvif->is_started &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		ret = ath11k_mac_stop_vdev_early(ar->hw, vif);
-		if (ret) {
+		if (ret)
 			ath11k_warn(ab, "failed to do early vdev stop: %d\n", ret);
-			return ret;
-		}
 	}
 
 	ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
@@ -10082,6 +10078,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
+	/* mac80211 does not let a down transition fail */
+	if (new_state < old_state)
+		ret = 0;
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.53.0

