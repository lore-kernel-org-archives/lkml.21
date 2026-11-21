Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278995;
	b=syad+wI3ff8PgoC74MGqLbMsQPlYobiKZgMaoaAwEjWTE4Yn7Wxez5WCnBvdMx5DfFvc
	 zDH8RVQqVCPLzSSInU5nopgHgvrQ7e/AFhK8tsQ5Y/Thvicb/p6ZM0/FlUb4VH9zcot7C
	 IV0Ox9sWNSnF7m0IXPE5V+tZpfSCNx58Sq02i1VwcKjt1JFPv8TF++WustBuUYv2yFH1g
	 La/Dwq8VfQo6vJZTM80bMHeaEkhU8oDpjQd2rytXZDDdGzWuIS85J2VO2EiI1ZkGnt8tl
	 KxfrxT90GmTTr6QFhYwIyQvOsOaVEcZVyC4kuAcUbLL0nvUBwTXtrRnrWT6GgjVrFhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7DeVTuQrYsASnJ+ymnmCnAG2Ji9/l6ci1SThhWZ6G6s=;
	b=fg/FeKKaHY0veMuABEnmJwGyB/p6Ki5puzWPQVxkf3MM6aSSWtMr3ApwhvKhQ+ifJ5sb
	 sijkVya16D/mSHkPxci0RAegE2WxPjmCR8+zMNFFDc4SR8tAvEMwlloAOk1xT5l8i1bsi
	 9yHki7qg0Bmtw99EsFZQYjMiJmHGvUaa1W6vcv1V3bmFaKPc4XrxFAEFYMT/mYhW+dUHZ
	 /Z+JIgajHpu2FQr8izTqDVwfStVZrfyVUTa9xrUpozyXvP9ba7B2q2MpupnDIfuYYvSmi
	 mBUPOE/eM/1RKuvDM6v9hT1WckT0FlalDpzsiawwSos0GCDcf7Qnx0GlbCGyntg/VRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEwVr+HS;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F9606A693
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A09F9606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEwVr+HS
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so970261a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278994; x=1795883794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DeVTuQrYsASnJ+ymnmCnAG2Ji9/l6ci1SThhWZ6G6s=;
        b=dEwVr+HSExkMLBvHFfNA74Q/D0EPIuEXkbx7gYIS+Lv21hLambcZQucOVyr+NOdvec
         DcGyLvEPSAus6Vkdbehg9v+we0k1gWzdUTm3mq/MIZSjprEhxtzKsB14yL0ZPJ2W+U/c
         19J8NSZG033JpeCkTkNd/7CsKJZM0uQXNupgw0lHpIK2/6+ktW8N7jp2T2A4ynHwwvuS
         WQ3WdRIz48hbv5MxB2DpmzA/aj1k1TXbRGMM8yZaY0gEFGGVIszQHgpBdJ9XQknhzCb8
         sTIY0sfkYGN90gwXLXwFkNBFd7Z4Pn3U2g60sxBpeLGMbRFfVdhWgJ/vbMnJ4BnQ6tHR
         5OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278994; x=1795883794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DeVTuQrYsASnJ+ymnmCnAG2Ji9/l6ci1SThhWZ6G6s=;
        b=Wx0jc31WD0K9UjJmTiUPqN/gxGSlmbF+nhklrM7eHG4bQsBvLKddvT2qDw1NLYM3wz
         l1Xohp5wdVwiFgrCsN+nLd4aR0alebK8VRc3uOX+vovyrabX7aL9kVTROQpZeFZ5Jk6e
         bQo04et7w8OJ67+lL38GNLgeCEBJs5V2VQukbui6cEeA6pQGGJ6nFGkPrAIgRmLlTWIO
         Ztt09T5lmi9XwSt4GknIlMlJA7bSJAVL/BA6lVPFtGxv5bUUPvD43K4ko/OTLZmpd0FA
         Mqku8elPhSq4vS6tQTjtTWVNhrnCP3xOVNGZb5oHAqXUQY3ZNjOHJvViR03dPRJorgxp
         x65A==
X-Forwarded-Encrypted: i=1; AL+hErFOWlh3lWt59KP/99PheLHTqEPig73ywxur6yMLCwn34tDLW1mwSKT4cJKrc1/8qt4AZ1+XNHY5FeXBE2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dqLD7/yrE6DvvCPmkZWkt1VBo50Ux/B9iHjNwCVxrE3DfpPGq
	7Yh6SWiyO5sDGPsvaWzimvRQ2HrgyBVIT7dcgT84qB3kRakx2rFV8Rnk
