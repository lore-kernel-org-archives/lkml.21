Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534171;
	b=VT9Ew6MQ+zQ2C7IP+Pft1LtzoPGbhZxA9tcOvgPvGQ1MmV1oodUHk7cVlTZ6mH1Vq2VW
	 twFcoDvT1gVFcajSKOl2R01qeta18m83Iom7mUCu40k0uowwwDPRWQjf1qQGhyZYAYSsh
	 b0vBWiMX3VEXy0UabCe+0gIlsmo0Y1LaKQaB6cwvbi54QciiGLjKofDm7mbgL3srfQId5
	 QDaoAUKkTYMvpl+PuPJm8pqlKTyRy3sShdddJIt5UIicwbRwuGkiSXLM4QI2KXMh6zzH5
	 rRh5nwlT0b89Ms99+SLajZ1uJJwMWLflQzS48nMH6lZ0m1HC9fAl+/1wyuzUDfyUU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pIZqHCS9uMGA/JN3ND+wWAQA7pc+psBTl5VMPUonuyw=;
	b=xfXNjg+N8XNgShcoNnvvewZSCIHMZSlMoHuYFUY2UmNRAyoMWwqmnGFgNl3WPZ38ivdH
	 ev+DRiNgXVeOPD94SfgYCLq6dP0zusHkA6OfHREHU0oeyigFqJIbwIGcu1vbW2r3IeL1f
	 9qo1IUW/w1DJkgJKnN8bZZioQjO1Id4z69v5jS0lFZykhEkIyRccM82TEyBTORzL6rq7k
	 Dzc57NRtM8JZS+cui4gCYD5TuJDGUwYDItwlZ4Lu4gP3jubqMAhWyF+URiz3ojljs9jxV
	 AkAPb0K0Ka4xLuMRJHeft6muJDKyOzRtVUXbHgTwvk7/SBTSd67seRuKDNUe3kF6YdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cTQKgVGh;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5A606A692
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C5A606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cTQKgVGh
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso36197375e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534170; x=1796138970; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIZqHCS9uMGA/JN3ND+wWAQA7pc+psBTl5VMPUonuyw=;
        b=cTQKgVGhtoXxnPlZ/YExWGY0uWxQfuIvF9e/WL9/yFg8ZNF8rhxZf6dLD/oJs3e+fU
         g7QTQbdht5LGFTT+MoMom498LzipJ2ZipT8Sb/ZltPcMORc7r2Ql5izvmiSnoy7UGiE6
         mcY89wBKlsquROfRW6wTHaAxmgekN0gHZcrvqNHr05otd2LnIDPZxK5b822d+k+Au0pR
         vSzhn9fGIGpvYVdDNQKXMmFUdFWfvKE0h/IkBDboKugpsQLnYrPLIYaqKVaz7wzJMv1l
         ImkKik59G74c+ubuNXNcognhAdutupbuyL2OFBDXlTXShj7NxVuNfOAdzX/upwwGYvyW
         YyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534170; x=1796138970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIZqHCS9uMGA/JN3ND+wWAQA7pc+psBTl5VMPUonuyw=;
        b=t2iimm+8JZzX8evGUGhCSs/RCwQ8feLFMSNFrf1b8+HEf7lsWmovuE+qwOwVGvm/M5
         Mq6PlB8D7wt97HR3X8MgXHYKHQ6oaJdf/cwOw79gS5y0shjHjh3HpuFJ9kuz6InYTJXz
         KTFAUQU11FwSbQ27Ahem42olbGvJNxZ6sb1ZQR4HJag8zDke5mCE+V/f+L6jk5j6TkTC
         1VWbnMRxFODVCk4bWXOTW19uIPhuaAKDwp643WXdwyJJqI7YCvy8S1CfwOvChspUh6fC
         rCsSAPa443wF1XmTtYg5fSzHLH8cECZT87OkYYEWV+ausoGNseuS57ibGnnpguFxl6+e
         LrWw==
X-Forwarded-Encrypted: i=1; AL+hErGhecOdgD0URHNsqEIaCXgQ+lEfgCqX1A3aArxtLhqQ9udN99nrN5QxVD6X8fwaoKWpS3CTYuMluzPCQbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z95yqiIAaFXaornf2UefC5y6tWWGwEjWhp6fEESPtfZbHLYoK+L
	NZ1QOZZg6Qe+49VcqcjcKWQmLGiRWwkxfFzAmI8xNUaln5Z4JnkTETpJ2qT/3Cn2RCxUzvwSDvF
	ng6qJwbKhCUF5LmZUc7ut2g==
X-Received: from wmlc16.prod.google.com ([2002:a7b:c850:0:b0:4b6:b851:c655])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr315561905e9.1.1795534169555;
 Tue, 24 Nov 2026 07:29:29 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:36 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-13-vdonnefort@google.com>
Subject: [PATCH v9 12/21] ring-buffer: Avoid reader_lock deadlock during panic
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Although reader_lock is taken with IRQs disabled, panic shutdown can
stop CPUs with NMIs (most likely if the first attempt with maskable
interrupts failed). Those NMIs may stop a CPU while it holds the
reader_lock. Use trylock when panic_on_this_cpu() just like in_nmi().

Fixes: 289a5a25c5d0 ("ring-buffer: Give NMIs a chance to lock the reader_lock")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-trace-kernel/20260924151509.23AEE1F000FF@smtp.kernel.org/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 928fdd4718ea..42507e97291f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -22,6 +22,7 @@
 #include <linux/kthread.h>	/* for self test */
 #include <linux/module.h>
 #include <linux/percpu.h>
+#include <linux/panic.h>
 #include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -6323,7 +6324,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_iter_peek);
 
 static inline bool rb_reader_lock(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	if (likely(!in_nmi())) {
+	if (likely(!in_nmi() && !panic_on_this_cpu())) {
 		raw_spin_lock(&cpu_buffer->reader_lock);
 		return true;
 	}
-- 
2.56.1.809.ga0b61035b5-goog

