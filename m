Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757325;
	b=3vzaIwYCYADiiWQiLHVdBKohEsMtVPpOZvU8J8CbbI2v+ED13Dfvp6O9uEn03y3FSvpJ
	 MAiL+bZGT/tJlIsprQBJ+DlMwWRVo6Udf5NbfgJIAIdpNnXJAXyUCUpHLKbaJ3bUvP8gB
	 /g352IJ1v3rcRYnenSuCPWmNNykZeIM5oGG2TdZ4tO7exJXp+mRAgN9J/84oGuRy9zgI5
	 B7q8Ka7+EJf/kohMpO4B4xAo0Tka0I2PR5P1Cy6CO4Dv7g34p0wUK/aoZGT9tRVJDwuwO
	 doGI5tqtzFm9ZG0KqGF0z8q1M8I4SfK78x1CF5YbVQ/A+Rvzj5v1a+UnLDMH5TYuW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=opzL0+bRRsAW8Xh4G3H8xnm+Ixjopiv/vK7BY1qrbqQ=;
	b=Nzkf0rxvRD908UHsm8zgKnrS3qDhT17Ucrf6QjpYGgOQwex7NB/rM5oyBJSp/CcrOa3/
	 ofm5f8MQh9aSDcyO4KgzJrbRnuvl7zNgOqMxHxKS2Gjz3qb3DW5o/yxxf3FlDujQr/LMu
	 bQpukPkmfzLrci3TWApCfl8MTCC/Eqan1pMhe8l/zSIs/26RzMyG/YWttt/z+UYAQ3wGU
	 PADsTfBFumteMONlDZTmZZGecVH4YMNc1MgHasnB8umFjt9zdVbjI/Ajqpd1TPvU04UMd
	 heX0HNjo7FbhxzjGwQ3Z6IHh7zR2WmVEtP1ZgwjTDOWcQdSAw9UbYHCB73ygyX5iLCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHgO6koW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C733606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C733606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHgO6koW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so48021555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795757324; x=1796362124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opzL0+bRRsAW8Xh4G3H8xnm+Ixjopiv/vK7BY1qrbqQ=;
        b=HHgO6koWLqKZU69ZnIAuEI/7eGgwnrCAMSgfu/6jJ+veq6GJciQpLSgfidJ3MlEJg2
         hpthz16QBOsI0yUYdEidEymh2v36F34oL5DUPvGkd4DNjmSiWVwiYARl2UnJ9RIrj+VB
         lEutaUf2f9+UyO7Z1H9Sfw9a07jtvmhOGowPtTdTN59v+osNGvJNc/y2kxQVf4pBVp90
         ksv7PyCHZdjrFPHk8ayjRQnRdYoYY7CYS5ey8FtsdpvbQdrINLsaigHKzB+CLVnPlkG3
         audc9SuS2rxsxiGgP0w5lTWRAUcq7A61axhy31O6kgh0FZNe1VJbCxe5CChTnobzesyJ
         VNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757324; x=1796362124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opzL0+bRRsAW8Xh4G3H8xnm+Ixjopiv/vK7BY1qrbqQ=;
        b=latWurbickUtiqz9qvHRlA/V0RFjY/wmBjI6kEFEA+5ISnV2WphFZ9e1pvJnaU87ND
         axFJ3VfG2HXZzM+dvcN7m2FwJIZBnTuVW45rPYB22jpFcEToMQc6wcL8ftEFnV/sXxQy
         BCE8biaP6Jgeo1Xjznj1qlualznIKGoUEp1kusZjfSFyEpE0Aa/NiJfUjI99/1malfhp
         +AyPq/X3KqvtaHmRMw8FbbbCAh+OazzSr+xeEcEPVrNbhNe9/6pAwam7ST4LfCvmSmKm
         FpKJaFiZp8j/xAXRcKL3iH3+Z6L1KwxyRERwj9mytNg7y8JeOhAbm3n8J9rMfyGwEG2x
         5EBw==
X-Forwarded-Encrypted: i=1; AL+hErHbezpQMq3B4TF79E6H/miQ4LhfOiQYlU7qRKA/x5D3R+3hwdAIRiZsfJrmoHhCn1dOJ4lWcnRzgGSj5ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RPJM/m7f386wZdd/NoGyj6pVZ9j0THdvF5efeKY8xDo6ZFsCl
	k7hfB2FDO+hOjuzP88O9RAo1f7RYCHlKBiw6TWrBHmGhQbds2jRjX8Mw
