Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193995;
	b=kMQkXy/Y7e5fYQSwAc9Ara/iAemv4UyzI0ldFM3MBtwH24otKLd7/iiUfYgSrYgnp/+0
	 22IKLYmjcSw6jbZQPKEaTYPl1Blskk7VM3C6WXCVa/spTW98cF/yoyAbnAWJ1dR4O+h79
	 h4ZQIh9iAVj+OHJmr1pvJlmTBSt16gvx61Oqeu/l7s+h/SOOzEb82FoT+kSnTX8BNIo5t
	 syZ7KTX5q6xF2WaClC4uqKWw/3GjNTtE7OQGOFErBBD2bHQIhZvxGhAeQrr+Qt+tNxbL3
	 CEKIUZrXhGcOhfMKG5bVKxk4wQrPqgLHkQanN3zna39TplDKba/Y2cT742wY7iX6pnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O8S+yRSGSfrlAkjD3dhQT0CDK6E3kYAaaeOgKnCRES0=;
	b=lGTr383sqccIk71MY9ez04prTLgE2/yNhU+QvLfPHRqhMEQ1kN4pu8lOy1bEIZsVHiXv
	 GODRW6xzoDtIeE02lSif/a06gbbP0NYy191viZAMgftWNtwJTDUbCH3yjbyr3FcrxRl4i
	 SC6y6R13jNXF6Pj4gQMmmWztSf/rNzsYJUpBGXmG4zCf1ZVRHReUUg3AtF7aroaa8FqMi
	 mqD30reYt97+dxySpoCAWizBpFKYizalTXupkSiNq65TXydgDazrLt31skpiQR6aBTxER
	 CA00aclSnlhKkLvEBeJLUW4CIGlylfigMCK/kJ1fxiMwvaDcBhRys25Y0xm/eXQRS/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6BU0MGc;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B00A60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B00A60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6BU0MGc
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so12198225e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795193985; x=1795798785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8S+yRSGSfrlAkjD3dhQT0CDK6E3kYAaaeOgKnCRES0=;
        b=m6BU0MGcdDFsz3WbRA2gTKSk9CNBrAfxBTx6CmujE6OCmk70Ot99iutsrU4lwdQl1/
         HgRPqyeuj4Oe5Pjbjnm0Xw3RAFjVpn5WmzvOu0pCNFRd65lQGiqFX8YFWWnP2ShfKJIj
         kGnsN+tcJ7uJY+gCOZNA6BsjO3+LHYxDSfW6P0ZpAHqYnEIXiricwc4GPWhnrdnak/A0
         DYep3ouTGZwh1csxcBkK9K9/3rfVWPw32oSnyyp3c/cxPy9yQFkL9i9tiF4oGPCtGZU9
         gtq4vBx7u08eL1D/Kvwo/PKHe6uED74DOzoF9UBy9cNi0XXTfDAlPu7jfeid3HCNr6kf
         rWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193985; x=1795798785;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8S+yRSGSfrlAkjD3dhQT0CDK6E3kYAaaeOgKnCRES0=;
        b=eCQnjVtr0utTjHVR2tyN2NSSWXhyQCTFF7Wfyv3bTSgapbFDEv3YZa1KEupMPTo/6J
         +Zt2eTWM/bRNQ/tazDrqSHC3d0blKVZVNSH2D6xD6g24BElazjQSLzENsOMNZlnyoUp8
         TN5zbArXTYnwXDPtw3ToB93dDf7MyXm814urnMXUkuEkL8+HcZpCQQ3ERKcIgUDXthQj
         TXB89LeHlOPqzeAMt+6YL2/bbEUW4q/rlp7pfBdotseEquIBpT0mio81RBaJmQ0xrCq2
         j2+9vghGE1POwocPkzOi+VlY7/7HI9bbd49HbWdeTtmjDInPfaM+yOWocKcfqHrqyhjY
         cJBQ==
