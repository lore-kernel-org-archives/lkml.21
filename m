Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441305;
	b=dxERpVC0ZxFXzEldi1STi3LRPoA4muUxdN+9VAoicsdWXaFVG7IGTh76S9Hqv6k03VS8
	 vIxZyXwap4ow7SY8WB9pU6fXdHY85EvBKdMQEFp4EyVGmqj9+iNcPdKw3PS7ntZUzt8n5
	 +oU/9bd05Hkgs2SX9jCRXjHNJf0b2NpBrajNgRjXYGJdTwD0Dg0ssH3QnbVfrfJe8ymFm
	 /PINHaE6gamq7Xl2DfTolyXR+oGffUMRkgb+rlB7ERGwCxgIrviKCJGRwXI1H67lJ3P50
	 kw/m0BabdKPhnTkFivs+kt2vmUdltStmS7K9uAKL/riihG5eD6H3I0Z8UzEMyWWvGeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
	b=sgp32oWx7x2aL5L2R1wMtueDm39qi8OiI3f9OdCzfvtkGd6KG1e1iB5249Z5ct4917eY
	 kMWnm8C056ZHnj1opsc63kbvPaKjylv5hg277K6HN5sozd3RG75Aw7xZNFocu1uXxh/z3
	 JyJRNij2/4XK6SFtinlf/JuHUdg/m/Vv4zcI02cCP5xA0Z2Fg0waMTCeg1Pn7i8lAYwK5
	 n7sMJ4po8gcLD8+nzlqWIzt0JwAMTOuFpPd5CuQrVNqQw5xV4r/t3xkga1gS6OLZK3KLn
	 LqJm5tS8mDG+jQ8e1nBFlvhr9qA8SMYvVh46c+zIehbZClhv5IAYK8XzfmpTBbG2Jww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="kH/m7MGX";
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F660A6F7C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690F660A6F7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kH/m7MGX
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so4185954a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441303; x=1796046103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
        b=kH/m7MGXhr3gRUnew3v7bGg5U/zXeENcjhopfGx1/JgCCQVEArVqeg44cyQUW7/Nqb
         3kYLVDzAYvte+d7At+J1Ma0l+iRZdkt88HmBzencoCnM7HzVwgDixBRw1CaVjr4IAb+g
         Ei4KIHj1noHRBdnkA/XqMUkzIcSKeZLCpQgyF7ieXmTgpnKfLBRV73aOa+14OKtuwlpm
         dDn1lTWWKSfZfQWNQosqealkQHNT2eGxs+7g37GbeggOvRWRhQ2En6EWPEl8jrBc08Fx
         EALm+k1Hv39V8Kw4QcFWK0jBjc0nOEV13bgSW+UvDQbKglzPRACGdfoMVbwNUhrxPBog
         Mlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441303; x=1796046103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
        b=2SjE6oe1jLTrQhQvphdb1/gKg62eYfWL6Dz52QQYsKzqOcFjjNTtHkBO/iM/ybmkQs
         cGL9/+yU1Yn29Ny9Vb896QowOSlpq5HBMXaW9Qi7Qj/SQ5aBYGMzGzvbljApcpWdsVtR
         trma1oISDTd+VtySgY2B2SUha7RzdruT/82sD8Y3Ie5yvr3bc7QWp7d6/0UK8vDdiarq
         kW0VOuFbvmFAap8gx2C2jhJF9Zq8L2C+Y6eWvj7Er29yD9NDfT3k/8wuL79FQ9hqhOtJ
         AFbRN8ogGU1PKN471+SHB1teCAycmsYqV0sm3rHcpDgDO9qs4zvBES/mSqlsKc6O+uIb
         xh/Q==
X-Forwarded-Encrypted: i=1; AL+hErFN+5UuzCam1rQRp+su9jYkTOOV8UfSxHo/DFwoO49kqiDz9UZy6b64JsX9SrDs3CdF1JpRLSW1PzqHgU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m0tamgeAZ1YfG1xBvLgiL//6rJYeqHh4EDxTINXqbwqZO3/a+
	f4I/twWinCWbVtHWuIcJz7J5YkvrWkPl2lNOIVtHQZTzJcxkscDldzgQ/yThpih8vA==
X-Gm-Gg: AZFdTZe2K/tRuKW2oUgdhJ1LOD7oHv6uwyWOoKXbVvf28p5nbwzbkJdQnh20P/ZW5Ej
	tNP7e4sQLVxHL+WRfzK62nIfFs8ZtHVgLWesEefUP/Xm9j6v1FxiW5iCvYzXme6kRq1GRF0CI0v
	Tgbn1rOj0yCqv7epPf1TeL2vVsOjBmMr4elFNpxHy09H++emip9u6ex2FxSHaH0Df+dx+ypIU1P
	AUlrswcJOT7hAiBhr7ECFoZOyAnjf7T1k/jTEo7YDrZXmDrpQ1U1IMPzCF1I0Ci78WH0RyJWH50
	Uv1xdZErD26OemY4+Y/z0jZ1bl7qTS3N++AWD06Kdx2ItSagQDCtmhIE5RSXM5GKhFfqSHBtw15
	tGSlAiCz7DxJPfN14EVF5J+OMBW9QSYVcIShjnb892YokQ290xL1mfxJrHhg7yEoXYekG6mcOEL
	xj33CPEM0L87RxXxn/Lu14nFyPOW8CBSnLvSb8Q6itP0UPWRCl+dgDyjFR6ivJeMs20TeYWfgVG
	D0Ng+qjV9ab5VPFfO9bDPxYTKeNm0SWl22ecPGH6q5R5sffhfNYlZWMVaJshmzkNsEjx2nrcQjG
	4Ph+z3LooLnv2tPOhqZwd9K64kstIy9HjPeOlQlb0CY7sYtjrdyb7mbuQl+KXNb8/qWs5nAQB+2
	Vuc+FNHSc0J+2dmAK6z4G7NJI8WG6pZgVOi2/QoVx2XGaEc+NQbfj3Xugws2hqRBFNLBx+wEK7D
	9vzlX5bXhULzj8PcvOYlFG5Vv+R1zJsdwbB3CvikZ0se/HuwDO6Y0iQe1n8ZM/N/vMFslYH1sNO
	4OssedRX5McHHuBBwEXsnALbGy/EHqPOYUHK1IIwmUiP++uFB0vKsftb4Lmj/+QEyfnTlQGZsAy
	JFQftbhan6lMMlsq2NyhPU8KaIuTCYsEQAgp0g3pr93skUsYntbGAnW7vaJKIFy2on/ihdykFA=
	=
