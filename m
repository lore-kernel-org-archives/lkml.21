Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381534;
	b=42Uaag9A3w9F7W8DU4nj6uzO8Bmk39IcVDQneSgMy7rDT+H03YcquGsJhQjFiAdR7+Lp
	 yngDgDwgsgYNbeld8LLetmyiRgE7CYT50WRyZsau31aDxW1Yt3+EKsTwW67M/+LdveXlO
	 FictKQ/WvX1XX6ZeRrOWzHHNHwTpVadQ5Hk9W2ayx1esl5WFpcYgJdAOWdhNWpttIYmwi
	 I1vgvNYAdnhLdYQ1/17JhvTJY+LzNSfFHjS1qVD+EmLSfbD9Gasdt8DLubDon/yRgs2eU
	 br6Nq1G/859v8dFS/6hhAjIsFZSgE7NNoM8HojfjKegcxV2hsTxJvcmwHvsUs9zr9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
	b=qKJM4/CY4t27ZO83g9gfZkTFe6xA+rYQGrsFNMzyHqpe6ykdVlmavO1dT4SlNn/g55v/
	 6W+mpvs6KaxOuR3Bk9kCaojvmsQORUHvlEtoEoADZfYYr3gJL4YQFGMkPDQf+KGukIZ5E
	 s/+pQ1NbxGQt93NagAP4czv+GEW4+hdUk9pqir0R5UIxMswbMYPJeeGb5SMk4MEUX2fmY
	 YYDHqeRU8wr8RUdru5M97TM5r9x3p8ehuWSmcthu641ifzX3DqKDLNpH13AJjE40GMlGl
	 olou+5TK3nM4i3mnarC045LOcOGUoBIX4BfMOZYyV5v1PJgWEjzT89Pl27iWPihlRtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Gd+gO5Hq;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFE606A6AF
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CFE606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Gd+gO5Hq
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so467910466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381532; x=1795986332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=Gd+gO5HqqcCuFR32X+85Ydy0Qi5kmm3KErC4ttV0moc5Y/10hlYXNxrnB3Iut+Cf/u
         xHklT8nv6iZTQ8NnwemSf7KyihF6vzXad/e/m7rKuBwAlvEBLHscDiggZnPMqJZoSfJx
         J7Z6yVkRFTREbwrIt/5ljNB7hP3QZI9io8lFeDffsDzd5RNPo35A11y/P6zUj1+JmuR/
         C4RGOdt17NS6xGE98diIyH/zNZI7iiLQ4m022bBMU4BYt34oSKASY1fQ/xX8l5pPfGSB
         kAtQzoY7qEbY+5cAFRwXQHbCGVR8qQc1+DVMi808Qs1WzM4w9CAVWXjs1w5kH0ARq0Q8
         ylOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381532; x=1795986332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=LB4hCSC5SqwLwW9mqEorqqw5sw+buTiV+AeX51rlXy8Wsd3tY/kZB/h3V682BvJ55a
         Q/qmMzll83DmXVYMwDjcIATxzgQCp+3C6E3Myjeiielda2moHTcJeFVF9pHOBgw05ERP
         y+0E/AJ/bwqp8f+QxsBT41hRZC61BmJN962TsTlEhT+VGB4UbyWo3Q70cGkopVoLO4cy
         lIRsn/ksSpG/Sc/pshPyQmA/VHf6Qb/2UjIN88Mlng3Eb1Fvrv9yJPwUkVkPndYZHwHd
         b+dJJlV3i4g+opow/kTrtGqM67vf9jcQBfSZ5yoHZN6asz4DvnAf6APJfbFXPnM4ZTFZ
         J2zA==
X-Forwarded-Encrypted: i=1; AL+hErFGlINIr6ZypzuNoNB+opcUEkbJ+Gb16hUZ69IEguDiK7a5OE+ei7IRL0wBj6axOU3k+akg5Bc6MLzcIRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5iBgzmLWUQ15B3kVTz3kIjyxbuFUudOXyIfQ0jRS8zFO25FFE
	1NdNFzQba9T4f9+mBV5YWdQxKlqs5EGvVOkDCZnEvEQ6ZNFWMRJvJG/rZOas79UE8A==
X-Gm-Gg: AZFdTZep674iTzByYSlDT7w2Fh7t2gWI60Aw+TiUC/qb4MKUsnaMlnD35yhlOATd2w4
	KkYNFkR2I0DXeufKhPv/1qcK6ykfI3dtyEnHxqFHb9tXV/K03T5/Je8bOpexszQoTuyUd//5jnb
	fiQGNgOUVGgJ5zhsinZjgjpnI+1sAk8/XaL4pspOF3Tp0f7pQNgdwJwkDoVfo/HeL4qIWce5NXo
	TzhuHYRM8lKVwD8zIEueuykc+U5WTZ3K8MDx2Ll2IOT5FnMpAP9k4ks2rI66uGDkdR5Uw64abfV
	0YRHMxuN+84yjNpnFDoShnOHccHZhvyLRsJltKx62/TpbmYBZzixLv6IFOglePvBVxiSmyoPpDq
	Xzv6GAFFV6yMHHQ7yBUpnOvKOPzu7Uo6wDuQ4oez7yFtYuEB6Qz00wNiQZQXf3w/zhSpS9zJsx3
	sAz+9L+T83EbULY22s2aiQEbcxZNDca2iqu7KIDAdpZa4Iu+mcAgmVzM1Wh2bKEwbdkUJkIi7cQ
	BmHY+OkB7y/JVt4azuoC/W2hFo6sIWCtUeUvWNwnILwqLHLvhcJEpW8ePM5dvfSKXj2z/CdFKgD
	mqXdhM7s9F9V7VusH3BnbUOlKUpOI+KTSVutR6Hk0blYaJl7rgydSt/H9yuXYd+yW5LLjb5BzM2
	UCk7kBV1fNe+MmlQ3J+7bzrDAgnkgGvyP+FC4pWIT5/7IKaa0OXIbstFLjlTvyLgo0Hft4n8Xi7
	InRKd9zvCUTuXgK9zUCJuyWwDB7hMgQly8bq3AVyfi3xpann8BMiioeUjZ2ad3g1QtW2cO5l45i
	6ZSkaO7Wmnvvw3kwMGljl29kgOfbPXezuQpQKfck1U/gRs9VIF/U3RiNcuyrPKqmTS6gMpHkg3m
	Iw3U9aQo2DNw/ZXAnFmT+ye5ZigIvxK2L0jtKi4iBJIR6IetfCUx2fvbUUVkRyF722KIWXh/FQ=
	=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr894924966b.4.1795381532562;
        Sun, 22 Nov 2026 13:05:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:31 -0800 (PST)
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
Subject: [PATCH ath-next 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:24 +0100
Message-ID: <20261122210525.2076058-6-julius@bairaktaris.de>
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

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 4a57d89669ab..fac60041d3ec 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -411,7 +411,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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

