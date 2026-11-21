Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268375;
	b=2TzP4IcBwjM6Bm8OJEIjiU4MS++z9wbOE+x5QQl3SLRsn6Q4Jzn+3p7nqxkvBfQrcdUN
	 s5R26JOrpQSfa5cHZVPQnwDBzvqCYw2CpEjZ+Fx/QEp0Tc/pWRo89wV79tvruMfbJnVjs
	 DBchhxhOOKlkBn8duRYIwtlYAl8iYLyMZtrJI/JXivgGig+MtFH3LztOjEfeFy3NsAXLv
	 8XTPwMRFunBrL75e8zKbMPCEI9e96WEbJ6gW6XCarnQUvNf+aSEwd2NCaZ1izE2NhDQ+f
	 Pd141C+Yiu3epmKgHd3V+Tm46h2PuUo7pkaovVWjMyJZtLfxqiyRV208LmichQRq8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jpAB7bN4jOX4zDM3zWu+BqiTANE8OqvGyHkfG0EgWp8=;
	b=nwZ6av9kdCK8tBiBV0jbvlb8QrAHLxXpkyzEpN7jbhZzDhVEd6/KF3a3cALOk3EEyAlK
	 h59an+Gs7b3Tj0g8eKCvMQzhpvv6FU3BGjn3HgvPl8ODQs9qbO0Kwuk+aJxHeeGWmzsrR
	 gplMVl+oGjO1Hk1XteIYUIaIBXwsPUr0qcLCO4wB28BfbN8wKxs8HjQpsYqSx2IPvq5to
	 WaZIFLewgmSeQYxe6p4cfGw1tkT7dJacI7yd93WBQq/6YgzFnj6Dgu3dfYB7phCNwvpYp
	 XPa7CC3XVFE1PO8SBXrbWOLQRbGXiEBANm/MRps+x+ZB55TxRVmXenaARVQUgIRduOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0GmXMpc;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70C606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B70C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0GmXMpc
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02f04a426so15388935ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795268374; x=1795873174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpAB7bN4jOX4zDM3zWu+BqiTANE8OqvGyHkfG0EgWp8=;
        b=x0GmXMpcJGEGUgPPs38gakwdA6J6Z0yLES82zLYAFZLqsbI/lndHmKNXRzl/mvoskn
         XKlNKB+5kMzOTrRf6SM1je6hFibJUyQ4CBKY1OrWOpFHh0uVsiehpwzlbwC6ZpR0FapB
         a9Wiyz0iwaw0PQa67CPgPMv1wpd2wbSKX8D0Sf9QXzwur2fJj8AdAj/n5oH3jvUjCAB+
         lUL7doeJadhWhrDsV7LUeXgr9H6M0Il8DnFZ9xynGi6WUcendggG/Z6WP8pU8YlDYQgt
         /KAoFs8ASbifr0GK4SteOXLxN1kX2EGyrEe+zfHYAgcIv6TtUi7tNEmW37akNyRLEPEB
         wI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795268374; x=1795873174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpAB7bN4jOX4zDM3zWu+BqiTANE8OqvGyHkfG0EgWp8=;
        b=v6mWewstzfQ+HFNItyOHo0fzMALaoFivlXMcS0eznAP4T+ksFO/cLwhmqJP50kKg+I
         xcint7iqe7+f0lryYqOyqtBCFiAuLRwElizqulm/6VboJbn6jOO6LdG/IdSjBLHt4G7l
         0rLr+jJ3Sk/yQOVOQ3rWcuvZcCWxHWjsAzAp1xNkmKEx89klYt8ugc6wrRQ5W+snF35S
         +wizpU2pkKp7885CmRZk6Uh+3l5QVEKE8x1qzZ9EZT7CZuo8H/JNQXqauEYZGA4iNSew
         /QOCVLYWaN6H7j+6kJaZhX1u3T+lQu1QsPj/hTNYU0B5iE4ZDdv5Z2h8tSv30ZLNGBfD
         MTeQ==
X-Forwarded-Encrypted: i=1; AL+hErGnhiGp1cR0iSlq3/ZutLDy4eS3QNXJFImy5t7c9E2H/KeSuzsXr/KobHaFdK5VAmOGholCR1o54IZGYgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q7Dj6ATRHfJ93EG9SZitjMEyosTw7KF7BplU1ZJZB8RaGmU2d
	C3a4vkiCuuh51FKiowRn7+07Z8NK0OxxrzGiPeEyAB9wlXyVo5x9cBYk
