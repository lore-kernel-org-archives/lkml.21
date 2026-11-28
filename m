Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886543;
	b=rTxOxYzTXB5c7BSCBe/qxJbP1iOSFGq2uDPqfP1p74Kgpa8oSQ/Pt6Se7qAe2XxBHkqq
	 Oz7W5IAglfBCsdWN8Ya8mcZewu1vI/2nu0IRNrbC/Obx0RDDc3DrfSVGkHqXejAelTf7J
	 HjQrWJWlfMKD3Nlqj2MpIGv3+nMPMsEhpiMQtoVdpeI3jRzdBHaQ2m0D80hNGiOFbut8z
	 0Vs2t8COlygxwTtDGQxVwK4Dj9CTn+GWkRbcditzuThP2oAycftg4ifF4SsrbEUPbM190
	 vVHb1JaivvBM4Qu48JZbYdqoisj1okRVkt+s1TO3Mr5aHttTqCNYwoqXRJbkJz5cnbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
	b=CdCWMXjJU79RJ3KlCZkydkoaIxXLTn6TrlUNEH7HmXqdCIFWf58FWVUGCH0+3PyENxhT
	 2xeQQM0ba/irUl4UoIS/OCCqcnZtzsRQOKrd69jgk04GjGSl7UIlNb/j99HRaZty2uUiK
	 Pd1O8RyQCTjC5QyhJa58Gc4JxyKA1nI254H/lrpK/Ue3/v/IyaHAHbWQdsjdxLoUjNtAz
	 UgNT0P9IL8NNPjGlTSAUahmmAP8JTH7FHdX1/clw2ycHNJxB5/gfWuhu/IpV+tlQzNmPn
	 qgAc0xcsSwAr5Cm8ouCfqt47QBtgVu7SB4lszn+rdAn9tmAGKr3awAxN5aUb7uCpzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PewXpDOj;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F111606A682
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F111606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PewXpDOj
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1505004566b.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886541; x=1796491341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=PewXpDOjitUdcvBrWs9aCx8Tt9K7nFsi4CTgWFSUl8yKBOC9jEHQ/pVBcRKQh6tFCd
         1vREtC0TmD3iKJYPZPcfF1qbNQBLj2hCOGbc9FjQVw8ZZ9kb0J6Xoi9a9RhzYIheV+t3
         3414swGbu/Y8Hafk87lwyWrgcFScLNnpcLHXA/KLfv/3IeMDHiwJttdm67YbnKh1XA7w
         /d7lGfPY1C+hXLQrQsutGk4cnnvObF4lJMsQ72ZkoTSHgsMH/XXhUwkzqkasmJVzc63A
         eR5ZMPlNPpdxxD+tYamUg8f9cUCflWREV2B66cznvkn9LxVua5KE+5EvkBfHv3ItJHkM
         vSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886541; x=1796491341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=Xn8fPVDqY414CrpQ0/W17+fBO55hndsQdnHS3tthtme4y+Kj4im/RvO2KUqSFd3cpg
         czEgLCa4jlaB/nNXnGsXLQfL/YilviYxQRURvzXuamzo8UZBM6Pip2uXOSf5ndFfXzb/
         lnBjsgV+Pzg9UsMsgS5MCWUgtH3ygCsMJjeSzg4tFTStYAcraitV0p+XUa4nWbi5xzNi
         +NGJWqvhVFxPOTMDfySPNOpmLajL0qifEfAkmZAJtk+yxvntOkVHJuSQdrD2DWfjoDEL
         1wg9CXRaEqaCo8AKslljWfIjXeJv6IN06N+wqROB8YNj67QOUUCR/KujGcodjbbONoVM
         dd+Q==
X-Forwarded-Encrypted: i=1; AL+hErGnIRv0hLT5yogsmjZZGNTeOy/nga+ux+weyIs1llBQvY7GEsZDRBheN/1SNLQcI3/44OFiSudCXmchKUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l8sBgrZX495VBCpsW8a2zDl4RLgknEr1YJydjGf/FcsToJks9
	ppxl/2AKdz0e4SHATwbg2dmJ8Bk0iJnS1YFEdg9oQnWZTvuyDevOnn66/8dJ3g7miA==
