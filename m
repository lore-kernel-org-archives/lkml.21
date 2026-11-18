Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009156;
	b=dFs3pi1ProZ3YD4hF35Q9KxCUJUDEVV72Rj3EEfpvbRDCc9ONdMX8jbMTIPtjU3E+dbe
	 FfqVxDWgdUtdcyvjfx/DLAZmFV6d6UxGCqRmDGiDmaIp9jaqvQA1H7fKLUASDYW/hpeQl
	 5fnjm2rTTegrxXFGAewDuivq5FZN6DoqZLOwQ3a7fPGKfPJQQgvOtFRC/vDorbEUY8Y7G
	 wp/zgImtq0psLbsXLWH70YI+/eov1FcGTBacGVWePmZsvBGLx/cOVHbA/ZBUAqBHB7laQ
	 /wrOzckV/5QtDbZR/oo8+ejiRXgXYgrpP1Agm/7gXDMVv+SnumGgimAu7Iwvv3fQfEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009156;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=RCpbxizLrzhcT2RYtuSsJfcUIaP6PszPqxNORoq4BKs=;
	b=1v0HzVyFuK5AD0tbLTi/haAzm8PiiAJA2w4OOZ8Cig4KhiSKhZcGT6wSW0LZ4H0PWTKn
	 c9JKetvOvQfz9ybIhQ4vDelO0XWk2Huxd+Qwfv0wRim+rFmHzihiKLQ0RnKNUty8qEfpy
	 pLwQkIyfZiD9p7geVeACX81D6B6iF/npx3WC0o6svxA12YNqddv5FgT80eMYyI3tlaiT9
	 kQFq+xa4E142DzqvGi0dfZmPti5uBMbQam2H/t82YhzIbT/OagXrtsl/wFlDLXp57M5OL
	 doaI+oatnC/SOilcKSzGGF5ztweSlQtkITri92Pynmxk2Nwz9gjd+fK9N3HBtkoEgPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AAbq5Ce6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KqhDvb1p;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96A606A320;
	Wed, 18 Nov 2026 13:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED96A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AAbq5Ce6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KqhDvb1p
Date: Wed, 18 Nov 2026 13:39:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009153;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCpbxizLrzhcT2RYtuSsJfcUIaP6PszPqxNORoq4BKs=;
	b=AAbq5Ce6ztby255F4+kGBfMXqv/cslehVcdMk0xeNHGmGkHpOlSt9e+XIzbRFpoRlKL1La
	Gx99rrsE+V2f/LuacJtbHekM/UbpE8WmwJeKikOlV57ZAuG5/tLe/1nIzo/yV1iTSYE7Aw
	ccbU+nSn392zFSUpw7EK3XWjbHXb07rw4mQ37u0ioWP2hAyTF/ec6KG2kr6wt9KAqMnl4F
	a9ekrBQ+gh+xndFfJhXDYMr29DqvhRa8bCXub02qszTBjEbEsC3lqkcvT0U7jjOeDM6Ami
	OERgV0vzsXgYRBuY45LhzxBc8LI0v0wFTGVmGTjnM7QLbYHcgtrgk2CcQJH/tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009153;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCpbxizLrzhcT2RYtuSsJfcUIaP6PszPqxNORoq4BKs=;
	b=KqhDvb1pqNRZb2/24wDgQkIPIaq3O0N0qspv2l/CYnCMvbDyXUy0tJ9lqe5Mihr7/saMUy
	V0vtKoAlk0vCRdAw==
From: "tip-bot2 for Thorsten Blum" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel/uncore: Use sysfs_emit() in
 uncore_event_show()
Cc: Thorsten Blum <blum@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Ian Rogers <irogers@google.com>,
 Namhyung Kim <namhyung@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111164926.78234-2-blum@kernel.org>
References: <20261111164926.78234-2-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500914986.3191731.6711314209931205559.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     f16e34ff09cc4e976a303e54e9290022ac5d2db4
Gitweb:        https://git.kernel.org/tip/f16e34ff09cc4e976a303e54e9290022ac5=
d2db4
Author:        Thorsten Blum <blum@kernel.org>
AuthorDate:    Wed, 11 Nov 2026 17:49:27 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:22 +01:00

perf/x86/intel/uncore: Use sysfs_emit() in uncore_event_show()

Replace sprintf() with sysfs_emit() in uncore_event_show(). sysfs_emit()
is preferred for formatting sysfs output because it provides safer
bounds checking.

Add a terminating newline as suggested by checkpatch.

Signed-off-by: Thorsten Blum <blum@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
Link: https://patch.msgid.link/20261111164926.78234-2-blum@kernel.org
---
 arch/x86/events/intel/uncore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index b2109b3..b35a779 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/module.h>
+#include <linux/sysfs.h>
=20
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
@@ -153,7 +154,7 @@ ssize_t uncore_event_show(struct device *dev,
 {
 	struct uncore_event_desc *event =3D
 		container_of(attr, struct uncore_event_desc, attr);
-	return sprintf(buf, "%s", event->config);
+	return sysfs_emit(buf, "%s\n", event->config);
 }
=20
 struct intel_uncore_box *uncore_pmu_to_box(struct intel_uncore_pmu *pmu, int=
 cpu)
