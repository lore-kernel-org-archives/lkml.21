Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685886;
	b=VHD/8xNOD+gejv/Atr98aVkCqlS09ls9pOegiViCKVVOf9ApLGiY6iLKntg3CYlyA1tm
	 7HuhA//4U2geHZGIUda5w6ONHSJRcCEOhvgBXm78moFkii0f5iYDdRN10bqxamb2lt98H
	 gVQAMjbbcWJMqOPMjIyj+64wPnCKpOBzGbFJbIO6J6f4ZLJr3mAitn/YKWJEZDsCZqfei
	 uQcHQCSPruEbxFNhu6zL1Zd3mdPOXNHlLKHyJL/rMYnPRL9ZlTkgpSf/4Tg+7UTwBjb5z
	 0mafvexuqfzzsz6rmf1DQVPOAAX+mKAUZ607XoCUWln5WfHo6uNpK2sR/39hsKdORNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P96TXcMA23WG6JolthiehBkQWMHEz8OJSyqIerT2P4Q=;
	b=heIIowg18Uch9WFo2Yp5zwP1KppGtoFB7saEsX1kyen9JRNgjr91RMjmcSOW9zIxW8ne
	 FqC3ihi8sJFkDn0981COYltT17LmPKPjQabOCjeIrVKv6HRHbKIKqmAxkqt6n3CQR5FPo
	 LHveu9KwfTS/icdCt5USVWlWKRojbW4uBM7yGH5ts7txzMULnRB/yAHbwrOgrmRl2MOnE
	 Md7hfzZztq4MkKY1cFKUqjPrJ+4UW9QXOmSlpwFB7tKRPXsLaVKstEIYWfzF9PO2kGLZ6
	 s2/Am0Xj+BQQiSmv+Imn4E1KFyh3ZNJ7MfrEgJ6DdQcvEqvh/CMcZ78dVy1qzTbViSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A308yLFB;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200EB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A308yLFB
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so3439378b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685884; x=1796290684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P96TXcMA23WG6JolthiehBkQWMHEz8OJSyqIerT2P4Q=;
        b=A308yLFBhfx0UWudxJTFF+TuS20TYf9zVWIZFL4i05qjBqsX0/xjKgIJqFnj9+Sw1r
         uFIsuJ8JPosWuFpywVUdJrOJzMkUSwZwOxhzDuR/zafSv+aJOpEpKc092ZEJlc1PWn+I
         UAWVu17XmPEEyJ43AU35EAeUsxhqr3/A1DjuFkjc83wCJwJDmOBCadCFxrcQmxuXKhIX
         naaEMwPg2M08IMrAFUvD5Qo8aDBNqQ6XbbkaAqCa9ORR++jalF/96CzU/SFwhUspmij+
         v6900A8Lv36NpYleS2ovLgpzwtfFXCDCLtHE3+2hfBXc2R1CojxUB/6+UZABLS7TgUm8
         o0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685884; x=1796290684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P96TXcMA23WG6JolthiehBkQWMHEz8OJSyqIerT2P4Q=;
        b=0e5p4pb7UgoI6qh8U2jdcyNzap/DKIHeI5/AWTdxX/FedfAxYV5MODD5E8hxOcgPdv
         A6Bwr0kkOVSxkg27WHmjn/dEpLPaNOUAAVYPTqywzD82wN/BnMFI0qp8PfcyQiQovLVz
         +eEtAZbg/BZvYmCMqboWikZjDRieAtxTM+J+PUZKMtBI5DmSOeAUMKLxtXvVkRGdmGoY
         EZivf9M8/ptDt+9paH4LrY7KmLF9b0ac94wK1wanOuVXT+tlcnMTlOCAM1WBtCaX0Li3
         EMjhfciiZm8p3jsvpJWvFSZ6jZDSZb2u5xTNlEPVasiBgepn3zYikx896BVw+hzJmSYG
         r2oQ==
