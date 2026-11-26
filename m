Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685486;
	b=GUG2Atx7CzIhJwEOMRbrXuqqSOfqlGqM+sknvOQ1Vt/Xvo8yKMA3c41YsVdEzOSsFG7h
	 N9rR5V7+7rZUgGf6iGet815CKY8f71Z/naOvJtSczL3HgESp6vCTsvSJ1lT431cqN1ZDv
	 KPM72gUrInTVLPPMozHNxZ3l0YgIAqKIADH0kuXn5vJITdDWEk29Upfh5Nv/1lVS3oTiI
	 jDzdYq/bGtwejVxNsUVQZlsHS4AGXXy73oYOGh+c+hLJKbBb+ejNN+tXpkUnIhA/ftYA2
	 +ofptFj4/fyd4fsU3pWBG7itJDUhFCxRZCCpamAq/nXLyAU7KCfoR02Hfvkg8VeiMSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tCB15JnYkDvfVGEXUZ81H+2smLFpK44pjfBFb6tfg1Y=;
	b=B5wZNUcRRYo1AjcHN3o0PZgKh2CeABPi06m47WVciNeti4QuPhjv5s2ACRN+7wUVauKe
	 C34LMdV7bhGP8aEZpZTJecvTCIk5fpsdpdCAI9rEAWUHP/f2Q6jDH9WUSD9aKhEoKaw9o
	 +koDdOl8HFgzWEQFlMFCJh0CF9zPev46Td8MlnvUgUpJcLHiehUV4qRtJ62Zk/St0+kcq
	 fKd+rpiHLC/0+3Cx3gacMr2wNKlcCtNb94CQmSiJsCOPmxV6Yy1o0T27dexmuqoh/iJ+5
	 zOYj5BcNJkxwIS5AS4u3AfZArEXk++vD5gXB8TTZagVlNY1EoVlFm6uGqo8oQDka8dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJqwi00S;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D1606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886D1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJqwi00S
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1011117066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685485; x=1796290285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCB15JnYkDvfVGEXUZ81H+2smLFpK44pjfBFb6tfg1Y=;
        b=VJqwi00S5Wbo8E/cR2Lcr2fOeC5pr51NXyVjERokSV/kXNOsPUKew2a9XEf9JFgoMk
         c3+SV+T/13UTVvesYqXWkVTEpcDvm8S0we6zORSJTpJHVWmy+eQNXitRvmAYFDwZz/jp
         LP5xYQ5dEOLQmQtMEKTRhEb0Ba/3NGuSJY0Q4MrsKSlVTMo50lENu6l/3JSEyoVsSqC9
         klEeLq7R0FPtOPSLjHDYg7mvBMwKafcc6yqTCLc6eEhSW+LubgJTVR2Ynv2nNiA6Cbo+
         WTjJfs+LwyXTTgxE7oyG8J7xnPeuBrEppFHtQXhZXcel/Y2Cy92F1RGlr/Ff+RJvt3kp
         oKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685485; x=1796290285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCB15JnYkDvfVGEXUZ81H+2smLFpK44pjfBFb6tfg1Y=;
        b=Mvb1KNlz6Izb/jUrMBiZ/NauN0LVb7wcPdXl50Mf/9gAUs4+yY7/ukwYsPQpQGlVTk
         y9MM//3zDlqd4oGpIbg/qFwYH2eAVfyZgD6UBgU/a0XrnTTBXt2uQW84ZWSJXVP2us11
         F93MYl27kbmwiGgQujoQ+IZe/fh0yrc7Yq04IPQYV6j6yHPet0SY6gfF30TAmTlEYWTj
         qrgX85ZquvjqF88Pdlc2K5wYPCTo7nhcxjDu8g0WpRuksSZmRk+PiYLihWMEWxc1hPlK
         Nn+2LoYMICH2o0EkJhBBXW3E7HKvIe9g+i/B2fxZQElmWHqXn6U3L6FBj6n7AGrvqGSm
         UWCw==
X-Forwarded-Encrypted: i=1; AL+hErErAWyLn56ciSTHBuj4ikCQxXRisZ5E0aL5UDN6lBlhIGEBY+OSQ80RDtnVyUZlUp6aglc839uJJzLfZ+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jVc7OtcL0+MhlmmWVtRMsrqF3y+pzUuVUfIrT3MANot8ghLuq
	Sywwf6b89tV8FgHERaxKvcKNm/nk6zXrh3Hvbkh6BSI0o3QYdkbx9MWN
X-Gm-Gg: AZFdTZdb/NnJgWbLfhBWVW8WCyyw1CMPVt3VwX1I5MJyRcp8ozDv8m0FFQUkL3QfzLn
	uzh1ybsyh/XWUIz+ZvwtTnEdPmR/cPHiRmKdncZ8a+O1vOdPH+RKc7DnHwiz5vS2Jkt0Bb2vZ+G
	ZZATUSRWmk1Z9VKqhGgStsJWrI4j04BTVzfJT+3N/HZ+7uP8NM/LJ/AcMsWiAgK1o+DUthyJJnO
	s0rIZR82Fno+oazH5EfGlSb2XX+9V7ek/wLzL0ZYa72gy2ClyeWbb4jGY47bxWuuurSkTiRwoUV
	onqmFIZ/244Peorp9bZa2QIwjvspXr7zzlnta+wpvQp+lbOePaFi3bIK9GZ7d2w5a1fkQ6CQPSB
	6rZA+a6ACGTgk0mogS5j2WMqyZbmPOQKppyn87eNmAEKTZS4UdE9TrD4ufztp3P55qAedDaJuDX
	DND15XxfbvPJlug5ARGMqHjosdIr3lrNX1VHk3jALyJlwt2HPurTj07d9GNaQtiL0n76DF0OLxW
	ZuZJ5wq77PYQD+oTDSIcWuU5o/aehAH8OOOw1HpFbVsfJmYln7MZHGbtiQTcFx+XqYJTsVvVw7q
	zY9gUTw0ez92JlHZm+/diAytK6Bbb5BRvONybmRSb5swHh/xPNKXrSyw9Jlv66DLVQ0ThvQ=
