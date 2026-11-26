Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685487;
	b=nU8RMhabLW2gwbNpeWz0sORrrZPaaPDogUTC0ayLfz9KmTw0ANn8PIMjioeXdHynQinf
	 n9WndfsvELcxITz9Ap9FYm0874qDfeW3F65YCwpX72iEQDeWn0D3mL61MzIECTTVlD++c
	 /7V/8TBxgirjW/2x0BBmz+ZnIJfhQFgyWnMbKZqR7mceor7KAlM4qpgc+5yHaoVGrmGlO
	 FChdzTSTABUT4AIGrUyoCMONCLbGaQqMXCzZc0ALVaO84X36QLruqMg9WZ4bu2tm9aT6R
	 64RIku1Nh4pnqlSKFh89ZdY6713f5QLeEW0OXDN4gEVg8sjzQwXHKEzQISTPDtde33g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JI0g72Qz4jcoRZ1TWDvybKstNSgg9xw32wUy5VYIBiU=;
	b=YEl+iNFcS7SZ2uignC7PwZdC0ox/QfoeYwDOPMjcVWH/fdFcWbrq5RBSqIFVC4plm8X6
	 wY1heFHeBH5Vv61fLs9HXvqJ7EdVqUxQ1aZbAo+OK1BMN1JwpP1LQB/XKiSQ8boHnQ59I
	 UhDzuHZL/PLoKCjfCqz0aAF+OBsygGIMoTST7crbx5ikabEcGvDRdqTsHTKms4s+h6UnX
	 jbIKm6KmpYgnKS2MEaRwl/W45gCsdlRmCxHZ+AkII7ialdcogHEYRIXGw5R879xeqdmw/
	 BAheEEllDJgLqh0WiJyFNcCiqe/8MTCkRXfozetKZXtj107VOy7J2B74kTy2ilrWFvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLIEXoAC;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D6606A684
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490D6606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLIEXoAC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1011121166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685486; x=1796290286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JI0g72Qz4jcoRZ1TWDvybKstNSgg9xw32wUy5VYIBiU=;
        b=NLIEXoACBrLd1qXDnGnO+WaIvVmTHfswa0Z3T5gwTfjTJtLfjaQau8vJ+X3repNeH5
         eq31x0IaKS/4Kiq6gACXje2COML7Gfes4N7TmYeLwoLsVyrVQhVW2W6G+gU8sPM/W+5Z
         iLMCy2eAul21eKsG1gTWpqLEUAg0J7wQjAr0oSBPG9gdN1jxMSA77Rol4//Zc8pj+G5L
         i4K2Z46fkzb9J+fq+sTHMjyDAwj7w/VSVmL+CMIWA40wB/OJxG1Q1sEnshUZ0q6xKHD9
         twCECEI4Y7d+VvaX00eDHqjEZn4i9SH5mGFGNbPdIHtrUjA4I/pEycvJ5WTsKDXWHc/d
         /ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685486; x=1796290286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JI0g72Qz4jcoRZ1TWDvybKstNSgg9xw32wUy5VYIBiU=;
        b=l8hnMOGSbPX/rS/Jglp1y8UOaL/fu+cebNzkM6rM1SBnJIG/VY0ZlvcO+Bt5+VjyhW
         gA/vovwk+MQC/MpZdSnlWO5TZpUY4WhlXkOALhduz02lNtLN7I2ILQsZf7gxCa8kqnDB
         dvMfXv/iq+CNr3TZQt5vYKLGpL/vQUdnNwDs0rp/SSRqWPKHJtaSULkuHTlYXUQAMKcG
         +4ewC0LTKhLvoaJiWY5fczTzRg4Dnui5USghCHuQtLmJyeNU87cMe1clqPML5IltSixJ
         E25SPqcNVF4wPsS1EUl/Ps19RFpniPtgQEl1oN6jvdmfju16zBFPOjFrJWAvbtzD3l28
         A+Jw==
