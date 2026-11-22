Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330691;
	b=gbf/Q2JiENRBsEUVX960twOgQvsf7xJYgQ/ouYJZOYOo55L6bmnF3OEZkou+q32iv+vU
	 NzX5X1ZsCYOEeP2e1RNyR0xNI7/ZPIn2mb1Bs7DilIlgRnAx2OLb+16a7dXany10fUm1n
	 bX+UldVksWnlyllugawGfdFl+Q4uA9XjNw++ghvFUIpuFqafqn7lEuRg4anv75GH/Rlr1
	 u1SZ7sfNa9fZEkqtT+mnBxPv1MTfwjaQj7oYLeFzIrDNoNYe/tMbAcOaaXFOsJVJzADHl
	 6OFtgOw8IPEKgipFaIZ0Jen0otgvz5IReF6JvRI0eK8h7X+yoZ+IAfqf3vQBw4cIhVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
	b=Qu2YBCXaHBYmC3kBNo7uJ9WG1Y3IsbLHlBHAJhSqaugOr0zrTmwbC17ecWYNwoas5qAx
	 sogN3Qee5h5tb7mv43N2jL7sDl0hQFG81dH0Tkw/TrmkZulWQ+i27j9i3ttv9Fk3yBFb2
	 Y2FKzMTPZp5euGp4m/WYDumL11q6JMEhpK/j7JUa015EHnDDUftVBxZ+djiNPG1f/8W4u
	 tYMOJpIMzyNN05EJF9ET3T4fE7Jd0aldSgSPHAfjPwkLatL8RJiWanM/JLgtCZZTYWn2y
	 sGarB7lSCDp/nKiTOaYu1qU7pdY2htgF5bwEGNXUSjrPXRBwx6LIhWPQlx3MXxEWW/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKY8UVpz;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93146606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93146606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKY8UVpz
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04b676219so10782995ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330691; x=1795935491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
        b=oKY8UVpzKhjVKafswLUERPYGhhuJRjrxLQQvx/ETBnU7BjQ2U1eW5Eec82p9yUZSQM
         69uRrRN49rT5ki6eGLZdjWpK0iFa9hFcu4wc9nXn/Bp8SqlS5ABwSjJmy/8SKLjMcNSN
         E45Kc9P9FXDD8FCZB3Mse459Ccr+1VPgxJPHu5mX2h+V5P9u7qGOFfTVZx8K/aAkuydZ
         g3ubIm4r9b91xF+Qu40r4Ubh2J3pqSOdr9cABqN+bT+F6GnzohxpwXn/mB+bDsF4hX18
         jSuFLH9ww06Mwg+e8v0l+jJ+6Vqdg5L2tEdLXp+P0a5oEa7Sq73XhcG8d2SVKjJI9B4u
         vPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330691; x=1795935491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
        b=xxutK7ch2dQtM9ENQmmkX3bae4b5XAWz/tDoyItuDoOQqUCGKYyVsdclPxiI3xyYDQ
         nzdZzJthWkX/z0fSyzkSVHDC8Sb//Nd9PpVCQrsHV7jGxV3bmqJ+lvwDo0yLaw2COqA5
         FYxp0H9YbecSVddePfQTaJ84bn1GRv3ca/JYDNXCEAPi3vsgu8kp+b7FdweNvO2b6FiR
         pXp9Xt1ANNFeE7Oki29IXWUYCaaBDhStji21vL4Zi3o/w7bOc1YsyXQ83XBm4RnQijOY
         1IZBGmZC34E/OEtbedjvPHycB2aXX4Ykk7EsbKnfCfZ1t8vktE+1Z3adstZnzkM0JdE0
         UPmw==
X-Forwarded-Encrypted: i=1; AL+hErHm+lTwyW3FLxyr4UytgXP/1ILPT2QnqQSXEDQQRtoY7gphZgLGoNvuTuVuuluu0idKwQR1MXIBkrp++fA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99dQTp0QCBXNUWHsPJE/ldSp0Jh3dAopK/ccmYcm4knDxz0MWv
	+O166rUrmUAfYJACKf6Fm54qOUg1fdCt1jNiYzczDK1A88KcLzARCKhH
X-Gm-Gg: AZFdTZdzC2xmprhcQDHEz50Za2pr4jAT2VZfV1+0AiaJzMucvidkTCRjumZludXS+ab
	YrTB9PUgo8Gw6WISQY8um3R64GPmnb0a1H/VXp9OiXkJx0mqMtoyVgEpKCmnTvfQ9tUw3IcHAcd
	SJlehxjHQVPm/JxnN5ijoJjZeuQ0sCxdBZvsrJUkg3YN7ZdH9a2eWY6/FMiVjk6E9lu29oCp7ba
	jv7ijbNMBp2fi+fNNUKACPWZBPQcfL3l67w+hklTgUT3ti+ZinvknROtm+TMNdggZi2gZEI3cm4
	abimBg+RafcYSeozYhh2oe+xHSc4oRanEo5mWgwe0BR277D8BHlp3PigdGy1E08r1gIjCk9jrJR
	/3ZUpehfuD6HH2DS/+xyFXOleJvM0IJms71ii9WRjuqfgwGnxVtDnG9RCSrud2VuQSRdhD21XDQ
	tUV31lxpnZCfjZ/LwzGNmhGYqzhNwuUF6qeLFwxTXeIPntaKh4xuWqdYWtOQi7TDDo4P+O9HDNs
	aWbNROQ3dVBC8Ra5JtmH8xRqplR0sdE0s9pFugsFm1gtaUtVdGoXaMCcuDT/T78be8jbt/oR8Sb
	RLsJ0wA1PiSb+gVn1+DJUN1PrSmlsaBPKm78oJwY0qDqkiiACxBC
X-Received: by 2002:a17:903:240c:b0:2f0:3382:cf52 with SMTP id d9443c01a7336-2f03f156ddemr67246795ad.15.1795330690792;
        Sat, 21 Nov 2026 22:58:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] MAINTAINERS: Add HiSilicon STB drivers entry
Date: Sun, 22 Nov 2026 14:55:23 +0800
Message-ID: <20261122065549.3265519-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
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

Add a MAINTAINERS entry for the HiSilicon STB platform drivers, covering
the histb-wdt watchdog driver and the existing histb-rng hardware RNG
driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac5128b756e..f248a04b925c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB DRIVERS
+M:	David Yang <mmyangfl@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
+F:	drivers/char/hw_random/histb-rng.c
+F:	drivers/watchdog/histb_wdt.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
-- 
2.53.0

