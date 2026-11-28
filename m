Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886546;
	b=biR9iGLsgACx7KRHSL1aBwXNw2LrJJqvw4AVLKt3H4wCnq6aJG6Mhm2JGnuQ542Hr1AP
	 MoSRzsryfJ+mZgkl8qkDroWGzp2YrCwjKYIsXOrAxs3Xo0D18RFeAegCXEQo2UhNckbRw
	 vIga62tCFD4BYvBKfKRQBbiG2830s93cOIjPonHb2XeKqlYc4X4sRE/QyY3uogWQsEOYJ
	 MgyfDe+PVLqYL5dF9PERmwX1mPAYHw/8JbKmeoCOagOmEoJ9SbV5MjIh/SyOqj2v9tAxQ
	 fBh8BQKBAuYAWJsJkeezqgI8BGVrSncoNFDvXFlWfh2kFtBYXaY2eM7ALb2MFrnD7Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
	b=mnakX4I1aNB4i+/RuyIz6QBaC5iPOqzhi0l3DpewJjvXErwTNgew8igvgyXlAzYRPrnf
	 hdOE+YOvjvzufeBNEx5AMWpEPxa4LeFT1xsZYhxolRQAg1iu7BDmzqq1tjUT9HMejGAvA
	 GazOVRcqCM0vraLjJyAx6gAi945bmHN5OThiouX5tTq7dB9faZMd/9ExmcbYaq1MmVSkE
	 OCAFTQfJcN22+tirgtyIF0FdCL/VbC6Q13aAiEzpWzO5FFBB/pY7kqvGjQgEH0w1JD+5c
	 dkWiL7cwxYO1at13J9hi977uwhpdbT1sFNDVfhbpZRTL/b5IFa6tN/BqUSjtP43vd6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Exm8y9+y;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E998606A688
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E998606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Exm8y9+y
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a194350so435493266b.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886543; x=1796491343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=Exm8y9+ynhuTQoJHe69NdeFLgDUJGKHApGkUjF8ImIMNEhtKnIzmGZdIihXUb+EfVY
         4d61Jn6zLOoFC8dQ71WEJK+5LJDjFSnCrfKZiA6FlmT4cx5HSV4+z4cHPSrsugW1l4gk
         Z9uBoVM66nW1FNKVSzZLruDUCv08wQiVGjCFNhcYT7UlSRgY80vaJmN2XPMAIyNTVvNn
         KmeVzt18YsgFIPSCEMrQa2ahj7siMgkmhGKKbIHOFkz1qobdKBOWcZi4vylaEs5FSWRZ
         k0BwUO7hA/q7R7lhY7jNBnjExQvpPgCB3rlQ8AvuW+1VOHfMC3tSBqj4HcMtp6z1pgEI
         HyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886543; x=1796491343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=b8wbRQVHkYwSaOuuLdWC+btBPriM+anELTBn2Rx2yVZSGtZOV1oiiY45AKwRZFO6Mk
         mpf4x+YZCClRDRlABDpfvozMpUIs7gFShESyXIlw3bpPD+UvYDXbIZYeNwuzBXHZqH9l
         oM1Ut4uf9swwrqZxixBS3gBLDjYs1uFSlZyNgBV4HkspkFShImZUF0ov/O04BbhvDujK
         nux1j3SiLk1VrWIJYQS8LCWlBH/Sw6uYhRGjDonWlF+ePs/+EHwIvhMSGya3m6t8JBby
         EAdyjj7SqvYdpjlYeUHsKoKZtFYJBFv+UWpOXOrDnBfnY/70lfY5k5rmirYWPJkzbp1S
         OzYg==
X-Forwarded-Encrypted: i=1; AL+hErFIfLYdccKCdYMkekIMTO9/XD/EG9mMrSdL0rq5wNC2+9w8BKS0p57/QuehqeDVF4OqPb2LVxxRsZKX1Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z90zVri45bMuHW48LkzY5hMbiQFySNYbwOfGorifaV63g3HE5yU
	4YVM+uBsAyYM0M6xvV2b030HtaJAQ1jBLjdIThk0IiM8xHoWTfKQ/Dz5HrHIHHdCaw==
X-Gm-Gg: AZFdTZds/4p0tOcU+ao/zkx9lkqwtGyPq8VXDj1JokOIim889xFcZIrxqv01tybe01D
	VykSxIE4f05gRDqPfhnjek5oTlx8ZXn1eluRFu+EkS4YSpX9BlP9boq5nj0aZ6onTAJvV9Lsiuo
	gJ5zlMBSWWKhV33IOHr1Y4oHfi/mmasxZ2/5dXePaYUTui+hw9pVIIZLGSlISslPYxdp/C6arzp
	OLwVkcM3uK6RtrJ0L8JjZ80kRrTEnrTgV8FahBu2wqB+i47Unlb/2ICsn3MhJSGu39NY0Mwagx2
	g/yVfChm/mAVGQaP1UXGL3CmAWZpPWv8wRr8cbtaxKPi5d037KjpqU78YRwMwaU13L9RCIvT/zW
	cZg+wVJaJhFL9LQFoEoFL8qT9/jbYzexxMCij+4NdPpZPcLhD69ytnb6VsclgsGAWv1RCnYJ4KO
	bIKzXWRRNnzncFZdFHtb82eN0B5tq8t3xXOJaH9pF0bKJWTMyo4Qbk0IhDOewvppx46DsXlTAYW
	CcrvGB4RBtzLPHisZzHxHqlFOohQ5xuP6x18tYPKzAsggyxYwC44TBU9OSDOcROF/jEkBlvcrd0
	PVKhQpjQiTcPiXJwI6oaI2Afn0QRK5EwhwGzpeosLt8epn2UV5p0eEcxJVpLK+yklU3/Ud2/8GO
	7q5M5wAHOVi637k+hiuv9rUvrepTjz11TF8IgxbEaZThj4TK3i1lhzlMcUn18rQ28syhKEh7Qjw
	8VDXYAciLPRk71ohIG2tHvZe38DgA9P0BPZsE9FOnrJO8H1yJ2mGjYPbOxJvTx4s4FfckO8Dc69
	nivKpxnxlpDXiG1THazRVZpZgr69HUHwPIgttmCcUjfy0j7gbfGhgJEqLlDUiahXByediBtKFZy
	wt52XQejUMULGA==
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr2391973566b.40.1795886543561;
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
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
Subject: [PATCH ath-next v2 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:18 +0100
Message-ID: <20261128172220.922376-5-julius@bairaktaris.de>
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

Found by an LLM review (Claude) of the code.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 516856c531a9..9f6872f2c8e1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2376,7 +2376,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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