X-Received: by 2002:a17:906:ad1:b0:c2d:d408:5d9c with SMTP id a640c23a62f3a-c513ac9c0d9mr1173205266b.48.1795685484803;
        Thu, 26 Nov 2026 01:31:24 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:24 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 05/18] sparc32: preserve both LEON PROM character-output conventions
Date: Thu, 26 Nov 2026 10:30:10 +0100
Message-ID: <20261126093106.1345825-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

Factory GR-LEON4-ITX U-Boot returns zero after character output, while
modern MKLINUXIMG returns zero when busy and one after transmission.
Recognize the legacy PROM before printing and adapt only its zero-success
callback. Match the exact legacy properties and accept its getprop()
success value of one; preserve other firmware conventions.

Fixes: 154337688bfa ("sparc: prom: Sanitize return value from prom_nbputchar()")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/oplib_32.h |  2 ++
 arch/sparc/prom/console_32.c      |  5 +++--
 arch/sparc/prom/init_32.c         | 23 +++++++++++++++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/oplib_32.h b/arch/sparc/include/asm/oplib_32.h
index d1cf3a27a40d..5f009615cecf 100644
--- a/arch/sparc/include/asm/oplib_32.h
+++ b/arch/sparc/include/asm/oplib_32.h
@@ -25,6 +25,8 @@ enum prom_major_version {
 };
 
 extern enum prom_major_version prom_vers;
+/* Old LEON U-Boot uses a blocking, zero-success V0 putchar. */
+extern bool prom_leon_legacy;
 /* Revision, and firmware revision. */
 extern unsigned int prom_rev, prom_prev;
 
diff --git a/arch/sparc/prom/console_32.c b/arch/sparc/prom/console_32.c
index 6404e5bbb7e6..8615005ca67f 100644
--- a/arch/sparc/prom/console_32.c
+++ b/arch/sparc/prom/console_32.c
@@ -22,12 +22,13 @@ extern void restore_current(void);
 static int prom_nbputchar(const char *buf)
 {
 	unsigned long flags;
-	int i = -1;
+	int i = -1, ret;
 
 	spin_lock_irqsave(&prom_lock, flags);
 	switch(prom_vers) {
 	case PROM_V0:
-		if ((*(romvec->pv_nbputchar))(*buf))
+		ret = romvec->pv_nbputchar(*buf);
+		if (prom_leon_legacy ? ret == 0 : ret)
 			i = 1;
 		break;
 	case PROM_V2:
diff --git a/arch/sparc/prom/init_32.c b/arch/sparc/prom/init_32.c
index d20470166cb1..d36fa4e7207a 100644
--- a/arch/sparc/prom/init_32.c
+++ b/arch/sparc/prom/init_32.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/string.h>
 
 #include <asm/openprom.h>
 #include <asm/oplib.h>
@@ -19,6 +20,7 @@ EXPORT_SYMBOL(romvec);
 
 enum prom_major_version prom_vers;
 unsigned int prom_rev, prom_prev;
+bool prom_leon_legacy __ro_after_init;
 
 /* The root node of the prom device tree. */
 phandle prom_root_node;
@@ -27,6 +29,25 @@ EXPORT_SYMBOL(prom_root_node);
 /* Pointer to the device tree operations structure. */
 struct linux_nodeops *prom_nodeops;
 
+/* Identify the old U-Boot PROM before any library routine can print. */
+static void __init prom_check_legacy_leon(void)
+{
+	char compat[5] = { };
+
+	if (!IS_ENABLED(CONFIG_SPARC_LEON) || prom_vers != PROM_V0 ||
+	    romvec->pv_stdin || romvec->pv_stdout)
+		return;
+	if (prom_getproplen(prom_root_node, "compatible") >= 0)
+		return;
+	/* Old U-Boot's getprop returns one on success, not the byte count. */
+	if (prom_getproplen(prom_root_node, "compatability") != sizeof(compat))
+		return;
+	if (prom_getproperty(prom_root_node, "compatability", compat,
+			     sizeof(compat)) > 0 &&
+	    !memcmp(compat, "leon2", sizeof(compat)))
+		prom_leon_legacy = true;
+}
+
 /* You must call prom_init() before you attempt to use any of the
  * routines in the prom library.
  * It gets passed the pointer to the PROM vector.
@@ -65,6 +86,8 @@ void __init prom_init(struct linux_romvec *rp)
 	   (((unsigned long) prom_nodeops) == -1))
 		prom_halt();
 
+	prom_check_legacy_leon();
+
 	prom_meminit();
 
 	prom_ranges_init();
-- 
2.43.0

