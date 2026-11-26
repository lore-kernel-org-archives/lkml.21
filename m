Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704510;
	b=NwiPFEgNwTRxa78Ff3lFYskksf12e2EGAlXWEWYaD3HDprM2BqY+hpzNokKqicfX1tsO
	 3jgxpNVrqy7wnknqZTvBn1LAawTDt/aUR9X65cOEco9JxbNqaTOvSe5wXbrEiaSd0yjXc
	 CmhVtwFfsmE6Cco4Bm5SwVImW1lqvDlC9eE6qjOyoVv8/ADidYJ/emgvJYnpJyPe+6QxX
	 YsEXGzBdlzOEZwVR/8T0Hfdnvd1bsCP+a/j4q13bS7GTqI0Tyn9jvqHIFa1NXPZeF2sAE
	 VE7QIKTTB0iJ9iuOHJnRoO2Ix6sQxcLhd53x1pVcYD2I5ZjDtmVrHvV3jR1g2TXCmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=gBUmB6k+/zMjiupz2fSB05AdcI9Yft2uVfQwRfm54S4=;
	b=SV9Xx+3AjHoyqcrm7JhXuE33zvGadKHuis4vj6Ar3paJslveWUP9jyRPN/J8YzszEtBT
	 yEZn8kblcf07diRd+dI1PtAxa04vVlEcci5xqDINHecAC+XhN51puVW/1dBpVPOtavPH4
	 9RL8f5pjREuguOzf7A+9reIAmKp6BLiIEj8a9SCtGbQTsuWzrBa/LEb9xsCT+9Hiit29H
	 m6pfkHwWYOQcsDwDdAnmO2EuzROzUwCSMQRqp18LsfCMwUCHdvwgw3InqkFuntInXqPJS
	 kUPuONg/9Y2WnJYQuvj+w0smzmngFRdOEWASumAQJ8rB4xI+ZuUbJwpBD6uOZVr2obQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nJ5nJvVM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3C5606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3C5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nJ5nJvVM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so75882975e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795704508; x=1796309308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gBUmB6k+/zMjiupz2fSB05AdcI9Yft2uVfQwRfm54S4=;
        b=nJ5nJvVMQH3wwi5zifiF/xQexKqWquJVPhGMStzyZ3dOXMLI4QQLbTERfjUthHfH8o
         8EOrzltcm+IRTFqRmnYDSuTeupT0Sqd1/h7FhqRNEjR79s1FLhCUeTJPSZ+CzCNdSc7R
         XWn+tiUMpVUcz8hfRrNKGplEwRSTvgVVz6JAIuj9DS/Do9LcLqOBcpQVhClsZtaE/eCF
         CDOJ17bY1Hny+u8hLfxBBS6kC+UtgPpG7I1h/G57E2MscwJodIptzVVsQNFLSKQL44UF
         qrG5T3FDG1yhe88bfhoWXeT6rAGtqUJJqlNPXBkUrR5cxjCmzai7v/5sZEaMVKo3ZIGC
         9Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704508; x=1796309308;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBUmB6k+/zMjiupz2fSB05AdcI9Yft2uVfQwRfm54S4=;
        b=i8kE1Kp2/hglc6chHucgjwFORNoO1LshmJabTGoVnl5+xGOzhkiKGr75J+4iIOT2fJ
         ZnnhgtPWpfXbBw7tCIrNTzydpdwXxxbln6luH9wrpl01ujaLb5RB/iqcAreHfifQX1SA
         euQkSzdsqMCZk2139QI8ycM9Dq9jfVWVxHnqwirtL3Vq9+iNhNQZxbdEPijB8bvgrR4c
         57WMD2zDEAwVGxPsH434q8hxj+bjHhrfftUUKXgOteiUZ919Raj3XvlGSR+mUw+4ooSy
         CBb+VCCP0lAt3+vmc4nb8HvGIVI8/Ip9b4pJzxLrWQsYJlkx7Ph1mEdN+e35Zcj1CEuS
         xEwg==
X-Gm-Message-State: APuU4Z8LScgKKVfIRmmAjs6bnyCGV0SR1bnk+1qSL9vPbZy0WKPPgrKZ
	nPWB9FXHy9J95YTF00lnXU1Y02JU3hDxx89I+EmFEmIpzQdCrHhpDjieNUQCm87UQgc=
