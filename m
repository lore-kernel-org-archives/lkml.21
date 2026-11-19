Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048143;
	b=wq9bAIkDJKI31hxQ/XhxEXT14G3VsPMHp5RNjRxb+GGkuD7zx6Sw3sGD9g2ZARkPgMkN
	 RuT4L96AkjUI6qzzEfVqiOf0aO3NAIRvHqIfxFG6R0cW4xIADue9946NRvV0GDf65X7t1
	 GzgveUC8D5l4S37MeeoSbFgnDHyi4dhcB2DN/iByI3YEgXicoA+0/uMswNqoH9s68HSMC
	 g7+ZfiPgXZbiHzSRIhhko+sFL9H2JFBm1slSBV+SOnzX+CvvJVWkUfTE0SPrwNbVg5Log
	 62NyYtcWokNmt1KkjYjhwgSgEzz80oxOPvmsoDu2vKzOEy606xnxllHOGS+WXM5nBxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
	b=FQYhcI09Oz+eqv3t2Z3MSsvD1AEhlZGY/R9hvSlFvnK7i8n9Z30MT+0A0wMya/v02ATq
	 SmaoMy2sS8RXwYIJ/GLTsmgBkJkDLjdloJXLvfigvJDjNyX7Grd/QLXhgQkIjOzc9btzt
	 asRYDvqNWenQ+Mk9v1Gif0f9L5iT/YfcvELKmwV7bh26y+GlMsEZnwD1EVW/pDlGU7dZK
	 VBuSYlSCQQlP/bXBx6Yfif9qNo8imDhjjfO8kIRRgBMMvc2hdPazbP8D7WiUAv7FCRj09
	 6BLdJH2sdXSvqgswv1TFdxoyXofmXQ+5wOQMIIDKm7w5uw0PKw+UkB+AAbosuF4dfpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlNcw2xn;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlNcw2xn
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-921159376efso17192076d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048142; x=1795652942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
        b=XlNcw2xnk/10XWBzLzdXEK7gMeMIwJgcUvEof6sAs3/o0Dti94lREoWLuPJmVHFKBh
         thLgGEHsU0jWV9CsPdGD5tv4ohGiCWu3vfdNptKaDo+Odw2w3Z4Ar5hbc3rgWGfazpby
         8FWPwOD09yursNaClJ3mEKsGwe6iORWfhSdpJS5K1mIBtqt1SYKRYBT6MtsvEYleatld
         SV7pM4BFIsoEsoJQ/HUDMMvYLWQNV+seVFtllDYgmMIAAa5JwhswoFnoaw+2RaIYhSZB
         eE/O/hw2eVNBDjhSQX5q2HpbX37SR/l2ZH5+/UMw/3igKAH3I6DbAdfjbxwEOoRvqMM+
         TS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048142; x=1795652942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
        b=o0EEVIdVf7YYZ+gej8hr5X28Zl4vHM1Hcv/NXcfkscvS+700LZIUbC6FaVtmc/njM3
         a5NBIxIs/Wtm55Jh+wFYAcK8bSMdzc5Hsudixq6B/SB9K+9T3DmX1ZZY4Z16LM3SSOd0
         wRoPvyb/zX0jo/YQVS6OyliB95fW+TTSBtUNl6kG84LZkVH4qaPrv/onbZwYFsxq/UHz
         wqY/TL6XNtKFR9h1AZXWBRCcNnwpE6Q5131Vkn/aAUDW4UTnz4wxd4rv+HbZi/6Khgjq
         XL86ja4xOIz+t4IkdzWhu1/Q4I6Qb8+cbW8edH64fVZirI94ndQalmOHLnJgwCyXSuOK
         vvhQ==
X-Forwarded-Encrypted: i=1; AL+hErEaQTFSjOlSPkafXt++2WwUWxWe/uh3auLjHGAo5DFnb2FCOsUIWgxFhSjK0vmASH/ZNpOHG+RmX9Ka/70=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y+jC1YWbylYEPVj85pSbxVwSlIOS0u+WKuW0GFPCahlVVKRWn
	lofK8KMLkmo7KNyDP5Y8JApkylUqxJNQdgZXCN02kS+/ryGzg27xkxCP
X-Gm-Gg: AZFdTZe4VB6LV6vaFxO38snnV8P13xAcqioXDsSpdOxv156bdqsY1uW4owz9yo7o45k
	PmpaC6pGc6UVyLGIBw8CAAURK4g2k+I1apJeJqRSMeXCuwnVpa3NcGvZ4CcOXDAsD2P0pa60y2m
	DCNaXM0Ri1mVW9i/jp2owtoWg1FEgdk20uVwU1Ru/pQUS+HqOCF3lvMDjRPCew49MZ7PXqJzuRx
	nPGdbF4mTLjofmtYBreTptfKQebRSUEe4U+I+apWpABczwgSKcqt3H8B6zyQV76cuXfHjpyzOdz
	F94w/xHBjgs61pPwjkJEiLd2bE+H5P5gscsFUTuGbvoNS9gTSjFgrMQHKJtXMqRBop08cHYxMuU
	xyLXToIL+T04iA46PZaNyJlWEbkMMb8DvsRcgUw9GcJbN3ZzGTGMmulZDdWHh71z7zJTVY4M/Xd
	8ZWbxd/MZhS5HqXe9m1XxgoAxp0I7eq5Gz9dnlUnFYaXjxksEfvivOyuynhmoyoEqeYXfFq5DTw
	7SuxyI4vKuLFH47zaPEKw7JPqnVIY1wyVPSSKUsQd/djLt9/XdknVw4epYSdoUcg3DEKu6nExVh
	qeqIIbCMEwuErEjyQafogdDFvcuzcKX20ky6hlSsVygBPxo0TR/y7GbANRdanC3NOOa01e/8Tw6
	4N/7wdhBpHXnR4pjuHo0Q
X-Received: by 2002:a05:6214:4306:b0:921:122b:80f0 with SMTP id 6a1803df08f44-92114f90a80mr69392036d6.46.1795048141981;
        Wed, 18 Nov 2026 16:29:01 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:01 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 0/2] wifi: ath10k: fix leaks when HL TX fails
Date: Wed, 18 Nov 2026 19:28:56 -0500
Message-ID: <20261119002858.425666-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

For SDIO and USB devices, ath10k_htt_tx_hl() leaks the msdu_id and an
skb reference when ath10k_htc_send_hl() fails. v2 splits them into one
patch per Fixes tag.

Found with a static analysis tool we are developing. Compile-tested
only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB and W=1.

---
Changes in v2:
- Split into two patches, one per Fixes tag
- Target ath-current instead of ath-next
- Link to v1: https://lore.kernel.org/all/20261118052116.3901761-1-lcy8047@gmail.com/

Changyul Lee (2):
  wifi: ath10k: free msdu_id when HL TX fails
  wifi: ath10k: drop extra skb reference when HL TX fails

 drivers/net/wireless/ath/ath10k/htt_tx.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

