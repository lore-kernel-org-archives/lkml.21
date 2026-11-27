Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792423;
	b=ZtYYwXz32hzcxnoAHyGMMapoIe1sU0xGyIZIZWARd/eisVFI1aWAsBktAQM2/0LHlSsP
	 F/YtFPaVWKbM1ym3Pji+s7z+wZbD/kECtx69Y7TSgmGz3KaD9iLLpXTErT1mdicehEsoE
	 l1Gz3y5nIcC/xtLka2uRksjP8uAQoFG94rC7MpeA3G40q+GyVfonuK7MYT/A5Evd0Zrjy
	 bMejt11McmpKFZoNdbxycAY1w3fygN8VifzbOdkSBS6swTUUkJvnrLSM0O4O7XX50ayOz
	 X51kzZEiBO811ar9jJ13bslk67fWifNhuVY1Ju1PmveUkL975QJl1+LsH6Kf8JSlApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=A7NcaP6FDZ+XY+/FocjZD2VG21QQhrjTLgCEJNn9mRo=;
	b=Mw4ar41c4BSN06/LoVzXxIX/WHpZ3fsNuc28RlZCi7Zuf9SrLYPvVMHqCfXIed3KGuDK
	 Xd0uaeLHOfoKOn51313d2O/kv6NlKPuek+ASj5kZRE2CRF/Q2O39RFyNRywgXP1t+XXt/
	 IT930pNn5IjpRQSxngwg77f05x/tW2mRnlkJkLonAOPqsmUUtEpba+LkKZyk0NeNzNDgR
	 d/asXvOgs73wopwa+6tM84eGC82Gjo+/a0uda2JLdsmBqn5q/i3Mw87BZY3PDhBkmRUgv
	 3AFb5yJA0BEkjybzNRGzNIDOlwfPDYKc9T/4nSjTXqwEuxa8N1gGXqgjLLCst9woasA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jOzOdJIT;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F3606A68E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041F3606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jOzOdJIT
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so58100245e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795792421; x=1796397221; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7NcaP6FDZ+XY+/FocjZD2VG21QQhrjTLgCEJNn9mRo=;
        b=jOzOdJITVGSsJVdQDT58zLr/mtr6JJAosTtEUOVJnhMXcwsnu80Tv192UiNieQstE4
         nwld3BlCEtabX2ngmKRX7CNc/IZ80yDw4DbL+3DAzrnjKoYPudwiNYD8u3Ge2+CtUfix
         15iuFlB7w+vRd2V300mxA4FsZBuycwehT9nEemFDyuleA4DQ8nHxUSNel4EtZTsiMJXI
         QV0CVEEYWH1CF29SOwK4/G/lzP91FJV4rbI5trb5YnnE0DGsTlFIdwlTU27Q7z1XmRzB
         HEYqrti539I6m1g8m8x0s5B3lx+mqD3xL/CqUaoG5ILnvaygQNuh2PTSAd0cmkkc6O7u
         dfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792421; x=1796397221;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7NcaP6FDZ+XY+/FocjZD2VG21QQhrjTLgCEJNn9mRo=;
        b=s7Ui2Vm66iWOCl2t7NQ9Z0qFHu43KFi/M3HNfLzt6rfyz9n9txQbTW+mZ0zI47orA7
         RdAXwzOYZgqPtxfJZCxDJfP5aPBAXf7Ly5bxqJ1CSoKEDLOB1dn4OMmAiuK51lMzSfeg
         4gQM/jL0uIfk/q1O7MApbbusg9H5o9JSkU0yPUTrxPj3zcKtS+miHjnSFs03Cxb5ZNqt
         7tRJwAUcAEU6EEbtVPWwPfJOigUS7ibTUviPuix3NyQf8P1N/0Aqr36E6LV5buOjN+XJ
         ecD7AM8rwprjzMs4F4A6MSx7F3qKDH73EaQrhDXwiyo6OOQLHvYBLMypUnt3iGNbCes3
         Tplg==
X-Forwarded-Encrypted: i=1; AL+hErHrT5R6ZIoxBVPmpJ1/8DykCihlmoFNJccbqAG+LdiuueugfWcVplDc3VdKqCAJv+AdA3CmX0D+F3StHCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QgWncTW390gmccKu1gN/6UgBv81XT5L0vvf5czmXBUp7+yNzp
	9CKbv/XilPk/MG4ok4psO3z/JgVku3iL8dPkWvUdGgezivTiL4WiiqIdZxHiTkoYhlAXevwwn3L
	DwRDRxl4J/fwPdCngMoQZAA==
X-Received: from wmcn11.prod.google.com ([2002:a05:600c:c0cb:b0:4a1:d8be:ba51])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr494342265e9.2.1795792421059;
 Fri, 27 Nov 2026 07:13:41 -0800 (PST)
Date: Fri, 27 Nov 2026 15:13:25 +0000
In-Reply-To: <20261127151326.515232-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127151326.515232-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127151326.515232-4-vdonnefort@google.com>
Subject: [PATCH v2 3/3] ring-buffer: Use kvmalloc for ring_buffer_iter::event
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The maximum size for an event corresponds to the capacity of a single
ring-buffer sub-buffer, which can span multiple pages and fail
contiguous allocations under memory fragmentation.

Switch it to kvmalloc() to fall back to vmalloc under memory pressure,
keeping kmalloc() when blocking is disallowed.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index bcff4c12680f..c543c200f769 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6517,7 +6517,8 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 
 	/* Holds the entire event: data and meta data. */
 	iter->event_size = rb_page_capacity(READ_ONCE(cpu_buffer->reader_page));
-	iter->event = kmalloc(iter->event_size, flags);
+	iter->event = gfpflags_allow_blocking(flags) ?
+		kvmalloc(iter->event_size, flags) : kmalloc(iter->event_size, flags);
 	if (!iter->event) {
 		atomic_dec(&cpu_buffer->resize_disabled);
 		return NULL;
@@ -6548,7 +6549,7 @@ ring_buffer_read_finish(struct ring_buffer_iter *iter)
 	rb_check_pages(cpu_buffer);
 
 	atomic_dec(&cpu_buffer->resize_disabled);
-	kfree(iter->event);
+	kvfree(iter->event);
 	kfree(iter);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_read_finish);
-- 
2.56.1.839.g22a8290db9-goog