X-Gm-Gg: AZFdTZcf4ly8kYm5oGu/+z5qUOEgiQxRGPl0JeVUy9Miyiypgx7/p42CGz9S12KfQrt
	WDpWORuG7x8J/OCnV72jSMImtbyv3TiVTyssNSOxvkLZiSNSH3hHOaTEhEmaAwo3f4IPuWDnDrv
	oNs/ak8A3Y52YAZFTNoQPGEu7vNN4maAPoyKdm4jju+0/LQQx2btdz8pmUi/MdnIBRA/21bIgDc
	hUd3EtGlOO6VQUtPJXQNAH7155MxtIaOAXF8gixg38+yfnQYDeEeQFsqZ7awoNRBIjHMwkIMZ1c
	eEa41CGQg4KQC7vpk8nbAaeCyBi8Dr0mjVJ2PojSbxazj4BE6vNiFU00GYNXEZlAsZgf14oMIQ0
	ol71ke1wB6Le8Ds++3Cv1nBUhcITXfqF1yjAgqtS3DoXmxFt4FsOAPi+CkqrUQhAHpmBkfOPfKa
	5DH/Fkxct3GHaDlBUunPppK8LadxlBfhVYLUI4z+sbQm7dJNlGo0QrMucU5TKpMBdr4bHqPx4Is
	3yYttZiZDpP2lAK1AT8NpYbAgah4o07lnC9oVhw0Qz38Za+7OSKnjzO+QmX5cfQgshaBI3C0tdt
	dvOVqZ+Q5hvDmbmqbWXs1dYh4Fa7wHIpAgPx+fg=
X-Received: by 2002:a17:903:98b:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2f03f1cf5ccmr67862115ad.10.1795268373920;
        Sat, 21 Nov 2026 05:39:33 -0800 (PST)
Received: from omarchy ([14.139.177.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm26621375ad.35.2026.11.21.05.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:39:33 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH] staging: sm750fb: Use str_has_prefix instead of strncmp()
Date: Sat, 21 Nov 2026 19:08:43 +0530
Message-ID: <20261121133843.127718-1-vaibhav.chahar26@gmail.com>
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

Using str_has_prefix() is cleaner and more readable than using
strncmp() with strlen(). Also avoiding the possibility of errors due to
mismatched string lengths.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 99d410e18..658e93b27 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -854,21 +854,21 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
-		if (!strncmp(opt, "swap", strlen("swap"))) {
+		if (str_has_prefix(opt, "swap")) {
 			swap = 1;
-		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
+		} else if (str_has_prefix(opt, "nocrt")) {
 			sm750_dev->nocrt = 1;
-		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
+		} else if (str_has_prefix(opt, "36bit")) {
 			sm750_dev->pnltype = SM750_DOUBLE_TFT;
-		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
+		} else if (str_has_prefix(opt, "18bit")) {
 			sm750_dev->pnltype = SM750_DUAL_TFT;
-		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
+		} else if (str_has_prefix(opt, "24bit")) {
 			sm750_dev->pnltype = SM750_24TFT;
-		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
+		} else if (str_has_prefix(opt, "nohwc0")) {
 			g_hwcursor &= ~0x1;
-		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
+		} else if (str_has_prefix(opt, "nohwc1")) {
 			g_hwcursor &= ~0x2;
-		} else if (!strncmp(opt, "nohwc", strlen("nohwc"))) {
+		} else if (str_has_prefix(opt, "nohwc")) {
 			g_hwcursor = 0;
 		} else {
 			if (!g_fbmode[0]) {
@@ -1073,11 +1073,11 @@ static int __init lynxfb_setup(char *options)
 	 */
 	while ((opt = strsep(&options, ":")) != NULL) {
 		/* options that mean for any lynx chips are configured here */
-		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
+		if (str_has_prefix(opt, "noaccel")) {
 			g_noaccel = 1;
-		} else if (!strncmp(opt, "nomtrr", strlen("nomtrr"))) {
+		} else if (str_has_prefix(opt, "nomtrr")) {
 			g_nomtrr = 1;
-		} else if (!strncmp(opt, "dual", strlen("dual"))) {
+		} else if (str_has_prefix(opt, "dual")) {
 			g_dualview = 1;
 		} else {
 			strcat(tmp, opt);
-- 
2.56.0

