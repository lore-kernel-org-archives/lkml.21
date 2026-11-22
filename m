Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381532;
	b=3X+JN5Kmzo57uVq9BA58D/Pokcje1ryIzc0LI8VEqy84b9PYgVB1UY0HmGWMxQT7uANY
	 l9hLfLqXibZ3IEY5Xd9rGDigQWV7x4pOCY4luCdmUoJeJ9HTA/mz/5XOFsADy79ZCS3hz
	 uMUfJ5Z8MRG/3ak3+1H1ci2Tbu/TBwdED5QsJwxiGeP17GIq1mKUBigTZtpLXmyY+erH+
	 StqhFMCAdk2/oaM1JmyucfmJd9YdQALjkycm1Grdsd8qnFBKoQKxNnEM2P/a/ek0Mcu3T
	 XP3ixwLP0BJz2vZO6K7zgHTCZM91MFqXluU5cvuJZbBOurhw8hYpX5+FKNfw5nXXTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
	b=njOeBYGS0/xV5uErkdrNwcFw64JykuMbR1bbQhHZmjbt0QJpjuYAkrjotsKWWAqPn86a
	 JPQqXRUNRAh324XhSAcHNOnVb+nDf5lwX1q36I2eii3P5WgzEnm25zZ0Fy26p6V4S79RR
	 TMqiSltsnv0w0ZEKTEnjOizIQYrR6k9t+mEBn4NpLKaf4bPuFyWySPWiL4lG3Ewo91J3Q
	 Rd8uikvZMkpvSTYjJetRXBSo79ftENATbQCCnqVdbJGstlZ0ipgXrkMwSsFz+Z8970QNm
	 iqXQIYXYERxss7zv1acDQhqvB4boZ5qmXi0pymV00qO63eRjSs3rMd7MlhtCCgGdTFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wOYHaZRS;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE9606A69B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FE9606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wOYHaZRS
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c511c0e2826so308970766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381530; x=1795986330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=wOYHaZRS3HslOW76vk6PNpFluea0dyW546sBvu6wsCaNn9t24i1HTo4F3AZ1u44Trm
         YgU58WLrEMLorgFWwdT3KVo7eANT46K58R7OLG9YgXB+5hlcVRQBFBJD13KF5jcOprmb
         jjZvDb3PO42X8fXv1Hloa+Qunof9wzQxfPiTf/yo7gtmrOQ/Xl57aET5qLPBjxRCH+bT
         VEx838FJTfsYaou8Z0d3JxE+iuqie2mjrvE/oz77sIcbC0YDlnXzqUN9xb6zHC8Kh0aQ
         Ip0ZMw54tuJAaPpd+ZZYrbbftcqmMdqbii00X0VYGkPe7COJAsGOhpnAt7G4F8I8VanS
         8+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381530; x=1795986330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=u2POlfHFBqHrMK525I3kDldPhcR42yj109YEzRDg7QO4rrCf1/obme1mRmCZ7bZaVz
         ZfrAmcfCRFJiDQYTME+Ex8VAmF1jXIGnMInY5J1o4OsRJVa+pD2mD6XyaawBX9EoZGY1
         JDlxfdM6+txp0n5HweH1fygMkY5Iqyjeo3pRfg8rUP1+CRYd6nYV0xbBZOG8ZHpUUAzZ
         SYV2Dmm2nn0v0Z5gAxof3xkMIZondTG3PFvqxHH60RvZ8fjcISAJneoDa/s9U7vFJZfS
         5v4/6gizVRdeOVjbDLwpgEoAWLfG+9O+NOi46NUsBAu0oXbRvIo8LN83UJsp100ShaGB
         gGUg==
X-Forwarded-Encrypted: i=1; AL+hErHE53OZJHXIwvA2SGPLiSM08rkjuwanxjh/WpdL7IKhz9zA+yE3RSN8ZflItekZLuum1ly/JJ6axp5DVnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ZaogYpiIGXNUmxKmxX3Cc+XvUBRfLLo17tH+E+Ll5ydnPgFC
	UXB4W94Hlb4sYh7lPHVchfP2S6yy7oUmKXFb6Ht7IkDgNyMdiBqaaszcElWkUHOqiw==
