Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593232;
	b=IAXqztW6yxN+G473WxrfduyHFIHyX+EdA0ETUduCddxZyJOiwOlBlcwL0PakNf7aAPRN
	 YlVwDe30HczhHUq+zdoGah4/bZBmGX/RoDvc4dhLedWd/W+D7btmoHJrHKbtuP2OpbJNb
	 KDAR2WMwFGJSKe5PmsuQiuNbXAEWArXJQfsZaMUJR9T4RM7R1ZLe/t8+tBiybDxVB972X
	 hQjmo9sQ6aVkTr/uinUtS/JZ77uRHhlhPAKdyyCl1kcPtUKP0nKqdChfPesMTH653fJAK
	 D7vaw49tBOEX0hkuZ/7ORQAZgn1RA3bhA5cQNJXmo3gexCnXYf+v/L6O5Q7joRN8KWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U0564f1/wQ5vpUisl1vWxnDQHDxUALBKjxGcDAa3Zv0=;
	b=cEjMtF1Q3941DyMsBEyZL7xAbqxmD8MnA2st9+H325YCm+V2MtNiM/NqO855YT75b52n
	 ulfAhSSXlqR36JDwlePwUsYSD+yCdA3z0Nno/fqzcEdPbBnoNqmNYdU5E066a/dOaZ5lY
	 F7BJV38vkwpY8qoZcs5h9xrvStzg+d+FMtzGb4vT/Wvl6aW+mTiuQK4iiNgZj+ynXHNAk
	 PofAfxdNTKQBuNDVv0bCTIMJy6x5J8r6fs5z2a+BbXzVyYwPeFVdOlVCK2j45eF6u2Ppj
	 ohRij6sZhDYt3LMxcmhJzHBnHd2YrLoS6Z4XUyzsiZbASHMTP9M5XlkW6ZuwdbCNi4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GL2G/tVj";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9BD606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2G/tVj
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so1912455a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593231; x=1796198031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0564f1/wQ5vpUisl1vWxnDQHDxUALBKjxGcDAa3Zv0=;
        b=GL2G/tVjeRFiOoBQv+pcXwPzzo6knoBZR2QDzEuKIxXmpwCCnmgrHCp/dQEKS2RqgE
         pf5a7x0kHMOj2lpNTl4Sq7tNJlseTjSpxB+z1PqM0g+ZQmy4/o1rHqNn2HSYXfcoCLwI
         apJT8oGNx4yWJ+nCKErLHbVoC2dhUFZRXFPWSpkctcoW9XM5sgHmw3is4b5ZIKs/s/cz
         sit3qoQTAmUjGuejlKJxR2T+lowFqm1gJ0TA5JxAVRlO7SJNpSvXNbxsT1+ERbnBJlcr
         ktHApYxXYDm7izbhh4EAnKcFvwJgAMrP9UNQCOqCLQlPMY9Km4JOmqJ166XrLe1aJolZ
         zYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593231; x=1796198031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0564f1/wQ5vpUisl1vWxnDQHDxUALBKjxGcDAa3Zv0=;
        b=ShJoTURhnUQ5B29+u5DdiU9e6xkNAgOYdt2OM49IY7lhOb/I48QoxscmVBIPw7U3DT
         1Y+XGa1KHhzZ7CRIjOPNuyg18Yed4hKgCUo4k5GzbtULCG/l90B8p7+60fHsZ/ujPrQF
         3Y+8zZQYEL/hVbDtkT4xb4ElaMRkp4apxK3kZhOwH3ZJJm+YEy/LEBOhopM3/8eU4cOO
         8iMCitBpEEZP0rkAXnuvkxEF28Xy6F9FUbJIxmKuFD3A0dSnQ5lVbNXTEZ68tz8kv8Vc
         Sm0rwlg9SbvUhPekSQ83BH+gPMydIRYQZ4qa7r/k2B0keuDN9RE0l4pMNkxB8Wn36S7J
         syCA==
