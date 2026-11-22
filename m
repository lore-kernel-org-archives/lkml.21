Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381528;
	b=DOTxdEpR58f5Vl8vs9ej6gTqlhfZ6aPK5nY4ZMCVRCCNvvYs7rzJnwAFDinpUE4eXn3m
	 eooVjobrNjVzBkBlA/nYDgmb/QiA5pyl06PkSkdQQxHzR4ZA/2QHL82Zz+uKQZyk/Ycws
	 ZRusTd8Q9RbcT0JPTtZ7Gwe06MIwmaWs9FrHuTygCmm82KBQhcEugx8GxDrp1xX3Rzp58
	 7fa8oM6LcwcCAUG7mf9SAVdTIu/csQxwXaoabJLMFbKl2caFmgeXZxQ6zcxoCvVhiNpuc
	 Mc+6b+//4Q1AkUxdOQg9QOmxNirCnFBjXv5hnPxmISTkSST+GNujX4dpAQLkty9UUEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
	b=XTTe1xGzsuDUZ+vwRPf4LJuzg4aUCigxFRiwddz55Rt3/rTrH/uvRglH/Nv00+atsrZ9
	 E1MhgekFUiCYNJN8mikc4j5AazS2UzysFKABSsMvaXltUzGSVYu/62pqw+GqREcCDKUZV
	 +pXYpFNJ9xWjbmyuyYp0DS7WJiS1GU6OyAGgFr55FF+o8Rwz/GNOO1slqFsy/VmhUXoF5
	 4jNGpgvTwKHkZjSu0ivdPwrR5+BxvnS7Q1/EaRypdSMACJxiCpigGKv+n7rgfkJV7f6k4
	 Shj9/SJJ+p/cwCMMhMseIK8quekvn4e5ikZAj2zXhd1Td6KDudgTpYezTxGadOpr+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G6RiUEDv;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975CC606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975CC606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G6RiUEDv
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so467902566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381526; x=1795986326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
        b=G6RiUEDvdQTRN+BzIk0ekEDP7Pa111u4DymCk+gQcRvNKohvG43LPeaRl+dcRDV9Uw
         dE543FvuQm11SXhN+32zgLf1sXnPcYv5LtMv6PNAGjvR7Fa7QE/F8AWdqqN1kJjZYsuz
         zDJPBsNzAzTB1nACci7/3iROuxb7zXycj1Ty9B5AfDU+lH+uMjAry0JsLwsx9RwHTbsS
         5xma+5M9ZMYk2WXJLLCmUmppMaKiMCJHulKLVvSA/YRgIoCGS4L2GTgkAQMvROREtPtn
         XTqIMq3pAc1h+zfgTO6V+mUlmXS0dqqkNBlOTlgws65JKWuiKCOBpm5yxxKvqiJF3viY
         o6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381526; x=1795986326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
        b=ZNUXZ9D+eI9SuvcvSy21aPVqXie7gndyQGO7YFAPJ1hglb769Fg+yipwiyZPuZWmjp
         RMhnpkKEqOoLkM+U3Wuyy+ptY//XFja+Cks8RwU1ebIBEHHu+GiABWiowKm4NCUMl3mW
         bjrTxagvZYXZ96dRTrBnC1lueU1kXXcFHUItn2qWgSIeRMQwANprKJZIhDVLiDeeN4zT
         jELCXjWtNhRCZzyWnpzCDZqSiaQtpBnC/WgF/+sYI+Oun6djJeAH/FW7e8EcV+0fGctB
         W2JEwc7peplyDgGnF/S6oiCydqrx4GAuvIOQqNvKhj4nqIJ1ulo56GWq26Z8bQsdW7yZ
         f1JQ==
X-Forwarded-Encrypted: i=1; AL+hErF+f4U+RUKIuoGlQnRL3coI1Yry9+fSluFYPP1mbkXsxhqB334IecVe8t3hzOYy3cJNK8+zLC6M0TLW/Zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LPYbRLBsCysVNgF/WCgoUamugaUbwsjKRu5+CLMMuFuns3U7K
	KiI60au1P2mm/yxf2qAkAnYfBMbxoYVKbBhbTZZfqqIIDLmc0GgymqEoVsyppr8XmQ==
