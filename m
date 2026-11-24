Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533016;
	b=AHlpYGXUFMuMcLyumiW4du7Rcrg6kxm+VwOPBhQ7yTVSh36g7ars1TGrzH8tff2lxp6C
	 M7FkeYZ2cigUT9BqVfsYn1/yOplQiUUstGVOv2y6r5WDgkB4TeGT2MdpFonLanO4NkKFs
	 mEylwzryDV5gtdguBabyPeJdQrAOiH54za1DaVf1BpFraAeNkzjUBfOS4x9Vzz46yLPF2
	 Tst4f5UOfFMgWV2ZqUWOPQd6M2D1y9yiSdKhylJjIvSpDBznwGDpFaUNqbgnMq9FYrJLm
	 bO+v6NkBZHx5mBekdkJvh9ij3ASfA63hl5jC5wDK/Xl/ZdmHoeF7YVEEDX+IGaXckOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zLnilNtv6TgFtWLmY0P+M7M3ZbXmBZe4pPd+K5XLsr0=;
	b=i8n2mDmq7T/ed3EiTSP1MchMuT4YxF5rVGk6du22mUVYzzPzoJubcNVZAN7yuCw9Xy6P
	 DpQSIfpE53iGt+ia4cEjRN5wm4zmDvhkZk34Atirti5wkned1z7oa75oQO5lxXU2KAO4A
	 zqSojKCdWP3Ww0UOCMF9MX7klQu4zzbqVMRBwUGK2pIkKmz/ejAdbPpO0zkuytxQUtErK
	 JmDFcGS2+/o6D5islA4eTp7evCYJFhUBsCi2lH5Knv3ZR//TbNdC1cS/pmQD0drwgc4s3
	 6jV4PvRb3wGgINlI8GthFumboBjovziCXDzVNxIfxP8tX0hnjQF9mXnVd6sCWRcbhUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZhksYgP;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2BF606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2BF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZhksYgP
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451a49abd8aso4665920fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795533015; x=1796137815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLnilNtv6TgFtWLmY0P+M7M3ZbXmBZe4pPd+K5XLsr0=;
        b=GZhksYgPAY37clzdNFEqyPrcq+rItQ+EVlz/36uIp3ryGtUoXq8xDuF4cWnp10gT2o
         rxY+ULkzgcKT3fB5LzP/kSaffBYJyosXsvGzGbfFH6MGmdxT67wPCJIuQc6kgcPUms4w
         G35rYL30SbviZK91LmanaBszRXyqM18C/kcxhalrfu1XALe1DdLlesnCi2frXlvbfRbY
         QUGRLXDOUpk96Zfp+A6cbEmqvBepmzrR55oX8yEfhCk1pIuyIp2zsnFPNqUqXt+HnUZf
         ldozSwEDdiRogUdvz2RehJZknxR8U0VUsuLI80/zWIBA16xzxdqem8qw7Cezu9NCU3Vs
         Q1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533015; x=1796137815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLnilNtv6TgFtWLmY0P+M7M3ZbXmBZe4pPd+K5XLsr0=;
        b=gSUJ3Vkn0qkpyNiQO9ga1kWVX9MfLsRpm6BCwfyH0qrQ9Pkzolp6KhXh4PZn8sSVMs
         /Z9wYJ23bcQa/XJyVvq8X4s61dvEy2sfucG6yA2YjV8wsYUNghLvGQig/FELvGTW2nJu
         rfzBzAqH/PpOFq957AYP2rRhZ6bMePfJ/EenKjH2VqPR2N/XrU1JDS563eFq959Ew243
         qNeExKIs0fBzktnifJ1SzlqrE5Re4lLkU52WzXDtna6JIFCrf2GneT5H55IpRtMv2a6E
         pTWfajnBF+0wW4isxgpDkT3HVadCleBK+kA698l89kN604JTDm4IW6qZO6AMb6Mh32yX
         GKEA==
X-Forwarded-Encrypted: i=1; AL+hErEZqD1u+Y0PiFMg+IcjraqgxTMsQRKpukN+3Vyk+ESsmR9+NWSxGZeJ9K14943TH02iDL7Y315KwVm4HiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iyalKonh6Imy6qKcoihqQLrQmq9FNJetTtpyFJvlR3zu3vkbN
	XuNd3m/cisR3sQX9m1w54FQq3oIEMgOlqM3ZcFaxbOuslejD3wL9Fou7
