Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210149;
	b=GuPkO5u7SXsCBzPBORElsTXIre7BTmCmOzAaJ55/NK31iqk0sBeR2Cj/rTQ0w1AEVAaw
	 tz3kXuotnVW2IkZ1WOZNDe3n7qy3NcKBkBux8fCcC5f6DxH6zKfjp8NmsTPSTPgs5EUdd
	 jDeXlsW4gGWW3sTbMYK18PEcErqqqFf6ySWX84DHqiHAu6M+dUVXB0H6A9Vk098OMl/Ty
	 lY6oqtTXvThmvXEyk6FO9uDNVTNukLK1ZBMcPhH+6RVJ5ST/Tptu1enKqaOnwFCSxGVvG
	 V4EVk34252zKqQA8we9gunsjR0GDugvnIxQxVstMyTXVt+4sFDnB6RETMq2ZP95Y2Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RtJF5VKE8u91+dvBTPTeMcNPvnfKxdIIH3R4flqEr6s=;
	b=2vdc0m34m1sg5P/Do4U+7+WEJ0PWlnWFUOOHswI2TyTwIVHfiPRUpW7dv3gdxtlLjd5T
	 iUy9Sv2touzr05rEqyJjeAbbXIARsprm8Bl7GfwhsdKg4z8+2gddkWPe5VWbN3i4FT4TE
	 1PqvCVnasvlM9p3mr3EXOKfFOOs0SskOYGYzkbnxc47+wKfITFtFNoa4cz//fZkKUctRq
	 mU56a/IWZcUBEPaQqoWxYTR+396/UuSHe+4r0B9t9A2hhc1QrPjr8Xcpvic4lOOILogAY
	 vfk81ocksIW+ERk/5K7lo/8fESQBiXYL8GdXJoOYHsEPw6ePRKlsOlk7KpT8Ocngvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuQAj3sa;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A18606A6A5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A18606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GuQAj3sa
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so453798e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210147; x=1795814947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtJF5VKE8u91+dvBTPTeMcNPvnfKxdIIH3R4flqEr6s=;
        b=GuQAj3saQdXCDa9aobPR2y7rJ1ST8tMdTFd9D9LRo+H/hjqGMY5/LQGUIWb/r+jxFA
         z+rvM8ElYpoaTxdwei476vbYYWpbwIgrU19fIzFT76zqhVnoads2aM5Ffv26F3PuMyw6
         KFSVSRSLFkw9OeT2+/2fT2YnpxQByTfJeJSskmqJZ0m38817C1+m7ReZ4sBQQYWvqbip
         0lGtd+ps+lSFBHSL3pPNovOZsiaJzpyznOLuhqnjudnA4Lz28YWTTuQjKo+ERugCKxH8
         bc6N5XCBM1H3Gui2xqbSn3rW4nOlnGjkiM3YfKnE1ncOUr+qe6askR3Xz6U+kcCNwXfq
         nqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210147; x=1795814947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtJF5VKE8u91+dvBTPTeMcNPvnfKxdIIH3R4flqEr6s=;
        b=U+goW6l4Qn6B/5RNrbJkpH4rACkQf1zPInJnBihDYlQi6ZoFNAJTjowiTTAne6sA6g
         bfBwsUgSRc0bjL7T3r5Hv5/rgwTk0dS4JG1nsBoZc3rsizsy/36FcgL724z7s9dCH8z5
         A+43/ziiULdGZJKu37r36F6eaz8QE0UkexyDkBRQ6hvdaWEFaIP3JhXa8f5uhbQqWjRs
         WqwXlSEJY0l8rcuruJ/A/Llvwv/ub/Cst4XN8mcOGtqUroeqcvwQr4Rg391gdjwc8Td6
         MkwauULCgDPi7BgzyG1kieJGM+geDlQK5uVE60U2Ef9zl2DaDYOva8IUwTnIp6rUKxoo
         1qfw==
X-Forwarded-Encrypted: i=1; AL+hErFErPCQOK0ok0MHhUxMEIwD2GSS2M4TEWfa6LyohSzrMpXBHfQWMHothHFTBlL8wj34BEyx46dBYQUOv6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mAc71BfIMMmtnXTszslJnavOIlIvsV7HnbOkAkUkxxAY30Kki
	PBIGrp/+3KoRA8PMSVQjq2Ywfk53goNShpFbu0aUzhCZUHWfx92fMZUw
X-Gm-Gg: AZFdTZf+2lDa8E+48n9I9Wm7t3ApuTtNBiDmjnhmo531f4nj+F83QTieeK1nWgNrCb5
	tkepEAwxysubPfETEr8Ou5ApoYkNHaIUrim+doZKWdJrHOyiovrnKoaSg+Q+OcOk9ZQcz5za4kN
	SjCTwIiSG2eIyokkaBkkNAWkGR0UhyCKdj3bqsNqh3eDA/rigsxBc7DwVwFdNdAIik0bVs1XdVk
	FmXB7AS4EgTqMxQr5H/cE3cdBDVwSDxgh/4rkCHLh5ZHi4YB/hkSCvQbGcqPU5R3Q6esZNoAP/O
	3aak2p+FLgDhQTNdsAU7CJVUk6muqZINeyDt1CIpQj88sf2mLb/jC87EY7TzIwQnJODs2fPl+up
	MJ1uC/Dtzd4dxpJSq9sAagdmZBWJQe4KLApFI46A5fKsFd6oM62ryeyA3P8Zra00MXnVTs3Gust
	Edv/ktANlPg0oCKLW68DSpv7+p6qNDaia219WJJIXsY4CFOkg9njBtJdhGz6m/4Oo2KwT+shEmR
	q3U+kc+D9lnRrAegNWW+TqFi0wVoZh3CzePI1CnuiPu7ALUzIPCj/8/OdfmgQ9iWqbLJtkRxT2C
	1/X8Q5qN8ueRAJQtr9UCxkmTVIM+dK8H6EgIHU7Vkag=
