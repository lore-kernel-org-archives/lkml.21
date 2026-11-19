Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074989;
	b=slKvPQn9Id79IVT1IxayjK8O985c/hL/9Csg89bFFzxoGsZWD7wrIzhC4lR1dAAU3K7p
	 xEm/s5OB/E17cD4EFMO2NhcrsgwH6X5p8DnMLU1Q7iOVTFeoe8DsLCTDdUMlwG4QgtUnm
	 1T0OWRVddvEpuUOCusPb8nHOpahLoUT5oNjQHkhIw8qPOucGWkp3FbvNGpb8VXxTBJhOf
	 PcG7v1VL/G5+OJldc9Gh+htDJ7wG/Oi08yD9YQpIF3zbYXR6GQSO0lJ2UQEah3eX1Cv4F
	 X9wFO94MijEmmSFcceoX3vlfcpm6qrrpyoExDo1VhNfoJW99xpw/ZoQKLJZ8I9VcWeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zD4vWVrzj0m5l3wwaVzmZX6fctqf45aDG3D9ksl4C6c=;
	b=m3tf1WTTolYzDPg/Q0Qtdsl6N3c1rSQaU97VSONVPE2c2wKNq9ncnMD0uo/6O1VG5IAO
	 BhOjg9k36uw58cD9NH6SO8uMzt8uaGW6dvDaWKlYKs3S8bvJajtstUZMaYuDW6OT3h6Om
	 uCqNhBDwaEpm0yCuf+260a7elYON2b7JmhCQmfL55VZAUygZD225NcINEQkgnrDpdfCiT
	 599MVoO7mXyHUvYOJXmEROZXAygF3R5eh9ovnIuVgtg5l6cGOypqXr30UWmhyHT3zrO0l
	 fP0Mg0cRHKcQuZnwmTBZNd66XDmyXvlzArswtrEBXxVoycJNtYzvJqXq032iRh6Syyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YB4Hwqg0;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ED3606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56ED3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YB4Hwqg0
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed08b07213so9073485ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074987; x=1795679787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zD4vWVrzj0m5l3wwaVzmZX6fctqf45aDG3D9ksl4C6c=;
        b=YB4Hwqg0DiuGEH09AUeOt3wJvoIWEDxxJr+bQEPUE/yv227htIMm1ypFAL/7XjQ0EC
         J9gBdTDOEvnceKo4pbdKyyWEFpAK26KWd3jIEpCzqgtuH8WqzcmY3YIWcwtdImFwI/sx
         fdJqpu3MCWQh8i7Qf306MWqM8NGl1LGE8eH144xnFUqZxtRpzvijTgq6D5x96Okrk1cI
         guKoL1BhmJ+UxI2nPcwqW7/OSf0CfaESi0dfvz0vei89aoRLQe2t13Y0HO9jqHcZQc4f
         +r7WrTosr0CblSIzkDrWu0yJJQlL/y7Xj22sxCPh9KCQeL7v2F0EXBw/LIXHK7W3l+cI
         PnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074987; x=1795679787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zD4vWVrzj0m5l3wwaVzmZX6fctqf45aDG3D9ksl4C6c=;
        b=ESvO/o54Dzz7LM9pZ+PSjpem10i/1E+L8zeie72MB1vB6gb6t/u+OqZ2gvIEIN1rln
         YLhk2s0Yise9lgvbZjBXMw9InSkhMWX2yjLvnpu5g/ZaGTv7fHnjHvQPoXr9ltTAWzkg
         LyG0xj7tY2HbIz5xQ//uky4u8izTYxqWIsAGnFCyPKSXJlxogMqgm9Ig+lBCN8bVzF4t
         uWeBdzFrI/leSZNyviJAPaurk0rdKYTHpHau67jfaU5ejSfsfW2PlcXRnBXN0zy7kVsR
         /g+Kkbxgw0zKvhzj+TsQ1oipZmBPbbPjImFaGoJ1s8WEZ6GCvFYEejGbME175RiCsUjd
         gx+w==
X-Forwarded-Encrypted: i=1; AL+hErGNt6o3YXTov0XAYvkXxjUJxLMz6mqUxjNeIUjvTA7AZC7H+RpBl1arqcESOXCFKsd4c018fu703Tky4qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KfmbR23yRRCs6EOZo0iOGxk/JXUNSuDrlcBbXIvh2aHPy2SfH
	c88m9vBeFrZXqPCyR8d0sCbgKe/LTE2iy2suwj/dunkZTAfSs7rN7TEu