X-Gm-Gg: AZFdTZfZnPO20eRld7/o39DgRhXMfqjF2HGQpf5i38oBkshECV9zuamBjYHp2gI53LC
	FsoBcusuiW1I9OC++d+or17BmjoIiHNhbrmpYdgRv9wbPirkmRhKXVZK2gVrYLb2Z9fZUUvb3+i
	fgexE8ZdCIatawCFNfZT2xpvuS9DtJWsbDa4cJndjNtGspokFYhpkLRHW0kpaHT20Yz1XZpy5g7
	ftb8xq1+vbLizBajxt7/DfFzVXOlIHza2iFXQCiS9w1+bRkM4XSKfNYyS3ssPQhjuCoHlQhioHW
	sE9LjE4T/Brz+RPFVLSMBmt1SNq27hzbXUKjDHSIHo+k9ENATrVJgHGpDiy2wiKYkz/bxRojuHi
	fwiyqJxyH8E50G0dclpKaXmHZhwT6Fn/J6b4g6bvGVgw4LVw6gK2pWMHroMhjIEtqMAbJPZndO1
	jFJbaOGArs/mCabKXGdVhPUkHa/g6aZNEDgxzMyBN29/zwSuSqjxgm4vpNf63PmUsgIqPYtfeNT
	EZFQogdIbkw2JTxLxr8VVXZ7XLeSt/RyIdkCgKSivFKvtK8DCEK/8MMgflloDDu0Ei5IZN8IHJy
	WabrmBUXDGBxTOKvgpUD9weR6OaurelIx4cCBZPEgGHtmuGUIgS66zvIIjbk6KiL+Qbzb0pML5k
	sO/gmX7sEyamgvCa7oMRZjK8F31OiZj27RPLVRDfR2DvEAp0HCSKwrHACpKmRG5CPnM5d0ADlkT
	lWfTnzAfXlMJcS3PZ2EAmno1lMn7PWIsaa2uY5xIVpTpleTiXbEk3aPXDeeZ0PsPc=
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr472596405e9.25.1795757323826;
        Thu, 26 Nov 2026 21:28:43 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm649073745e9.1.2026.11.26.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:43 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (yogafan) Support more than two fans and add 3rd fan for Legion Pro 7 16AFR10H
Date: Fri, 27 Nov 2026 06:28:40 +0100
Message-ID: <20261127052841.492895-2-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127052841.492895-1-sergiomelas@gmail.com>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
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

Expand struct yogafan_config.paths from 2 entries to MAX_FANS (8) so
laptops with more than two fans can be configured, matching struct
yoga_fan_data.

Update the Lenovo Legion Pro 7 16AFR10H (83RU) configuration to include
its third 8-bit tachometer field (\_SB.PCI0.LPC0.EC0.FASF, EC offset 0x04)
and update Documentation/hwmon/yogafan.rst accordingly.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/yogafan.rst |  2 ++
 drivers/hwmon/yogafan.c         | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 239c7b576..c30cd9c81 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -107,6 +107,7 @@ immediately to ensure the user knows the fan has stopped.
  83RU           | Legion Pro 7 16     | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  83KF           | Yoga Pro 7 14IAH    | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
  83BS           | Yoga 7 16ARP8       | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83RU           | Legion Pro 7 16     | 0x04      | \_SB.PCI0.LPC0.EC0.FASF (Fan3) |  8-bit | 100
  *Legacy*       | Pre-2020 Models     | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
  -------------------------------------------------------------------------------------------------------
 
@@ -165,3 +166,4 @@ Contributors & DSDT Providers:
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
+- **GabboRocchia** (Legion Pro 7 16AFR10H - 83RU 3rd fan)
diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 6d1284c09..172fdc198 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -41,7 +41,7 @@
 struct yogafan_config {
 	int multiplier;
 	int fan_count;
-	const char *paths[2];
+	const char *paths[MAX_FANS];
 };
 
 struct yoga_fan_data {
@@ -106,6 +106,14 @@ static const struct yogafan_config yoga_pro_83dn_cfg = {
 		   "\\_SB.PC00.LPCB.EC0.FA2S" }
 };
 
+static const struct yogafan_config legion_8bit_triple_cfg = {
+	.multiplier = 100,
+	.fan_count = 3,
+	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS",
+		   "\\_SB.PCI0.LPC0.EC0.FA2S",
+		   "\\_SB.PCI0.LPC0.EC0.FASF" }
+};
+
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -259,7 +267,7 @@ static const struct dmi_system_id yogafan_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Pro 7 16AFR10H"),
 		},
-		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+		.driver_data = (void *)&legion_8bit_triple_cfg,
 	},
 	{
 		.ident = "Lenovo Yoga Pro 7 14IAH10",
-- 
2.55.0