X-Forwarded-Encrypted: i=1; AL+hErFo+F8gVxqf1lAD5OBhoncugOWNZaxQ+VJUGy8psriAkvAasvLT42GYlVnk/UkJuF5pQxG/vGU8ca+U7Lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BYyETtKyzruQP+FuL64NKzIg5L9oQtG9QGE/KyTFzReRLqXLE
	8ZMWt27De1/jgRP++JTDTUiqdL7C0QTU2E3NMBiEZNDrcbIv/ZemUjDQ
X-Gm-Gg: AZFdTZeD+s/HQhvrY0sk8lFjCRQtFqI1fHz0yMKwH6oofalj+n631sJu6cWIZANyEI3
	F87tH+peAXuxKTsrzC9vI3Sfy5oQILz4m1SRS6jh4548RIw7l8WnVV1Z+UonDzzllE+XGYr/kKo
	AmPFgs9Tf2pFFCbut1xzgm9pqB9Z9Mp4argpGHw3eep3QdScD3zpi/HvKQN53IlD6IF8pG1nvQn
	oCedRAWqHSD1zq3/VY/CKpfWROnb3xzqF4WYyD5IVu1FU3mjTMI3fCaBR5s1F/29NZjJMKhug60
	0kAklO9gGi9ZrdVaHTfp0QwkSPVikf4DDwIrxwjvDp9Xn2p7YztinOCJWtDuV3d0MttfsjuYswN
	t1FrrS+deMA0mMhakto42sAS96YirW1rngOjfnXPGUYIGdzU32esPHo4F45B4TmD7CSA7hXHWkd
	q+Hgg+LXxgVht5wJIR9rNsJeWA1tY0pywg9jLuR981IPfbWYzWH1OBUvyqPQH6fzBUYAAWMuOwQ
	trgAmZA6/5SANZ/qbM8/bWmot4WKB/nHYJ/cFGrvBWD1xR+vsDlrseWPGoMB2jvRD5JoFge7Vmk
	QqO42QIljpYh2JjdPc/KFBF03xlysZYDPDLcZbyUvT95LoXaZ3OhFBRl6NX40RwP/oQzPeQ=
X-Received: by 2002:a17:906:81da:b0:c51:1d9a:323c with SMTP id a640c23a62f3a-c513a88b0d1mr1322592666b.15.1795685485641;
        Thu, 26 Nov 2026 01:31:25 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:25 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 06/18] sparc32: tolerate firmware nodes without a name property
Date: Thu, 26 Nov 2026 10:30:11 +0100
Message-ID: <20261126093106.1345825-7-linmag7@gmail.com>
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

Factory LEON U-Boot omits device-tree name properties, causing
build_path_component() to dereference NULL. Use an empty root component
and phandle-based child names when the property is absent.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/prom_32.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sparc/kernel/prom_32.c b/arch/sparc/kernel/prom_32.c
index cd94f1e8d644..804ca0b2a5b5 100644
--- a/arch/sparc/kernel/prom_32.c
+++ b/arch/sparc/kernel/prom_32.c
@@ -189,11 +189,21 @@ char * __init build_path_component(struct device_node *dp)
 	char tmp_buf[64], *n;
 	size_t n_sz;
 
+	/* Old LEON firmware omits the root name; handle unnamed children too. */
+	if (!name) {
+		if (dp->parent)
+			snprintf(tmp_buf, sizeof(tmp_buf), "node@%x", dp->phandle);
+		else
+			tmp_buf[0] = '\0';
+		goto alloc_name;
+	}
+
 	tmp_buf[0] = '\0';
 	__build_path_component(dp, tmp_buf);
 	if (tmp_buf[0] == '\0')
 		strscpy(tmp_buf, name);
 
+alloc_name:
 	n_sz = strlen(tmp_buf) + 1;
 	n = prom_early_alloc(n_sz);
 	strscpy(n, tmp_buf, n_sz);
-- 
2.43.0