X-Received: by 2002:a05:6122:7ca:b0:5ea:fae8:e69e with SMTP id 71dfb90a1353d-5ee8aefbc08mr2508517e0c.11.1795210146967;
        Fri, 20 Nov 2026 13:29:06 -0800 (PST)
Received: from arch.localdomain ([181.80.89.146])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm3709291e0c.1.2026.11.20.13.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:29:06 -0800 (PST)
From: Paulneja <paulnejacontacto@gmail.com>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless v2] wifi: nxpwifi: bound the pairwise-cipher OUI walk to the IE length
Date: Fri, 20 Nov 2026 18:28:54 -0300
Message-ID: <20261120212854.25239-1-paulnejacontacto@gmail.com>
X-Mailer: git-send-email 2.56.0
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

nxpwifi_search_oui_in_ie() walks as many 4-byte cipher suites as the
pairwise count in the RSN or WPA element of a beacon says, without
checking the count against the element length. An AP can send a short
element with a large count and make the walk read up to 1020 bytes past
the end of the kmemdup()ed beacon buffer.

Pass the number of element bytes available at the suite list and reject
a count that does not fit, as commit e667aee1c192 ("wifi: mwifiex: bound
the pairwise-cipher OUI walk to the IE length") did for mwifiex.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Paulneja <paulnejacontacto@gmail.com>
---

Notes:
    v2: shortened the commit message and dropped the Assisted-by tag, as Jeff
    asked. No code change.
    
    An LLM was used to locate the bug and to draft the patch. I reviewed it by
    hand against struct ie_body and struct ieee80211_vendor_ie and against the
    mwifiex fix.
    
    Testing: no IW61x hardware here. The three functions were run verbatim in a
    userspace harness under AddressSanitizer with a short RSN element and a
    pairwise count of 255. It reports a heap-buffer-overflow read before the
    patch and is clean after it. scan.o builds without warnings with W=1.

 drivers/net/wireless/nxp/nxpwifi/scan.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 4eeba6700aa7..33779e21336b 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -79,12 +79,20 @@ _dbg_security_flags(int log_level, const char *func, const char *desc,
 
 /* Parse a WPA/RSN element and check whether its PTK list contains the OUI */
 static u8
-nxpwifi_search_oui_in_ie(struct ie_body *iebody, u8 *oui)
+nxpwifi_search_oui_in_ie(struct ie_body *iebody, u8 *oui, int ie_len)
 {
+	const size_t ptk_body_offset = offsetof(struct ie_body, ptk_body);
 	u8 count;
 
+	/* ie_len is the number of element bytes available at iebody */
+	if (ie_len < 0 || (size_t)ie_len < ptk_body_offset)
+		return NXPWIFI_OUI_NOT_PRESENT;
+
 	count = iebody->ptk_cnt[0];
 
+	if (ptk_body_offset + count * sizeof(iebody->ptk_body) > (size_t)ie_len)
+		return NXPWIFI_OUI_NOT_PRESENT;
+
 	/*
 	 * PTK may contain multiple OUIs; iterate through the list and compare
 	 * each one
@@ -113,10 +121,13 @@ nxpwifi_is_rsn_oui_present(struct nxpwifi_bssdescriptor *bss_desc,
 	__be32 oui = cpu_to_be32(cipher);
 
 	if (bss_desc->bcn_rsn_ie) {
+		int ie_len = (int)bss_desc->bcn_rsn_ie->datalen -
+			     RSN_GTK_OUI_OFFSET;
+
 		iebody = (struct ie_body *)
 			 (((u8 *)bss_desc->bcn_rsn_ie->data) +
 			  RSN_GTK_OUI_OFFSET);
-		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui);
+		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui, ie_len);
 		if (ret)
 			return ret;
 	}
@@ -132,9 +143,15 @@ nxpwifi_is_wpa_oui_present(struct nxpwifi_bssdescriptor *bss_desc, u32 cipher)
 	__be32 oui = cpu_to_be32(cipher);
 
 	if (bss_desc->bcn_wpa_ie) {
+		/* data[] starts after the OUI and OUI type */
+		int ie_len = (int)bss_desc->bcn_wpa_ie->vend_hdr.len -
+			     (int)sizeof(bss_desc->bcn_wpa_ie->vend_hdr.oui) -
+			     (int)sizeof(bss_desc->bcn_wpa_ie->vend_hdr.oui_type) -
+			     WPA_GTK_OUI_OFFSET;
+
 		iebody = (struct ie_body *)((u8 *)bss_desc->bcn_wpa_ie->data +
 					    WPA_GTK_OUI_OFFSET);
-		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui);
+		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui, ie_len);
 		if (ret)
 			return ret;
 	}

base-commit: dcf495789037ab78d8ddf5844239cf85d92ac5f1
-- 
2.56.0


