Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759986;
	b=mQoPYSF7QOpMBA5QpYJpP4vrY9VfwzF8DFAwPzxKfI1H1fpRQliE0ZGE9erc8/nExln/
	 judmvt+zrCx9RbxZieJfPf5ofBkZRGf5CGBTC0dg4RK7oxdlnBcxw8yAi7p/j3G9f3hwr
	 AZbfyw8H9h952eFc1ctgLDw/1ygocOIzDI6cyXFqzWKu4nxfTP1EVVWQhEvWlZTsHARf1
	 UU/xVBrGqdxbFlFmkuX/MkJOC+8VLqo8fMzf+DQiPM6+3jubOiaiYmJoomOIEadNo7fSj
	 k/xURxycNRHg5lUqjEJOuB9twjdrIwAxNxEdIL0o4u79uTol2comES2E44or3/M3G9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
	b=Y4LNVqMeKak+UN6jFnXicILDhOTRnHj75BqBVA1x7NASWQnpo9M1fwhPfLqq3gL8R/uz
	 DiC7gppd5Qobz3p/xMqfkowqoXwKB4uEylVFxVQXkRFKuasMMElLGjeGurTSI9ne5KXe8
	 HQIK7iBt49A+i0yFboR0BNFTEqwu0fTp1Ajdf+cRDNrMdLbMZEMlZ3PMAmXXzU73JCI/W
	 Y3MWdiBaHZNY0sxKnjdM3DJcY1dCwCE1M6aQMi0pCjK+NpY7a8Exv3pwy9c5Lzh6zecwz
	 iS9Hl55t3FPCVWNOiKgxeBPn/MTBbOdyyUCAZ3dfabRKu0ZA0c3rKUaKfU7z8Ri6mig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwYpj1yN;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FC606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506FC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwYpj1yN
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386d1859e1cso2076512eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759985; x=1796364785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=VwYpj1yNNcxsJvWPKOsFJhMIArOE21iHVxBb/peU4uK0KJ+3YU/Mcb+iYUmJ4sMXw4
         Lz7me6cMlJvnDG0s2KC4n9BpV8x/qRAwGZ/M3Sukj4vXTqUMC6Ntb4qSSS+IJsJjc6U1
         SxVseqW6uXRJ8VpkhEkvKWsAyQFIVWirDjvbbjDjW16lj4jViEVF1ffOHIuie6hZ3EeP
         jGSk6FjpF4azPRRvqlrU/AZMDg8kU59JcxmhtLBxH2KMU1hH+poj2eDgDR+ktxd0C5Uc
         GqFfox0rSgXyeuZ76p68I/UOC00CODbDjnUCbj2Ai+Nwdt3O1UMecwBWuSmQqcjbwf6k
         9IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759985; x=1796364785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=qyt+gwMgyyql8EKQX86iVNWrW8pAsFFvwRBuhO5aYgCN2iaQOmyGnaF3VDCz00rI2p
         VsImc+DF6YuERrhBfyYFagilMOb0dymmhGVvDOzOzu0EfWemB9khDaS7uEVhtldEmYCs
         PmwTUJS7yL6Uk/mi+4oZWPng2X+OE2Vp+w6CeZbMMYuHPhQVWwhIGUhhvfYq8tsS8C3J
         KCN+XSIyVvHJicgxrAFrym/1sKFzihBgeL6V+cKWYJR+8bR+TR+GyHOYTOtnh+ymsOYI
         YDQOa9EyeD67D7YDtT5UPigkPqiVvR8vxQZ+ts0l0lOfckh+hz7EeqtBv9RiHvUdiwcP
         gfqA==
X-Forwarded-Encrypted: i=1; AL+hErHUH2uS4YG9hX3M4c1JfPjpIj3AoFkYthaXKQzoaM18mTrEja91vixksLL28bqmVcTBWQBg38jWLE9xoCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n/+2axUWW7+ANnRaCfUKfgrpvyZSZYCW2ddrhYC4rdg0uYjl9
	xWnTngSsbeqvyQTUegbBQN0Eh3rSKJibikblPcXVklKniQUoGCHwrKf6
