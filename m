Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385483;
	b=rAb1uyT5KyqX92exmirUHddb06dmxscUzwDLDjiO36SBwQwYspQ1Yt4Aw4cl7sogoQ9R
	 Z/iPRZ2gA62RTXBzgbzw+ohQDTCZkeOUa6V44qilZnour5h5afiu38ocI3YMIpdJzEx7j
	 6clnu52KODO921zmcicSPFXBUFwLVy7eWueH3s2r3ZtmCOtQe/c3Yvxmpb07zAVjCJ/ZA
	 3DABPxq0zCNN1Xvm0zAek00rlvq9Qqxw0dm999NEmvXLTipY07xvaRkCuw42arVtZTnje
	 +hIVK7mn78qNpbNxqig80Pd5YhgaAiwwGE3i17bU/pqXVa7mo8Ce96uMRQEp0VxqOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NT7eFfs6WkxNgNowIC+ULTZcMm8aCZgXy7WoR8EwZgo=;
	b=cTB8996iwmWG+LOC5IkIYCqaAlHRmg7TaadyD3Kgn5Lp64QIU9/WX1AGAtnkG8uQ8eUw
	 IXONfC4l3wQdfGEcyf7wGhoOXBCNIQg7nzRybiLruTi4lMLtFS9zNOxr20VG+Fc3W+3GK
	 mhS5sO6jgYBInJH3u1vccMv05oTTb87d98roXty8FO/HYCsZN1Cwhv42PVkzDpK6xeU/D
	 6QcEsKfGq7J2YFTeFZluc3KjOjI379+ICSQ3t1utd/LDkBfQY+bmb33cCzgwNrlMoU1NV
	 YnW+29VUc6CoIOaK939nPOR+4zDUL0tbNG5YQaUohwfvsz3OGmv7vC6eJhE7SiprOGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm+H+CtX;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52E606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B52E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm+H+CtX
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1884237a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795385483; x=1795990283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NT7eFfs6WkxNgNowIC+ULTZcMm8aCZgXy7WoR8EwZgo=;
        b=mm+H+CtXuUnDhCgOJkFFTkQHyA2htZw9KSqBk7j9qLKXEjHZXv9pEQ/oQB4ZnjKP5k
         9Z+Qz6iZkyQwmWrnjskyyKn6Kq8HeRR81hi7HFffdD/PHko4tSq4BprZVGhldktaZDSB
         4YjF5dHlp1l5Kp9of5vfZBTE/Na/rAL0Krn/1F7wwWwR+X6ajMBwLOvRgjQcCIm52aOO
         aZB1zdGQ2GpB8yO9ovNqSObOaFRzaJDKdeFCD2DXI90uf+OiItgLZDR6kf8m1paHbu9c
         PulQKTibYrTomvOFvGiGATTE8ILHHPBJvVJNrul/eeoPQ7Us3HxYDZtP8PtAx655RY3L
         v04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795385483; x=1795990283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NT7eFfs6WkxNgNowIC+ULTZcMm8aCZgXy7WoR8EwZgo=;
        b=o3y45w35xDMB4eicxejSuEpluefMUfalGNE2ms/SvkKyhJcdoSanDWTR9XMbK3PcMj
         e2eyvZn2zVt2T35J/We5b3fHz+rJk+27pcdzad+F8Vj/robykr1uzx7s1ojHyNeilflF
         fAQSgPtD8eNttYvdbFAMHf1lnMB/YMcXI9sppDUt94OgN/FLMqwjjC66Blo1czzH4zok
         hL6DuN8/BkuD8b/RHbgruNuG5C4XRy6Vr3UJGM9KZlTQxVB5gqa5ml9IGOjdbPrQ2CKD
         bbdbEVYHmnS8ugK2w4ml8ijxmjLSDH5Lzwcugt+3FUxjpeUjtVC/0B53FEpPlK5r5ib1
         llhg==
X-Forwarded-Encrypted: i=1; AL+hErEuFySqWYtn2I492rto4u7PAb4bLik4ySP997Hw8XAjXEF+Xy5Tbc3Tp1W0h8IRKSyYYzFe3/rjRxQybao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KngElBq9AzXL+RLBHqE2Z+AmN0u08YQNxPkai/QviZOG3g4a0
	G5TNia6NBS09NGy5xIFRd3y6FmAvKk0anp7XjW4MZgd2tx25Jc0CuL5R
