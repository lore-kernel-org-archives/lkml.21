Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881820;
	b=w8XNNG+07jAlITz5Uw0CaVFufURX2rrLf2Yuw4MN3BE9WTu61XVWgKV/KB3RBq6TDW/n
	 UjmeZMFNPWt597ZMsi0FsoRpoSLhjRJWRPOyY6fkold9T+uXVPA5QpyV9k8AM/CaJU8SA
	 hEq71OUtgYzBS4kh0PUrEsyTAN+AABBCNc05L6OQ51B3dE8Nl/ABMYzC7F7LOqFHDZUxC
	 Ht819EatOxpTbLichSLyMPUTP7/3kVBNdBY1kmliC0I54j4GSG6tRl7xJfxPBPaA0hqCr
	 tXqhzIk0tn9kQnFkQJJHi8ILpLUDyVrMbYZFe+47PmEEDS7afRvgvWZadpLUuaRnGKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
	b=Gp0lLYZ+FkHuEAcL5Ty6LT5QcBsaj3hxNUyjcJbVfwlPkX1D3uhbFFNlL8seoKd6TGuz
	 8bAUXsimpgAlTIrhIjKbqEbBeFn1cklXvuznCEl1Vaty6CiVirbWGfxIaPHmpf/A4UI9w
	 KaKpARo4xeYDt8WeXDo8Jb82Ffaz2oPdk9gzjzfXIfQiO78ICDthOJt/MI4NL193RzjdQ
	 pfxD9/Bi8B9QVax1wEZGaLma9xuyNC5HhqbiFvm9yhfu9ir5nC8+3QjMBOott14mK4hT1
	 rE+81rbV5uyKIsFz4Ny+x2mSm0KclItJ9RCFk8JewhJper5z6Vc7yCqjFaVqPbww6cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oGWUPouh;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701260A260A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9701260A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oGWUPouh
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso592362866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881818; x=1796486618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
        b=oGWUPouhJy/5YFVTzJeFZ05KU4Fi/XR8EXucS8twOsFUJeLltXS0/cqFUUYFV7yTK2
         r9uKWN4Xd6eZC4HV7l41qRe2jenzBaoVnY/1OZdnXDf7it5LkEsRvLLmpLOPG7t5F8/L
         1434E6DMkQnnCjDkhyGFZK0ohI8J0Gowpq8+SkzQFJb7jvrSth0VyOOPr3RrLYMeOFAp
         IpMh7wFteeqz/CaNn2Ybh0qHPIkVTufCmwLYV0jpR8thVST2pNn2aME3gTsTB0oZB/e0
         eekjD6kT6DFM4OM5IC9o/RZD3fOWOQ2mlkufTWFZEvBF8zGmNIbRcailTZMrhUSh3s3q
         v65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881818; x=1796486618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=868a/UVmwsNaRJvxrCK8lfineTN1iwqIJ4228Iylmqk=;
        b=Sw/pq2UouOvko/SsHK4s8SamLLh6TbO9dh+N+ZRbiBcX8GRwsZcoZYYFs3FCun9Fte
         fgpqMuOiXIwuWkyG79Ib4u149ShhTDbeeGx4S4Ohy1bVNpiuRrNqXWPm1zRC6+YXsOqe
         gKBvWOG1OIDcF5MNSYLR7s07MFE2ymR82eDx7EQfEVW/73pK400B7Riizmj5c6DLY7nC
         Y8ZcUTFGsgnGdGLqhsF8Eqtf1ZXBcF9+3xgPLZwstlXPSQIolRDj8PBNqJmdG3ePSkPN
         YqKgF95/H4UEZ4pDhiD1iNUDgiUv5WeKuNkgry+ZAI8vJnG5c+DcOAj2h2cfiy8iZXKW
         28Tw==
X-Forwarded-Encrypted: i=1; AL+hErEgCRIbgTlJH3SC/toa2TsU8aY0e6koSWKJtxfkCW8ZzafNe19C5KcCUqsW2Lx9hLqtpwaNkKmwJdGxRtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mN6vFXSMMcLLaWlmJ/s4AffUBPKCF1X5Qe7/DcgLfiN9SO/T7
	g0RUqvBPf/vVcX1GXj831Ma3doDtLx76DhVHkeY5FERJe4x4DAMqMzvgA8rPvJ4am6sruenRdZs
	7Fl5YqAor
