Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665344;
	b=Dt4rbusqqFAK+3icgyPxLDQx/e3UKMOyolHYNh0pXzxrUA/qUosjEv56hwva/utTdMyv
	 hnGY6qHzy2IVT+SWFld4GWS9icQzIm3hNvWW+klmFvqgiVOl5rk1BXdKBxDisXBESC5uq
	 MJ39Gfq21QxOxeXL2CtvSRpcVWDJOlczEHNvlY7B/XBww8+P28IsDqXEXVwQ9JYC4oUIV
	 XyPnkMFzaA9vt9+9jDPLA+4LtrskDGM/Bp4MsuRYhHayCyWOgYuAxAbB3Fgn8Hkc/gEHM
	 0yhjB9o6I5H4m2Wo3BA00Zf8ogHSyt13h1S/T04YYvNr6c8A1QjdbeoJ3ugQuQ+vgsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
	b=ps58U6P8PCn/OK04UXdeSGcWlHSDikcx6lyesAYssxuvTT1EHAVYbG/A43PBhjqBCHxl
	 iEaFXwCQrWT25b78qS+DuB+fb9EA8tRtm89B39fLZHJpz+CAWyk9dBYwbQPE7KZ/boMqm
	 bKoccZ/XyB9L09c8Il7Hu678ERyoBk1mC2eZq0U9Bx2J8kEuIvWWpqLRcREMb3kJlZ8f5
	 nknShtXozyBkkzLJ9qF9Ev4GXmGRARwFpMlGJtZPafCs6kVG/UT2msQTzFJzawCdA7282
	 4hSCIQD3ACrprFJcLvwjbS0p8HhwzVb+Bq23w6DI7sHAbV6C1nErSk//g48lXJDHuKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="msI/o92b";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE0606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDE0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=msI/o92b
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3938767a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665343; x=1796270143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
        b=msI/o92bEHnsjco9Ke0fI073BxQiXbX3VM9rf/9oUFGDcNUWNjQxV6Vno4qbzpCJIj
         7I5HPAw3UUvneqRFGSgmiw3EsQIPhKQvKSdP0gwGr+f/8Wl/tSeny+5Ff8d3IEEOcPxq
         4Hw6VKA2j9ZQY7hfSVHWwwsfSrInQ3ewHihSo/3uBOtwAwJkIuL6U8ffgIj8t81XlmNM
         ap3flkleijeEP17wAQt/vU2Niu4jI4GbmAr5cN0jLuGYyhb1bTScXugaIW+/aNkfWksT
         3vh1sKZBFclsHKi8MgF8mcY3S081l6v+n0nf9q/TS/8RdNR0AU+76wSYKFdRFc1JZuy0
         aISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665343; x=1796270143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
        b=Jl2BJIlv+mh8ER5+9DiZO5w/Smm1IvTaRAKg9lfWxoY42jZuWk+VAJ8f9LtvmzH3oZ
         R8deqLKeW3eGQQfjFJnUypSkpmViLdXGt/NyIuto0bAEToXZAKjmXp3MXJjXWQQ11SLz
         vMZUXJ2/iOHi61HtC3A1BmrLDslbYmey6mrYwvFStx2fupnrvB4v2z9wuUyWnDjyEu8f
         oQ9Qac0lfVitzt97qdrqUez7jbcu8QnBRamN90exIoE1K2yBI27RACVKbDcwuPIxqqT4
         wzgIohMWpn1cA5UdaE2IhcILJihITkCE1MRnQcw2/ji4PG2Vvy+l4BmfZKGLaPEX2X2d
         8WwQ==
X-Forwarded-Encrypted: i=1; AL+hErF///MG+10K4B66VH3TWLVJ4uX/RyLJk4gOsib7Z6htZf49EsShH1s6AMHt2Q9J4C6NGUrYONb0gticvpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rY0JZWFREsfVTMjKHO9b224DvaiiXI1jNzOUh/hDal30Kkor2
	PKctxXXy8O86wq1325nYKlxWfAGlSkxowec5gW1OeX6cmB9kgrO2gUHg
X-Gm-Gg: AZFdTZejUN1cc0Aomo+f8ehCUpKTNbinTf/D0xaHgpPlMKODtkCPAfF40XK0GpfA2WD
	agU0pwke/QXRGWHQcTWB+SJLs2eQXUM5r5I0Mi61JCLlkvRPGWDxNplRWQAOOJnoUIhhf/Ir0K7
	63eux8BNgK0sWPi2NP//qY2f34hMp/gFqNK+PW9d3lEG3AB+dv7ApbLcnCiTRWKol6fFHvZYKVw
	5AJhfuDV5aM4cKpbKWBwz8Wejey97jgLf9AXy2gHbLcB9IIN6SbCE71Q4K2aoEfIs165JfNBiRo
	V9BG2oMeXnvXdfgJeGe3ESSTmpiDtFMyzKLIM/Z2vaG/n3NU+8LobieRgJOOvc+NfFFXtvNQZBV
	ImkAg1rPrIygU9/H/0fmORrCXtFEWIU5AfbbCSUPnQWE24nQwOvSSZcto0o9q6oQ8ibEX9dcrf/
	pdNf7R8rsP/cVWNLeOv+MfZOWjdtSx6+dcyQO1Lu6u9cpbeBJV7aWJrLLzb4w5xjdtrgeQg16f5
	bvJ0KkV0iq3BKOZ4xJyXKUoMNSxnbunscnLnnPdl4vXA49mtH+83qaLzrpbbOtmnfEdIt8HYHal
	T9Wu1dCQG1xNox5pY48bPxxeVegdynIgGux5ffpjkPnuFUmvuoe9iqntAdNx2T1oJD0E0z/j2+Y
	/uyFgr4kgrnYJaRf/26jlXVInuicc0BZZ1rlGXi5RKs8Q9l0XbwFjx4+926lSig==
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b41c907e21mr18204723a91.26.1795665343049;
        Wed, 25 Nov 2026 19:55:43 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:42 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests: ALSA: pcmtest: Load the module when it is missing
Date: Thu, 26 Nov 2026 12:55:25 +0900
Message-ID: <20261126035526.1779288-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

test-pcmtest-driver skips when the pcmtest debugfs files are missing.
The driver has no device to bind to, so nothing loads the module, and the
test skips even on a kernel that builds it.

Run modprobe once before skipping, as the net pktgen test does. The
module stays loaded. In the default order the test runs after mixer-test
and pcm-test, so the extra card does not change what they check.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index b796a5613c6f..ea6a9e0f7483 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -6,6 +6,7 @@
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <alsa/asoundlib.h>
@@ -171,6 +172,9 @@ FIXTURE_SETUP(pcmtest) {
 		SKIP(return, "This test needs root to run!");
 
 	err = read_patterns();
+	/* nothing loads the module on its own, so ask for it */
+	if (err && !system("modprobe -q snd-pcmtest"))
+		err = read_patterns();
 	if (err)
 		SKIP(return, "Can't read patterns. Probably, module isn't loaded");
 
-- 
2.43.0

