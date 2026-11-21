Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279003;
	b=TT4zKyorGEnVSMKrTvKjXiyp259CNE8s1pSoc8aEzJsb2rhaqfkM3WBCrOq0Qt6NqkTy
	 Doz9h8pztwXGq34UeHwTWYG7batVS2ZLMPmUL82cKzBBOlEQYNe1nIS8tpGZeSKoiGBG4
	 8+29xZCXb8D8wXqLC/lfRIX3T0abtgsfXdn1rku853k45ZcSwreQo0IzTTX4onbDKmbqk
	 dLwwRm/+NnYIMwIMSmtb2lVvecJDGY5tR8yH80/TKTK6IzVABwMLmK9iJznBPxSfX1GOi
	 0P89tqLfByH5H8oXL8VkH1LXrMTTuVML6M8oFBJ7vzrS/yTytvuTFsb90Yry5RiQNkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hn7c/Dz84tJJhV+0Auq9iY8AybuWUE55EkzU/GyhEek=;
	b=0zpo14ocHVxdsiK55C7XZdU96FrBywktNs4ObiacJc9uRNVUTKoPxIeB8rM4Mny7KT7e
	 BnXQdgwbv7ikjAk2O76dIzz0E4fk9fiRt0pRyp9WaxX0gRge3/Xx3qvB0sid/cARWtolG
	 bU0i8Y2OU4Wb2VRm5J5aM0C+WokZAVtbrjB6K93hRp5H1YMvBGcxUmepBv7JplyirUEAO
	 rZs2t/4Kgw+rXKXa/4AzAdc2Pc91/FnNzON7F5d3Yg1Nww21ZkhuzNXFKPSSylIMBBzp4
	 VwbHnCa3BwOeADMFJDxFG/xetadO2B2OdTdp92MSPkhfEtFPcUegvoWS/sOY0X6QrpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NEvYbR1k;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0054E606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0054E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NEvYbR1k
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1156475a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279002; x=1795883802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn7c/Dz84tJJhV+0Auq9iY8AybuWUE55EkzU/GyhEek=;
        b=NEvYbR1k9Cv3Ee/WcKYPovFDDTagOL9m7pCRpFexMh07IbJqbozQHwlm0WguF1dgm5
         G3VbQUt/2UMowNrA5HXshcI1ni6YBVp4dc0ZcIzJcLl5XR7F+sIGTOVKVLdV9SRgzmum
         mTfmrAmBftSSImEIP2fdUFfS8vPzCuDcIYjClGyfQGlE/T874D6ZzLWzNuh4rUNXn0R7
         QkjOB6hcOJLFtLdWO1kwQmU8VwCkhyPoKUglkRx5FiQsrVNMtgSEg1/XedT/9/4U/8zR
         tcEOWZvzZEBnoozKrc+YZWLSSIcPRcM6LxwUTFjJj7WluuoiINubGErjJ2G8amP3T3Qk
         ORBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279002; x=1795883802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hn7c/Dz84tJJhV+0Auq9iY8AybuWUE55EkzU/GyhEek=;
        b=dyZSdE2rRkBcLfF9dULnfrlWa9Pm24VD6XSOiJdybWs+Qfp6SthoN5pUHhd9Tj5XKI
         5F2mBjwo6r5nnNNpfuZVDd56+sXv7+9o0JwB/w/nO3lT6jtQrt1PqH+b/wWAMTuIH//m
         bfWsBKbDc/80PT4twcplj/p+1rbqhgVRpm2kKWAmQNB7Zg/NUZe4+1fevJPjprNgL04/
         AyhqAc3rp+yRhqnhps6v/gBYD2QudM1s9wuNjzKEVe0Cc811sZ9XukwwA11S0OTFf3kl
         qNWDBtlhfmeCIQAQzLoeQ1mH18VNT59Fo3TNUVSQf9gyGnF/YN4y31qQYlx1enaZVcR1
         yVBQ==
X-Forwarded-Encrypted: i=1; AL+hErGopsHhHDZfmqkQeMJ3LnYao1QunfIYQB1JoofofLW5N6PwP56AX1xGrW32d0fA6+u/csBSP9KAxH3zDvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+UmcvJQ5Ah86lqDWo+d0mnvQtCNHb+dDNmy5HUoNs/5Z/pf9t
	+i2Se7C+EsPMkRQFMxFQWdteLzAJTFBOXz0DoJOTHlkEftYOdueYRgh5
X-Gm-Gg: AZFdTZfaJKvEcIAEJKgXWrZDZZFqLuylPwLMi0SrUaVCwpc7CNF9x/67Q3cHpxG9xgu
	oCgIFBfQoeCvBL5uu3glEtZguWrNX3MLdyf8fUj9UQCru22Iid4OsU44iRoQJjfutG68XYKzLAQ
	V6RuSFB1Xz/ABJTgA1QCBu9mMckOnVvnmoKgWvg25QqxdwBqGdvDSzaiW1i41+RlbxSRR0gU+s7
	3XLOkGCnSjxYuxxBUPkcH2+chjILND4Y+KYQtSWvfcnrK+nDexRjrp/4VpMi89V2xBdEvozw8kf
	WVxwrHnBlQSosrn1pgOKZuFT+7QlwTL0lOhmY0fPqP3QxIv4u78rnHGvSE53ujh+CHKtlRMFEKT
	gOFCCtyUC5MUHFZZ5OCeVPlHHtdJ96x0lFPORgh6AloW94t3yKZDm8DjjzprUnBxfQob+1lWLR3
	Yga/AlnPDE1YufYZZ9mzw8rCEUoXoMBszpxKtroTH804DR5jgxgldZ2pADxp3idWcggVgYSvWOl
	dOcwZZHl6JGDr7g7X/aHF6RpQ/gZSg/1XqJKSQcqx0jXgpVOttH1Y/o1RpSs5Dp3YC/bwVeqjtB
	sIQGTUZqtpQFtWBArZPMuhPoKN5elJMRe5PPjWPZ7SHje41d5PeVv6KYF5svYa8Oghm9nI/K8VN
	uyQ9C