X-Gm-Gg: AZFdTZfx1NbcPYBtNhpGTaME1j9fqbzy024A0pWLrC/AEF5Q5joYngJS8ikNQ+YhEcR
	ENvdiHmVljVvwDEIB6KbnLF+KJOYEFglVnTWVVJfBWqTUrub50iUa/uyRe+RZVAn/ptSHh4q0rK
	DydQY1JdzyEbtMzl5fbyVoXvrdnYRxAcYibn2bTO8ld4gseNqRPwu4iWsZ9z4ZtDeyxZv12q/Ge
	/I7fBpv9xYkqvN3yCk+zAJYA4SVz0fYCbbMDgO1pMFcCZsJoptcd6hJwqCEcR1Yf3MOZJeJCCBc
	EF0NIvwZeCj9L6ECvVPYRxvqTUu7KXy+qIi4LbL/cj7YLCJNFC+wgABQTtD8A3foER/Q6bSkfLG
	eQamki5Ba9yLshvTsC5X5wIufJNmP4ZYaNV3KTP5k4RmVmfk7CxGebNCL4xOuyTJ4/ZkbPlhPk2
	HHGML1vKlMpGDfcZ/I0f7x8BQkDl8Mu4a+lO4t0bTKF1xmIMPvUqGhI0wQ1l4EfLz986m0a/nDn
	khV6uMbbGYEUOtA2BO5gMD9ejmpaRfLA/WYdJbSKnIcABoACtiSF+R18THYjPuM7zo8o8v5hCWz
	bYfeZ+CRrCWhJq+YwCwmfBR96NkoMjVGxPfKqCGDd1m8+HUkU4h1PCmA6KYBXPKiIdfgjrj7G3P
	wtL5iHkcURxmy8HsDdAZNSzxzH19JoY/MAEzfrY/jjFusJk09DYR6EFdmHJIr5aP7mXbEKBN9h9
	k42XCGwad5wW5n8/gl07QGMpSn6NTGmI/kQiCs57w+3nE2jbtwLrHnQfkoLtNSaegAXI8GMHAEU
	XHzXwpls3un/mFW6bUOzTWbAThYlsPYc9bfwfPpY4F4ExlvKkJv+iU9nxcYTUdAh85rmuMI3erz
	uSA5wGPFYlHXVZP/hYq2Ojj5OIxx7v7u4JBnRjdLFDwO2su1Cmf8jMUX0GdiVqilHDcxeFPf6w=
	=
X-Received: by 2002:a17:907:c13:b0:c4c:c997:8711 with SMTP id a640c23a62f3a-c513ac67123mr760146366b.38.1795381525929;
        Sun, 22 Nov 2026 13:05:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:25 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sun, 22 Nov 2026 22:05:21 +0100
Message-ID: <20261122210525.2076058-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the MSDU end TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, a TCP or UDP frame whose headers it did not
parse, and an IP fragment, which carries only part of the datagram its
checksum covers. icmp_rcv() then takes the checksum as verified, and a
UDP datagram whose fragments all carry CHECKSUM_UNNECESSARY keeps it
after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, and mark a frame CHECKSUM_UNNECESSARY only when it
is TCP or UDP, not a fragment, and its IP and TCP/UDP headers were
parsed.

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       |  8 +++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..003baf0d3ea0 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -732,6 +732,7 @@ struct hal_rx_desc_data {
 	    is_decrypted:1,
 	    ip_csum_fail:1,
 	    l4_csum_fail:1,
+	    l4_csum_checked:1,
 	    is_first_msdu:1,
 	    is_last_msdu:1,
 	    mesh_ctrl_present:1,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 473887ed4bb1..4a57d89669ab 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,13 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment.
+	 */
+	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index f579fdfc7c1d..23a07ca5aaa9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -347,6 +347,16 @@ static bool ath12k_hal_rx_h_l4_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static bool ath12k_hal_rx_h_l4_csum_checked_qcc2072(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcc2072.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static bool ath12k_hal_rx_h_ip_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 {
 	return !!le32_get_bits(desc->u.qcc2072.msdu_end.info13,
@@ -421,6 +431,7 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcc2072(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(rx_desc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index dd12b1684cf7..4f0a4daf7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -872,6 +872,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_qcn9274(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1042,6 +1053,7 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcn9274(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(rx_desc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index de6247aa3b2b..090ed78589a3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -485,6 +485,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_wcn7850(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.wcn7850.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 {
@@ -638,6 +649,7 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_wcn7850(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(rx_desc);
 }
-- 
2.53.0

