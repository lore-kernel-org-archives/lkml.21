Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586869;
	b=a8N4OqWUThE1n3/xu+SyEsLTIzi0HlDfMhChe1W0ibY3hHsNpF3jwUGVwmY82q5Tz0Dg
	 PYoxelQgwfJhIWB1n3ogmKXuI68TyVoetoZV03vi+b1LvUgI4nwelw96w10+3ZR7nuqby
	 VKJowYlDnLb0PxHG6Aw76r75qKGamObOSMhi/x8gMGp3zEyo8xw2l7T+TF4PfKs1+kJ3v
	 KvMSj1erlgMYoQ+AHf7ulKqunFg+Cv2OQs1TpDUrcm3D0v6hbK7JYioFaGXnlw9htG6OT
	 NosSAongwaTIjrGnKm0HUbr6VPpVQune/it6NRX4WiAWPEWJ99XuoOpHQAD6R9IXPOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uNOvfashgWVnAYYWGzUdcUIW23Wlm/O6cLEys1MSUjM=;
	b=3eGfGYrK0oWaLFzMHhr9Tp0bRojQPyKVo6q2Fw6+F/hqSWxC4+nupZUzTJNVFiaR/7Cp
	 5YXNZHfCfH/w/TcRXJTdjSvQ5VJenb/gGBjqI4uUPvqDY0Dg61v7vhp/f3qpXpZ745pJI
	 JynjF/G4kr9jdZn/AvfKViT0ujhj2InXmFmC6F/ETUsL24UdT1DIOg/jl5mplHrjmayjy
	 T3PRB0kr3PkVqX5ZWGILpxmwpMmu0aYaWMDPXWKbaTdUwI8SZPFiGM/XT5FVf2nsaSoh3
	 ZPS0222DpO3BLweaQdlQGYjaRaBP1RoibYfo68dSnCT6M0LzPOCvleTf6/KYQwtsf0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLjBQXr+;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD2606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AD2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLjBQXr+
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb684859cbso3112917a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795586868; x=1796191668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNOvfashgWVnAYYWGzUdcUIW23Wlm/O6cLEys1MSUjM=;
        b=tLjBQXr+F4seW5EPloA/V/zSKMoMqGP/9R+BmO6CE6r3Un76zjlGIHDRPfK3l/xJuf
         n+hzpq2RwkKQ9vY2v2qOc7dMQvNk39WZsnxTBEGNZzk6h5XLe8oztsPGcnZi6JrdSaEY
         9oibnG98bD9aw+DELxTQMJ6ocEWGKhmZ27GA8hOb7IQGFPh0LDXgeIxHAQXQR9mVo+m6
         QtjnokSRmm08XlPig4XEbKDlk98CqNv2jw1/EhqTIL9fHxBhs2WExCDIDf97h1gIZl0d
         CioPzQclsbcRCnVIJIxcjwuwvLu0AEiT9GIi203j2ciGAquvd/l5DAHhPJLv64ZRAMCT
         bm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586868; x=1796191668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNOvfashgWVnAYYWGzUdcUIW23Wlm/O6cLEys1MSUjM=;
        b=enNOyEEJtMeTRtt0n6/vpjrHxHJbAm+3REYLa4WHZUbCyNw/FhGU44AOaMrRcXgskD
         070Op6jDJaJnhiPRSrV7vOj4T3XZH64M5Ks00rCwmsF+1CDB+xpYsIzic3SeogYXfFHy
         RyeABah48gDLiEFYpmtoo93g3vs4yoiG1b7rIrMoGqpU5e6kiKB1RGUgMfWSk2HKZFR/
         TntVa1tbcFEh9NkFjWeDPitFrV9NSdOYyMYzKjKQdSW0p5ukoa11UpqYxA6LqwFPHDe/
         EpRG56m8HXQ0UXHvWr+ZG22ag8rxjCDbcHmd2Q8oO550kU6uv6fvzbV+gscgJUqmDD4y
         ZC3g==
X-Forwarded-Encrypted: i=1; AL+hErGuHKgAiqpI+2XX5bdeXeAPc4Fsyz4XFojBET6b24/u9bhACtNiWfHmOUJhjOuL509n2zmfOS/FWwlFiYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z99fZkDiAPVuXi7iK63B55rWksfsulnTNPQIwaEb9fen+scU9Jw
	BXmuZBATYbbI5sbj1uYSPh/HI+/ngm3ZEmRcG+36Qqh8z65WsJ1fppMjbrr/DcoMDpcBmQ==
