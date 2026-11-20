Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174300;
	b=FMqzaUJracmjKuIidU3g6rJvPl93hgmdQjhYZkAwKiUIjJa8Il4mGpA/TCAkZE0BEDHK
	 Roh60fLtYogj1rTqluA3eL9JJvBbOdlXjrSrljOWPkvS5pM+9JXkpHeomb674x9vk78dj
	 +TOJ/9zktzfecxObswfAoMKhRIm/eLlTXgDLwXcOCmoE6Y5ydFS+IVb85xxVvHA+P9lZp
	 NPrtHGbScrmwzP/wMYYrgT30lxAjW0eUQAg1JpTcw7pCW1xMcKJQd2UUiqjuAPSj6K7mj
	 JisUNe0thDllt4HpBpwANVGboJD/O3SgfkHA3YIo25MY4piPJVuR0d/xWZEB/6bYMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=677whf195NLsgFLCzjEzru0i4Z+4+NkynuJcgslET6o=;
	b=h87Z5YakBlaHfJDEAcCKyaImPhsDthcudEZ+cbdxqvRpPLtp/2qhuLcH7V1qoq8Nh/j+
	 b1PwWEeqXOo/doXq7So8r57kAugu/FcyzZp4Q/XgvEU2wa6jANBUEUBZuxw8Pa7e6OyNU
	 gfwyKMqEzvyZKYFKb9XLhCmufezweBI7/YdqPCYv0s8vXxeeqO4Ji6+l799I1mcZ94Tt0
	 p1aLDPg1le/X3P0z7mkhqPdixITs7kXa6PhTxpnEZtuURK//Bk70qr4GJYykmAFJWOoI8
	 A5twbpCnBy8SfCzvljRt//41/DvivC5cOeZDIKAjTKCQ7MhLMlRaUhZ33drzrZX4gew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNoWSv+u;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC760A3804
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACC760A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNoWSv+u
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so159622eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174299; x=1795779099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=677whf195NLsgFLCzjEzru0i4Z+4+NkynuJcgslET6o=;
        b=BNoWSv+uGI1UPoC2rwjghY63rtirDaiZPwabATfulMbPmoyFylEC+Y4hEBnJc2AO4O
         dIXomubMCgsdYj5RkqcNMAUJII9Jiwo57bsCCNHAGfedPkoPCvRNtutvm8qoR7TY/JDT
         h5RNpf+Xb/i97qkWVgXNBSJ38ArJ7qWXGV4nuvsW32LKEwNeTfOxS90Qa7bMuklKTaHp
         o5ysHa44+++y7CoiEE8ikhDBPFjMuaxZ4sgeY7vJBayw5fFPKVqT6a1fnJ+H+VQeXuNB
         s4ePHoNEIpyTApsX3KHiXljddXwyeiA0UZocKOMnMvuSmfx0iT1DdWUxOkrXG6hcPs/Z
         TWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174299; x=1795779099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=677whf195NLsgFLCzjEzru0i4Z+4+NkynuJcgslET6o=;
        b=Ql8Wi0vEzchqbFaGHUKxleZ/bxN6CYrLSUKtDKHFh7Ck3hwKPzJGEJUS26j9a/PO2p
         g8jluiygSqpY1+i0IyPCgV1MV0jv78lgAGDR6ThRQWng+elG7S3aJmfl394Ic4yvTKLY
         tiRXPJ3EBgB80scSqnYHiiJ06xvzJtOpfQ0ELIhXRrrO+4zUXCwny7xqnquC9rKQa89J
         HlA3uWsNMSpokEAnXUcqegLz9P0JvuWd1MDASXYDj1d6sIaSKhiQ9nUfDCuPIB55o4S7
         Kt6oGig4IWHySqjz2iAno9WlTp7T/8QO90c+h0xDRofdxQxW12iGgwSAtTsrxCtXuow4
         pPUw==
X-Forwarded-Encrypted: i=1; AL+hErFhjngFupdLxHU8WpJfgi5yw51vzkUxXHdhfqYRjmFlb2j1jvL24lrF8eYwUIWveZPv+Bpjj83K7/MzU/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xg7fGoRiz07bD8OsXOYbnmnsHvOayxX4rlHZ2cG3cTGRCFgmc
	/nvUFMWDGsbuAxxV7lKRKmIV99rUcty9o+XD/y811iwtilgbktHkSBW3