X-Gm-Gg: AZFdTZegMv5YSZ1OS5PXdnb4hZGwzkNtmg4XBtP6E6snWRrCr0Rtw45Fxjo7usb08dZ
	oGsBtBuTksnW265Ltati2TlOc8QIH9eqaHtE09eo09O+oJq1Zas3uVBwCEzTVjT+rXAKPYDtxjR
	Vy7hq6kXVrlsIVF6pY5cdZT17op7rerphCqW4irFJrtktBzHL9SyJJQ05dpaxi0DXKsoq21BJHw
	DKAIR7Ad/zxu73gSV2IbSHxHgHqCGlOGGbORetdzeLVI3+9iOMoVXQf8QTrq1sOqytAYinNALhW
	qmCqn+aeIO+rIRCnLkzXjQPIb0ydAhNS3vwoMgwmc05NqHQm76pI+kS+PmF6o8h8BE9yJxmXhsU
	gVnm4Zyori7D7ymOz/3YJXA9Ca/FWX7N5TYiTZVw+jZP6rTtYs5dnYenjtmTfrO5fRJr9EpvNqs
	a/pJ8YKCRxWz2iZJZJHVl69DluBoyLRofNAcN3IqGFwTGQDnCLxkM8Ylb1hmbKreULjtH6bosHt
	VtXV97PWfEY4NovQb1GrPIwPfIinTqLjzAMUsWsCWSGKqKDOqBmYV7N/sPMFleSFN1EoA+udy00
	JFZHhKgEDJsEQmCSLBHE1dh8z+z0/oHNFjb2XXc/54J+al77O/nMj16BGJmI6Y6PLetj8f3SMwg
	agPul
X-Received: by 2002:a17:90a:e705:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3b41c7e118emr6541664a91.5.1795278993908;
        Sat, 21 Nov 2026 08:36:33 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:33 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH rtw-next 2/3] wifi: rtlwifi: rtl8192se: don't mark unencrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:46 +0800
Message-ID: <20261121163547.37019-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121163547.37019-1-enderaoelyther@gmail.com>
References: <20261121163547.37019-1-enderaoelyther@gmail.com>
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

The receive descriptor's SWDEC bit is set when a frame still needs
software decryption. It is also clear for a frame that was never
encrypted. rtl92se_rx_query_desc() nevertheless sets RX_FLAG_DECRYPTED
for every frame with SWDEC clear except a protected robust management
frame, including unprotected data and management frames.

mac80211 then accepts an unprotected unicast data frame although a
pairwise key is installed, because ieee80211_drop_unencrypted() passes
frames marked as decrypted, and it accepts unprotected deauthentication
and disassociation frames on a connection that uses management frame
protection. A station in radio range can therefore inject plaintext
data into an encrypted connection, or end a protected one, by spoofing
the peer's address.

Set the flag only for a protected frame that is not a robust management
frame, as the rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and rtl8821ae
drivers do. rtw88 dropped the same assumption in commit 0649ff58a0f6
("rtw88: Don't set RX_FLAG_DECRYPTED if packet has no encryption").

Found by code review. Compile-tested with W=1.

Fixes: 84f494cef7d9 ("rtlwifi: rtl8192se: Merge TX and RX routines")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

834fc28d7880 (7.4-rc1) fixed "managment" in the comment this patch removes;
with the old spelling in the removed lines it applies to 5.10.y through 7.3.y.

AI assistance was used.

 .../net/wireless/realtek/rtlwifi/rtl8192se/trx.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
index b057d035a3a8..663f7a5fc070 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
@@ -274,22 +274,16 @@ bool rtl92se_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 
 	rx_status->flag |= RX_FLAG_MACTIME_START;
 
-	/* hw will set stats->decrypted true, if it finds the
-	 * frame is open data frame or mgmt frame,
-	 * hw will not decrypt robust management frame
-	 * for IEEE80211w but still set stats->decrypted
-	 * true, so here we should set it back to undecrypted
-	 * for IEEE80211w frame, and mac80211 sw will help
-	 * to decrypt it */
+	/* SWDEC is clear for plaintext too; mac80211 decrypts robust mgmt */
 	if (stats->decrypted) {
 		hdr = (struct ieee80211_hdr *)(skb->data +
 		       stats->rx_drvinfo_size + stats->rx_bufshift);
 
-		if ((_ieee80211_is_robust_mgmt_frame(hdr)) &&
-			(ieee80211_has_protected(hdr->frame_control)))
-			rx_status->flag &= ~RX_FLAG_DECRYPTED;
-		else
+		if (ieee80211_has_protected(hdr->frame_control) &&
+		    !_ieee80211_is_robust_mgmt_frame(hdr))
 			rx_status->flag |= RX_FLAG_DECRYPTED;
+		else
+			rx_status->flag &= ~RX_FLAG_DECRYPTED;
 	}
 
 	rx_status->rate_idx = rtlwifi_rate_mapping(hw, stats->is_ht,
-- 
2.56.1

