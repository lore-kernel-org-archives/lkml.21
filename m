Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110213;
	b=ggEOV56aP12uJOzz3ED6jeBtUQwotZLh+HkuzivKR1u0PKhdO/mCylj9NvZp5iFmJQDY
	 Si2qeIa8AxzlmofANFGXEbIsb8htJIYFq2QKJAyJPEA4qQo886d2YowAAuqik7mIAeLNH
	 KgsGv6O0rQdwLIfcFVZKF2OhH1bTXgWZw2ek65CgI+GlIi7Frp532EzCPxwB4cnYK0BJo
	 MfU4HHKcA2LZyFNcTDQ4faftQ4R01BfnOP7b4t4eyjji3vFIRc/vsZOHcLXE2OKa402+n
	 8MpVmvyYEK0Xk549Pv8bYjCP9kXCWrsur1OPwpmcLXnhmR3HiE8qiz5ERDUmig+T75g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AlaJ2kXmyX2ex9cqiNhx4W/LysSwxrxfAi2UJAeREB0=;
	b=XmPvhY2YNftMiut+1+jZ21WlOqVWnLHK04hwO8oCIFBzoQNEySbZ5sDgokzuNDubDd1P
	 hplASPAVf8J6YAAnGWOuVozYBbZF+/lJF+ym2mZjyQS9iYqcifUH3ky4/OA6pWqsyvxko
	 8jwtWNdHolQFyquf1zcvHxPNe5opqLo3jwOOAnlZZQYs/mj7URpucFkbyERh9f+gZCBYd
	 1C8brC3AVVjfCb9f3fNZUEF3QqdvqmCbnMU5eiKeAwdoCuF1pS9wzw9ylnkNslqE7IJBu
	 Si+OL0Di+Vt0m5+gaznK6Cm0PkyG2dcpwJW1xlazCa7eh9+P2qSMPJ7LsqwOemfqyMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKg8VGfq;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E03606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E03606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKg8VGfq
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-372bdb942dbso3614560eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110212; x=1795715012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlaJ2kXmyX2ex9cqiNhx4W/LysSwxrxfAi2UJAeREB0=;
        b=LKg8VGfqbatQQpF7mJuYKhBbVEl/RG+budEVnkIFnCekWhc/aWXCCtS8TgkaLlHyoK
         pqSXW0mqPx5eJv3LlClcoy+9hPNioKdgPB9xbPTzGkpJX44DKECtRqqiaFXZUykepjQ0
         wetosojnGbZrsfG4/c/8jcrJkBoaGqF2bSjYb8qKYds6LuDSvrVXWwmhsdDyPECROoVR
         468p3l2JuMAByHSpVzwRzkt3qGosiRydP2fyEVlg22Em2AHdndhaxdBwt90bWds19DrJ
         vPV+de3zhz0rUg05flQ4gcloNE+Phs34votyaPQ+Jr85JtolIg/nU0jk43FzD1h9ptRj
         6Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110212; x=1795715012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlaJ2kXmyX2ex9cqiNhx4W/LysSwxrxfAi2UJAeREB0=;
        b=gSSaIaIwPQD3wEUF9c9x7EAihZ1TyvLhH3ost72V511gijVNaTya11hHMEyroSTokA
         EtPJjCGRqVr7Ky6iaCMvGdfDhAVKkC8Oinh0HHTHhMpbGzesk4dfiZEfwSEmNrxNC6Ev
         lptqe5fsoJT3ht61DzjMoF8o7IuhiiTDKUdL6aBxbKNYUEGO5ddaFIlagO9jn9owsmTZ
         mQAkwgu8xvVuN6+L43ReUf7GMypbLwXC+s1I/L5iGihMPT4SV1UV0GDfuisq/k7R0AsL
         uLSvi3OCe6Dn2wGziUURBuFbghiDRDC5WpY7GR7mGYVHcKOUn3QSahWVyk8UpuHpVN6m
         he7g==
X-Forwarded-Encrypted: i=1; AL+hErH2MyTKJRtVWWW1mc7Ggylkw0NDuxSo/yxuNeYa8M74EVe+Yl4Y1ZJ/h4M5KiZhHsXrGUovaMwTQn315S4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wvrfLdZUPME/e56+QBpoEg0KYCMiyf+KeIHyyjJIOhYXke2iY
	G/nP7Of+R+zjFY8RPliMOPqc5T+yU7EOxTBPD9h6xRwhKdz0kX1ZPCoE
