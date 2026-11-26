Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685489;
	b=t+URE45mLTAzJSy26OZg4fuWsgA5OkIT5bFVOd/7kYfEspsUzyIlYZI8vfkskoGqqyEZ
	 z/IBmxdcXsthIlFbY01OhOmdWgxAe0AiDXHRpoMQ4tcNYhji7eVG3fh1n/e4mRPr5qkeE
	 KDxbTktj2brLDykXRHJSlnyVjxlh+KzeIKiBeA4UH+azWmJnbLsK6v2CX7Jk87Q3t+FKT
	 zc6+Pqo26i00YOe3DJEU2D1QjVQFR/lg6tCIxpiSiaIH3QgdL/6Fjs6CRiTzv5773M5sG
	 FsJZSwQyGSjO9splq4HGRTRU+0H/2SZtqK1MahCxBCwTOV/PdYsABAWXiGjshIdHtXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=62zsAbNpyYh2P0IvXqu0uU90/iZYUWvyU/7P+mIdw/Q=;
	b=tLitt9/T4IPdH5eUlO2MMaj1iLi64pFb+tFbhpcScr2x0y6HmZu+blksF62TAYn7a05k
	 a/jvzZ5WxVd+koXo9n3w+b8w/luDf+YKMz1DaxRNOHDJBHlJ1z8Tj4lnkY0UgJT+Vc/nn
	 xpmkzslo8ROqDvNI/RHAP8eRL855Dn6N+W11xcirvI7LxbVVke8M9Q8g7lU7YwStLS6b9
	 cHjylL8HC3DWS5yySpoH36zIc0xeSIPA4R9h2ARfWt+Yq2LgNekXbEp5FjbJXouOtpHiU
	 z2ZotKBjQLwhDUmOgzwtxQEjqR1YMOpw8nmiKQt8gbx/UXILaaC5fet3M6GcmpMDILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHScJeds;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E673606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E673606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHScJeds
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c515319dd89so210445966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685487; x=1796290287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62zsAbNpyYh2P0IvXqu0uU90/iZYUWvyU/7P+mIdw/Q=;
        b=sHScJedsWWAuHzomP/yISjEYjyOFfOgoS7OoN+mMu38gyHwCyBAyv07VGirbjLz3s3
         OYMssdDrcV4tCOJOxVcW1wcp9Q2KbtPVR+z46mZUeQ/dqjvralNbv8umYoKAq8ZR7TvL
         aszdQUaGiPGzOpcVj7xHTfVpg4pRYbezmV+iYYhN5XL3T7URMfPwL2tbkPLZiOxtIrgv
         sn6dhuXdGQUanMWYdIkhYZlHeQ83zWWcNhCXVFr/hrag1o1c0QX178Hapsb4zpW8vDx/
         HXNllJXzGcywo1k0tsIcV58BBCNzJW8WQ43VRjdKXeBF6DMh1hLeRpFoulazq+twjKvU
         ZTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685487; x=1796290287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=62zsAbNpyYh2P0IvXqu0uU90/iZYUWvyU/7P+mIdw/Q=;
        b=ln5TKNeNVMqL5dYQ5BMttTB/0c6Eci2NvfonoV1BVnvpLCEWK71elsCSMp2bN+V45p
         e0jcXQ53gZcRu/CvHWtBXWrQ9SF10Es83UD3OvYEunfEoqDVrRlCSHRTXoBSGjYfqpaS
         wRNPfXvegUxE5K20/ZUEa2T9uk7zNZodLlq8vE0NIaztuHZEGoXlZQvmmyfsjdl+tbom
         usTPKlN7W2IcsEHvktMcyANaWAImIvz1iTMg0G1MOQIsLNnoi0kZGhR2UbfPHTSbCiGP
         NcRKydYeVbUdeoLudYK3XDzBeTjjKJa3M+gEe0AADMrGTsXsEsN6gnQxCd1rYVMOMmOj
         odTQ==
X-Forwarded-Encrypted: i=1; AL+hErEc/lQ5Uhkw4o9NHShxl4Ou84HjJrQ/lvTWcKugt2YxfHkAmPe3kwEEbbzI8qevyjXYOUZLXtbQDxE3U3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TJjXI2738+81OhYny3Nqsb2lCViqWp2mLAE9dU4B3QfV7TRtN
	ajFPh/xKcKUsNxGnieXjVM5JUEjoKZUT1as3BXDM3kbaUZT6UtJnDT4F