X-Gm-Gg: AZFdTZe4Wu+Bap+vUZpzo9sdRmEbZbN2McScKgSvAKjWnVRfvizR8iOI10xBSCgyIFP
	yYq1ScUK+jQ7niYiwZMaV0NAluas4/WH3CH3EzOBgngdDRZRk9tvQHcdJCBjKEX7uXGOOl2vEWk
	wwWF8YTMl8kFwSYoyEqFPQIfcfUjSdDmClVNwwXVDeaSDEzjp4jlo9rrxKSO8ApLvY+NNR4VThV
	ZL+0mBSTbSN52dJP3+FZBTzeXSkhCntoTWWXu1fcV+/YR+6K9C9QsjDguLt3evHBmy2Rkzh2ay2
	t9NVX/bt1AshdlEetGe9yJ9aADy/uT4RgLwlovEh+CF+xbw9XtaMEbvuRqOT16IOBWLBBU1a62N
	LF/6/JhYz9KcaUXfQ4McPjd0ReuV4W950hI8WsKCfmgbNoKBqkBMWgXJwiG+llpC+NioH8pRXd0
	IoRfPEWhawdmqpzGuN3rwdQdo6kiHf0wMNj6QjMG2VvHLexNfSIR5G5j+daRxb36rbDiL12D6vP
	y1nUynmMWvuPBBxsMTUmjOiSdHGEESbYhYLL3BNMR1BiSf3uVFZqsy749TsO6vaL4iZOnTgrJE2
	VuGZX3eTPGuzbDKOxrfSdnBJ5Hx2hZIUxueaVaWSFMRZzrikiD9re7dejXBHv0xOnI8duO8P8mA
	g64kThxWl6Yf6Tb4=
X-Received: by 2002:a05:600c:5395:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb8880e599mr430139155e9.8.1795704508528;
        Thu, 26 Nov 2026 06:48:28 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853c9170sm675710655e9.14.2026.11.26.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:48:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 2/3] spmi: Drop struct spmi_device_id
Date: Thu, 26 Nov 2026 15:48:12 +0100
Message-ID:  <473f022082e95f68e4feeb49b98bce7544501d86.1795703292.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
References: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=EU28X4vdtBqNKjyzUsAYRaVxwyOnJRB5cWGYlvwtouw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCEavklLfccMJp3d2JFJRpmX6Eln9m+v3hH3sF BXjhcxY63WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawhGrwAKCRCPgPtYfRL+ Tv71B/4y28N+ZsaJ53RYgUpvv0IaxVHWKipUnpkOiku3Vi8pNhyn4Q45CjidxPlyrZ/Txla1Kbc vb33+OwZQF02UROzDcm5eFLGcmKY2jnjq2tLBMZ3Il0tJSgBUjLXOMSxVbUg68TIDr/wOJWP9sQ 7kGJS0uJGWBUfwawO78SgQkarBhjww0FEOhd1Foei9REaBU/7uS1iGUpCGB/RY/co6xuqGfh0g/ +5HrFZTFsMi3NFyiqi4F76c8nC6xEjPHic46Mlq6PZqSfCTvrWj4Zzlc2pJ+3YVo4QMvhfQ7Ak1 6NFlGqMeM/7iNPJ5PnQiYl3wlvQzvyYscJFnLbGvCgCdyMBZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This was introduced by commit 5a86bf343976 ("spmi: Linux driver
framework for SPMI") in 2014 for Linux 3.15 and already then was unused
and no user was added since then. The only exception was a usage of
SPMI_NAME_SIZE that was dropped in the previous commit.

Reviewed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 include/linux/device-id/spmi.h  | 17 -----------------
 include/linux/mod_devicetable.h |  1 -
 2 files changed, 18 deletions(-)
 delete mode 100644 include/linux/device-id/spmi.h

diff --git a/include/linux/device-id/spmi.h b/include/linux/device-id/spmi.h
deleted file mode 100644
index a821c42cfc9a..000000000000
--- a/include/linux/device-id/spmi.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef LINUX_DEVICE_ID_SPMI_H
-#define LINUX_DEVICE_ID_SPMI_H
-
-#ifdef __KERNEL__
-typedef unsigned long kernel_ulong_t;
-#endif
-
-#define SPMI_NAME_SIZE	32
-#define SPMI_MODULE_PREFIX "spmi:"
-
-struct spmi_device_id {
-	char name[SPMI_NAME_SIZE];
-	kernel_ulong_t driver_data;	/* Data private to the driver */
-};
-
-#endif /* ifndef LINUX_DEVICE_ID_SPMI_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a69947f2c1dc..fd21238c99f5 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -51,7 +51,6 @@
 #include "device-id/serio.h"
 #include "device-id/slim.h"
 #include "device-id/spi.h"
-#include "device-id/spmi.h"
 #include "device-id/ssam.h"
 #include "device-id/ssb.h"
 #include "device-id/tb.h"
-- 
2.47.3