X-Gm-Gg: AZFdTZcl+r3XMVCozfAlsiEOceRydhsi9m0obkrI/K7GVLSek44txD7PwOKYFHHQ7RJ
	i5s2ugik30v7FCopMtkSHx2YytVizoXjBIw9+LETH4eoRcjj/U7lHru9V+cNLE8JfxqiqN7xqoO
	aUJUmtuNpF66Suy5rgzC2QesKWbVWJV4MWpLVa+gYBUXI20rTM13TydZzh3yBGbWthDhnZxpgqb
	b+UpqvAVUfYeUYpH1yFRJ0QHPuUHlwb/20IvBbr7Bchvl+2wXPMcd7EVZk6NY58a/lNdKUInhku
	ekvadOXLb+wxbVfAojV/AS79WGUyZe5BuLaFs1RWUPdEjJ5ay8FX2gjpY7TCjhfbu+Kftp2STv3
	MyknYq5ZDshBkKFPRwY0wC42rjI8Alfc0l+zMVYWdaF9LZAbkzigxdd+o+Rjw4Rv++8kX/RHrKv
	oIo/JZn4yq3roDY2fVvpoff/9pfGtXC6UDJkeCHhHSB5y5i6FMGWfBQr5CrMtftWwTwNVF4Fr2J
	OhtEYHW67wIE03MQ8jYasM1IOaWjFIeJTDnBXyGpNhDwq3ewLL3xiwBsofZbFF3hCl+xhuMa5WF
	0V45T5GSx6wwFajNYW7g6rDMRVckGIc=
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr57542eec.36.1795110211655;
        Thu, 19 Nov 2026 09:43:31 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm378097eec.26.2026.11.19.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:43:31 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] fixup! MIPS: SiByte: Fix missing function prototypes
Date: Thu, 19 Nov 2026 09:43:18 -0800
Message-ID: <20261119174327.220291-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Adopt Maciej's suggestion of moving sb1250_m3_workaround_needed() to
asm/bugs.h and have that file be included to provide the definition for
that function. The previous style of using IS_ENABLED() for
bcm1250_m3_war() is also restored.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/bugs.h          |  1 +
 arch/mips/include/asm/sibyte/sb1250.h |  1 -
 arch/mips/mm/tlbex.c                  | 10 +++-------
 arch/mips/sibyte/sb1250/setup.c       |  1 +
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index 84be74afcb9a..04d159d4cb21 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -17,6 +17,7 @@ extern void check_bugs64_early(void);
 
 extern void check_bugs32(void);
 extern void check_bugs64(void);
+extern int sb1250_m3_workaround_needed(void);
 
 static inline int r4k_daddiu_bug(void)
 {
diff --git a/arch/mips/include/asm/sibyte/sb1250.h b/arch/mips/include/asm/sibyte/sb1250.h
index ff97e77d4fe7..1186a8b21b36 100644
--- a/arch/mips/include/asm/sibyte/sb1250.h
+++ b/arch/mips/include/asm/sibyte/sb1250.h
@@ -38,7 +38,6 @@ void sb1_cache_error(void);
 void check_bus_watcher(void);
 #endif
 
-int sb1250_m3_workaround_needed(void);
 void sb1250_setup(void);
 void sb1250_clockevent_init(void);
 void sb1250_clocksource_init(void);
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 03a9b03c3d3a..deaee3a3572e 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -37,9 +37,7 @@
 #include <asm/regdef.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
-#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
-#include <asm/sibyte/sb1250.h>
-#endif
+#include <asm/bugs.h>
 #include <asm/tlbex.h>
 
 static int mips_xpa_disabled;
@@ -89,11 +87,9 @@ static inline int r4k_250MHZhwbug(void)
 
 static inline int __maybe_unused bcm1250_m3_war(void)
 {
-#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
-	return sb1250_m3_workaround_needed();
-#else
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
+		return sb1250_m3_workaround_needed();
 	return 0;
-#endif
 }
 
 static inline int __maybe_unused r10000_llsc_war(void)
diff --git a/arch/mips/sibyte/sb1250/setup.c b/arch/mips/sibyte/sb1250/setup.c
index 644b19038848..26d0197ab4b4 100644
--- a/arch/mips/sibyte/sb1250/setup.c
+++ b/arch/mips/sibyte/sb1250/setup.c
@@ -9,6 +9,7 @@
 #include <linux/string.h>
 
 #include <asm/bootinfo.h>
+#include <asm/bugs.h>
 #include <asm/cpu.h>
 #include <asm/mipsregs.h>
 #include <asm/io.h>
-- 
2.53.0