X-Gm-Gg: AZFdTZdtsja/H0nDWR1dS4V4oon8Ex+aFqRmiW42dUqmvN1KAF/UekUFN61gqdsMr8G
	McuQ/rOPHSsu5VwKJsBy9MPv2SHJ7+YAAH/bcH2Xh5NOp/xZdWZSlUHinyxdEZgTkJOxARas3Pj
	bLIqlg+qtQAOL6haaXIJ4rTPwDtnYkupeI3zt/TrzP3J0Llv8SeXNi2B1ZekhO27aFC27UQUOkT
	HHVrFPeW5filaJqd6BZHntv5xPHJdcnc3x8aPEOT1KCEVhdvZPnGxQWGO30HVgKEaUPnX9Bi02l
	JzO12aEmGIJzjUj3o8NPjDg+qfEztsejawB3QeKsJV3th1Bb7TLAxSilWS7l5b2Z+MQTZuF3AjB
	rJngDxMtQHD7BCCu4EO81rIbKBKsphPWs2UZ9LKwQ01vd6TAWRYlGvEHuTBD75vZI7dBbLSM8e4
	TEsWhGc5QFB5t/KZ/oDkfA/bOCwLzfv7byA6H9sEKAD8aKpOyDVXjgZb0Xz9wpAUiGpBrmdZZRU
	W/CRJICwVRO3U+57HpbjkEUfX+CcY6Ffv0Uy1VCQEiF7rs39ALMXdHHNIllffQ3hffNZnLpnzch
	1jVkOef72x27RQF6NtyBoC8f3tlzTJV/pxCn8L+9Y1P2jI6taF5V03DR4iiZ/SMywMTLi1V72jN
	jgb5PVn0WR9kKV1XlCw/xrsuUZUODA6qsAIFUQp5COoXokQyoEP+SRRT8/o2n33Dj5RXHAin1Ke
	wasJtxILQe2eKptaE/pMdXxNwthxoE7OSWlJw7MfciaM6o+tur502cf6ikL3nU0CLBBtXyeNZIL
	OG6BHicf7sOH9l0/lP85l8fMOatHjnjmLWUlkR213FB81N+8Ot34tpgKhF+TnNEiUjsBgPS477k
	/YmRmybzUBjnoCjKGRcBkkFeBp1cmm12xY1g6HPCIic9A0/UsxT6ZsakYO5NQgek178pvtXdWQ=
	=
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c513ac496d8mr571307066b.44.1795381530146;
        Sun, 22 Nov 2026 13:05:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:29 -0800 (PST)
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
Subject: [PATCH ath-next 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:23 +0100
Message-ID: <20261122210525.2076058-5-julius@bairaktaris.de>
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

ath11k_dp_rx_process_received_packets() keeps one ieee80211_rx_status
for all MSDUs of a radio that a REO reap returns, and
ath11k_dp_rx_h_mpdu() fills it for each of them. It clears
RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED of the
MSDU before, but not the other flags it sets for a decrypted MSDU:
RX_FLAG_MIC_STRIPPED and RX_FLAG_ICV_STRIPPED for a group-addressed
one, RX_FLAG_PN_VALIDATED for a unicast one.

A decrypted group-addressed MSDU that follows a decrypted unicast MSDU
of the same radio in one reap would therefore reach mac80211 with
RX_FLAG_PN_VALIDATED, although the hardware checks the PN of unicast
frames only. ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key.

On IPQ8074 hw2.0 with WLAN.HK.2.12-01460 this is not reachable: the
firmware releases group-addressed MSDUs through the REO error path,
with error code DESC_ADDR_ZERO, and ath11k_dp_rx_wbm_err() gives each
of them a receive status of its own, so no reap carries the flags of a
unicast MSDU into a group-addressed one. An ath11k station under
unicast load received 29011 group-addressed MSDUs there, and none of
them entered ath11k_dp_rx_h_mpdu() with RX_FLAG_PN_VALIDATED already
set. If a chip or firmware delivers group-addressed MSDUs through the
REO destination ring, a radio in range that recorded a group-addressed
data frame of the network could send it again, without any key, while
the receiver gets unicast data, and the station or mesh point would
accept the copy.

Clear the three flags with the other per-MPDU flags.

Found by reading the code with an AI review tool.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f8c08b8b6b08..6fdcd2aed7dc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2338,7 +2338,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & DP_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

