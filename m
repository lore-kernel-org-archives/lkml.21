Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792422;
	b=SudBSuE6sfST3Hoax2sag6fGXNC+lyMighav67vIEnNWnDECRsIs90pWm/8wneYOMuKR
	 oIkrp5801Iepk58OS98ln5ZJ8wXy5HLn5VGzIjTP0qNjY0zuefqVMM5Ty2vQDJBGpa3pH
	 0nB0WPJM3jPtoi//rsLUdGDbqmPuiY4sQNJ6mqpty69h/Zgh4UwF3R4wjJES0kyEcPejj
	 2CwrypRfiRJ2UfHvZSehsEIXGovxxBWmTEdfO0gbySaS1GMMs0TR99ssytkZZji6BnlGf
	 qnfwN836CktKqwDKPopTs3zV3dzvMSsQU5YSmebSPwfeH+PF8nGLM4OhUtiFuXa4AaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QUdvWncd1Nex597ohZHTKVDevRK+Yf/5v5Q8NnQr0js=;
	b=4BWT3bf8LujVV4lUAhE+wy2j5WDzRNpusMhUmWYDp1PzcH85XSRz7AeOJM0U6eT4Goji
	 NEFFyx+PFQXYTekL8aPYbbEH/bjB2Hl7uRk8+QjzNcswGf9GhCavPA9LcDP7OPQY7LFbW
	 8V+jIBjfsMfUbFKFjT8bPXcPtp92wTSmyfxEzRl4vbn1vHJQF2A+OIFeWNfrq9rtJ35Yr
	 uYoRpKSaMNjyMo2ffa4Ff0rCPQlLFOC8ANKwmgEOfd8ZN9vLo5FKcjEb+IdxAPn+0FQqj
	 r/+IoDqgUHcQTcPq0nc5cHJSHcRG6pzHYS/K7FgZnazZ7ueOHvrygsSrO5v+/Re9Eug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=owbioq6l;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA43606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA43606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=owbioq6l
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a4654add56so55854695e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795792420; x=1796397220; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUdvWncd1Nex597ohZHTKVDevRK+Yf/5v5Q8NnQr0js=;
        b=owbioq6lUez30mE7kW8oE/u7H6q7faOAWCb6bxACFOybBMA3fSqWqBUFHz1WQLscPm
         OtedwXRiMLejupAN/SaX9+pheYGaPJJGictLwkQuE1pEILNusf6+96oMNZMBEKleHzPN
         MUP7Wy6S9aJRPFPLlAl/ZhO+NIrYAahBntZU8WmCAXmJBDKIhqEF0bzPz7teh7QEKfnu
         rYmv2kKryfQ7T/Hke3cp8VT98CrgkzC5uriZWIe2ZPD/PFHz9JTrAWh7jv2XSR3EjgUk
         sR8hgXZlXqIeYZptYQTSkiShp503O0jIzqupUg3QQ3BwjFLpcvjjfYwXeIOwubUdTEFw
         iJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792420; x=1796397220;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUdvWncd1Nex597ohZHTKVDevRK+Yf/5v5Q8NnQr0js=;
        b=tYyZ8ZIsk+ehzwQxw5hvONXdMwOt/lOmnarzGIdmJzACaSg8ara6L8AqekPNnUx4yN
         5SVZoMI7WTY20QWJD2KQHEK9727ZuQXKYSrdYqy4DGUVAJgsYoPkSCG6wqeMMdZATZSH
         rbku3hXZWOpi4X8wQ1TaGsnyfZHwit5e2FWhwteAtv0+3wvhWswhQ76Ag/ZzN3WcSu4j
         wnzSqBxtKmjUG1+mQP8ATcCh04oVbQs2Ff2rV3WyS2Lg088yaym2N1OouSgNf+qVq9Cq
         IxuixQMKOnxsaWd9UcVoc8BD4POHFivaeYaCLrDk5VSycLPhhflEQQGGu7VEhiqlyw2d
         Hrnw==
X-Forwarded-Encrypted: i=1; AL+hErFHyZzqh9sK4vGYqbXlBwdo+yD67ASXvxJnBhnptVDWA9Khmt6d0ys/vF1gYsxQ4lMrdhdguyn9teaJHuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gSTEj9inBO1TE2jIq+LVbjtppWfiCtgVyr7XLapwEFhsvx54+
	WQUFuptUPIq/9aR46SuhdV9ojBh7Zfhjk7rNiBaEi1w3CfVIfhpwrF473DqYh4RFUiFCMolsqHD
	OoVp/8YrjExzNVngTaXCntg==
X-Received: from wmxt6-n1.prod.google.com ([2002:a05:600d:8646:10b0:4bb:6c3d:a4ef])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr475821795e9.7.1795792420044;
 Fri, 27 Nov 2026 07:13:40 -0800 (PST)
Date: Fri, 27 Nov 2026 15:13:24 +0000
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
Message-ID: <20261127151326.515232-3-vdonnefort@google.com>
Subject: [PATCH v2 2/3] ring-buffer: Use kvzalloc_objs for remote buffer subbuf_ids
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Creating a remote ring buffer requires allocating an array of struct
buffer_page *. For large ring buffers, this contiguous allocation can
fail under memory fragmentation.

Switch it to kvzalloc_objs() to use the vmalloc fallback under memory
pressure.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 484fb1c08682..bcff4c12680f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2638,8 +2638,8 @@ rb_allocate_cpu_buffer(struct trace_buffer *buffer, unsigned long nr_pages, int
 		cpu_buffer->remote = buffer->remote;
 		cpu_buffer->meta_page = (struct trace_buffer_meta *)(void *)desc->meta_va;
 		cpu_buffer->nr_pages = nr_pages;
-		cpu_buffer->subbuf_ids = kzalloc_objs(*cpu_buffer->subbuf_ids,
-						      cpu_buffer->nr_pages + 1);
+		cpu_buffer->subbuf_ids = kvzalloc_objs(*cpu_buffer->subbuf_ids,
+						       cpu_buffer->nr_pages + 1);
 		if (!cpu_buffer->subbuf_ids)
 			goto fail_free_reader;
 
@@ -2699,7 +2699,7 @@ rb_allocate_cpu_buffer(struct trace_buffer *buffer, unsigned long nr_pages, int
 	return_ptr(cpu_buffer);
 
  fail_free_reader:
-	kfree(cpu_buffer->subbuf_ids);
+	kvfree(cpu_buffer->subbuf_ids);
 	free_buffer_page(cpu_buffer->reader_page);
 
 	return NULL;
@@ -2712,8 +2712,8 @@ static void rb_free_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
 
 	irq_work_sync(&cpu_buffer->irq_work.work);
 
-	if (cpu_buffer->remote)
-		kfree(cpu_buffer->subbuf_ids);
+	kvfree(cpu_buffer->subbuf_ids);
+	cpu_buffer->subbuf_ids = NULL;
 
 	free_buffer_page(cpu_buffer->reader_page);
 
-- 
2.56.1.839.g22a8290db9-goog