X-Gm-Gg: AZFdTZetmB2nIfYhNgl+b+ooIfFaTOgQLRif3OudVFTS9vO7XHpZjJceRJcoKGM8fQg
	/iOLgaxt6FLX1iPjhZ1hliwEjP8vlYDhG7ggblBWbJ6uEGOBiSzyrIACHRhU66jfduPqaQFvI4X
	3d1W4yhFOThne/dF+uo75IER9QjrpaJIAbKoSNAx2rOoaEVy3TMqVbtzmURJU6hKr/+x34gvqjP
	HWAWVcjf+DcVLw/tsPajqma2vTJCA0LtlX4UN2z2FU0BRFdYVxtjRoV2oRUJ8wH85rDWKsNlGDT
	lZApg1/JlCm4AnOpj0Vbort6+ZOYEP+5iPALCHPy8Rdac/LxcwsL9UWOVgh7HEMbm+1G6tBHIAC
	c5AmxyrCHrYBxnr4zE1u7SmydmK96pTIslgXb3rOFUOCuZcRceG8IiLTRdgj7vOegt4nBg/ZiOR
	8Qoo7FMWkgNoagunJDGMFM4HknG6vVIM5x1eMnkX5DtN5VezBxgW40k4h4wMX8t0na2QONtBBgK
	d8QMFtE9aX0myOZPH6jXYOsoFW9gz9zKZbCmnGuTsUkrDcBC7jxxUUtyx0TAAVQCSH8+6rtZrcv
	r0Mh8ekVLEpKT1YVBBByqKB4Q3Q5aEJq8DLmrMQDI40lTKhKTbuSacRgeWwQxuwfLgYLf0kqePi
	+7nBklNFMPoyMobt3nA7S8JV1Ka98YcjkVxWdHmVoGNoFzzlBqBA0VMdqkNeLM/jdWpA=
X-Received: by 2002:a05:6870:b0d6:b0:43b:b245:30ac with SMTP id 586e51a60fabf-4bc81aa21f4mr13572490fac.16.1795533014780;
        Tue, 24 Nov 2026 07:10:14 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm14404091fac.16.2026.11.24.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:10:14 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Pavel Machek <pavel@ucw.cz>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: OMAP2+: Fix CPCAP node reference leaks
Date: Tue, 24 Nov 2026 15:10:06 +0000
Message-ID: <20261124151012.333306-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
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

omap4_cpcap_init(), cpcap_late_init() and omap4_twl_init() call
of_find_compatible_node() to check whether the device tree has a
"motorola,cpcap" node. of_find_compatible_node() returns the node with
its reference count raised, but the callers only test the returned
pointer and never drop that reference.

Put the node right after the check.

Fixes: d44fa156dcb2 ("ARM: OMAP2+: Configure voltage controller for cpcap")
Fixes: ccd369455a23 ("ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC")
Fixes: 7397daf1029d ("ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM omap2plus_defconfig, W=1). I have no OMAP4
board with a CPCAP PMIC to test it on.

 arch/arm/mach-omap2/omap_twl.c   | 10 ++++++++--
 arch/arm/mach-omap2/pmic-cpcap.c | 11 +++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index d4dab041324d..e103088bb34f 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -213,11 +213,17 @@ static struct omap_voltdm_pmic omap4_core_pmic = {
 int __init omap4_twl_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np;
 
-	if (!cpu_is_omap44xx() ||
-	    of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	if (!cpu_is_omap44xx())
 		return -ENODEV;
 
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	if (np) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
 	voltdm = voltdm_lookup("mpu");
 	omap_voltage_register_pmic(voltdm, &omap4_mpu_pmic);
 
diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 9f9a20274db8..2f487ad41685 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -238,9 +238,12 @@ static struct omap_voltdm_pmic omap4_fan_iva = {
 int __init omap4_cpcap_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np;
 
-	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	if (!np)
 		return -ENODEV;
+	of_node_put(np);
 
 	voltdm = voltdm_lookup("mpu");
 	omap_voltage_register_pmic(voltdm, &omap443x_max8952_mpu);
@@ -264,8 +267,12 @@ int __init omap4_cpcap_init(void)
 
 static int __init cpcap_late_init(void)
 {
-	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "motorola,cpcap");
+	if (!np)
 		return 0;
+	of_node_put(np);
 
 	if (soc_is_omap443x() || soc_is_omap446x() || soc_is_omap447x())
 		omap4_vc_set_pmic_signaling(PWRDM_POWER_RET);

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