X-Gm-Gg: AZFdTZc/BSVi2hKwr84SRzEFjt0Yf7cUDEfEbqfyP1hZxjzFlpM41JwMKRCWED49lfK
	vXs8dZ0cS4wKPnRNVZxJTi7HvWwMILkoanH9FcKPeDbWC8NQefzZy9odTGZj6vkI5d+//a+2yGk
	OXYjJCOqVA56sUJU2I4sHBupBy61dXvBNpDVLxS5EGtcP7lHLr9B8QN2Ymd/L5JMNkwH66sHJg0
	OUFOVNwLoXzgz9EvO1VWYtL6obD6OtFMhvBeMpLr6w9Qo7aHSwmcqLJpyVDkR+s8blBo3MtpzGr
	w5G3cKo5Pg5IhlfPJSbCuXwysaY4ixYiUjtznYimwySIRReER7d9aWKIjndYLyuj4zLJBPsbEDq
	BlQ8615iJbgWVv0vIfP/4qRN0+GnxO+EfuN3MHBP2B62r8wR3ht8FN40lRYSjciTxVhXIoclfK7
	fJLYG35ReTdztQHrMDmWQS/rAlwf3miyPgxMcTuhAoVTdOjMxiR0LY6xCGfVAsBKpDsx3diqj8z
	CyjyX8yOAnL21ls5shHXTicio0KoQlOUCJ8ph4eY4UqEnIOAjhNmuUAlaRxjvwLhWiFwBYlQScm
	yhSghBOEvfEh4pvM7PvPY6sdPbRaAHaM/eFlZiCkkFdzftcHBemRiRF8chlrJqOb1dVAaYw=
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr1276642366b.24.1795685487565;
        Thu, 26 Nov 2026 01:31:27 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:26 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 08/18] sparc32,leon: identify LEON before the firmware model lookup
Date: Thu, 26 Nov 2026 10:30:13 +0100
Message-ID: <20261126093106.1345825-9-linmag7@gmail.com>
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

The legacy firmware lacks the compatible property expected by startup,
so LEON is misidentified as sun4m. With LEON support enabled, identify
PSR implementation 0xf before the firmware lookup and enter leon_init.

Fixes: 1ddb22e13dea ("sparc32,leon: fix leon bootup")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/head_32.S | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 11a1746829a4..97000e9dffd6 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -27,6 +27,13 @@
 #include <asm/errno.h>
 #include <asm/pgtable.h>	/* PGDIR_SHIFT */
 
+	.macro leon_psr_compare reg
+	rd	%psr, \reg
+	srl	\reg, PSR_IMPL_SHIFT, \reg
+	and	\reg, PSR_IMPL_SHIFTED_MASK, \reg
+	cmp	\reg, PSR_IMPL_LEON
+	.endm
+
 	.data
 /* The following are used with the prom_vector node-ops to figure out
  * the cpu-type
@@ -205,10 +212,7 @@ not_a_sun4:
 		 */
 
 		/* Check if this is a LEON CPU */
-		rd	%psr, %g3
-		srl	%g3, PSR_IMPL_SHIFT, %g3
-		and	%g3, PSR_IMPL_SHIFTED_MASK, %g3
-		cmp	%g3, PSR_IMPL_LEON
+		leon_psr_compare %g3
 		be	leon_remap		/* It is a LEON - jump */
 		 nop
 
@@ -366,6 +370,23 @@ execute_in_high_mem:
 		sethi	%hi(linux_dbvec), %g1
 		st	%o1, [%g1 + %lo(linux_dbvec)]
 
+#ifdef CONFIG_SPARC_LEON
+		/* Old LEON U-Boot uses "compatability", not "compatible".
+		 * Identify the CPU before choosing platform initialization,
+		 * and publish the same model for sparc32_start_kernel().
+		 */
+		leon_psr_compare %g3
+		bne	.Lprom_machine_type
+		 nop
+		set	cputypval, %o2
+		set	0x6c656f6e, %g3		! "leon"
+		st	%g3, [%o2]
+		stb	%g0, [%o2 + 4]
+		ba	leon_init
+		 nop
+.Lprom_machine_type:
+#endif /* CONFIG_SPARC_LEON */
+
 		/* Get the machine type via the romvec
 		 * getprops node operation
 		 */
-- 
2.43.0