X-Gm-Gg: AZFdTZcohTx+T1NniNLxERA1fqkYg7q7eayp6VCeH5mZjpdJNxfUzIAtPP39XxgKoLA
	DThfqk1ZYcWok23bK8KcYLrn2UK+C7fxRAhQpieACvA/HXSZzhJBBTy5rLTN5QJFqWtgVQaD6iB
	WftgsY7ejCguZoW1oVorLDW3U0JNNv6XvNLSgMw4Bk8QT8ghlVPev6beRixl82SAzG48e/B+d5B
	U2yl/X19eY/cOYhYhCupik2hevaeftRtBF+WtNHcTK0NT5m3k1TxbcCf2CLwBvy8oZpkg/TCQuC
	gDCmOdUakJwZjELuKeLXJV2WsSxqR22VQWisW7qGMWgpJyev6jIh2Josc7tf+G4WXJZtD5AsmzM
	0NVQYnRhGKnTtb3ONpycVTAsL6UJGnmfo+w0nxHc6kqh/NZFfzU1oOoeczrpamTS1HQOVQTWyVO
	Uh53VQVeAMpbjv5yGv4ItMqpcLTvNX7PHCzYjoYc0NqlZPZ9NXT8NHT25vRz9P52bOa8KbQg6Ic
	sSUf3ULe3us8aCJzXAneyGjXlMR0mwxwYFeeXkfg8b0wQQGUbvt6jwMRUujXuuuiwU3j/1jNF+t
	G1MRhOgOdaqO9b1XmJD5jHvcMben01WIBN9BT/jnKiKpw/yOfvWffjT9U6RYrKo9BF6LQhtVivC
	ztb4w+Dspl5hZ2y028pJ9aQhC3l7zs3VSM12CqzazR0s1
X-Received: by 2002:a05:693c:829b:20b0:376:552d:402d with SMTP id 5a478bee46e88-38570f29044mr3045263eec.34.1795174298523;
        Fri, 20 Nov 2026 03:31:38 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:38 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 4/5] wifi: rtlwifi: usb: move the radiotap headroom size to usb.h
Date: Fri, 20 Nov 2026 19:31:13 +0800
Message-ID: <20261120113116.153232-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

Let drivers use the same define to add headroom for the frames
split out of aggregated transfers.

Move __RADIO_TAP_SIZE_RSV to usb.h as RTL_RADIO_TAP_SIZE_RSV
so chip specific code can use it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 8 ++------
 drivers/net/wireless/realtek/rtlwifi/usb.h | 1 +
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d7b3192262..5aca1a49ca 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -488,8 +488,6 @@ static unsigned int _rtl_rx_get_padding(struct ieee80211_hdr *hdr,
 #endif
 }
 
-#define __RADIO_TAP_SIZE_RSV	32
-
 static void _rtl_rx_completed(struct urb *_urb)
 {
 	struct rtl_usb *rtlusb = (struct rtl_usb *)_urb->context;
@@ -521,7 +519,7 @@ static void _rtl_rx_completed(struct urb *_urb)
 		hdr = (void *)(_urb->transfer_buffer + RTL_RX_DESC_SIZE);
 		padding = _rtl_rx_get_padding(hdr, size - RTL_RX_DESC_SIZE);
 
-		skb = dev_alloc_skb(size + __RADIO_TAP_SIZE_RSV + padding);
+		skb = dev_alloc_skb(size + RTL_RADIO_TAP_SIZE_RSV + padding);
 		if (!skb) {
 			pr_err("Can't allocate skb for bulk IN!\n");
 			goto resubmit;
@@ -533,7 +531,7 @@ static void _rtl_rx_completed(struct urb *_urb)
 		skb_reserve(skb, padding);
 
 		/* reserve some space for mac80211's radiotap */
-		skb_reserve(skb, __RADIO_TAP_SIZE_RSV);
+		skb_reserve(skb, RTL_RADIO_TAP_SIZE_RSV);
 
 		skb_put_data(skb, _urb->transfer_buffer, size);
 
@@ -570,8 +568,6 @@ static void _rtl_rx_completed(struct urb *_urb)
 	usb_anchor_urb(_urb, &rtlusb->rx_cleanup_urbs);
 }
 
-#undef __RADIO_TAP_SIZE_RSV
-
 static void _rtl_usb_cleanup_rx(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.h b/drivers/net/wireless/realtek/rtlwifi/usb.h
index b873bbc9c4..a7ffff2d7c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.h
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.h
@@ -7,6 +7,7 @@
 #include <linux/skbuff.h>
 
 #define RTL_RX_DESC_SIZE		24
+#define RTL_RADIO_TAP_SIZE_RSV		32
 
 #define RTL_USB_DEVICE(vend, prod, cfg) \
 	.match_flags = USB_DEVICE_ID_MATCH_DEVICE, \
-- 
2.53.0

