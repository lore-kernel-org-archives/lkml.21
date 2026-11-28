Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850344;
	b=CGXV2Xi2PgmZnnaXVDGWfhn8uW+0UiblpXR+n+OSAv6ATnlZ9M+y6fFCSL4onaXRvipp
	 nM3Y9xBLjbDOcmhU1HtV9LwoM90DFoW9CeH+ti7cis2obVXsQQUd1DuKpcw+CKAEIy6Uo
	 TcH8kF1agZzNZ/WAzF4MTKRwT5raW2xh8gvYpEDvO8t1hp5pzN9OItFcMAbRe9XxU0UOQ
	 6rJEhwNJsJ1DYlzvr+whPwn1moqvqTiMn46XyC/ajqdb5hDLf9m/XS0FCZa+Pj7gqvn0t
	 1CgCWj1WMq0RBuqM5ZBp7kV788TrR69CyV9ly80urS33PcqLya9llF6ewIaG4IrH52w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fO2eIe95VRSOU1KijFAbx5NDCPAQZnU3pyzGbtCTNiU=;
	b=hITc2xqs92GdnOjYqDtSGWiGE19sX565mwb+clYdot0jStYK63WQVGkNwl1mZpqzxFCg
	 gKee7L7jWTW+wQKScz/B1DYGoTzqb1z8Ma0L8bu/pJrOqmJmOO7q1MUEJPfGIGmg6Wdqm
	 +eIBcHZndF53u/evXjPNZFfx+yyEfz09PbjhlBjG1Ealsg82tWzqOkfUaGAe70mLZmVv5
	 59jpXoVs5DKfP+aUCf3OW3/47JmwVYDOU0VH9XwGmPoFj+mNI6ce4yr+RHRkuZlqoFPkN
	 yQTW65ONzv7OqyDNce2PEyiuxBKga3QKNfuh3Ha8N3b+PhwIxqZkUZgL/URaxkaHWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEG9NQks;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCC606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBFCC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEG9NQks
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so92686905e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795850341; x=1796455141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fO2eIe95VRSOU1KijFAbx5NDCPAQZnU3pyzGbtCTNiU=;
        b=yEG9NQksw+gb1uWL2I1sRiCmKZoQV1AFDaV4WfdFzWJUtieetKTk6R5Wq0Ovmmpbrn
         r4Xk0dOLUvFiCx69w2KWQ9NIYc69eBPYkp+hrc5U756WY/PFte4L+n/3Gjqh9XtwYLkH
         z6dfNQKCNkDuLyMJip+n6lufV8COugDOjVOpTf3gWgml2CLXb5VF5CyELpJbQaxE29kW
         aiM/HfrS1Vx3eiHu6ucgM6fCODL5WoP/tAPRQ51FcHHkKMl5zhNyfbk+SGReHEEe3szW
         1nlRpZBuK1xQJ3cE5/xZTo7IDRZX5QIqBON/CL3K6x6v8+1RYwJSE0Y91k+Gil/pzTKt
         bnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850341; x=1796455141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fO2eIe95VRSOU1KijFAbx5NDCPAQZnU3pyzGbtCTNiU=;
        b=OWECrG8h/oHLT+2bzWTmPNzekGydROIOSDoZ9dMzs82Xcqy2gQpcygTZbH0/x64JDR
         FZvYBJb/Hx71imwUHmf+P6eYcxgUVESlBTRgUbclGZH1xrHuklyhjv6IsS0ittl7AWCs
         0xRu4uHtMIZ8MFeHMzxqGvKXoIoPru8RdOd6mUtZZgBRtFduvLk+kGKPduMmAKzBoXdo
         L8dWMCOw9fSaeYeEDzY7otqJZ5n+94RUQDobL6rITsLSawHHxqzrVNkflRkh6SEI/cLE
         K1CEuMMTYBN9zJB3Ok+xFO7RHaudQaw5dVNT1f2b7CzlOcLuMgTSaCKfMH9W7Pd+F7d/
         KtoQ==