X-Gm-Gg: AZFdTZcG5Bg5AakLGAoSUw5Lg/w8RAqCZwH3GJqLeYtC1aHdFLbTidzGuREYQvBhp7z
	8PnTznUtBwZ6Ph2rEu8IWo6lSNzFruv59JrDCIZETcCrNjEN+uLc8llRkZQSP93IhgMF0/Eoxib
	vDhyvvCeKTI8bWZp+jZPxevV8vOcXtWJxpY7KWjiEk6WyetoxYCIlrkU/YFXq1KKJVZtpdgdYf8
	XtM7724YbYfDnLlhA5lcVajgYcvWYcKL6AB5j1uqAL474NXXCkfCWAL8lfV1aU31HfN98yxwGhJ
	aq1YzHy5NYcajDpGbMaSR1QxIXQa70dcZajRsHRIB1ZM3E9EaHhZFfacFe/RzMmm7MGJ8GWEDej
	DehZzuDCuL+QOstgxewubOIsjgWxJ0cbp4/NrccXfT3snXzomZ7t7sfLNE52lygbhD0E+qztJxB
	R09nV6IyTinPMjY8ZnCRnzYl5PHZVFixn3cXrqHTztnypz8KLDePl7G+EdwEPz4ZV3umnPb2Ql3
	uPM9V9R0mAUEYcmH593cxD4dd1OER3ms3DjyQDcUOVHXEWjgiudoVDFN9Bmzzr4oc0kSBF62y7f
	MFPriDZFCuoIGUy+/aJhm+vf7/YZeH9FkKO3daKUkNfbbVS7tVYD5sJ6TTUClA5DkGcy0CjeuJC
	5ZhGOM3jJ44y+/2qlUlPhfPkRIePpT9DRVnI6XszZulRIm/oeZMP5jfI5MpdP2ZaFrLLwTORNox
	LPAJZ6UYpQiV+L50DKGUMFLYkcg/BjG4/PAR1FE17dWZX8J1BprQHXUHT4/q9o/OGIC/pPPD625
	nmxLT9JDLYgMVWMj8r6wmYUosgkVNzQZITajv4IcC3I3EgV1711WPwzMF3ZrnfhOTM76flSgRXP
	s7OEq0r1KSocTA==
X-Received: by 2002:a17:906:365a:b0:c46:50c6:f737 with SMTP id a640c23a62f3a-c513a88d971mr1837729166b.31.1795886541449;
        Sat, 28 Nov 2026 09:22:21 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:20 -0800 (PST)
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
Subject: [PATCH ath-next v2 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sat, 28 Nov 2026 18:22:16 +0100
Message-ID: <20261128172220.922376-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
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
checksum covers. A frame that ath12k_wifi7_dp_rx_h_defrag() reassembles
from 802.11 fragments keeps the descriptor of its first fragment, of
which only the MSDU length is rewritten, so its flags say nothing about
the payload of the later fragments. icmp_rcv() then takes the checksum
as verified, and a UDP datagram whose IP fragments all carry
CHECKSUM_UNNECESSARY keeps it after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, from the last buffer of the MSDU like the other
MSDU end fields, and mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, its IP and TCP/UDP headers were parsed, and
it was not reassembled from 802.11 fragments. Unlike ath11k, ath12k
needs no case for a raw A-MSDU: nothing in the driver sets
ATH12K_FLAG_RAW_MODE.

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: also leave a frame reassembled from 802.11 fragments to the stack
(Sashiko, on 1/6); read l4_csum_checked from the last buffer, like the
other MSDU end fields since commit 1e678e37ff13; discovery line
reworded.

 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       | 11 ++++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)

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
index 473887ed4bb1..fa591a03ecef 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,16 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment. A
+	 * frame reassembled from 802.11 fragments keeps the descriptor of its
+	 * first fragment, which does not describe the later ones.
+	 */
+	msdu->ip_summed = (ATH12K_SKB_RXCB(msdu)->is_frag ||
+			   rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..10a8e3e78fdf 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..659d74a85764 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..6e103f49bb9f 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(ldesc);
 }
-- 
2.53.0

