Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371147;
	b=PgsuVn+y15aagWhH/zJiABsQkOWw61/qEFKlg2Bn3oAdUiFRPRbY3mJPgNOscPB+eWYM
	 ciP9812OoYAZ9hxbJaIVP7noLtEwi1bF/vRfCkf3mS5pIdNvOtQ4+FumpDMR3ju9neld/
	 zBn3MPT6wRYSKMryQXGWgYPskeUtPPQZ8CgDNV5DBIxPc5DTBlymSAtbRK6k9O41uH10g
	 RI+k9FN08ngqD6KaDPg1Nx1qO4LpZ6TH0vA6fUwkPdMsCwl5FQLMoK5rjra8cQVEv6iXR
	 boWnE21iPLNX/Z+ZK7BWQkPT+RmadoB1qLjkRZQgZIv/01uG0iTSvuGeguhTxHnF1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
	b=It6wfLjoe91fROVRXh8A4SWEGZk8SZFQKgl/2tAYaxcFn6bhpWNvasMlYrkiJyuPuL/i
	 uewGnBnD7Xh03DO2hlbTJIuLRMv/SklhO7rfvREocDCCSTcic7PWOEq8It4KuKpy1MgHP
	 iRQi7n7PBYDpuMOtWeCX+zywUt2zZGZKQwmdy9fE6QBc0L/qxuu5bCRjlTmtBPieQRqpn
	 9GfKF9xCetKruH2/BXwvUwAB0T7WsUdexXpDumVAQGKYUPHUcxvWl6HO00KFbaihGC+hf
	 GTysR2FpPNiRlEA9YX/WWh6QW1MAvbDLpOjBWoT8oXNC3aFm3kIJGFmC3QPLcEurhOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="j/GaYwEJ";
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30910606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30910606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=j/GaYwEJ
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so3395299a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371145; x=1795975945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
        b=j/GaYwEJmmU916yqS+cd1VYn4bpJYyzyT59IwuexB9AIxkK4NVDVaznebjh4789eFf
         jymY995I5fIuwLOuu4AXYcVWQL53pWPjiZ2EvjU/JpNfOb9NLFdPW5EQRdUvwqwpCoK4
         CdKDtYjo/x2/RmZFaSbeMMYtwzuuiHhVd2lOsEmvvj28tky0Bp567+cI4gV1cRmhP8sy
         djyXxolHRTaGL2Fa56Z7azWE4TSIEMBvf5bLUGaxvv+Hir0NaDk8PVkX26a5KV3DhKy/
         U+UF+QqPceUm6+KnojVt3Sy9Q6UFLMlKVBnFKhsQHjEaCyQzM1XmT9VWJyHpzkDIu40W
         0JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371145; x=1795975945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
        b=19wFpHGGJ3UAyPLJDgr/1epJJkyw5fJcWbIDqaL0o6Tj6oseYOFy+BpyWCB6LfH2r/
         oCSIXDrxkSeScXOJ9tY5tKoR0YYZ5oOmrHJSxyA60MQGUCTkmK7lqYOQTCkfIB4Ptkmu
         XjsjhqUiCimdDTv8M5duS7iHjDdMI310XUQ8Y6QJfURnATeIYEhoKAXNHvOqqYAQl6fw
         8nCrfbkMG+5j0ymF9bp6pzN8PDHXwmHjUqyCrDPf+uA3DEI0Pod5uzelGCuyqbT9IJLc
         nZERgH5LaMipmrikY8LFyOmKZyCV8fdtseJl4iGIDg+U4neeW5b6kElzDiBQYqOG92fW
         nHXg==
X-Forwarded-Encrypted: i=1; AL+hErEs3DUe0enQErG/uQNjYolHobqRSBiXGYATmtyP9GbcQfODFNYI/JESCAws9l8L0S8qDz/zgYEJ0A3StXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z//xyLU/YxFQS/L4lVoaWXThch5UfQxyIg63bjoGOfqXNrrpu6O
	CbhCifW06KEY50mB2sHcuYl8Nwgz1zvBUseJ9kGtEmuCZv8BSBsOSA2Ql5Tk1MIvNZYli7NFT25
	fG3CQcm10
