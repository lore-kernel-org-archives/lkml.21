Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886548;
	b=YKsNtLzntgdFToWeskmUboSm7b5HW/obux9IOlKSJwX1x5YJp3h5gNNK6OGzGU7I1ANm
	 I1xp05wKGEd/OldazaN3REZ6ZHrVT834gwNoe+u51sN3teVk+p6nAXwkZXq2uPwjR5BC3
	 0PCOc9l43Vm0V0lWReMDypmqfMVn0l1g+iRN8bJ3kUme9YW3X4nowhOot/js3NkM4B/tm
	 RH74MndHFDSvM1B90ptUEiyIg9oJL9HDeKLTbf3HctOB0CW9/CUzkj7kqVEfz49Odqwbt
	 Qu0yNfj+68+n7vzkhUEFA+FRejh1LXcr3Z7EEUk4psPeC5MzPeEUMv9LcPnN0eE7d/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
	b=kFVdL3tFmwo4hMRcc2/vZ15/QK0cdH4xUfLvnAUrFdmLEEzAxAI16Z080uInu2qlqpO4
	 ZiZWKHPFJfFXhf1i1v2yz/hAvOT8aSgS9OigJ207/NwSgSZ2b3HtXDZyLjMplPcfI+paf
	 Tiig3UM2+FjSBZWBItdgtvnOpQTOllcumaVGo4P4VWJhALU8do1e5EmWUMXyAWwtZ5Igu
	 Q4xRvCA4cJNA0NzTJxyz30YbW/ol0QYjvwIyOvWTTSC3U+squGagzyxsybX3RDZDZjV8C
	 BqM77QUD4YyD5SjIV1UBDIId3H5/cyyyh4FkWc2CyRYXqURUjIvhn6xn/+B98QP2Zgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vlp8VNGE;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110C2606A6AE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110C2606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vlp8VNGE
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1505010866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886545; x=1796491345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=vlp8VNGEYW0LUa1Yv6yQojOikW8OjKUDUaii/i9HxCvyGp8+h4Kgtlgm+qgIKSNIzZ
         UfktPhE4ZYWWh4Qs8vxNJGJg6m2uqm52mIPVzSCeCoOaX0OqSnZ/QZ2aWOHTeVCWTbTf
         xxTXlHjPc7Pre4aiN/qJhkJh+694gaiStDwfy3wIHa4DSjILGS0BK3WhTtmHiNF4k+3Q
         fO5dBt2ekdfEWZ6DTTSSxyo4HfgeqzVGINXZNzDLZed/Pxr59zEYJe/emxw8baElNlAP
         EdndSrs/aSUU5f8VUb1jn0XnrWMd4r+c8QRTFmBDx5Frx8lJaRDJs44fe4a7i2D1bDii
         HDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886545; x=1796491345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=nPacOD1Sc9YVGDzuLbeRrJXwZZzsG+Nf4nSHFybS62+RfZrtogEI9K00jdlxXl1tIM
         2JQRNLYk0uOh3xV+NKXqyrcUE8lp13b7QdiaK6ezPmE4rGLMpW6dRJMiqQ6UF5tk/uf0
         IOFpVIlatZj3dJdW2+S9Cj9twIMgoKQkysVbEZmw1mFHTkUlsn56Det5cOrBCk/S+LNo
         YHt+KcAib/0t1AJEeVr04ATvg+CDO+vquBEFWxGe+9ckvI1NWIveFNpG/HHH2FizCPIl
         mfKNlsoiu6lPncIb6p+GhWBKipmCTcDvYV3ii2po8O8l85rGwEicXIDB4Q3GhJSBRS1o
         TWlg==
X-Forwarded-Encrypted: i=1; AL+hErFpIJy6lX/7Oyfcjw3yrmPiBOzOPVHRZsMXVr9ik2Wyjm6DxpzTo8zUVUlo5JGak26ATwTp6tumxEaJk2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jcupf3AKfNk3brTKHryhiYj5uAWoye1h5NKYccR99syngzJug
	wf5f8/b6NJlB54wYvd+RZXqDPdDP841MNyY4sdiUC74UCf/biPxlrKr3qNYkG4QONQ==