X-Forwarded-Encrypted: i=1; AL+hErHxZYCMDLLFDPrWEpzE+vEC5SspkZ4aPWfb5IAOSkmcE8c1ZblwpJWFcfLLFpxfYsfu2tnpq43QR8GotnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQ8mWbVCMJLid/nt4kGmkmmqILhxuDUu7JnM7MIMcph6lQHgL
	/61L2FraPmn9KP8CjW0UG4pMEm/pyxl+oyyaAgTtwItAn+qOc61GtW+lEGeb6DmKqA==
X-Gm-Gg: AZFdTZeSHu5DxLza01GEf4Kyhkd0ScKHSqCG9oWhdlU0gikVZq9oe+n1YTyqYmB/SVu
	E4gKyE9vyh+FnsAHQOpqMNu/omUyqQUGoBPBe9G9cFOH4FTioorKG6Qa+Lj5XR4eouifnB5R2CG
	HLl5ljnsLQOHWiaS+AJY/omBlrjdp6Mw7cHwlbyl8DdUtvX25KEyWWu3EeIrg62NIqxOb3efGmE
	Gd5A+fUsqoTnNmGu84swRehTHbe2J8qKunPxF1nTwcAO7jRc5XxIgW1WA7je6VsInT/PlvS7rfj
	5s9yAA6bpDask0zuWWdjqucDE6ubtyScBLL2rAk5V9aostD+SKSDFQv9TlbLS6IaQCXK9laSUZS
	rqqDVm4BrDIZOlY+ULFLZfMT7YEiQZhLU47yVQnv+RMNM159JjgbH0UtNvCz2DOz1A2kqVz5F2Q
	IgkTyomg9YMn2RqBWc/NY17Bcof2TGTBA0sOH3jpEbeXzI9VorhbWD3xeegM5vQfIVssfq7ktmj
	9xa1mZ+ETCU2ladYueGCBdNS4asXanr2guqFXFOG4o8UsndBC4BHcNTA8ixMpTEQuHe3RPgChfc
	+SDLAduj2Q9VmsJd53UX1Vs3YaBC137lBTZh8t9arNw4+vMdsIMwcBo0tNSyMhKU0a3+Umlxe7e
	qcbd8JhIC1fyuPw==
X-Received: by 2002:a05:6a00:4189:b0:8a3:23c1:c0e3 with SMTP id d2e1a72fcca58-8c87ded5130mr18749858b3a.59.1795685884373;
        Thu, 26 Nov 2026 01:38:04 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm10357231b3a.14.2026.11.26.01.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:04 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Madalin Bucur <madalin.bucur@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] fsl/fman: Drop device references when dpaa_eth_add_device() fails
Date: Thu, 26 Nov 2026 17:37:56 +0800
Message-ID: <rc-b1-20261110-vc-177-85d2478ac4b9@gmail.com>
X-Mailer: git-send-email 2.50.1
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

When dpaa_eth_add_device() fails at the end of mac_probe(), the error
is returned directly. This skips the _return_dev_arr_put and
_return_dev_put labels, so the references held on the FMan device and
on both FMan port devices are never dropped. mac_remove() would drop
them, but it does not run after a failed probe.

Jump to _return_dev_arr_put instead, as the init() failure above does.
The devices are created from the device tree and are not normally
removed, so the leaked references have no visible effect in practice.
The MAC state allocated by init() is still not freed on this path, as
in mac_remove(); that needs a separate change.

Fixes: 1dec67e0d9fb ("fsl/fman: Fix refcount handling of fman-related devices")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_FSL_FMAN=y, CONFIG_FSL_DPAA=y, CONFIG_COMPILE_TEST=y; baseline and patched mac.o, no new warnings.
No hardware or runtime test was performed.

The path needs dpaa_eth_add_device() to fail (allocation failure or a
platform_device_add() error) after the MAC was initialized.

 drivers/net/ethernet/freescale/fman/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 29c2fa2be837..4180cec15c0f 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -307,6 +307,7 @@ static int mac_probe(struct platform_device *_of_dev)
 		dev_err(dev, "failed to add Ethernet platform device for MAC %d\n",
 			priv->cell_index);
 		priv->eth_dev = NULL;
+		goto _return_dev_arr_put;
 	}
 
 	return err;

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.50.1 (Apple Git-155)