X-Received: by 2002:a05:6402:1f4d:b0:6ba:3f4e:79d8 with SMTP id 4fb4d7f45d1cf-6ba3f4e7a62mr7747627a12.36.1795441302373;
        Mon, 23 Nov 2026 05:41:42 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 04/10] wifi: ath11k: set the skb hash of a received frame from the hardware
Date: Mon, 23 Nov 2026 14:41:31 +0100
Message-ID: <20261123134137.718575-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
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

mac80211 picks the TXQ flow of a frame by skb_get_hash() in
fq_flow_idx(), and RPS and the queueing disciplines on the output device
do the same. ath11k never sets the hash, so every received frame that is
forwarded or steered is dissected again, though the receive engine has
already hashed its 5-tuple (flow_id_toeplitz in the MSDU start TLV, with
the seed ath11k_wmi_pdev_lro_cfg() sets at random).

Use that hash as an L4 hash for a frame whose descriptor says it is TCP
or UDP, not an IP fragment, and with the fixed IP header and the TCP/UDP
header parsed. A zero hash is not used. A boot random value is mixed into
it, so that it is not a function of the packet alone and a station
cannot choose the flow queue that a flow of another station shares.

The field is at the same place in the MSDU start TLV of every chip
family; read it, and the word with the flags, through two new hw_ops.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 36 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.c    | 22 +++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b3b8afb82a78..b027b76ea3f3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -6,7 +6,9 @@
 
 #include <linux/fips.h>
 #include <linux/ieee80211.h>
+#include <linux/jhash.h>
 #include <linux/kernel.h>
+#include <linux/net.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
 #include "core.h"
@@ -2057,6 +2059,39 @@ static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 	msdu->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
+static u32 ath11k_rx_hash_seed __read_mostly;
+
+/*
+ * The receive engine hashes the 5-tuple of a TCP or UDP frame whose IP and L4
+ * headers it parsed. mac80211's queue selection and the queueing disciplines
+ * would otherwise dissect the frame again for the same hash.
+ */
+static void ath11k_dp_rx_h_hash(struct ath11k *ar, struct sk_buff *msdu)
+{
+	const struct ath11k_hw_ops *ops = ar->ab->hw_params.hw_ops;
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	u32 info2, hash;
+
+	info2 = ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
+	if (!(info2 & (RX_MSDU_START_INFO2_TCP | RX_MSDU_START_INFO2_UDP)) ||
+	    (info2 & RX_MSDU_START_INFO2_IP_FRAG) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_FIXED_HDR_VALID) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_TCP_UDP_HDR_VALID))
+		return;
+
+	hash = ops->rx_desc_get_flow_id_toeplitz(rxcb->rx_desc);
+	if (!hash)
+		return;
+
+	/*
+	 * Make the hash differ per boot, so that a station cannot aim
+	 * collisions at the queues of the others.
+	 */
+	net_get_random_once(&ath11k_rx_hash_seed, sizeof(ath11k_rx_hash_seed));
+	skb_set_hash(msdu, jhash_1word(hash, ath11k_rx_hash_seed),
+		     PKT_HASH_TYPE_L4);
+}
+
 int ath11k_dp_rx_crypto_mic_len(struct ath11k *ar, enum hal_encrypt_type enctype)
 {
 	switch (enctype) {
@@ -2524,6 +2559,7 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_csum_offload(ar, msdu);
+	ath11k_dp_rx_h_hash(ar, msdu);
 	ath11k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       enctype, rx_status, is_decrypted);
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 096366b85849..40a9fae52e84 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -283,6 +283,11 @@ static u8 ath11k_hw_ipq8074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.ipq8074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.ipq8074.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_ipq8074_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
@@ -465,6 +470,11 @@ static u8 ath11k_hw_qcn9074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.qcn9074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.qcn9074.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_qcn9074_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
@@ -647,6 +657,11 @@ static u8 ath11k_hw_wcn6855_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
+static u32 ath11k_hw_wcn6855_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.wcn6855.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld(struct hal_rx_desc *desc)
 {
 	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_CTRL_VALID,
@@ -930,6 +945,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -971,6 +987,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1012,6 +1029,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1053,6 +1071,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1094,6 +1113,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_wcn6855_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
@@ -1135,6 +1155,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1177,6 +1198,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8725e119707b..925785c9f688 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -250,6 +250,7 @@ struct ath11k_hw_ops {
 	u8 (*rx_desc_get_decap_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mesh_ctl)(struct hal_rx_desc *desc);
 	u32 (*rx_desc_get_msdu_start_info2)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_flow_id_toeplitz)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
-- 
2.53.0

