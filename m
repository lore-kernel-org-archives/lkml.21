Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886907;
	b=DLU3MuBOwyHxViOh/X2/brAQAQ5qklmFRDOGWVsbKMPgDBtSYwb2vyqUAfKoODpXvp+K
	 CJyvKiNz74W2k6eVy7dni/bmhOaHqOEc0mcJoNf3JrBS3pdPSNRn0/w6sZyEyb5Ozqyv5
	 ZlJUpsSJadAzK3mw2moh1PFEsMtWk7vDqGHEahIvGYcoFHgwhLkGRo4UCFqvC6zkx8cZc
	 8qOc67Qk9DOcImb/A5PCI0v5hocUM8I7b3dTy56lrJZRl/Gg6keUQT24dOje2w8mp+n2x
	 egKAkDrN9TrC4loJvjMRZplzo9BNnItpkfv6Ltn4RQPwNY8LFXK4RK6YyNd+NKP/QYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
	b=VMGe3IcwiSkLmao/7VrSz2iyyqXCDHtQWgjrXeB+FDTcUJ+dabZqQYjn7eVMbQFkv7F6
	 l0SrExBQaZD3T3UfAW2HE44xyboL6usUAqbCI70KebA83KvtSD1Nyi2U1AvkQ6oES9yKJ
	 xRLu0y3a1b60qVCDj3iEf56bS/3aUrwPIbUz/gomsm4MlL/VUz2PCvKsexgQyUPOv82ka
	 qea/tJ0MH5y0RDS/pL5Qt/uV3ntUMnYh+zv2DvoPBoOQaJNMjGZSE3RSWxH0wsg0RgAAM
	 eSdS7Qk9VzxNZdifW2X8YCLRR9W2Wmlop9MmsCaYs1aYi9KuJ2bfAhOI27fNoRdz5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ylRIPEyH;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F6606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ylRIPEyH
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5118deebcfso1357919966b.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886905; x=1796491705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
        b=ylRIPEyHAyGcc8MbQPr3Qwm1eo4UzZNOYmxDQDQaTHmomhKp+T5wtwmAjvIgN9fzin
         a4A3J/MnaUs5CC5rfc0bFMGo2e1P/67ETvrMhM6tk2QYyffSR20nA23TQUN2a2ZuOLYj
         +kPWD7CM3o3OmneGaZSuz5Jjw31YXwsYKz9412HxxAvJzsbWMVxf7askXqt+hnEMfZ64
         RuLmKe1hZc7LcsEUsk4y9J3I3ixMMOlXmt1FLUb2D8gXZRAgDWV6BmN1Ky6oGZv/0R+C
         ubiMMGjol3s6AFxKOzh7yl5wZokKUq1HV1V6BECNE62QkjpQnizC2ZMun8xxkcMu3fVi
         OICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886905; x=1796491705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O080aChkvNamwQRpvXuVq5oFlnHhJNHxbRaLnIM0Xus=;
        b=OyR4QMIPZUPPNAts/CMjv0f8KzaytC3UMZK1AJoYX19VL8UwIOeu98RFhZ1NHXiUMs
         YfCbY4PIKGAcCVMgIKD9/p65hL8KKU/h2Hv8Hcvc5CYNlRI+2QjUKWfhgy9Y9DWnRpTQ
         Yj6+sWFhzsV1fcWlMQtvHV1dLjqJfUy/jcA068FNPKAZxOK/ybMBwjVGUzH7aIdDKM7o
         Iow7wUBujNM2UY3AUfs8HEnRZoaev8AFcZqJ9nhIjZPzvyoBf2atpUkRR5iDDnvrwo68
         tSsETYcT3NTD6R5xMcybdH4hqhrTDetDgs826NpPwWCNT4JiIEe/WCHEBkk7zZHVNT+4
         L5Gg==
X-Forwarded-Encrypted: i=1; AL+hErF5RzlsFLy0tu11DMwxByUEaTayYOLf35zRYyysy6GE2oB9FBQaav9YYfU7UdoLSWGXwMg6u9qrdzqs16A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y2JSZpGxIvWO2UsvOAIxlJhnOdnFS9RNtPvlSoISlrhM1au/b
	8sxrMNnbhHnl/nzpEhmlPKR887/xHHdK85GZXz0C6wELPvFoWn8+h+xr3cFHaA/1mQ==