X-Gm-Gg: AZFdTZeivz89N9MeEKLa1HxGIo8U7ENuIgaLLLY9Uhux3BgAWMZNrimDs+z/EkTG53j
	wCdnLykHvgXplKc+Vnz37XVc5W9XlKhnNqB8OzRsfwkRFrOBfEPZXMMiMLBMj2OgEPFheQj3Vxx
	ZGyyVI6o1ZtOG0B9zU2n38lo7cMtTGvwf6gf/woOSmCnwUlnrFYo8D/djXV0kLNepkRtuvnhfrZ
	UmEHidEX7O0DIkZyHa7wm8FMeaJoQChKh1Xfd6GxNHWJivgB9w8+cApd7mz2S1poTZ9VjXF0OBF
	Q8zVEmxJrTdxeyZnex2AsLXnmA5+PUnupaDv1TApXBXdj3aSMC5khdS0tlBPS9hM24EKLQEGL/6
	8ao1NR7qeCZdC4exHz5nEHZekq5qHyP+eHEYMrLuFw1u2Klv9W2nZIRqp2vv7DdexNzbwUlyiMC
	AM2VXeCFOWIlp9JA8zVoJ1EnfJI+gPIyJW/5h50MFtOFW/ovAy9wH1HyFMhXUQkOxTRu091XExH
	THfeIXR+grutOEhp64FLKzJQVkOsbwhcAQ7i+RcUXgPaU7mZSUE/IwWzf0zfWQgOOk647PgKGlr
	zPKqRgxTRvCSCunJCZ8dTM5/87d/N1QoMGZA6txLZiOxqnlRgYzAmATsfLMqPevBBntGwLeC1wk
	RNUZ3Uswcc09Vca/AGidbhAD9iKIJisN7IoMZT0duWTsgLHk43QN19TzXl/9l4N9At1QQ4wdrOh
	p8B2GA7HB5KvrZB6nx67wnI0YQljl8CN0gi0GLH75Al05EjerR8f4JuV3bDqBcrF5k6ZWXAyXsy
	ApXyDFceOOr7ylpZcekctxxFpRuSwM4j+GJ8zcGyrpu42juWO96Eq7Y0iZj4PLuoHjlfG/8A5Cu
	72RLcUmLFPXIiw==
X-Received: by 2002:a17:906:5d9:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c513aab025emr1766181066b.36.1795881817868;
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 6/7] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sat, 28 Nov 2026 17:03:34 +0100
Message-ID: <20261128160335.1815537-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver keeps in rxcb->tid. Copying the rx status into skb->cb
overwrites rxcb, so read it before that.

On the REO path rxcb->tid is the REO queue number, which is
HAL_DESC_REO_NON_QOS_TID for a frame without QoS control. The null
queue descriptor path takes it from the 4-bit TID field of MPDU_START;
set HAL_DESC_REO_NON_QOS_TID there as well when the MPDU has no QoS
control, so mac80211 counts such a frame as non-QoS on both paths.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- Read rxcb->tid before *rx_status = *status overwrites it. Found by
  the hosted Sashiko review of v1.
- Report a frame without QoS control on the null queue descriptor path
  as HAL_DESC_REO_NON_QOS_TID. Found by an LLM review (Claude).

 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c    | 25 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..6d09b4c10b6d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -70,6 +70,12 @@ static inline bool ath11k_dp_rx_h_mpdu_start_fc_valid(struct ath11k_base *ab,
 	return ab->hw_params.hw_ops->rx_desc_get_mpdu_fc_valid(desc);
 }
 
+static inline bool ath11k_dp_rx_h_mpdu_start_qos_ctrl_valid(struct ath11k_base *ab,
+							    struct hal_rx_desc *desc)
+{
+	return ab->hw_params.hw_ops->rx_desc_get_mpdu_qos_ctrl_valid(desc);
+}
+
 static inline bool ath11k_dp_rx_h_mpdu_start_more_frags(struct ath11k_base *ab,
 							struct sk_buff *skb)
 {
@@ -2446,6 +2452,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	u8 decap = DP_RX_DECAP_TYPE_RAW;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol = rxcb->is_eapol;
+	u8 tid = rxcb->tid;
 
 	if (status->encoding == RX_ENC_HE &&
 	    !(status->flag & RX_FLAG_RADIOTAP_HE) &&
@@ -2493,6 +2500,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
@@ -4001,7 +4009,11 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
 
-	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
+	/* the REO queue number, as on the REO path */
+	if (ath11k_dp_rx_h_mpdu_start_qos_ctrl_valid(ar->ab, desc))
+		rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
+	else
+		rxcb->tid = HAL_DESC_REO_NON_QOS_TID;
 
 	/* Please note that caller will having the access to msdu and completing
 	 * rx with mac80211. Need not worry about cleaning up amsdu_list.
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..20d0cd9687bc 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -296,6 +296,12 @@ static bool ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.ipq8074.mpdu_start.info1));
 }
 
+static bool ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.ipq8074.mpdu_start.info1));
+}
+
 static u16 ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_NUM,
@@ -473,6 +479,12 @@ static bool ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.qcn9074.mpdu_start.info11));
 }
 
+static bool ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO11_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.qcn9074.mpdu_start.info11));
+}
+
 static u16 ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO11_MPDU_SEQ_NUM,
@@ -644,6 +656,12 @@ static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid(struct hal_rx_desc *desc
 			   __le32_to_cpu(desc->u.wcn6855.mpdu_start.info1));
 }
 
+static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_qos_ctrl_valid(struct hal_rx_desc *desc)
+{
+	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_QOS_CTRL_VALID,
+			   __le32_to_cpu(desc->u.wcn6855.mpdu_start.info1));
+}
+
 static u16 ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_NUM,
@@ -917,6 +935,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -957,6 +976,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -997,6 +1017,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
@@ -1037,6 +1058,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
@@ -1077,6 +1099,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_wcn6855_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_wcn6855_rx_desc_get_msdu_sgi,
@@ -1117,6 +1140,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
@@ -1158,6 +1182,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_qos_ctrl_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_qos_ctrl_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
 	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
 	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..3bd99d347fba 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -252,6 +252,7 @@ struct ath11k_hw_ops {
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
+	bool (*rx_desc_get_mpdu_qos_ctrl_valid)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_mpdu_start_seq_no)(struct hal_rx_desc *desc);
 	u16 (*rx_desc_get_msdu_len)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_msdu_sgi)(struct hal_rx_desc *desc);
-- 
2.53.0