X-Forwarded-Encrypted: i=1; AL+hErF17TqMzKj8JXFPSIBm1MBQA1aXSrjifPdyuPcb+cbhfIeP4d3QqVsmNxRrcudry07PrbB1u2JnCgUVQj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HIpk/9nU4iG6AeFgkaNwU4F8a67dvlSl7FqSSegajrAer/naU
	l8ewDgAugB2Wm3TD1C0lampt6QaHU3g2MW9I7qKqjEjgQUGnDvXaWyo4
X-Gm-Gg: AZFdTZeswxJhWqqUTg2+F7fByR20Hdv7De8KE08smtVexR809fM6kJt8hejdUiH51r5
	9aqLXUgsAfVJF8JX3ZYB6Z91InuRD+SteGcgDuUDLP+p52IqzuMAp8569RaUlCpO345daVMao7R
	ySeBzi8qQoaJMEILKRPJ2jAFnhxKFVDfi0VhP1zLGwHEb8vuncOpBvrHDfI95mZqfd/rh9QIBwu
	NUraT3f9/OedEUbg6PSTjzI2ZD+pf0naD124k8F4qcZZYQG4GVVB4MXHAsoJoejR0dUfufBAGt4
	8aOuxLd71Kgb8Dptr2JLAGqKFYwo3VopbpTxAGbwUs/ane2Loza1SnfzIkgve7IAkaPF6xw2eCZ
	PRPKgaVptdaZLP2hKBviY7DN80ae9txjBgqGGDKFHhujJ/zWsKeZXD2zbpbncOIIzCGwlPZuWjp
	i7v4dDa/1hkscaAS3EbcwO2AgCAKY3X5xh3teAyYSOKgtBhDoQFO0YOfCx6Jvlt88qycUyJYTSQ
	IZpSYLJS7AirBsfSSYcL6RLv9dj8ZQqxO0yam90ieUgsUIaMqTxURCjPu0Yn0eRtOmn23UGZzf+
	8uuNR6dHvzedkTSw6l8DpNp6ek1V8n+woss=
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr582461845e9.9.1795850341157;
        Fri, 27 Nov 2026 23:19:01 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm748649545e9.10.2026.11.27.23.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:19:00 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v15 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Sat, 28 Nov 2026 08:18:56 +0100
Message-ID: <20261128071858.42275-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261128071858.42275-1-mehmet.fide@gmail.com>
References: <20261128071858.42275-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

rtw_fw_download_rsvd_page() downloads the beacon twice: as part of the
reserved page, and again on its own so that the firmware gets a TX
descriptor for the beacon instead of the whole page. The second
download fetches a new beacon from mac80211 instead of the one in the
page.

Each fetch advances the DTIM count and, during a channel switch, the
CSA countdown. Two fetches per update step a countdown of 2 past 1,
and mac80211 warns "beacon TX faster than countdown". Keep the beacon
from the page build and download that one. The hw scan, which downloads
the beacon without a page build, still fetches its own.

The hardware writes the DTIM count of an AP beacon itself
(BIT_TCR_UPDATE_TIMIE), so nothing on the air changes without a channel
switch, and this is not marked as a fix.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v14:
    - dropped two comments that repeated the commit message, reworded
      the commit message; rebased on the rtw88 firmware recovery fixes v4
    
    Changes in v13:
    - none, rebased on rtw-next
    
    Changes in v12:
    - the commit message says why this is not marked as a fix and what
      mac80211 reports for the double fetch (Sashiko); no code change, the
      tags are kept
    - rebased on patches 1-4 of the rtw88 firmware recovery fixes v3
    
    Changes in v11:
    - none, rebased on rtw-next
    
    Changes in v10:
    - none, rebased on rtw-next
    
    Changes in v9:
    - none
    
    Changes in v8:
    - none
    
    Changes in v7:
    - none, rebased on rtw-next
    
    Changes in v6:
    - none
    
    Changes in v5:
    - none
    
    Changes in v4:
    - none, rebased on rtw-next
    
    Changes in v3:
    - the beacon out-pointer is initialised in the caller

 drivers/net/wireless/realtek/rtw88/fw.c | 32 +++++++++++++++----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 09b5836540c4..4575073d0149 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1622,7 +1622,8 @@ static int  __rtw_build_rsvd_page_from_vifs(struct rtw_dev *rtwdev)
 	return 0;
 }
 
