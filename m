Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625738;
	b=OWG2bXahn2KzpvlCR2qDFETOt8LATmLucJ4mCw0zD4/ngJtK6ls4sLuIyrQbqYfcPE+Q
	 z72MX+N7z1ev0Ku07hcbc7oE1UNJxz0ceosLX05P+YJQ4t2bYXgTmCnH+YB6i99Bwzx+P
	 DL+BQ1njJn9s0U/TVbz2iW9Ga7U19/EA0I0MKUSV84ney3mva3H3l08S0LR5zNB+w3olg
	 Ke4ChXCHcnPbkvH6KixE6rx5HBXH5py+Asu0By10evYPW01QxTLuosmtui+amHHoPGggq
	 7u0e0timduNb8DPhE/mlRQ9XP6OaH9GbUgZ1aGfQIyFFDHaeAgimd4W/tI50+gGSvxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7T2iEQGH7MR6agvHC71z+pVkY2Bd8M1MIAiZujC2aXk=;
	b=ZQJV6QmP2xxzG7f042OLbtSo2eZl3ThcvG6Iff5pY95aUB82yDp6CA5cVEg4mT69Yw0G
	 Ipm1FJBaI/l20wMHCd8/xIlyX1s4xnTJBeF4k+0kz04NKdrSlfo6spadlf3RWFTFOkZY/
	 krgxZ+uJwKfbxEUB+xnzUxltm7ul9Iel2mmB1nLg6XUAKJHK9ke/HoaqKcUbwWBT+exGZ
	 33YyVvYE8XLOp9IiUhQKpzJiUpvPeKe95/JOyIvdHQtaJmzFf9mX7jc9o/safjbm6M5+P
	 VJc38TYtg7C1L6wDLFYEIGKVIiS4aNt2G/sGmjSb4lzV57pKOmUEX3oLj2AQE2mKI2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QmDO/XeH";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmDO/XeH
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4e04eda5aso45245767b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625737; x=1796230537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7T2iEQGH7MR6agvHC71z+pVkY2Bd8M1MIAiZujC2aXk=;
        b=QmDO/XeHPbPyl7rhqmMP0EtDQV1NCHE0vlfV0+JAPpOfFe51HPR3Jev2l3joKLN6Gw
         OCe9g4Fxvj1wjiRSVrHQFt1F8ILFK9qnchUuKQOMl7L3JrWwaj4I19KgV4OSDZhaj+Wv
         ayUc06/nd3ADFbrS3qDIdKqjzQN6N6fMJmgKQkZAZNnVkH/vqsDUhh/7Cfvly+RIjryY
         77QOEB/K2vGACgXKaD2FDwBkdbnSRcx2YYPFdEjoHM6pC0vvmoZStCGnLiVII3TkxucM
         MJPJZ0AeXVq48t2MzT43htSwBPMiiDB+DNx7dW3NsX3oLDtfWx/GDxMMv5cN40mJqy3m
         RNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625737; x=1796230537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7T2iEQGH7MR6agvHC71z+pVkY2Bd8M1MIAiZujC2aXk=;
        b=EkN27JRoXqEDsy8QrWK+dWPkVD7BhqFqIEWM1FIFWZwA8Hvtg/YuGr8snfQt2+MB7E
         cjnNLPxf15IEl8hCglereuCz+a8Sx+D4I8CGvGlK2+nKj37mzim+bIqpxJ0EOQI27fbd
         qCXSdttCNsF5VH72Qq8l3bsaT2nKotsBNA3i/y7YFxPpRB0q3ARkJQWn2JpC2OyPExIT
         WOtQZ4IqPdamQtdW4ZqBiGsEJFAAS9PTYbngQCV4Wy/FakHV1aobTqILW6urYGn38EBl
         j49U1sg3GnuUjGXj1hnFRpDpJPLIVREFc16u84W/wJGAuIGNp3tJs29jwxWqQZ1ISoIb
         QWRQ==
X-Gm-Message-State: APuU4Z8Y94NiwWBcXE/z7Nxxwe94HENNDmVvnPGye+8F6argvTZehMYp
	F72TtwFnoecp41VMwciKc/KUU4Q3tEcLXzRQTcAb5lhuj0lyzFphL9Q=
X-Gm-Gg: AZFdTZeFriiNn7WTHDTku6GStTxHQsLlY9pp4r71TEky/C/JgCFsDzCIkXzO4DoPNno
	Cz4qCRt2pjQ8ZiY/FG8x5Q3hnFDwur4Ha1zj9Nuls5PB1o1Ztndgo6DRj8n1qtyCknZUUd4FeXe
	ixdW7WKSlTsoJFkpi/Uxt6vaqSyHHlx9UOiNgYsl9bSY8OMEioQjhxG9sjQAWjFqG0u7K0G6SBI
	0EiXJJypNwxB7UKHAjVJKeDWW7rYK1V82sOejwXQAPZ8iP1sao0ghsCLR5yBZNqhcxm1IKuoieY
	FTpmcyAIA/aeOkXvpd8LLrLndyw8ttL4JX387oES4PDFInH2zTC8494E8L4vUZftvldBKjNdx2g
	zXNDn3/xC9jYuHmptDE/Lxm2jUWXXjyxmN0oyxs81nUsJOgj7vW9ZTJ0YxE0HI2EPKPB2waNdxz
	ThUpZUnlkek/k7X3d9D7xcqqvqFVc4rbu/ryOSkeGzEsJjvjWdb9JhXqk5iUZfpBBf1ADPB05Y0
	rNChE8YxR76AGYCpRr5QX0e5EvZBr2Ps+Oe2SWu7vtb9oBj6LzG1w2gknAJ8JKvBCH33JdBmeER
	fo3na2Mc8eegtA==
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id 00721157ae682-8b52032707amr92285857b3.4.1795625737600;
        Wed, 25 Nov 2026 08:55:37 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:37 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] MAINTAINERS: Move LPC32XX DMAMUX SUPPORT entry to sorted position
Date: Wed, 25 Nov 2026 10:55:28 -0600
Message-ID: <20261125165536.792563-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The LPC32XX DMAMUX SUPPORT entry is out of alphabetical order. Move it
between LOONGSON-2K Board Management Controller (BMC) DRIVER and
LOONGSON EDAC DRIVER.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291ff..6503b32587746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3158,14 +3158,6 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
-LPC32XX DMAMUX SUPPORT
-M:	J.M.B. Downing <jonathan.downing@nautel.com>
-M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
-R:	Vladimir Zapolskiy <vz@mleia.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
-
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
@@ -15786,6 +15778,14 @@ S:	Maintained
 F:	drivers/char/ipmi/ipmi_si_ls2k.c
 F:	drivers/mfd/ls2k-bmc-core.c
 
+LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+
 LOONGSON EDAC DRIVER
 M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
 L:	linux-edac@vger.kernel.org
-- 
2.47.3