X-Forwarded-Encrypted: i=1; AL+hErGHfijKZ03+mXWn9xmLnIEvpSeY6yQBx/s57rvOop9PofUOmQ2PtRiOPeWEAdIka2YYtsGNjwQLvvG3EKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z985kwHj2QKUOwGuGuHB20g4UI4kzDEv534gVGF4CYwprqBMhk1
	ck5JTw/CEOwmrt2JP8T8t5zyHUqhux5zTYmc9s3dtCjTcKwDlVk0z9Jg
X-Gm-Gg: AYBFou3BPageqgc0RMbHgNd0O7EEbUMU1C02uzoYG6OLdr/8MteAU5Yi8vTq/HAUzJu
	hop5+sQ2K10ho37a45+/HoaE8odJG/gb3wuIdK67XhZnrh1wrmwL/ikSEd7g3H1ZUm2/B8MuyUW
	q+N9Mry0wQQNwouT3Hbtl1L5SsQk+sLoy/+tm5gF53QtbYGKttkylTjyvWS6qI2aXyQCvexHeRM
	11CZ5I8J6SlfK/kaqxgEHbDLkID4phHgJWwxhZ6rVW3WOfBXpx+CGvpAFiFPTS50HGt8qyC1Nds
	Mfs+IVghYGBObsZr7cO+wCuUoNfuscrxdQKq+nYVSFNMcYBeokF9GGOuDkBuyVzYshwed7NBfsP
	ru2UQnVaKrKVti62z7fEEfzgbzMeC93FmR8Q5BLIwC/KSjNGDm/QKx6NRvHteEjWTW5yNeUA5R+
	WAn5B+p/QCSaZIRiNa2LraQvl8Upu+YXH+Dgg8cR5LYURXVy/BTit4VB76i6hwnJkVYzk1iV82l
	5Rm625MUpk4IaI0HNfVx7sub0RIMM7vlcxGJ0/F5LGugw2kwz1SMh230xMHik27/DBUL71DDf2/
	lxjaTHvlne7xZhk0xzN91vFJ07WwpPc1aQ==
X-Received: by 2002:a05:600c:6748:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb888251bfmr79940645e9.14.1795193985361;
        Fri, 20 Nov 2026 08:59:45 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm103768165e9.4.2026.11.20.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:59:45 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Remove unused for_each_sibling() and name_attr
Date: Fri, 20 Nov 2026 19:59:26 +0300
Message-ID: <20261120165926.579575-1-asafbertizlioglu@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The for_each_sibling() macro lost its only user in commit
e1b370b64031 ("hwmon: (coretemp) Simplify sibling management").

The name_attr member of struct platform_data has been unused since
commit d72d19c26c41 ("hwmon: (coretemp) Convert to use
devm_hwmon_device_register_with_groups"), which left the "name"
attribute to the hwmon core.

Remove both. No functional change.

Built with CONFIG_SMP=y and CONFIG_SMP=n at W=1 with no new
warnings. Apart from the struct platform_data allocation size,
which shrinks from 88 to 56 bytes, the generated code is unchanged.

The unused definitions were found with an LLM-based coding assistant,
which also drafted this changelog. Both findings were confirmed with
gcc -Wunused-macros, git grep and the git history.

Signed-off-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>
---
 drivers/hwmon/coretemp.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 96d57fe12de6..75ba3484b1e1 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -51,13 +51,6 @@ enum coretemp_attr_index {
 	TOTAL_ATTRS = ATTR_TTARGET + 1		/* Maximum no of possible attrs */
 };
 
-#ifdef CONFIG_SMP
-#define for_each_sibling(i, cpu) \
-	for_each_cpu(i, topology_sibling_cpumask(cpu))
-#else
-#define for_each_sibling(i, cpu)	for (i = 0; false; )
-#endif
-
 /*
  * Per-Core Temperature Data
  * @temp_valid: Whether the CPU reported @temp as valid. @temp is not
@@ -98,7 +91,6 @@ struct platform_data {
 	struct cpumask		cpumask;
 	struct temp_data	*pkg_data;
 	struct temp_data	**core_data;
-	struct device_attribute name_attr;
 };
 
 struct tjmax_pci {
-- 
2.56.0