X-Gm-Gg: AZFdTZdGZE8iVMXrnZshN8MIufpvKvn1EXseP5ZApG2MAAevQzyaSfAdVO8+xKU4O7k
	zVxXBVMvTz7rV0kNa788jUosKrEBiAs4YBvS02CZK9WuBK3d7TxaCyb6U9uaWxRRvidiVhUbY0u
	z5WhMbgaIf2ySqcCED5y0JQUb4lFPHYNVJFXsvTWqZaXjk18SS8ovJ2nKjSp2tW7Zck9ZlTGNO5
	ikFopUPcc5G5CZuyNzKdEL4dFvNcWokcjUWWtcmFlHY77hvxeKcRefr1rnVXAhJ1wgzMaIhTSya
	4fEpCgA+12v3JbaGEwOPUdyzjDyv9xfK2zg7OB+sk70pWtNI7XH3NS9K/UF2lh6h5vy79XA9jj6
	SmCrrtJzAbAJfFSyPewg9e9+0sHitEi71nSR08ALLz8XwPZPeJpDeciyOtJxVU8ErUVwLIidZrT
	KtVvU++U7ngYKt2yytHO+FJjNID91VyWJF79z6+CoBac2Nx1i04cTHHnA6XyK2MAwgklrQqF4ar
	M73Y0KjMOSY5eeyA5NZgX/3KaPcNVmi8v9uwIY5wnOWWJOdZKTtOIVYyGuWp55Qpa4mEYDCVmo5
	MFZak9K1o5xoM7sGRT/0fC4iPy73p06ewYSeyUDSyj/HiCDMFftS6KB2FqU3XjrzTI9rODz78ev
	Dhcj4GVpG/6FyfwCjUEYXxCYd5Np8hq5NQHgBhcw8s+lLqBAoFNt+PmDPaHyKptpDxkLLzULgtY
	5VLyhKb44kzfuLptIpf4rDPhfefVbqBfE1aSejoVqgK0W+6drjlVskJPMSgHpTjIn3BUVh/fxdQ
	U+03tlptAWcO+U0vxCTWwikcwfISbMGxkgOsXiPCyY8ZAD3vE71JftT0Pkv2yVFvRyFsflJJTI5
	0IgZjxPF9X10jQ==
X-Received: by 2002:a17:906:99cd:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c5158a29e82mr1859064466b.8.1795886905085;
        Sat, 28 Nov 2026 09:28:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm976442266b.77.2026.11.28.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:28:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: ignore the PPDU ID format indication
Date: Sat, 28 Nov 2026 18:28:27 +0100
Message-ID: <20261128172827.1168404-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

Firmware WLAN.HK.2.12-01460 on IPQ8074 sends HTT T2H message 0x30 each
time it starts, at boot and after a firmware recovery. ath11k has no
case for it and logs a warning every time:

  ath11k c000000.wifi: htt event 48 not handled

The same line is in a user's boot log with WLAN.HK.2.9.0.1-02146, the
firmware linux-firmware ships for IPQ8074.

The message is HTT_T2H_PPDU_ID_FMT_IND in Qualcomm's public fw-api
(fw/htt.h). It tells the host which bits of a PPDU ID hold the hardware
scheduler's command ID, ring, sequence index, link and MAC ID. ath11k
only compares PPDU IDs as whole values and never splits one into these
fields, so it has no use for the layout. Name the message and drop it
without the warning.

Found on the bench, from the warning in the kernel log. No security
impact.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
The warning shows once at every start of the firmware (boot, driver
load, firmware recovery) on IPQ8074 with WLAN.HK.2.12-01460, seen on
the bench, and with WLAN.HK.2.9.0.1-02146, seen in a user's boot log. No
frame or user action is involved, and nothing else goes wrong; until
this lands, the line can be ignored.

I used Claude (Anthropic) to help write these patches.

 drivers/net/wireless/ath/ath11k/dp.h    | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6d..bace81c453e16 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1033,6 +1033,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_PPDU_STATS_IND = 0x1d,
 	HTT_T2H_MSG_TYPE_EXT_STATS_CONF = 0x1c,
 	HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND = 0x24,
+	HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND = 0x30,
 };
 
 #define HTT_TARGET_VERSION_MAJOR 3
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..c65bbbdc267eb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1747,6 +1747,9 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 	case HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND:
 		ath11k_htt_backpressure_event_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_PPDU_ID_FMT_IND:
+		/* ath11k uses PPDU IDs only as whole values */
+		break;
 	default:
 		ath11k_warn(ab, "htt event %d not handled\n", type);
 		break;

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
