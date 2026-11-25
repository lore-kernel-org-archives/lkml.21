Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605730;
	b=TZr3Tbdral29PyBdOTRIpFvv0Wh0rFZ8lPAZ2NAN/zHiGFYdkQnpLtJ2kiVpukiQhjFG
	 AwfV817ST2PJL0Jft5SsPzCGRX+JI6uz2V2fNCTrEf6x4iMMDEB3yyappjnA7I7+h1wxn
	 GjBVY3m7OVVrfC/kTeSqHD90JsSEOrBo3nvM4UW9Mf3VA3uOmML8B7PUZorDs6xXP+sU0
	 yd7CnqVpQb+ylr8sYHwgOBizraUcm/G2SwKshts3eUzyfDhoMjn2rrXR4QDgZNGlicIAd
	 qPw43iSVN4/5/PIcYKUkUh/a+0xaaFGS68UH6++lcAe7ITIcK3mTtYWE8MaW7chBChg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=co9/jCMuDpW3sZtjGQUu7H6Z7tadkDLGpuzEguSSeDs=;
	b=TLoEQOW1kNyll6AZVL14hjD+MINk7tki938vdggD50L4xMjrW3wTzGdBoPFj2g8YoTwL
	 lZeJstn2UT5rKwVc3X7+SjRpbl7CY9jQQdsWAhXWV6O+s02KSEdRMuerd4eYDlXSqS4Pu
	 YGYtgM37kg0W4fXt+q9e0SWiCzkchZnrG7IK1TjMi8fM3tggB9WjQghx/u/XeO2eVc/TP
	 bKp2uwqqG+57jWvKor2GwbYfiy2qDklTfepv7sYTXBipEU6FbhTVdLl579OoVR2PvJwOS
	 IQlKh32Fkyo5xPN+Ehjwi4vP6rD1i5/62wojKaEcpyXGiIrM7raHDPOYPb0/AO+pwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZZHRRZUi;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CE606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20CE606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZZHRRZUi
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so26500645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795605728; x=1796210528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=co9/jCMuDpW3sZtjGQUu7H6Z7tadkDLGpuzEguSSeDs=;
        b=ZZHRRZUiShYawjnhoSgxwDhbvXJ1IRVSWUUtl6OVJo1N0wAeMX1c1zUnxIVSZnP+PU
         UMawSju2SjU7ezb2eZY7F2cYe72fK/wcxUg3DejTCEimGZxXaW29KxXmPjJ6+5I2J4r2
         0251tCgCEpWmvDZv9hhvVXgdvX18stoLCtQmL02keQiFrHjIZh+r7hAOnc+uNPQ9AEQD
         bsmGG2hpGiD6ByrJrpHuvFOtj94ommabNn/3MTskSuiusXghOdHuEwQb4JuO/z1eZpQ/
         f+ZXW9+yazeQi+Av9xV6M0pTUaKSXD9kPOKPlsXtjEevotxuoEw/4O4zeTIL5w4oF+jV
         hI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605728; x=1796210528;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=co9/jCMuDpW3sZtjGQUu7H6Z7tadkDLGpuzEguSSeDs=;
        b=zlehDK15AHmrClRj1lcXrKOwxUqDJRv5hqHf3ggFlpkWUbBYhxskN8TTg4fDeAQsMj
         lEeNKghiu+8Egn4+LxXSXKBr04YY9PQKeZk1RLv8+UZ31ePvwe3wod9TATIiUaxmWomf
         VPHsX+HkLsCEpDqUlVLl8PtVpQhKcOP8LCCLHawbscj4Lm/1eXJ86YZYp2Anb6/RbaE/
         oz8a93RFbOLNXrlhxjHgei4U+gOeD5SB4y1QDqIv+xjxUM+jdy4YrUji5PeP9XnLFKam
         GWsd+dp8SxH6A3WIwSiA7jNMNKgHq8GA5VNm79g6QMUcasVbmrGtRQ4yejTX1rxHswIp
         eyNg==
