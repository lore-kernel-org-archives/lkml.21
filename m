Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848765;
	b=mlDiGjF2wf8uF/tHUJ5vfFwNKnQtvi5reP7p/mSOdCBmueRfb7p5wS+Ie8hTgIOWFmhb
	 iDJjDQhBMpVmHxZT0bPeqX9tDdejSWRmdtB/NxNVZQPVQuq/rTQS+By34mvfce8WwBbs5
	 EPd/L5ViEk8fWh62R1MRDAUONSJ+s0shg3WOdP+Lf7b3VFw+pRHWeRREpcm+pBGo45JPB
	 MjhWCipjzSqhJb8OnxIhLa6rOT7jMUk89LQ8EsHYHPj6dSXPSoo5Fbxw8wzdpeWanjwfS
	 uLpIvJLDIo5i+pZlU9PI42Yi3TTzYmxZ7mXXAS8aE/ikZZfhD/RBRw74GBV042twfBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
	b=NdCX/QvBv2fFP7lTGhB5TRvsTI+0gGfRfeGBRKk0bQygnqiVq3DCkL+dhi6VJNNeUcir
	 tX+z0Jn+7Gi7iV0nm/uIbySzmoNpIDZhH+6ii7yel7qWMgtW3fdb4U7x/0NMqV7903fE6
	 KxITwYNfFpxei2XElxzC1/PO/1Aw1xKl+0q7ELKGjLpwJpAokoZx4SnS0BaMOXEFL4HPO
	 qasAUdUU2lp9MK12kdDPCIgkXLBcMcoqMNEmpI0DQo1hGEUhd6gsX2XDdi38NZtWV8lAs
	 JV9++67O4c8fBJO3neya/JJt9Bvxvp5RBArB90mQx0/gBAGX71ZVMxH9ifee38Xx5mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgw5NiQZ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F0606A337
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 469F0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgw5NiQZ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b5489c6b26so301647a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848765; x=1796453565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
        b=Wgw5NiQZUceuxOQxc2tauQLWvq3tcPn2/7gmKBB95k4EKFQTfCBOp/nCTx0SEi8fRu
         3Mkjrtzh24NiMd4aY4SLUqQPntrXmnV4ZaY+X+i5MG2oBaThN1sBnKhDdZY2Ef8N90Pc
         lc8gsJ7BWjFz9YL5DZMcNXAG2H69eJW5gCcSSsRV3sx6B2WLe0+widcEZMjcI45zD12H
         ox8htxy2pnkKedOX38tft8B0I8YiR3svHqOA+qS4mbbf3tEdCSC1B0sfLzlJSxH5uyWa
         DpsI3tRY02tBmmwDeXpiiJLURqAxV8vx/M3KHSEHXJ0ORNbOeDnQmK4z8V47e1vU/18Y
         sewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848765; x=1796453565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
        b=R1nC5zDzifqYl8KarjZLcQAZZlg9uoMw+gbvPa+vRr5DD8K9+25dFD6mhpX6PwEc5J
         7ao1XjnC0neDEl3u5MfN1KyjtJnzRr1d0ZwDGYFV9f9THWG/7v2uMm7ZbhTHtdQUQxhr
         RUhgfPYFP0bTWLIA2eDUX8Mj8nNBQbkHHX/DFxk4FVVSYqMeO/ql+NUovfsGeX9s/OKb
         TE7FXNXHT4pqVpK7WmE02GiuDX09UJdBvCtBTTcRSr73Kcdts9eWG11odiVs5kQAN6DF
         xxMPeeb6UP6dk92zBAW54GTnEf6NDfhbSmo61zxoqx1j2X1PD1Iy4ZXmXYMMzdm1Qp6m
         wMtA==
X-Forwarded-Encrypted: i=1; AL+hErF9DnfTuXL35byTebnY5o8zy6ROD53cTlpZ/PWgSOtvtSQYHu3BimL3NzZPRto9vuFDIh0WwXIb9QAkEL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JIaVBwZ09066XS7okjje3KCX+5BwQFnVMYtV+RADV6Ll+K8l1
	ijlm6RKSY63COgMy9T33K93EaixGZ/1XnXsvPAXHHHXgl/ao4+T/cfQH