X-Gm-Gg: AZFdTZcxIkQbZPIgbT8vK6bK2UW1qvwFLydqMx7gOY9jbh5UW+T0n+6qXbxSYGJ+9ZV
	B6mb/2vTRi2VdVegFuEbeR6lBR5FNENmnnf0PR+oE+CG+nBTilV2PU0qJpY3+Yly8n465dT9bFb
	DIfNaNJpnKyQ9HG6cJy5Qq7fz/zIaLNynQvtXajMlp5wZ+PNcOBKORhBjKEcsPpiBUkzKv5xbgI
	9RvWk5zwvUNKTlAFadXPZXDMtP9GDYKvsw+KFqLaZ3J3JCu8rJ/BTjPqeQ/kkFnWj64K4pe2OIs
	k3fCkLj6Q2wit/tnK3jtahr6ezsZN+4/0VBx1zgD2rEV1jxrHK4ytf24eNIAodBqlaCJyHLHQIF
	4Tm/QkJcJ987l+iC9W9KaI+tEaz600wsWThhuZdyTbJ4zJs5txbX0JIuFQ4StNQ3c78/ImIvAaj
	/VZcM78Rn8rdWwwH/xTL6bYrOZryrEqiAHFjbgnZY1smDLyqgZY+bkasslIk7L8QC3xWzNFSztr
	zSl1sK2pgEoiOtIOJXjoZsrlgh6EvVdw/BjFRqFxIzVWQRldA35qSxmdoDtPmXtpTmIPUoq+zk6
	GiZB1Gfee0YKwkFKLegWaGKwr58aBL9xQJ4Is3pr1qI4A4ylbIGzM3BEBaeeNb/7iIaw1r/DqU6
	5/RNx1AQi7Ls6ooBritAi90R5Y9Mg9gBHjHfoABIWinn0+wAIYbsmd654BPFUshYeGopkPJ1H+5
	4buLHsGB474J/w40Ohx4DWps0WrpJ0pOGmbpvwOhq462qaReIbGwXozUcV3AqEfFdP5eezb5wQ1
	nS/jABWfY9OGUkbXhE77Dy5lZ8xDRZ7pCFxmdvpYpvTDZ9lH8TWV5KKPmu1HlFghpfvRlBXgNZa
	5mmYG5uFY0azABJr89PD2iqWg0NOHo/l1GQScPvY49uWSxLy64A/XRCRGqDnVhFXn8JtRShT
X-Received: by 2002:a05:6402:51d4:b0:6b5:8cb3:5e19 with SMTP id 4fb4d7f45d1cf-6ba37e8826emr7380558a12.38.1795371145587;
        Sun, 22 Nov 2026 10:12:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 6/9] wifi: ath11k: offer scatter-gather and TSO with Ethernet encap
Date: Sun, 22 Nov 2026 19:12:10 +0100
Message-ID: <20261122181213.1016590-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

Tell mac80211 that the AP, AP VLAN and station netdevs may pass TCP
batches with fragments (NETIF_F_SG, TSO and TSO6, up to 16 segments)
when frames go out with Ethernet encap on a device whose TCL takes them
(IPQ8074). mac80211 segments them in software on every other path, and
when the airtime of the whole batch would not fit AQL's estimate.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 12 ++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 4fbdd15d1ce0..6d950afb90f1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -15,6 +15,12 @@
 #include "peer.h"
 #include "mac.h"
 
+/* Whether the netdevs of this device offer TSO and scatter-gather */
+bool ath11k_dp_tx_tso_wanted(struct ath11k_base *ab)
+{
+	return ab->hw_params.tx_tso;
+}
+
 static enum hal_tcl_encap_type
 ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 967f212d33db..a73b5197fac2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,6 +22,7 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring, int n);
+bool ath11k_dp_tx_tso_wanted(struct ath11k_base *ab);
 int ath11k_dp_tx_gso(struct ath11k *ar, struct ath11k_vif *arvif,
 		     struct ath11k_sta *arsta, struct sk_buff *skb,
 		     int held_ring);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5f2086bf6c5d..1076e3b09cd3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10727,6 +10727,18 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_ETHERNET) {
 		ieee80211_hw_set(ar->hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 		ieee80211_hw_set(ar->hw, SUPPORTS_RX_DECAP_OFFLOAD);
+
+		/*
+		 * The TCL takes a TCP batch whole, with its payload in
+		 * fragments, when the frame goes out with Ethernet encap.
+		 */
+		if (ath11k_dp_tx_tso_wanted(ab)) {
+			ar->hw->encap_netdev_features = NETIF_F_SG |
+							NETIF_F_TSO |
+							NETIF_F_TSO6;
+			ar->hw->encap_gso_max_segs =
+				ATH11K_DP_TX_TSO_MAX_SEGS;
+		}
 	}
 
 	if (cap->nss_ratio_enabled)
-- 
2.53.0