X-Gm-Gg: AZFdTZc9G/+1woT1vgZcHYie4+XKf6ub0AiS4AsA9xEo8cXmAevw9RSZ1XrkHARbxdj
	3lzunmJbQjITRXya6oqS3+cdGtbbd+buU0REaWpHkg3FdYI4TFTJwqnFeCUHVCVuIr9HMQd/qGW
	MiMll9qdTmjFgpQCCfrT/IUNyZDKe3W8hLWSPXWeWFyfFNWogwcE3LYFQGhu++aRXxUnDlPvYmH
	pLSsRoa464YLFzaEP+uJw6PO4OsPHvSGWhHbitr82HSSv7b+8lZTMRI0s8eIrgg8RFlMkDhHjWX
	f6i8oU+klsCKoJTw9MjKqwFibbEsIvPG2mzbFR7hq8cQhsXZdYbzngGlzF06pVrtx6wrNjTmOnf
	GW1myDHJB4yoC6MhZicKVk+fNw4x3/4Zjv/k2jyj6mohYwOj2aKkemtKljkpGlPxkVAy/R+Njly
	CbzbzO+4F2Jp4AZQHj/MQcz1nP/UOWBuOqLwojhwmzaXCYasOfdJ1QPHOKiQrCZvROV0ZmLlMuC
	jI036G/9BQpac2NGTaxlCERgp1YDwVES8wnywmyLqYXZJsU2u3RM7FdAB7cNNtzc43PeFA/u+G1
	9EPjjBwxcHBaHmCTTt0i4qf6lJKC47H+XISlybiz4g0iTzWnxTm0T8Y1XBIFnzf7lCzBatPZm/Z
	d4X8AC0nLHYygUupqLN9+alYhHmLwrZbwLgW26IqXM3AyVF9edzNo1MBQ/bz91EvFZIhKt+QS/L
	mz0qvFPhdbC74YBITFjuUCsH+loI5q3/AgQaHdSU0dKmp5v5jmwWaXhxkY5SWgU4bR7e+sRC8Mc
	DnYMoShUFH/Vq2HYevg6+l4hrJtsd+luCs5NE/plN6hTbvpBbr4nhTKXBbem0oi1qnjMiniS1hI
	epDF7smGAP9Pog==
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id a640c23a62f3a-c513a84c864mr1823750566b.24.1795886545446;
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
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
Subject: [PATCH ath-next v2 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:20 +0100
Message-ID: <20261128172220.922376-7-julius@bairaktaris.de>
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

Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
type in Rx path"), ath12k_dp_rx_h_undecap() sets RX_FLAG_8023 in the
receive status that ath12k_wifi7_dp_rx_process_received_packets()
keeps for all MSDUs of a REO reap. Before, ath12k_dp_rx_deliver_msdu()
set it in the copy it hands to mac80211. Nothing clears it, so every
MSDU after the first one delivered as 802.3 reaches mac80211 with
RX_FLAG_8023, including those that carry an 802.11 header:
ath12k_dp_rx_h_undecap() rebuilds one for EAPOL frames, for decrypted
group-addressed frames and for frames from a 3-address peer with both
DS bits set, and native Wi-Fi decap delivers one.

mac80211 hands such a frame to __ieee80211_rx_handle_8023(), which
drops it when the station has no fast-RX state, as before its 4-way
handshake completes, and otherwise handles it as an Ethernet frame
whose addresses and EtherType are bytes of the 802.11 header. An EAPOL
frame that follows a data frame of any station in the same reap is lost
this way, and so is a decrypted group-addressed frame.

Clear RX_FLAG_8023 with the other per-MPDU flags in
ath12k_wifi7_dp_rx_h_mpdu(), before ath12k_dp_rx_h_undecap() sets it.

Found by an LLM review (Claude) of the code.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index e37353445749..b74ffcd94a87 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -417,7 +417,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_STRIPPED |
 			     RX_FLAG_MIC_STRIPPED |
 			     RX_FLAG_ICV_STRIPPED |
-			     RX_FLAG_PN_VALIDATED);
+			     RX_FLAG_PN_VALIDATED |
+			     RX_FLAG_8023);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