X-Gm-Gg: AZFdTZdErs6G0zub0L1OPhRcbaWhWP8Ky5R9w1cUG5B4I7+HLNGnSffZpxCtj+FHgEm
	U7AjAJ+kcF7haZVsvrSvareyfSuQKONq4N+sAI2vP84CLKyWmplvRVoGxyX0Jav7MZPmD9+TIIz
	Fe7JJhbhg+6/X6mWuQTzXEBMyuEkdrUS0UsOoZ5PWpXGH3gsYSgZuASje1NSA/WpD8sreTc4xEU
	Qk/zE6PmQQqOdpWSHaIj02DhUwLKd9lmR+ibXdx8BAUAtCJ71xgC6pJeTD51CtkEu867btnfG+G
	hsM9qWAf1VRuHruesZw7yQGSrXMRaZ+lY4bir3V4nMeaffBVm+5/CRxss2Z+NN3iqTsxcdNY6Uu
	m7Msfrekj1ltJe9lgPFLIlyoawX0K06jvcnKF+r7eWAZ7grJgmGfAXr2KTwJaYUdp1YS6Sd0SW+
	Axka3rr8srDbAI19rOdWRGv7kX9UPXG+lT1ECracwNhJYAjw05uibN2t/eFczvZnSTgS08bJOhI
	37RFGS0Svwgsck+nyghPChwQzZoBzLAmFKSiuDtImU4ArfCruj3Ah/LhPbtJ1vvWgELEQvceJ2x
	CEQzrM7H/tnvJkhRFmMaSZ4+cm4Oa9+4hpqoeEr0ZBaxW+myh93Us5xpf61/jjQEnMXC
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr9444836a91.47.1795385482676;
        Sun, 22 Nov 2026 14:11:22 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm17277003a91.14.2026.11.22.14.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:11:22 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: cfg80211: unlink hidden SSID members of the merged BSS on CSA
Date: Mon, 23 Nov 2026 07:11:19 +0900
Message-ID: <179538424838.2896923.3237950934209281172@gmail.com>
In-Reply-To: <179538423867.2896802.12596731671226623616@gmail.com>
References: <179538423867.2896802.12596731671226623616@gmail.com>
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

When the associated BSS moves to a new channel,
cfg80211_update_assoc_bss_entry() gives the IEs of a matching entry on
that channel (new) to the associated BSS and unlinks new. If new is the
beacon entry of a hidden SSID group, __cfg80211_unlink_bss() refuses
while the group has probe response entries, so the WARN_ON() fires and
new stays on the list. The probe response entries keep sharing the
beacon IEs that now belong to the associated BSS, and read them after
that BSS is freed:

  BUG: KASAN: slab-use-after-free in nl80211_send_bss.constprop.0 (net/wireless/nl80211.c:12959)
  Read of size 1 at addr ff1100001428e61c by task test/115
  Call Trace:
   nl80211_send_bss.constprop.0 (net/wireless/nl80211.c:12959)
   nl80211_dump_scan (net/wireless/nl80211.c:13105)
   genl_dumpit (net/netlink/genetlink.c:1026)
   netlink_dump (net/netlink/af_netlink.c:2360)

Unlink the probe response entries of new before new itself, and clear
their beacon IEs, which they no longer share with any entry.

Fixes: 0afd425b1b64 ("cfg80211: fix duplicated scan entries after channel switch")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The patch was written with LLM assistance; we reviewed and tested it.
It applies to the wireless tree. With it, the reproducer runs without
the WARN and the use-after-free, and the station still follows the
channel switch.

 net/wireless/scan.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 1c50a16c0e9b..898cc65d6b1a 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -3490,7 +3490,7 @@ void cfg80211_update_assoc_bss_entry(struct wireless_dev *wdev,
 	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
 	struct cfg80211_internal_bss *cbss = wdev->links[link_id].client.current_bss;
 	struct cfg80211_internal_bss *new = NULL;
-	struct cfg80211_internal_bss *bss;
+	struct cfg80211_internal_bss *bss, *next;
 	struct cfg80211_bss *nontrans_bss;
 	struct cfg80211_bss *tmp;
 
@@ -3533,6 +3533,15 @@ void cfg80211_update_assoc_bss_entry(struct wireless_dev *wdev,
 				rdev->bss_generation++;
 		}
 
+		if (!new->pub.hidden_beacon_bss) {
+			list_for_each_entry_safe(bss, next, &new->hidden_list,
+						 hidden_list) {
+				RCU_INIT_POINTER(bss->pub.beacon_ies, NULL);
+				if (__cfg80211_unlink_bss(rdev, bss))
+					rdev->bss_generation++;
+			}
+		}
+
 		WARN_ON(atomic_read(&new->hold));
 		if (!WARN_ON(!__cfg80211_unlink_bss(rdev, new)))
 			rdev->bss_generation++;
-- 
2.43.0