X-Gm-Gg: AZFdTZfByhNLZHg07vgLUEzuaPBXUO1O1smFw8XrxzNXdebPcEz9jR0jz4a5YbU3bxj
	Socp1EEfNKagwKLZOwi/LbhXrx763r7L9Gr3Iz/D/zPjzbwpW2sTFeMs2jGGa9EFgSsVMdOCDol
	GEtAGt/14foZQsb2opmvOmI4CRLapk7r/bCbPJO2CMtzSwrxvYRFY2PfkXzmKf5id7jNoYG4x61
	ynMRjFcZx1w/MmAt13aSFPdYq0ru3WXS5fNGa3zuOF1wEHdQx+dn2iz9s3tkCynREkRMdi4DDze
	fzkUxqSsnRZyVN5N/uS2ffPKTyOWvPWoSjOK3Qu+AaIsODi9MWEePyulCnuEV5KNi0fmCcnLy8Q
	DxrBWPU+7B8Ka0SneXDYTJcbRKUKlbe9zPfqRNdVYA5Yqp5Q+5b8AbzjuSulbdAXQxxZsMHSGCj
	L5tKjR/R1fmIvbEZFYpDuXiXQDkqbHmGnOrWy4L3DOu2UMeeZLjlSaZ1r839bWGB1ACiSV9+l+W
	wErqIgW6jsJ+uvUJH6dUj3qS4t461uncvxBCe56Me32/N7V0cw7HFikPeXzhuYkOmPsmKqFwpoo
	KgFAbYUXRaR2VFWrib5BTt1tP17JmVzY3IAAN6zCqN9FxrqMQOPP2rnexXpw
X-Received: by 2002:a17:902:ea03:b0:2df:90d4:7758 with SMTP id d9443c01a7336-2eff72f4385mr44649885ad.23.1795074987036;
        Wed, 18 Nov 2026 23:56:27 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:84c0:a687:3d35:47b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6183f8csm25817825ad.31.2026.11.18.23.56.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:56:26 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current] wifi: ath11k: fail the start when a service ready event fails
Date: Thu, 19 Nov 2026 15:55:59 +0800
Message-ID: <20261119075559.10177-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

ath11k_core_start() waits for the service ready handshake, in which the
firmware sends SERVICE_READY, SERVICE_READY_EXT and, if it supports it,
SERVICE_READY_EXT2. Only the last of these events completes the wait,
whenever its own TLVs parse, so the start goes on after an earlier event
failed (for example, on -ENOMEM or a malformed TLV), with capabilities
that were only partly extracted. An event that arrives again, even after
the start, is handled again and rewrites the capabilities under a
running driver.

Track the next service ready event that this start accepts. Each handler
takes only its own event in turn, closes the handshake before parsing
and opens it for the next event only on success. A failed event then
makes ath11k_wmi_wait_for_service_ready() time out, and any event out of
turn, including one after the handshake completed, is ignored.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Fixes: bd6478559e27 ("ath11k: Add direct buffer ring support")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.1
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that feeds service ready events to a synthetic device: without this
change the start completed after a failed SERVICE_READY or
SERVICE_READY_EXT, and duplicate or out-of-turn events were parsed again
after the handshake; with it the failed start timed out and those events
were dropped before parsing.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/ath/ath11k/wmi.c | 22 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h |  9 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..5f9b18338478 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -612,6 +612,11 @@ static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *sk
 	struct wmi_tlv_svc_ready_parse svc_ready = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH11K_WMI_SVC_RDY)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_NONE;
+
 	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_parse,
 				  &svc_ready);
@@ -622,6 +627,8 @@ static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *sk
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event service ready");
 
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_EXT;
+
 	return 0;
 }
 
@@ -5118,6 +5125,11 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 	struct wmi_tlv_svc_rdy_ext_parse svc_rdy_ext = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH11K_WMI_SVC_RDY_EXT)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_NONE;
+
 	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_ext_parse,
 				  &svc_rdy_ext);
@@ -5128,7 +5140,9 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event service ready ext");
 
-	if (!test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+	if (test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+		ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_EXT2;
+	else
 		complete(&ab->wmi_ab.service_ready);
 
 	kfree(svc_rdy_ext.mac_phy_caps);
@@ -5180,6 +5194,11 @@ static int ath11k_service_ready_ext2_event(struct ath11k_base *ab,
 	struct wmi_tlv_svc_rdy_ext2_parse svc_rdy_ext2 = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH11K_WMI_SVC_RDY_EXT2)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_NONE;
+
 	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_ext2_parse,
 				  &svc_rdy_ext2);
@@ -9315,6 +9334,7 @@ int ath11k_wmi_attach(struct ath11k_base *ab)
 	/* TODO: Init remaining wmi soc resources required */
 	init_completion(&ab->wmi_ab.service_ready);
 	init_completion(&ab->wmi_ab.unified_ready);
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b2dade0516ac..c69037c8a114 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5849,6 +5849,13 @@ struct wmi_peer_sta_ps_state_chg_event {
 	u32 peer_ps_timestamp;
 } __packed;
 
+enum ath11k_wmi_svc_rdy {
+	ATH11K_WMI_SVC_RDY_NONE,
+	ATH11K_WMI_SVC_RDY,
+	ATH11K_WMI_SVC_RDY_EXT,
+	ATH11K_WMI_SVC_RDY_EXT2,
+};
+
 struct ath11k_wmi_base {
 	struct ath11k_base *ab;
 	struct ath11k_pdev_wmi wmi[MAX_RADIOS];
@@ -5857,6 +5864,8 @@ struct ath11k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
+	/* Next service ready event this start accepts */
+	enum ath11k_wmi_svc_rdy svc_rdy_next;
 	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	u32 num_mem_chunks;

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1