X-Gm-Gg: AZFdTZcEwYyd0OsDZOLi+QyXVGbXaM/EumXiQm7bHK+6r8ifHZWcU5B2oJlE9jNedDj
	LNQNCP8cDxNqNJZwhIl7SK2gl40ZUZLF/MVy4CyBGIv5z06lZo6DGbAIzg1APKZJcyTNAXBjs5I
	brjHq7taaS9U1/DlRYFLz61kp30Zy5GyA6MCY4FG8Tw8OIUjS/+YMbZd6hnCPxBH3QKWmHMBDRK
	ZDzbKVpn4pMrNwxJEAYE+iJBuURVlPFKwoXqEyZUMY1BKrn0iJmqhna3fXYOmKTywPDSKhmFrSY
	jWHrKdnWLgEvNScjtk8pyUOx1BGCxKn8OrgdjKV1EZDkARu5ydBSemHA0iYg/yKEXFhgG9paJPD
	N/gy+JhqyHfGHyqIZX3i5k/fWDGHwikEsuJTdV21pNJpddZSrU5QaoZ594s0DshDP5bWueL/ZP3
	yAZbhlzQ/X1GhZNLxhLQk/J2977XfJrJ2XIaVX9ixFiz3Gxehv0lnHR1E19FOcWQsvMKfN178oG
	BETDu75iCjTqfDt6bIx6A8gcynqL1RutBavuCg5Bs4WSjPSEoHjXiTcaThqTjIQJKEfaGx9G2+m
	6HhyYaYnP8fiIRg6AJnIkIFueZ1XTgMxg/WxxljNtsPYBgMoJvyMZtyrl28cEnPyopO5lg==
X-Received: by 2002:a05:7300:ce81:b0:384:a3c5:35b8 with SMTP id 5a478bee46e88-384b3986ee5mr27744207eec.8.1795759985522;
        Thu, 26 Nov 2026 22:13:05 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:05 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 03/11] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Fri, 27 Nov 2026 14:11:33 +0800
Message-ID: <20261127061147.506129-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

Move the OFDM rate table next to its only user, ofdm_phy2mac_rate(),
which leaves rate.c independent of the PHY code. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 17 -----------------
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  2 --
 .../broadcom/brcm80211/brcmsmac/rate.c        | 19 +++++++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        |  7 -------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
index 7eae73ef7e..d519e950ca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
@@ -101,18 +101,6 @@ static const struct chan_info_basic chan_info_all[] = {
 	{216, 5080}
 };
 
-static const u8 ofdm_rate_lookup[] = {
-
-	BRCM_RATE_48M,
-	BRCM_RATE_24M,
-	BRCM_RATE_12M,
-	BRCM_RATE_6M,
-	BRCM_RATE_54M,
-	BRCM_RATE_36M,
-	BRCM_RATE_18M,
-	BRCM_RATE_9M
-};
-
 #define PHY_WREG_LIMIT  24
 
 void wlc_phyreg_enter(struct brcms_phy_pub *pih)
@@ -2486,11 +2474,6 @@ u8 wlc_phy_stf_chain_active_get(struct brcms_phy_pub *pih)
 	return active_bitmap;
 }
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void)
-{
-	return ofdm_rate_lookup;
-}
-
 void wlc_phy_ldpc_override_set(struct brcms_phy_pub *ppi, bool ldpc)
 {
 	return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index 7ffff7f519..c5aaaec434 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -234,8 +234,6 @@ void wlc_phy_ofdm_rateset_war(struct brcms_phy_pub *pih, bool war);
 void wlc_phy_bf_preempt_enable(struct brcms_phy_pub *pih, bool bf_preempt);
 void wlc_phy_machwcap_set(struct brcms_phy_pub *ppi, u32 machwcap);
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void);
-
 s8 wlc_phy_get_tx_power_offset_by_mcs(struct brcms_phy_pub *ppi,
 				      u8 mcs_offset);
 s8 wlc_phy_get_tx_power_offset(struct brcms_phy_pub *ppi, u8 tbl_offset);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 6841bc0052..ac577c8e85 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -266,6 +266,25 @@ const struct brcms_c_rateset cck_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
+static const u8 ofdm_rate_lookup[] = {
+
+	BRCM_RATE_48M,
+	BRCM_RATE_24M,
+	BRCM_RATE_12M,
+	BRCM_RATE_6M,
+	BRCM_RATE_54M,
+	BRCM_RATE_36M,
+	BRCM_RATE_18M,
+	BRCM_RATE_9M
+};
+
+/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
+ * increments */
+static inline u8 ofdm_phy2mac_rate(u8 rlpt)
+{
+	return ofdm_rate_lookup[rlpt & 0x7];
+}
+
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index e178b1a0e2..7c1d43323a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -198,13 +198,6 @@ static inline u8 cck_rspec(u8 cck)
 	return cck & RSPEC_RATE_MASK;
 }
 
-/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
- * increments */
-static inline u8 ofdm_phy2mac_rate(u8 rlpt)
-{
-	return wlc_phy_get_ofdm_rate_lookup()[rlpt & 0x7];
-}
-
 static inline u8 cck_phy2mac_rate(u8 signal)
 {
 	return signal/5;
-- 
2.53.0

