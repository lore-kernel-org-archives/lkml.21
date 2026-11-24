Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521894;
	b=B5L9SdhJaa5+fu224yvLt9HeICgTH/457q6DMCiK1SGnZrubWQNeEd3wE0UAHYsbp5Sj
	 B3/fukN1dI3S+13RO2DWC0QhRZuMrbKc/RoSix8Jh4Vw0fGySsJpU0lMGF+/laCkj7nCM
	 AWI0R9tmBu8wdUtmkFuBTCLqg4KZb0/DYmNkSDX3V7+Vzrswz2EZ+Sfp63/4hWNKpX6jC
	 EF73FKyfHNQB7jxEufouQ+wDJnMyjEB7yqaYH61eWml/OqM5s+Tb3N98+TrWcMDAPuSLs
	 upkzlIueeO46iHFt3m+fClklosHZIn/0WqIo+OKDMa/gzAMCkAyB4Cta13j1w9UmFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
	b=mjW4sExJCA+A5aajFKTIelUF2MSRhc/zCOQDmwdCbG43qsJJCQ2TKGTdYIDvJgjMcjwu
	 SpFqRSqDqhRzJwk5Wa75SULSCkstgR0nTauk9eKSYqz98CjcHMn1s6CyjIsNgiJtYOp/x
	 b3VsOYp8qKytULLjHiJL7pEEOCEweafhR1w2pajjeUantT9s9uZ9pkIP5c2O+ATk00gLZ
	 Wk5Np2ylMT309T6iwqPlhA1F10DTtdy0u+u0Fbf4z0wsiL9vsI9Qmdb+d/155AdGalFbS
	 miD4OVQsclpEEzSDwkeC8cRLDDL5bL56m10vwGXFzsiyjtzTqIo7KjP0d1Q+QWdsyYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ztCxAWJc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C3E606A685
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C3E606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ztCxAWJc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso34940475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521892; x=1796126692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=ztCxAWJc1VAJUL+s946mNlM8AQeOvHWKnVcsbgNxSNGCvdyV1EFBs8mAn8XL+ZORVd
         sdWFEyucK751/D2uMke2PzypxyR7mhA+JNg20NX14tgmi16Go5mPBNKLmD2iZ2F+tO7s
         HRV5B29lda7/fF8BzbP8VBI1WfioyI43Jw7LU0DEUqsBseOBWbLVQm2fMAquAqR/UpTv
         VQzu5c4yorYOibgSj5n18Zjsd0Z1hBY1qjgtbS7XUbcj4My6Ryy3SzNQUcErDiqsj7Ui
         L0rxBhHJKNC6XJKw4lY3ILXNXW+W/gMjQgtOAAlJNlIfdsDZK4+QciwtR7LrkOF4ipAm
         Tc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521892; x=1796126692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=K8U2CGOS6TZ4ad3TowATtIKGBjPEeDiqY7JQ4fkvqWABiALxyCrdmsL94YGnJuT+MX
         yV5p8smmdhIpQqZV8xoaKw+9Vy1/ZW1WDzaFB/p4tu+3d8S6T6EJZ4QKlzfOeYP5SMXE
         utr9DrWdz0Xehd0Ha1ZIgOEwe4IHlsCiF2Pl8ZEukepFyAwwO3j/rHsAmA9Snr31+CMt
         djWOklNAjIlIe/Yu4nC8WtFkEhrnAZ/kI5Z9xjkCdfhkk/iDRT4zDGx+whgq8cWwLXMw
         aMzq1e3KOfapdwbI+1X8dMnF5n8sEUA9uEeX4K4seeyKIzQO9IBjuHN03YZwn2SWaRbP
         OuIA==
X-Forwarded-Encrypted: i=1; AL+hErFWP2Cy3JIN5kh0W2Xfe0ppLietaQB4hH0EYLfiuH2lBDZtIvUB05/i6JAOeiBMc7yT4Ax0jDGD6gGcjtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i1P00IS/vWNQORBoYEDvwCO3d4QfoJBufxIzRUfXXE2g/vLWZ
	qKQ4T8TWXcUmp9UMc3fDUABhefkESlQRWP6ODerapknZuejMcDrvZ6q61kl/KEyg5gA=
