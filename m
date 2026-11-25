Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640519;
	b=5KBt76X624XnEUp57vYFPajxmvBxuxOVnY2+LliWcHsHz6V8pZemcXwbJF3VBa0NwPtA
	 6u7Or+bUTpI3Tlvvk3NjAhnDu1cjDGA1zmnHEFJJj30aEVF9mJf0BTJZPVk50g3ymVGAy
	 XKnRG3JUdS9InzBCT+2Cfrx7zlb1iFIIglCBvXIZ1VDf5VYmrjQH39qHz+I+nI6A7V/lv
	 EsaPcfM6xg/znfN4fiznoeWb1v6s2AQZmKuPPnrLiaxuofK5RAfewuZNVjXzXENMZ2r38
	 3wWgoAi4KVoT/L6Mek5X+V7bnqJcK4bh53kbgLbA5uFJF319FV/fLs6dzzdvSWwbZGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=smmSgaVZzApJQV+Cv6DawJEFCZsBgrWDBhUsefeJK8w=;
	b=hzM0jXq8ovVnBgi84AWrw8ZhPxcHT7W0CvHwjq5QHGZb0a+FHv2Vr+uqZfP8k6LIX6VK
	 GZSxyy7IvsqVFtPUr8GRurjIwsGhxzR6sLAiUXybr0/yUY5eL0JVOLF9BeB65MgXpyUbc
	 +nOgfjZXJCveOn+0P67BEdjl2e+BgsEBOXyRN4wcrkZOPMesHwV0qHtOCKCVKCv0FfW/h
	 4UewsWFcou1L/C0pq5IeuGrDZyX0r121faDhT2xuECam4KFaI56rtyJlUNaPjo011eXOT
	 IakFqKraa7vIFjawSc0XRVCTKnmylpleAhO9CAPzGe1TcCW9JsYasNg/FaVk7SYmcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SBBTjyQR;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020D606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4020D606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SBBTjyQR
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso6779525eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640518; x=1796245318; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smmSgaVZzApJQV+Cv6DawJEFCZsBgrWDBhUsefeJK8w=;
        b=SBBTjyQRI+HmVsOr3WFPMfUjzGNEBW9liGXOEX0r8CFWlKW/1Cbec9gW7kGsd3IsTM
         9/+7+8kiVHYf2h/kIe2f4/QjdVDxlrQPL1Jd5M3HxwyV0kF5W2C8tluVDoJMHKOP0f0n
         HV5VzIkLuGjbJ9HOv3FaIWeOlOjPI98Nn6Hh3uos2tbZKgaaLV4+XS/gkqLNC/gVMMq2
         85JOMA3KIPG3EWpjQ/xrlP3m0t8tTyTiAQhBD5oe4e6eeS7h6l4cdgLTH3hc0dqKdPu0
         JJx078Iru7tlPDEqg8eNTKRRUnuZEbAfqTkHL7pKcUqeegdvppQmXHR7B6h2dD9D6qTM
         jsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640518; x=1796245318;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smmSgaVZzApJQV+Cv6DawJEFCZsBgrWDBhUsefeJK8w=;
        b=xBRjdGwgDgTICQkyHIJi98xG3sIVbFtp0NSPRjTibHzbKHGLdPeF1ndLOZjJjIzl12
         N87zdygD5J6zpsnRl6U0S3MnAPfoJuG4jlEoWAQ8hY7LX4tqCw7cwy1X1I4ukerPyEhC
         rHtRkP5R6W0+hohIkwpt0Xg2915ppOYejv4+jkbr/5/bRzopjd32KZz45KTi+G3IKKsk
         EexdxkFHbYJ33zK52F1oQ+4WYgQUtCXIWxVYm7PLvS5/6EzotQty4Lxf/amCiznJf1ZJ
         MlkryW8H3yHCZ6+MJk1MdtHQEYhXqjzzoRzqulU0zNOK8PBO3XAPNXNoZhj4YRNuZnXb
         hnIw==
X-Forwarded-Encrypted: i=1; AL+hErFBz6Gh8DFIp9Zu+FNfN27TzSQCOctTmMX/EHmEXMTn7lkj1Pfl/PJAEAfNTdRqDp1LnQVAEMtBW8X3azE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C4S+/INDKw/4OGBTge/PJA/5k8ih2ZdEdf1+RP7ZKjJmqgf8G
	kkSN5F7YT4SKEXYtu8J3CbBx5+YlpsKlDsBp3sCy0oRzxOO4tpvZdDyJ5x684tw54a/oSl84ieR
	EQg==
X-Received: from dybto8.prod.google.com ([2002:a05:7300:f148:b0:386:c442:456c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:60d4:b0:369:fe81:a575
 with SMTP id 5a478bee46e88-3857111f203mr23506949eec.35.1795640517818; Wed, 25
 Nov 2026 13:01:57 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:38 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-4-elkin@google.com>
Subject: [PATCH wireless 3/3] wifi: mwifiex: validate ext scan event envelope
 and TLV lengths
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In mwifiex_handle_event_ext_scan_report(), event_scan is cast from buf
without first verifying that adapter->event_skb contains at least
sizeof(*event_scan) bytes, and scan_resp_size is not validated against
the remaining event buffer length before dumping memory.

Additionally, under TLV_TYPE_BSS_SCAN_INFO, scan_info_tlv was assigned
before checking whether the TLV length matches the expected structure
size, causing invalid pointers to be retained on short TLVs.

Validate the event_skb length and scan_resp_size upfront, and verify the
TLV size before assigning scan_info_tlv. Break out of the switch on a
malformed TLV_TYPE_BSS_SCAN_INFO so the loop skips that TLV while
keeping bytes_left accounting consistent.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index 53aa16c1df33..52543532367b 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2627,9 +2627,21 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 	u64 fw_tsf = 0;
 	s32 rssi = 0;
 	struct mwifiex_event_scan_result *event_scan = buf;
-	u8 num_of_set = event_scan->num_of_set;
-	u8 *scan_resp = buf + sizeof(struct mwifiex_event_scan_result);
-	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
+	u8 num_of_set;
+	u8 *scan_resp;
+	u16 scan_resp_size;
+
+	if (adapter->event_skb->len < sizeof(*event_scan))
+		return -EINVAL;
+
+	num_of_set = event_scan->num_of_set;
+	scan_resp = buf + sizeof(struct mwifiex_event_scan_result);
+	scan_resp_size = le16_to_cpu(event_scan->buf_size);
+
+	if (scan_resp_size > adapter->event_skb->len - sizeof(*event_scan)) {
+		ret = -EINVAL;
+		goto check_next_scan;
+	}
 
 	if (num_of_set > MWIFIEX_MAX_AP) {
 		mwifiex_dbg(adapter, ERROR,
@@ -2690,14 +2702,11 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 			}
 			switch (type) {
 			case TLV_TYPE_BSS_SCAN_INFO:
+				if (len != sizeof(struct mwifiex_ie_types_bss_scan_info) -
+					   sizeof(struct mwifiex_ie_types_header))
+					break;
 				scan_info_tlv =
 				  (struct mwifiex_ie_types_bss_scan_info *)tlv;
-				if (len !=
-				 sizeof(struct mwifiex_ie_types_bss_scan_info) -
-				 sizeof(struct mwifiex_ie_types_header)) {
-					bytes_left_for_tlv = 0;
-					continue;
-				}
 				break;
 			default:
 				break;
-- 
2.56.1.839.g22a8290db9-goog

