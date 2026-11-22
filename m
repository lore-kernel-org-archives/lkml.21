Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354952;
	b=XTo8ucwN2TW2aRrhYDfKw6jDoeGwvFbOBPL/CGGY7vTmvH8cyDgOqOPyLcMAeeCxZjHe
	 45sd24RjM7Rit3lWMxS13Gja9MiPJbbqeDsBMKdI/W4SoE5KCyJSTeGwBHqr31rpt8EMs
	 mhpMfdjchtwMzO+8JL/eWHzPnBNQfYphdHJ6Nz1WSv/MKnEKtjaQMHHfZVez9xl9KNxG5
	 ZC4Ys0lEzP7R3O0dPae9CjsS5XObqtL6CXMgHLpmGZ9ENVmjGezT2djVog3KbL0xrxeTo
	 ySNuAumBhTESFHLaWUuOQLij+ZeqAmxZGo3/rhguGXdBJf0RDqU1rfVEAq4DK+4z8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
	b=aWm+XERUYnqvgZdJkOST42pqOQruDjuHxo4/F23hsspyJuwTY/LarUQkpPztG44RQWz2
	 TgUnUWlAoHYcI6hAWpWTrRM36OqEqYlQ8+2o41AY+Gh7BeCsLmnkoZmPoSfL0c1HgeEXc
	 XMEfcRcS/ODtSfmq6TtqvHtPQNRIK+3gtRyf7m1vT5FLwnMy6xETADeweF6nJPPtX0ixv
	 7IgTef9TeOrD3W0ACkSLa5c15u1ZWnTVnFyPIl5T/x/pAwD6kn2XJnZPJALXJJbGHwn87
	 7uvhkvwUmKXg9heQ9AOWxA0eZpBsynWTApTdEEaLIgxp1q5jDatTJ2/75v2MtfgJINw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XaTLOvXB;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E9606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890E9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XaTLOvXB
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d427836e9so338219866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354951; x=1795959751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=XaTLOvXBtGe1GTurJwUECWEVzZUrBl0CK75/PLgq1My59TyDTSJegqOOcVtsLZyr6s
         MT76FLj81pxsfp1xp1oAdKCJjzg/AoFsqr/gQ8wdkIsAj7Tn0vNCwQ3KtPKDce2GnkZg
         s745hSJ7NUxbifOxzQX8NA59mjgKdFjb0rO6OQJibtpr0vFVr72J7QwVuXDkSDJb7llx
         MqDSlDldSwN+CPLi3nILDJeCtljKjomqq1XrnoiYT7aWZx6E8usrt61AfYFrkSASZp9q
         nbRB3FnWLtvE/WGqz/znJ0Dk2hT8P59sd0doQdMHo+ez+SysRVAyr79/0UIT+FSit1cw
         H5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354951; x=1795959751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=zmOPocM2SFuqgEMb/miY5jKQ4Eo2LKPZZAOV/aZfCR4h5QUbPdqcIx3QkliicF7oNt
         iQ/s2oNtBH/SFbbiXWirh6gpgWnINA+5hst0AmIlaYr4jPpWIM2UKx78ruCOoP5iRseG
         JwBxDszA1dwCOPqQ1WGamuOHbASiwpsMOS15ih1rkSQZrDggX1/F2qkHxaeMa7P2ByMi
         0a3B/uI2VelQ/XBTjn8crc4f46qGzsICUp7Y6X12KJtttNvXHzggjnEu+5Mc9bFC82rp
         4ve58xRQudMq0yviguvfwpnvutNy8wLPvEZuyzM6XRjB4qZhbpnukzlxlukrrJN7E8tp
         +W3A==
X-Forwarded-Encrypted: i=1; AL+hErGxdY2NODzVAfp92ODn6KDA9CFgtLSn5Hi8QRICkUcEPg300eV24gQjidvWGYICSW2pQsIfUyeK22ZYJF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AgYhu17o3T4FnzS1VPhqitbgLKBs3wl9i09RrxCvaZJcIHOmy
	q3Sk+uElCEMKABWFjSt6oU5bNAeZum+Lyopy4StiDA6MOwGOi3zbNshUthVUlI9h4bRsIBHf9/A
	w7Q0pp2dU
X-Gm-Gg: AZFdTZeJVTcPf/rVZhEJ3DNJfLCdW0P5xcCu4ILRGU1JCfSDk6IR8P+K66Yk9XLE4vn
	CKM18JdLqk6zpwOYK8HzaWy/fLG8huQF059y11YEWbNpIssZ4S59xwbm+Zu56puFw0YEHDL1Vv9
	4n/M1EybpCbbqxsaw6Eg0LjFEYB61EOXzRdxdI2UBlEosKIgEF/KJLvyFDJbAmG9/669galcrZ3
	d1U9+Aclwl3rRWXLESniLQZd05I6OInzpOR8AjNsyWoJ5BAfG9vPhr+7d106pTXK2T3l9+sTubt
	tdWzsH3Nd+9JKYbUur/CTOCddP74kXgKNgYQl3yU8KYhvyEIriCi8ugkoEYAIewKJ4u4sJB/41F
	Cm8rgI3kp9kP2x8fHhGp5XLLQr7B1rZ8smntObp6JC+U749ky/9Z5AvZz0GmGm0sPSW4miT2cBh
	nxpYQjtHbtphSYwqV6tmnY/a3qIOIvFmvCqW+TZbl9Lbgc0fWyUh7m+OIiI5Us2c4NbEEPxZKi9
	ZIZs1OAZMCuVz+Fn6vsvXHzvLgEwJPX8E5aMuXYDkJo+V6pIrMmBeQ9dD2I23+GQ8iGDF5AX8BB
	BEe2T7ujx5WU6N/jxd1XgXxiYl8pD6f9hhEBhAqgu7HL1cd6iTmXaRk8EXYdfcm579Lvch7ltIh
	mc8iJbkY+9zEyjolwP9QaaBhCAEXNHn0t5vmaUuVfHY2Dye4frz1nEHQ9ddlduFFxLKR1CYOUYd
	DvhVhNCwXQzGoRByJuYQkGTXwLx/0kf0R4gK+fNTFg3Ox4AWeXh6msNlbST5tno9bdK1TAROu/g
	w3Mm6skXwT+UINb0JSvC58Yo2YSDoGQ5PYMV+3tm2kvAyW17QMK+TvTl8YeASO6Pkpkagoiv7XL
	pFiZlhOhY32iuLvBkUrTCet2qEp7pwknq0RiW6s/v2+AVGSqjuhu1II=
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr418956066b.16.1795354950990;
        Sun, 22 Nov 2026 05:42:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/4] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:27 +0100
Message-ID: <20261122134228.956044-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
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

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the REO or MPDU start descriptor into
rxcb->tid.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..7235399c5b39 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2493,6 +2493,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0