X-Gm-Gg: AZFdTZeyLCNkqS1p06UoNe94Wpnh8vDEachWDJ6iATrHRgJRd5zfeEykutmUmtxgrOJ
	X94/AvLmW0xysc1LZ8lyVTayau5Vnas4Y0PuQ1hqhO0/nF8p1OxNydbpNr3w2Oo5aAGWO0RKWqn
	L1+8+nWUUd5G9eFZWqbUFjQzuFMtgEiCIIW1MfZGRGRQjXLuieqNxMoNTsDsAANgnFhXtkQsyoq
	a6YSLlO1SKz5n5gNjpoHK8Ftx/cggkFl/wz3Vqt289kaQuVIUvkKQO29hd5GMqI76y4ySbmILZm
	BMrhkqtXVHWW+4P5xqBR5+Ei4bnWlaTeomDDNoM/FSXv/uZABL7WKBf9Rdd+ZCKu3QCZNiC9rfd
	P6Dghb5tDmkPnw9EEe2/693AmMVsvHTQXWL6zjtLi655zRjtjdL3ydvtBP9Hs02C5MysvcIYntw
	iOtvV5hwTUUpNP2uoSynkFGEc9JL7NbvcLPDlRskkDiNnWcq3IS3Llbt9aYb92L1JJecxVftmj8
	lEv5QCFYveDz4zbOsGozT/zJ4bt1JO8ClMrHpzMnMf1PXneL8XG8ONoLC11kKs3XyDfSSixQiWY
	bsTLRsVpxcIldofI0qocgrUS3ZQqSlZgafiyBhbkD2qit68JIlgbww1m9gp8YV5o3N2ZMtKoquZ
	kHf3MWtES
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb9de0d5ffmr64185675e9.25.1795521892212;
        Tue, 24 Nov 2026 04:04:52 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:51 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:32 +0400
Subject: [PATCH v4 2/5] net: Accept MAC addresses from longer NVMEM cells
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-2-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=alchark@flipper.net;
 h=from:subject:message-id; bh=niDymIQqvfRIIXXdqI/TGZmfY9YHOucl+/lAZoeizp4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZXZqQ0/bSZxXNP9Hn06upbPoGeitm9n4su2avFi
 86+E17aMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFR/ucTIcCVAYtO/Sf5nGx6silzcJuR58W9xqaVavUtavJ/e4iPFrxkZNi0sLzY
 7q6F4e63J1AW801YtWhkh7MP7zerfD2eOxefuswIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A "mac-address" NVMEM cell may contain a longer unique hardware ID,
beginning with valid MAC address bytes. Both NVMEM MAC address helpers
reject such a cell, as they insist on exactly ETH_ALEN bytes, and then
discard any tail regardless by doing a copy.

Accept a cell of at least ETH_ALEN bytes and use the first ETH_ALEN of
them, leaving it to is_valid_ether_addr() to reject unusable content.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 net/core/of_net.c  | 4 ++--
 net/ethernet/eth.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248..d4a256521954 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -85,7 +85,7 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}
@@ -108,7 +108,7 @@ EXPORT_SYMBOL(of_get_mac_address_nvmem);
  * because that is the default address. If that isn't set, then the obsolete
  * 'address' is checked, just in case we're using an old device tree. If any
  * of the above isn't set, then try to get MAC address from nvmem cell named
- * 'mac-address'.
+ * 'mac-address', using its first six bytes if the cell is longer.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index 39aab0f8035a..b69ef0eb16f8 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -508,7 +508,8 @@ EXPORT_SYMBOL(platform_get_ethdev_address);
 
 /**
  * nvmem_get_mac_address - Obtain the MAC address from an nvmem cell named
- * 'mac-address' associated with given device.
+ * 'mac-address' associated with given device. If the cell is longer than a MAC
+ * address, its first ETH_ALEN bytes are used.
  *
  * @dev:	Device with which the mac-address cell is associated.
  * @addrbuf:	Buffer to which the MAC address will be copied on success.
@@ -531,7 +532,7 @@ int nvmem_get_mac_address(struct device *dev, void *addrbuf)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}

-- 
2.56.0

