Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534170;
	b=DLZvb1I0CNxdJL+MftrjTVlExUNOMneK9cD0hxatnTGutK15HzVAQSrD0J/qJwfdbv9A
	 tsVLfrRzpW5+IXyUVCRGv6/2wAkYMQ+pengO/LP4LTtFxxqoCnVjDUA0getrhMZLn57+J
	 dU9a/kgRuw0kve5OoAXY0uEzoh3jwcLTgadX0wJpPk0/DAhSyknUnrs3fwaVEESOfP1kk
	 VTaws4f5cZ1AxOmH1cPbpurNaIq9KZm4ve6/37fTtOKb0XXmz3bk0cC+l8YGTR8fahLyI
	 ch6nHBt9oE8h4io5cNrOBVaLO8BKdyZrCEaKBXFnGbBZT02628vdamExexFvGkgmeFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CtGiWyJqdsDfW25/kKrYUtQQXV4c5pNEpPrlJDPGzlc=;
	b=uG92MoZKSy9sRUa+90GjdO694TTJa/oVes3NFP2Zk5PbgbFXnotzQuxBr1HGAzH5BwFR
	 tAqaYDpRtusqOCMYqiMtIV2jAjtflmE3Yf1C5zeFI1yYyh9h6MOYcA1FQrQj8/1yvy5Yu
	 6HhnEP7YGV9ie/eLQgsjilL9r5YxnObpEj6l8GRJezxp3sFA7EpSeo8ZOw7pWxXIM25CM
	 jZUir8uHCzPhdu5QyICv8oVjLg4i3I/gXCFIdb7lAuspUqA6nlgJD3FzKUV+F0/m/xwnW
	 BbCe+1UrCtMgl05QHai7vWHT2Cax0albUX3TQZRARDRtiUBqXDRwxS9OHQQChwWfmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VdfCctRO;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07160A2614
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C07160A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VdfCctRO
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490d2ac331bso4088028f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534169; x=1796138969; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtGiWyJqdsDfW25/kKrYUtQQXV4c5pNEpPrlJDPGzlc=;
        b=VdfCctROFBof7wQDQIkz9UFLUBHf50vhZUezaBVpyjwertM6RA7INHAfO/+PY3xUJ3
         V7YBAZ5+22ibaSJXmf6laqRLI2XlSvBgT71h6LTCdPAcwNyn4T7aMgNFZN5WZjpheeiF
         Y3Ww79UL8XhKKHJKS5OaT3zQKeX5QlSkOpwF7HElatoz2LBciHw8yjXTqXDsoDAxytYj
         X5xjvF2nBE5ScsKTvKmi3X/HDpd8lX/yuhHvy5CySYNERyOAJbRfHjcJQe5Z1jFGE1vm
         6J/k7pkcI2VPJBCDBfXTBLixKjCJKdR6B3UWIoWpF1NPGuXa/FWIwHMiL1MovtIuw5Us
         m76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534169; x=1796138969;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtGiWyJqdsDfW25/kKrYUtQQXV4c5pNEpPrlJDPGzlc=;
        b=YCxeUT+heHZ5fwnyzRQZGtvNx1PzPWgBRjGYnmerhkvLT7CZ0XWrdOIoc4j2efhPRI
         KTKkOVHnZOYzdFxvuvvIYkvxys9phabEgVQ2q/Lh21ObZZMiqzDAcFnafUEMF3dKTT+D
         VSKL9FZE9Y1apkaa1K47UiJPWswE8mMOTGLDpUz/mZDQB0zgW6x10sCisD/2PR86g3kF
         k9iUsjfbkUB6M5hMXZa+y03Pfo9gCOVmxnx3iuWcLKzNr5AZSmet9Fm94/r2VdbtfVC/
         QWG0Y4dkgzP5UpBi5xc0K/MmFP0W7515x3cU+r1GK1TfwsNojVOx7ZfXrKkl49HL+gjn
         R8RA==
X-Forwarded-Encrypted: i=1; AL+hErGq5I39nq6PZOPCcPM1MlVmiiNr5+CEuJqMBOo3kUkvFxu6RIKxVCmujoVgsuM/Eeac3GXdkOBTV0rkrxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gpfqslqxTjBS5uKatozPTjN2EV1bv8eY2j9PFsXvGWbmvkE01
	os3OsE6eH+zVCxTv2HKkz9u2ge46jAnLSvs7DzxMzMe3k1284yM+hYouTeV3QJXssubAQdLrgij
	mMsPTu5BeVpcDOIU3AqYopQ==
X-Received: from wmjy5.prod.google.com ([2002:a7b:cd85:0:b0:4bb:6476:9406])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id 5b1f17b1804b1-4bb8e958ce4mr202525055e9.23.1795534168529;
 Tue, 24 Nov 2026 07:29:28 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:35 +0000
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
Message-ID: <20261124152845.2233401-12-vdonnefort@google.com>
Subject: [PATCH v9 11/21] ring-buffer: Use irqsave for the reader lock in ring_buffer_poll_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Calling rb_wakeups with the reader lock held but interrupts enabled can
lead to a deadlock: the irq_work might run on the same CPU, but will
block when acquiring that very same reader spinlock.

First, rb_wakeups does not even need to be called under the reader lock.
Move the function outside of the reader lock scope.

Second, the reader lock must be acquired with IRQs disabled anyway. Use
the irqsave variant of the spinlock.

Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260602171146.2238998-1-vdonnefort%40google.com # patch 8
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 554013a189b9..928fdd4718ea 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6928,14 +6928,19 @@ int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 	struct ring_buffer_per_cpu *cpu_buffer;
 
 	if (cpu != RING_BUFFER_ALL_CPUS) {
+		bool wakeup;
+
 		if (!cpumask_test_cpu(cpu, buffer->cpumask))
 			return -EINVAL;
 
 		cpu_buffer = buffer->buffers[cpu];
 
-		guard(raw_spinlock)(&cpu_buffer->reader_lock);
-		rb_read_remote_meta_page(cpu_buffer);
-		if (rb_num_of_entries(cpu_buffer))
+		scoped_guard(raw_spinlock_irqsave, &cpu_buffer->reader_lock) {
+			rb_read_remote_meta_page(cpu_buffer);
+			wakeup = rb_num_of_entries(cpu_buffer);
+		}
+
+		if (wakeup)
 			rb_wakeups(buffer, cpu_buffer);
 
 		return 0;
@@ -6950,7 +6955,7 @@ int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 	for_each_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
 
-		guard(raw_spinlock)(&cpu_buffer->reader_lock);
+		guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock);
 		rb_read_remote_meta_page(cpu_buffer);
 	}
 
-- 
2.56.1.809.ga0b61035b5-goog

