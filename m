Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886546;
	b=RjzWwxxan6adGJtPdfgFNqCwHffQf5me+LiwvGRmJ313LEpYGR5e1RTcCBHLtohrkXpg
	 NBcpctSxMtjkqwNGS3PPdsH+fWGwIZr1rong5Gz5v4x82i8aYAGgoyGmeqyXeEm0k/vug
	 KrtLNT6OQ/4O9AqrXWcFZx+A6fyGbDYsF20qH+SPCHU3n2Vka0q23ppgXmFtDd7+zZT8H
	 xIEaTCTeOH2TcI3vdhD8zXrnUKhCDwa5WmgBSKTsYWZlgxlcI9nPQKaSkq3iabvXvjsME
	 0h7HrXkEykpt/767pMnKAkOGCqYTmDS32pSsLDrWG75bKUgYlMuj45pHBDvXSR3VtJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
	b=2/Gu8CdgALUtBDwen6Wwt7KgKAeGXqNCkB/VTm1YLXYdMUU0bV79xBYqx5TeyZ/j6t0B
	 x2VAg+QNjBlYgBdyL2Mw+i+03qkXAC4+O4ZqF/acXxpJE3KD9B7ou40U48IWZLYa4GlT5
	 XxWlIf/XOVkdWi07TDJSKcdJeaSa1QH8pv3ZZTIDz5TcTp1a8Q+jphA322EV73J68yZ4e
	 LUZ3ixQ0A4hptPgielDQzxN3/EUZLrgucKlXY6+1Ao8Q9HHl0i88IMGrbgF30DU92wq+Q
	 vwc0nkwMTjpbF7XLIGvf8tm9CDEPg8RdDhv1duJO4vvpu9GXQAwo7Sh2mITYo6PeeUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=zz4xOAmX;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93A606A69E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D93A606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=zz4xOAmX
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4395d31228so1555213466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886544; x=1796491344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=zz4xOAmXQNYV+2+x9ob57jhu33PWTfTPaAIhwIr6m7SMwI4t+Cl9VfYUkmhdbzoypc
         rJMro9ybX2bdbZWPFOM3/Y0pdDK1P2wsDZaM5Vy0tAFkkU5/bIZG8vHMk9kTTwUxe96V
         oNTRqh+BcQCPe1u1/qN8KPsDkWbwoLZrB3Y7mj6nJsd/FbpN+EWJg+GnAL4e9tSzda+7
         PoLp0aW+SEA6J+suL59q4l0yZEaN1I6wXFn5rEntEOsa08X5yHnY4fH5BgF5Fju+l2EV
         bPfqR7e9ahN+BIhSqM17K0ZRRDC7pxaYsGjBPMnW+NQQJ8tDHGUeOzERmVj7m6vUcMap
         EGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886544; x=1796491344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=RNnHQyWZ/s7nUSAVE2DWisn9tFK50XqhDaors8idRevcffLaxuwjsHghwvzp6ZZ6dG
         SKsZo5g5OX61ngZtv6LBPJK2T13R/1bMgPW0pqWsO+tNzB572MNbP8qiFUlopxQ7sDxh
         ZriFzus6Jg7mj08Nz5c3W3rzrpLO5BLECfMLO6kGSJ1M1LcvjsQETICVB0OkBywMX0PD
         CWw6AM6LH9t3K/ZHSovnDLn7s29zG/NNZ0IRNHm2ywEVF44dmb3EdZ+t/L8G2m/s+Tsr
         /o3YEJZ4OAd21HXlaa2enBcOin9NsFlajNkqxzXqiKTEhnja9YbJE/FwGV9alOUko8cU
         ErKg==
X-Forwarded-Encrypted: i=1; AL+hErGh3rY+jtnFvrCODJthHjwUJOn2xyS3lrolq/KxNin1yW4ogeDbI7c3buONSPbTGn54tP7UCNDBW4Xivx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4wmtOyn+pJUV0zc4MK4/FJfUMD5+3q5Lju1wTzjTlQ+S37YYs
	Ciz07Wc17Yd6HxSwuKBd9TyB+nhUo6roiaevHtJaMa3ZYw38B8e66TErtECu6Sxdtg==
X-Gm-Gg: AZFdTZd+KlUEZsgpniKgIbYoym+AKJ3ypSAB8Ym+XsFLhXFEobsaR3VLM7yvLlVgnxF
	jRAfRTNDieBqvG0WK3xqHzAUsGajNeupPMHwrNyo2QMwPX0DR/UHrad2+XL7M7NjmpZK8u6wP5M
	dcI0ijTrZakLgF2X71QR7xSRT1p+rMOYbVe4oGTvBWrNO8GaJ/EB0esGUE8dBxK0/roerQexDyJ
	wIyLcGN4Sgjg66lpuD2UgMOeM/ZDviyceanhOj84AEpWtXqk1KYMERtzqQWA+tDazmo4JeFjx//
	CG9g/IrG/RoW2M9Dk2wRfbFJoitWVuxBx2bbfSfptJthML7SHslhKH6dP3cZmUN4Sr3mSub93Rm
	1/ELvOX6ZETZCvDnVvtnqXonytpoFRtUVXI8IYGkHkov1QuGRW7FXxt6LrI+fAvigjz31EiHhQB
	wW7KW+m8bvgcG5lYjlQmwbuM0aSIOl3mRrA0ICgBeR3guwj5LnaqzA0PyvbnQN0UqLj6snH+/1z
	JNm0WUTIuG4QXrGanEl94t8uEIce1IerFPrMudDge6Ac+d5GmGz9xna82HcXP41Om/sbo17sHRP
	pBXkwJkyk3M9uymL+Ac770JPjkhKUpy52OSyrEQAO8k7DyMZPYx/0PtRcJKsPgmRc9J9mG+NQ5g
	vanyINjEfSjpvTXAiaN+8zdlmWfMo2QqrWbmyHKNEGHXaUo5K/7Zy2tOxE8Nnni6AbSA2zuCGlj
	p8RxYEoz6Eun2nkQmvI6WaNKbo7PxciqHQc4oc2mL+yQVmzpojDb2KpgKsHmL4ZJYBqry/Kn2sD
	6FdC/VqT+YUGb8R5IrwdQKpq+hQweMRS9NFVSFWlFZIUaiMPs8PR8vwNWVvqrpDmf3+qa0s8svB
	cbQ+ZnHQ3hPTCQ==
X-Received: by 2002:a17:906:eb56:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c513aab5575mr1784407366b.40.1795886544488;
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
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
Subject: [PATCH ath-next v2 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:19 +0100
Message-ID: <20261128172220.922376-6-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_process_received_packets() keeps one
ieee80211_rx_status for all MSDUs that a REO reap returns, and
ath12k_wifi7_dp_rx_h_mpdu() fills it for each of them. As in ath11k, it
clears RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED
of the MSDU before, but not RX_FLAG_MIC_STRIPPED, RX_FLAG_ICV_STRIPPED
and RX_FLAG_PN_VALIDATED, which it also sets for a decrypted MSDU.

ath12k_get_dot11_hdr_from_rx_desc() drops RX_FLAG_PN_VALIDATED from a
group-addressed MSDU that was decapped to Ethernet, but a decrypted
group-addressed MSDU in native Wi-Fi decap that follows a decrypted
unicast MSDU in one reap would reach mac80211 with
RX_FLAG_PN_VALIDATED, and ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key. Whether a reap holds such a pair depends, as in ath11k, on
whether the firmware delivers group-addressed MSDUs through the REO
destination ring.

Clear the three flags with the other per-MPDU flags.

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fa591a03ecef..e37353445749 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0