X-Gm-Gg: AZFdTZfFwmm3FlyQBuFC8KCtl1+nmCWW3hREJAT9DMoCRFMD4Bi4fuSlt33OVnKoj5e
	K8hJk9+cEeu4rTX4NJ/6JFuH/4WlovFp1iCwai3Dmvnw7OLGzGuF2ltCBZ5T3G6C6gyzBAOifm1
	VmKGFYQqx71HWIuLOMg3TZ21JuKa7DSUCEhCd5pzrX4dtRXaXuScbvh/bNMvrwm94/HOi2agHMN
	ATSByb7Aj1L0H7TS4QKI9g+ao0+n8+XmNjN+eLCsz+WgxFAE1dAJ80NOBh46oJDK+L29K4+1gAy
	wAnKkhn5B1K7dOJ6fI33zZLajNRArt37KvIgf9U/apDlkYQU7eEsZPoz316cIHOgVIRCnrmb3yE
	3exdV7oeTZ0RhEDkCUOMey5qEoL6qyoymTs4yV9EXwWnQhjgJAtkS9DTeY2FIQtW+77MusZkBFU
	rl8ZjQa35wUPFbaYKJfH0ZWXpDCnHOpmXVMBjB5fTa1GBL2oi5n0DT8fRxuubxKnkTJT5Gq/lXg
	l0UpWeCqdUtT2NQJVPTnzqcKHvJRXdmm0JNfd3LRog/WDglDU6X5aTV1qx8DWZF7DN81bbflzzb
	qFop29RVUEKgZDUIWEhr7QxyGk1aZIWDvcCJJ+ENWUY1G86qhJpI89Tvh8a2IXm474kDOxnp+DO
	K2b9WDQl1IZAy+jhju2ZWBHJpJPOuq0bTCqk6xFzcr+3j8uktuhOKSxBnk6q3wg==
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr25103895a91.16.1795848764542;
        Fri, 27 Nov 2026 22:52:44 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 2/2] selftests: ALSA: pcmtest: Load the module when it is missing
Date: Sat, 28 Nov 2026 15:52:27 +0900
Message-ID: <20261128065228.3628550-3-sammiee5311@gmail.com>
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

Run modprobe once before skipping, as the net pktgen test does. Each test
runs in a child process, so record whether the module was loaded before
the tests start, and unload it at exit if the tests loaded it.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
A built-in pcmtest creates its debugfs files at boot, so read_patterns()
succeeds and modprobe is not run. If debugfs is not mounted, modprobe of
a built-in module returns 0, the second read fails, and the test skips as
before.

 .../selftests/alsa/test-pcmtest-driver.c      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index b796a5613c6f..3bd6f75ac6f6 100644
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
@@ -149,6 +150,22 @@ static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
 	return 0;
 }
 
+static bool module_was_loaded;
+
+/* remember whether snd-pcmtest was loaded before the tests ran */
+static void __attribute__((constructor)) check_module(void)
+{
+	module_was_loaded = !access("/sys/module/snd_pcmtest", F_OK);
+}
+
+/* each test runs in a child, so unload in the parent once all are done */
+static void __attribute__((destructor)) unload_module(void)
+{
+	if (!module_was_loaded && !access("/sys/module/snd_pcmtest", F_OK) &&
+	    system("modprobe -r -q snd-pcmtest"))
+		ksft_print_msg("Failed to unload snd-pcmtest\n");
+}
+
 FIXTURE(pcmtest) {
 	int card;
 	snd_pcm_sw_params_t *swparams;
@@ -171,6 +188,9 @@ FIXTURE_SETUP(pcmtest) {
 		SKIP(return, "This test needs root to run!");
 
 	err = read_patterns();
+	/* nothing loads the module on its own, so ask for it */
+	if (err && !system("modprobe -q snd-pcmtest"))
+		err = read_patterns();
 	if (err)
 		SKIP(return, "Can't read patterns. Probably, module isn't loaded");
 
-- 
2.43.0

