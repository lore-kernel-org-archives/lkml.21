Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534174;
	b=sxzi0yWHbQTrUXbFtNlwrD3nE1d0OCvfugAUKBpt98FLJSllQFoTXDgkbbtk2mB9vlYo
	 YXNv/q6zWT1e8TRw1ljHzR6xCuidB+fEEuKb86KE//Ze+EGxKnUntnjiNeccTmOtjBT/C
	 57UPp9P+HFFC2ikgFnJWWpePqCf5yqnDZ3aoo6f+/kegfBpJq1tL7oXHvrfeOkNCq/JW7
	 Xe757baDak56MmOAJZcIMWA/OE/xencZBRsbFaK2B8LHsHDTn+Umi5jZfaVPvkKtIKjtl
	 mC+Qk3ENH/ZzT3Ku8Jei+nUPheSUduxI4JGeWDQG2bjX575uGqBNGxcHR3jMKMQpn/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=LoCHYzw2l3suo+jGQIj5bj47LEPtTtGO3zS1o9HP5XM=;
	b=tL8YfOD3qOG1D+wo4HL0HX2x7xRcEs3Oiy+FGx+t+e85qkuiXcJQkMJNVxmA1gveWR6T
	 YEqVYGAB98KQvFOg4AX3mWzc94l8XBoHDSkvf1Gu5sayye8HJJr34AeCLvDMfcEmKvvo5
	 G6SKxHrQmALqU/c3nzXYc2Kwq5JHP2Y2sbZwb+gVp1W9gS+DRYDWBOfGd/khAOnsUV7Vc
	 su2adN82Sb2i+eZ+e3WIb55OUx3ArTiTwWsgbWLkXUQHonWC3VL/vWXKX9U/eSYbnUDh6
	 GIMC4qaLkk3+q522MDm4hYl5L5pj3jZHbQBFOWabdh1j3HffB9vRuwIlBPDA0mlnkiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cuhkB5Kg;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108A60A2637
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E108A60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cuhkB5Kg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so28783445e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534172; x=1796138972; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoCHYzw2l3suo+jGQIj5bj47LEPtTtGO3zS1o9HP5XM=;
        b=cuhkB5Kggg4UljtubX1ljrKh4vCUUV0HgMi4UVgEzTNiB9JUVuDZfIc2WA/7lWURI8
         rhGm6ezMKAqe2BG9rr2cMOnvRrIgDIJ0SDEPnpVNUx5v7BFKYR6Q/xfPtjF60Uhy3r/Z
         IKCFoFasVbfrv8vWbJ3//80PV3pd+2H+hRw/j/7NYnmP+sIpXBM+I6oltUqZNwf++bli
         Y2jRwzzUeSGXqqL05wb4ZyU0aa7NUYxpCEjA2M8CxJBFpP9RlsYb2soVQ+dw3meIdhll
         NaJRFFfrvFFcieR2dRps8FDUvByhxkc0RMICPaqoN5n4UKh+Eb0V99ElgR3uZ50PcqVb
         6feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534172; x=1796138972;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoCHYzw2l3suo+jGQIj5bj47LEPtTtGO3zS1o9HP5XM=;
        b=nGTuoWsM37nTOhHBsGhMGNxK2/QJTcySGuGOnqVwmhlk2k+F0KrzEDms57I68FdvcH
         T7CtAOhnWAq9DEuVTuSlhoeZqp6eqo52rpYIM+Dl0CuWI9/rjytMEPQ1JkX35lv7QHYs
         OgE58FM6P6CButGT8M2OWQe1WubGtYf8Mhlbt3th5w+pNknLDcVaGt+ySSzdvSIMtkJr
         IUCCg6jhBhYjlbqVzRgDRpeHXI8qSD/EJ4xfWKvR02u9DGN90zEF24vQsCSx5e1xoBF9
         93LVVNwuEXBXNS378gYrEe4275Iua2m+ad9gFQ+DxfUIjIBTSbdPXrJE9hsO6OwqZ7Ed
         fs1A==
X-Forwarded-Encrypted: i=1; AL+hErHRb7sDo67TWe2R5nJJB8WTEuMtdl4jo1pb5v71k19/IED4YdRv/+QC2BND2gh5CI/22JWaVQABpA630v8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y3c4JckN6VeB6/QvOskHUGLLfbWG2qIFUkYzD03nNJYl3FE5p
	V5ifc7+6DQPSte2c33/NEzrIf86bXaY19y1EQJvbQonT2CiPtKXRQrMCGSmRLmwwqiYd72UiW8G
	smTZJE+sc8mSOYp4MI5/VDA==
X-Received: from wmg25.prod.google.com ([2002:a05:600c:22d9:b0:4b6:4096:72ad])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr325571055e9.19.1795534172141;
 Tue, 24 Nov 2026 07:29:32 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:38 +0000
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
Message-ID: <20261124152845.2233401-15-vdonnefort@google.com>
Subject: [PATCH v9 14/21] ring-buffer: Add kerneldoc for ring_buffer_poll_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Document ring_buffer_poll_remote().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index f517bc651e84..33d962f9d8cd 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6936,6 +6936,17 @@ bool ring_buffer_empty_cpu(struct trace_buffer *buffer, int cpu)
 }
 EXPORT_SYMBOL_GPL(ring_buffer_empty_cpu);
 
+/**
+ * ring_buffer_poll_remote - poll a remote ring buffer for new data
+ * @buffer: The ring buffer
+ * @cpu: The CPU buffer to poll (or RING_BUFFER_ALL_CPUS)
+ *
+ * This function polls the specified remote CPU buffer (or all of them)
+ * by reading its meta page to update the local reader's view. If new
+ * entries are detected, it triggers wakeups for any waiting readers.
+ * Returns:
+ *  0 on success, or -EINVAL if the CPU is not in the buffer's cpumask.
+ */
 int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-- 
2.56.1.809.ga0b61035b5-goog

