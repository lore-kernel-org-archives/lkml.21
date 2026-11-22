Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381535;
	b=hZAyJHFO0IqpYq9UxhzNoVz8WQgf8p77hwI3ZnfrCj+3QiIzHeGnjw0/hFSIUWbEq5Gc
	 k8prXjoHXDFpqVYixd75GrBI3FkEWXOkPjPN2vpDzN4DySfqeW/BiOcMyz+hf28mlxfnq
	 PZtAbQqkmYB9aYl28utzAe5kB+etydFdQIwUxI06Qzx/H/Lu7m5qLRC6aV11U+QHSeXfw
	 XBdKbgwDnQ9xMBKqu9prx/553otu4tXlD2R5EZHt8yqhGp+VglmEcwu3tH08bucKcRdXg
	 y/z9vPgKt9GO0h2JWe1nKyJlrHkWbOAfb84WWh/xOJKtm3oGyKb+8BEq2ZVSOi0ND7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
	b=funuisjGCGIIuLfsvLlTQDvNHJ58dKRW6y+yamaZLlTQgtrxT32gZ8PTMUsrJSKDIsm9
	 RkDPOfzFGBIWsAr8LWcvdLcejUx73LAw5VQ3fJQng9vxt6zrG1T1n47UjfAyfWTxLy4ML
	 dwYfGCF05uby9ztGPddVqvEgoZ1UXJZGaJIbTSNQz+dFRsbkwv7vAyILqS8Gm6h7KQDSR
	 NXjdzzyyXqAZxeCjO3A5TsiO5I37IEyJK+mQiIHIMGfhr8eVs0xxil3I2DjwA8VVeg+po
	 QxAvbHMOtwXfmS3sKbUdBxCAmCiXMg5HRaZlbBdd2v1nHvFRn+jeaw2hpciC1ktZkBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HN0ND8QR;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF85606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF85606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HN0ND8QR
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so440923166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381533; x=1795986333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=HN0ND8QRSBaFe+F0WIe1MfhEOVdpH7a1/ny4TCw1Zr3RzkpVNbbUM2lQZxFiqXPGlF
         eMR20Ypet8DN2WMRtCuihJN4Fo4uglp3vMxBSLc2x+gsGFMhHOD9YhUHv6lFPfPWuTFQ
         wK6E19ouh5DEjQkdZTVVrV+1jQHflH9xjranXUsrdKFK7L+aoDxYG3LpcxiC/pZCUnvC
         QQv+DbwFpCd0XF835ib6C0FTGEqHMoKKN7iXAhw5Jkz0NOkxSFMLaUHt+B2gc1VKA3n5
         fGEZGbmvQG0ufw7qC+MC5O+qOXVLxVRJAZl/AHiIf/Wd1aIQPbVEjLIh3HX1Rliwh+xK
         fHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381533; x=1795986333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=KpSiPd66BaFz3SKomnotA+7jVf2Vbi50SLf7nMl9Eg8pLaEFpDuCIi9FDyeV9GKKkP
         5fCPGRYmiSF4Kb+2rSullSw2OU/7tEMuOFYs26VMzZuXWcW7ivPL9HI1fT253wO0HUPC
         i87jBVDNQ0JOny+vP37tqrSLfwTv+nu49M1JcWTNlEE1+7j0lKvzvpfs1Py0bCptuUsA
         6cVpoi/Lnkf+uoR+TQHJwtGqFF6vzzH/4ODw0bAKu64qUM9yUGhgsnEtA2HO3SWVb/i9
         Z6EIaP9ED1WUqdAuZYNDCGoVIU+FCnLzcFqEhfilqqmPlUEpTCN0v7Q9NqRIciTG4Emg
         YSKw==
X-Forwarded-Encrypted: i=1; AL+hErEIx0DETlEHh8dDpEK4iGDAnPtWEV/tnwVHbIh8/NvNd80U3lwApnA+dmduLGGzANkhuEW3YiOu92VicDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gmWm0vR9HWqAixP7NDCoYTGJ27TxqQYEKZKw0exf4mirfS0rd
	3AC4h39h/4N8gu0B+sqytyh8ajk8ev+97+xr+oZcD1vYFRUEcRrQTw+uGiXEL3mmYA==
X-Gm-Gg: AZFdTZdbmneckSN0IAYocbpck4DT5p9Ur6hINmcROviGU7VWlqYwBj0UP/c1r5Ojf+y
	puLBNNM7fm1q1s2iRy85AKDctu/BO4DrEgA4wvzseeY6aBeLVSIta7eLDe2kYMPtFO1yF3mTBXk
	n7FZX6BKRNBqNhotM5keMz81KWUBsNc6qMQaFoH2LeNEfdQfhuOfTHiFAG23iSBmvlon3cOp35/
	RW9hXBPhsY4b0VEV814q5vUNPe7ZGQEg6rTT7dhBa5arZhIsScWYBFcVqYZn9hCL13rdJBq1WdI
	P20lEZROnUtY2HCvvpNDWGDRAUKmZdtllLXFSLwvj2h17DHQXix2zRSynYX3uZ30ma/M8ooJFy1
	sS+uuHb+NuzZUzNyA1OX24wLOEdFvwGXQd1UWoeV+kHIQkszeDFfV99tvNk8NvyLvOi4ED2p+N+
	b99qeQFLm+PxJZuopZpKUqMsn9/LHGp8NbcoTn+8mG9ZsqPhWWKYpg5QVrUEedeEsU7TKe/R9uo
	dL0FUeBccwO0bSgn5WB2+T5cZYJzU3OlV4Gcni+VTzIqhXE5A5cns/OvOfnlwFUT4vYrCoSw58O
	fV/Gz9QR9Wi+PYmVqEIbXxWdP4YAbWXPQ6XL6LB/eeudNuJAkG/LIuVZtit6ud7lPW/9lKXqJul
	epBdw3Y41uQoj8wGn35AoVOHGf2h0/2Jg0tmjD7Le50yqqOMVdgWe0O6GyCN3UhH1xFpRBRq4pE
	0TOEUaD6gNJZnXKSQduHVpi+/sMyyr+sDrOKboHR3DFsoz96tvsguX6M+gLUlajoydN405I1R+N
	b5oqW32MD1bYT12I8PqGW0XrTJBmm8hv7SYhR6NI49x2Wdz4wU7xQxswYJjPV/87SHUCb5rGrxW
	D8kqJR2PwYhBxV5R7GRk1DOdIWKkqqQQFVWvYzg9UQlEtJ/RJ5997XFkyeplm4BUbULnf/lpXx8
	=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr396957066b.1.1795381533567;
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
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
Subject: [PATCH ath-next 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:25 +0100
Message-ID: <20261122210525.2076058-7-julius@bairaktaris.de>
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

Found by reading the code with an AI review tool.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fac60041d3ec..1d52eab418a1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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