X-Received: by 2002:a17:90b:17cd:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b41c95b6bcmr5815185a91.43.1795279002278;
        Sat, 21 Nov 2026 08:36:42 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:41 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH rtw-next 3/3] wifi: rtlwifi: rtl8192cu: don't mark undecrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:47 +0800
Message-ID: <20261121163547.37019-4-enderaoelyther@gmail.com>
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
encrypted, and for a protected robust management frame, which the
hardware leaves for software to decrypt. rtl92cu_rx_query_desc()
nevertheless sets RX_FLAG_DECRYPTED for every frame with SWDEC clear,
in two places.

mac80211 then accepts an unprotected unicast data frame although a
pairwise key is installed, and unprotected deauthentication and
disassociation frames on a connection that uses management frame
protection. For a protected robust management frame it skips software
decryption and MIC verification, so a forged frame is accepted and a
genuine encrypted one, such as an SA Query from the peer, reaches
mac80211 still encrypted. A station in radio range can therefore inject
plaintext data into an encrypted connection, or end a protected one, by
spoofing the peer's address.

Set the flag only for a protected frame that is not a robust management
frame, as the rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and rtl8821ae
drivers do. rtl8xxxu, which supports the same chip, stopped trusting
SWDEC alone in commit cbfbb4ddbc85 ("wifi: rtl8xxxu: enable MFP support
with security flag of RX descriptor"). The header is read before the
receive path strips the driver info, so test the Protected bit first,
which needs only the frame control field, and read that only when the
URB holds it. When Protected is set, _ieee80211_is_robust_mgmt_frame()
also reads only frame_control.

Found by code review. Compile-tested with W=1.

Fixes: 29d00a3e46bb ("rtlwifi: rtl8192cu: Add routine trx")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 .../net/wireless/realtek/rtlwifi/rtl8192cu/trx.c   | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/trx.c
index d6c35e8d02a5..aceedc37e5d2 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/trx.c
@@ -295,11 +295,14 @@ bool rtl92cu_rx_query_desc(struct ieee80211_hw *hw,
 	struct rx_desc_92c *p_desc = (struct rx_desc_92c *)pdesc8;
 	__le32 *pdesc = (__le32 *)pdesc8;
 	u32 phystatus = get_rx_desc_phy_status(pdesc);
+	struct ieee80211_hdr *hdr;
+	unsigned int hdr_off;
 
 	stats->length = (u16)get_rx_desc_pkt_len(pdesc);
 	stats->rx_drvinfo_size = (u8)get_rx_desc_drvinfo_size(pdesc) *
 				 RX_DRV_INFO_SIZE_UNIT;
 	stats->rx_bufshift = (u8)(get_rx_desc_shift(pdesc) & 0x03);
+	hdr_off = stats->rx_drvinfo_size + stats->rx_bufshift;
 	stats->icv = (u16)get_rx_desc_icv(pdesc);
 	stats->crc = (u16)get_rx_desc_crc32(pdesc);
 	stats->hwerror = (stats->crc | stats->icv);
@@ -316,15 +319,18 @@ bool rtl92cu_rx_query_desc(struct ieee80211_hw *hw,
 	rx_status->band = hw->conf.chandef.chan->band;
 	if (get_rx_desc_crc32(pdesc))
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-	if (!get_rx_desc_swdec(pdesc))
-		rx_status->flag |= RX_FLAG_DECRYPTED;
 	if (get_rx_desc_bw(pdesc))
 		rx_status->bw = RATE_INFO_BW_40;
 	if (get_rx_desc_rx_ht(pdesc))
 		rx_status->encoding = RX_ENC_HT;
 	rx_status->flag |= RX_FLAG_MACTIME_START;
-	if (stats->decrypted)
-		rx_status->flag |= RX_FLAG_DECRYPTED;
+	if (stats->decrypted &&
+	    skb->len >= hdr_off + sizeof(hdr->frame_control)) {
+		hdr = (struct ieee80211_hdr *)(skb->data + hdr_off);
+		if (ieee80211_has_protected(hdr->frame_control) &&
+		    !_ieee80211_is_robust_mgmt_frame(hdr))
+			rx_status->flag |= RX_FLAG_DECRYPTED;
+	}
 	rx_status->rate_idx = rtlwifi_rate_mapping(hw, stats->is_ht,
 						   false, stats->rate);
 	rx_status->mactime = get_rx_desc_tsfl(pdesc);
-- 
2.56.1