X-Forwarded-Encrypted: i=1; AL+hErFJWBB3dZ2UFL/b0wNb+bxkRg7g9LD6DOS3fja5CxmveskLJk0cTXN93AmUoXs8Ter9n0Ht465RRhzRH80=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Js2vMEnoZxHYx+numnpBjmAPc4j3lDGKxxF4aUEZPyWDWHDth
	AlZQcvPQ8mMIq1Ums7SEmvqHUHUqtpKzKr5NA3FinF5XR0FpeiH6zPAcIM9c+9+mraZ3xMluCxG
	g+Gcv
X-Gm-Gg: AZFdTZc92KWXwss5xOQ/lahgYTX6F5aF2A/YKPZeXmcz1FQCKdXVMPZ63HiG10IKXvf
	zz1Ki4B7rxtJDJ8K2Fzd1YYWqzQHMH1vU5ALycPwGp9xjPS7fD5N8OO857kGAkRXeVYPCRka4ro
	I3jW3jO27tI8UM+DKkt34hb/sdeUr2RIOrj7+SnGWrwo6bGvq5pwxJkOKnyJTfY2i8/JBvlRlVM
	ClhG3pu+49PA4bhCmxCKyPujxJpywKt+VS9fVhDjSrZebccY+MMUrcufq9ePgd/77mzzOuGDza+
	4DvaRfs/rLdxZvQoy45HEP7DlQBtji/wz2+SxBgLpGoEcgCg685yRkOfUCzJi57uSq7pmv6qnOi
	F5RCJqgJkbwCtS/25Ko96NXEBOi2E0KgGiqGUf38dAe5pnIHKrsrtZVl8Ik3Wtpy2ATY1TU7LFd
	OPanP+vANujJ1Nd7C28JijAvfQms0iry7kw2CS/19eeevzOo9HdHfcdQQLlt0MoskVRiGLo1GMS
	X4ntZHCDOODR+z7sscllwMH7LW/aoogMAMeVWFtydck487PNyqiT2O8vt/lsqg2gyZamYjXxAkU
	2BTBPE4yYPBarPbigT0NQYaJzhpY1ML85zRLdyPi3M5X3uaEZAb/WIByBJg2ZsjOCIBs50z2Tpd
	h1Ang96DHUm5i0WH2
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr445497505e9.15.1795605727974;
        Wed, 25 Nov 2026 03:22:07 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906d6a13sm274079765e9.3.2026.11.25.03.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:22:06 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] spmi: Drop struct spmi_device_id
Date: Wed, 25 Nov 2026 12:21:52 +0100
Message-ID: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZDpRQHx3IyAiiwcGiQlfk73ex+b+rpaxrLKas9ndLWE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBsTXKJddFNddcsnikbHPceB6Ger+CxxvRlhFq 278I1wgfnWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawbE1wAKCRCPgPtYfRL+ ToqsB/4jmCVr/16jf/tXbb0mWEkL+/fOqTuZuqLEnBopBmJ1zbwzpuFxHWSK6lvRwDr2cTpfPoo F61w2T88lLuzjKBgBVuvOu2Oc1YQsPSOcuvzdf6vXVMjiFo2xE51i8LzgHQ2X8DL5YuUwB4hLFe Dd/zhHGZJEfsjnOlpd+aHUVQ7UCp097hacCNuQcRsxf8f9irHfI3Tnm/Jsdbamejmhi3cujl3/g IqOPpjwbQ7TEi+J0sC4oleK0ao5m97QmZkDzcwfZiw0B/u5HbY0b8lW7Fue9Eo6g/I9i4LpzjgI tGuRE1EV7ZP53w0ds+hJusjXJpKhMIOuaUMrMk6XYCSMPKRV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This was introduced by commit 5a86bf343976 ("spmi: Linux driver
framework for SPMI") in 2014 for Linux 3.15 and already then was unused
and no user was added since then.

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

base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
-- 
2.56.0.rc1