X-Gm-Gg: AZFdTZfJAj++m0vyL8k8W7V7s5SOvrymn8KZkZHCWNEbSoxl+G3w1WwIS5EBlgoCcoE
	RRXI77z6AFP+KZ9uq4w1llqhSLCdbyyox8/K2TpPvnZZPYiA4m1s8ojILJHUgK4XYmBdkXFx7UL
	ZFBQQDiBB43IcffMhIOFlh9p2/C11iBYs0LB/uBvyFqpMOS/a/mjCxr1bzSaH3IhQD3zyh3xdA0
	XWLk7nx+CEkgsZsvW3VHMqrkLq5hHKZ0r8pVI6eTzifqskUey3Hl78cUIBvjwkAbvAKf1t9VV2K
	+eazT3tm+GQrG2AP8eSPSLHfb45MD0pIFz8eCxYpamw7mLwTYrZd4A5ONWD7AwsSKPYY4/0bvsF
	M3KGrWgbyReClR8uPjCXojR04kaIQAkbLQuKmyLeXjd9PzQ7Im+tytqwSpn+/M9SJMY9riIEKtc
	r46Dtt6J6auR+F9tWOGZEA+cBQZO+hoB1qmAd0raklAegjc4YfhT11KVbOYuIOMZxBBIOczkls0
	r6dHpmZAwG/LEW7TI31mp7KEs9FkEl/MjW4ePkZBi0vRBIw7cIeuWmKfBVRk6/kNq0KOARBQVem
	W3RSvHamOiUj81miVnHFz01NVol4k7IPYrrW9YMc4o10jS8NykvHFI4e2WKMooTNE3z/j9SCjyl
	2C5yP1FOHtNtD+oZ6DiU=
X-Received: by 2002:a17:90b:1649:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b41cb50c4fmr16950732a91.64.1795586867765;
        Tue, 24 Nov 2026 22:07:47 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm25931346a91.8.2026.11.24.22.07.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 22:07:47 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] pinctrl: starfive: jh7100: Reject malformed pin properties
Date: Wed, 25 Nov 2026 14:07:41 +0800
Message-ID: <20261125060741.14033-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The JH7100 binding allows each pin group to specify either "pinmux" or
"pins", but not both. starfive_dt_node_to_map() uses
of_property_count_u32_elems() to decide which property is present, so a
negative parser error is handled the same way as an absent property.

A group that contains a malformed "pinmux" property and a valid "pins"
property is therefore accepted as a "pins" group. Similarly, a malformed
"pins" property can be ignored when a valid "pinmux" property is present.
Both cases silently accept a device tree node that the binding rejects.

Check property presence separately from array length. Reject groups that
specify both or neither property, and require the selected property's u32
array to contain at least one element before sizing and filling the maps.

I found this issue. OpenAI Codex helped draft the fix, and I reviewed the
result.

Fixes: ec648f6b7686 ("pinctrl: starfive: Add pinctrl driver for StarFive SoCs")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 .../starfive/pinctrl-starfive-jh7100.c        | 41 ++++++++++++++-----
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index d89f6a4722..97c96c92d3 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -491,24 +491,34 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 	nmaps = 0;
 	ngroups = 0;
 	for_each_available_child_of_node_scoped(np, child) {
-		int npinmux = of_property_count_u32_elems(child, "pinmux");
-		int npins   = of_property_count_u32_elems(child, "pins");
+		bool has_pinmux = of_property_present(child, "pinmux");
+		bool has_pins = of_property_present(child, "pins");
+		int npins;
 
-		if (npinmux > 0 && npins > 0) {
+		if (has_pinmux && has_pins) {
 			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
 				np, child);
 			return -EINVAL;
 		}
-		if (npinmux == 0 && npins == 0) {
+		if (!has_pinmux && !has_pins) {
 			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
 				np, child);
 			return -EINVAL;
 		}
 
-		if (npinmux > 0)
+		if (has_pinmux) {
+			npins = of_property_count_u32_elems(child, "pinmux");
+			if (npins < 1)
+				return npins ?: -EINVAL;
+
 			nmaps += 2;
-		else
+		} else {
+			npins = of_property_count_u32_elems(child, "pins");
+			if (npins < 1)
+				return npins ?: -EINVAL;
+
 			nmaps += 1;
+		}
 		ngroups += 1;
 	}
 
@@ -535,7 +545,13 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 		pgnames[ngroups++] = grpname;
 
-		if ((npins = of_property_count_u32_elems(child, "pinmux")) > 0) {
+		if (of_property_present(child, "pinmux")) {
+			npins = of_property_count_u32_elems(child, "pinmux");
+			if (npins < 1) {
+				ret = npins ?: -EINVAL;
+				goto free_map;
+			}
+
 			pins = devm_kzalloc_objs(dev, *pins, npins);
 			if (!pins) {
 				ret = -ENOMEM;
@@ -562,7 +578,13 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 			map[nmaps].data.mux.function = np->name;
 			map[nmaps].data.mux.group = grpname;
 			nmaps += 1;
-		} else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
+		} else {
+			npins = of_property_count_u32_elems(child, "pins");
+			if (npins < 1) {
+				ret = npins ?: -EINVAL;
+				goto free_map;
+			}
+
 			pins = devm_kzalloc_objs(dev, *pins, npins);
 			if (!pins) {
 				ret = -ENOMEM;
@@ -579,9 +601,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 					goto free_map;
 				pins[i] = v;
 			}
-		} else {
-			ret = -EINVAL;
-			goto free_map;
 		}
 
 		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
-- 
2.54.0 (Apple Git-157)