-static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
+static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size,
+			       struct sk_buff **beacon)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct ieee80211_hw *hw = rtwdev->hw;
@@ -1702,13 +1703,14 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	list_for_each_entry(rsvd_pkt, &rtwdev->rsvd_page_list, build_list) {
 		rtw_rsvd_page_list_to_buf(rtwdev, page_size, page_margin,
 					  page, buf, rsvd_pkt);
-		if (page == 0)
+		if (page == 0) {
 			page += rtw_len_to_page(rsvd_pkt->skb->len +
 						tx_desc_sz, page_size);
-		else
+			*beacon = rsvd_pkt->skb;
+		} else {
 			page += rtw_len_to_page(rsvd_pkt->skb->len, page_size);
-
-		kfree_skb(rsvd_pkt->skb);
+			kfree_skb(rsvd_pkt->skb);
+		}
 		rsvd_pkt->skb = NULL;
 	}
 
@@ -1723,11 +1725,11 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	return NULL;
 }
 
-static int rtw_download_beacon(struct rtw_dev *rtwdev)
+static int rtw_download_beacon(struct rtw_dev *rtwdev, struct sk_buff *beacon)
 {
 	struct ieee80211_hw *hw = rtwdev->hw;
 	struct rtw_rsvd_page *rsvd_pkt;
-	struct sk_buff *skb;
+	struct sk_buff *skb = beacon;
 	int ret = 0;
 
 	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
@@ -1744,7 +1746,8 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 		return -EINVAL;
 	}
 
-	skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
+	if (!skb)
+		skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
 	if (!skb) {
 		rtw_err(rtwdev, "failed to get beacon skb\n");
 		return -ENOMEM;
@@ -1754,18 +1757,20 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 	if (ret)
 		rtw_err(rtwdev, "failed to download drv rsvd page\n");
 
-	dev_kfree_skb(skb);
+	if (!beacon)
+		dev_kfree_skb(skb);
 
 	return ret;
 }
 
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 {
-	u8 *buf;
+	struct sk_buff *beacon = NULL;
 	u32 size;
+	u8 *buf;
 	int ret;
 
-	buf = rtw_build_rsvd_page(rtwdev, &size);
+	buf = rtw_build_rsvd_page(rtwdev, &size, &beacon);
 	if (!buf) {
 		rtw_err(rtwdev, "failed to build rsvd page pkt\n");
 		return -ENOMEM;
@@ -1782,13 +1787,14 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	 * the beacon again to replace the TX desc header, and we will get
 	 * a correct tx_desc for the beacon in the rsvd page.
 	 */
-	ret = rtw_download_beacon(rtwdev);
+	ret = rtw_download_beacon(rtwdev, beacon);
 	if (ret) {
 		rtw_err(rtwdev, "failed to download beacon\n");
 		goto free;
 	}
 
 free:
+	dev_kfree_skb(beacon);
 	kfree(buf);
 
 	return ret;
@@ -2346,7 +2352,7 @@ int rtw_hw_scan_offload(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtw_fw_set_scan_offload(rtwdev, &cs_option, rtwvif, &chan_list);
 out:
 	if (rtwdev->ap_active) {
-		ret = rtw_download_beacon(rtwdev);
+		ret = rtw_download_beacon(rtwdev, NULL);
 		if (ret)
 			rtw_err(rtwdev, "HW scan download beacon failed\n");
 	}
-- 
2.56.0