X-Forwarded-Encrypted: i=1; AL+hErHO5sXYNLjjZnCkRwSH0L7gmn5tggZ7/vQPX/ABFleHw+eDyQRgAYtmwWM9wBgAuGNZ5tXM8CpGjxzXspo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fnej8PDzux2T/IDCg7epAuk9EE3Pl39YyL9L4bMkecKzMLHa9
	2/8jnD5mIWOi8vOtkJVNmM6pBpa0fGlSKF+CIZPOb/SSVI1gMChTHK8mS6m23JA=
X-Gm-Gg: AZFdTZfU3hOEetwkLyKj84Ey3RHEDYmWw5FwlSJVkMFEXKZ3UQHien3qmBCi9Ri1+ks
	8f0Qlc2oU7vMfyQSb6ImFX4chDblnoVqeoHW6kkONb2eseu3N6iPx1inV9BxG4IAoCR8STjqDF/
	dBv4HJTDqMK/J0v7JaGcY+gISydZnQARaIcOusLO8v75RN7gjUTrqAbad2qrYbHoX4Wac/BOJQe
	Si3XOjSRlslWk0AYqHLlWiwHld12mp+o83rDpbbflTjAB4LcvzPJLi7NEGN5lqBrixVwXtb3rF3
	7xAZxoI2dCrm34Xk1LKVw0J43r73RkDu8SOBjvaOpPIFezN38LSfe/MIiCW7PwXzsEbcbWjMNs/
	alRTwMbyv95bhBuQ297rSNRfE0lT29NEFjVYiDyQNe61+dO0tO/yIWXwIi52OPDQ1a8MXcSHxwB
	ucOVMZHSIVhDZlHQhZXBOURgNwJhRhyB+ezsA9/vJpcFDOyowwgLD6IzYHcfaxA1Q0MEvf2xagk
	a6zd+t5bctIfIJFECFJofv3L71//udfclARh5s2ISNaQC6SI/vBOIiuPYPMQh3Xho0m0InD4EY2
	v9EKQth7X3YqYTthQzBmxqIpCmWqjmKeMr1O5GObonUhbe2R18SXFeIr7GA+t+QnUWNLKA==
X-Received: by 2002:a17:90b:35d1:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b41cb04e15mr16222267a91.48.1795593231485;
        Tue, 24 Nov 2026 23:53:51 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:44a2:4377:d176:9ad1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm12347433a91.4.2026.11.24.23.53.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 23:53:50 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bcma: Put the OF node of a core when the core is released
Date: Wed, 25 Nov 2026 15:53:45 +0800
Message-ID: <rc-b1-20261110-vc-179-09535b897585@gmail.com>
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

bcma_of_find_child_device() returns the matching child from inside
for_each_child_of_node(), so it hands a counted reference to its
caller. bcma_of_fill_device() stores that node in core->dev.of_node,
but bcma_release_core_dev() never puts it, so each core matched to a
DT node leaks one device_node reference when it is released.

The node normally comes from the base device tree, and base-DT nodes
are never freed: of_node_release() frees only detached OF_DYNAMIC
nodes, i.e. overlay or changeset nodes. On a normal DT system the leak
therefore has no memory effect.

Drop the reference in the release callback, where the lifetime of
the core ends. The node is still assigned before device_add() and is
not changed afterwards.

Fixes: 2101e533f41a ("bcma: register bcma as device tree driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, aarch64-linux-gnu-gcc 14.2.0, W=1, COMPILE_TEST=y, BCMA=m, BCMA_HOST_PCI=y, BCMA_HOST_SOC=y, OF_DYNAMIC=y; drivers/bcma/{main,scan}.o built before and after, no new warnings.
No hardware or runtime test was performed.
An AI assistant traced the OF node reference and helped draft the fix.

The leak needs a DT-described bcma bus (a "brcm,bus-axi" SoC host such as BCM4708/BCM53xx, or a DT node under a bcma PCI host) and happens when a matched core is released (bus unbind, module unload).

 drivers/bcma/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 72f045e6ed51..58d72580f09f 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -123,6 +123,7 @@ static void bcma_release_core_dev(struct device *dev)
 		iounmap(core->io_addr);
 	if (core->io_wrap)
 		iounmap(core->io_wrap);
+	of_node_put(dev->of_node);
 	kfree(core);
 }
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
