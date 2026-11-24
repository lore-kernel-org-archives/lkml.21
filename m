Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534175;
	b=g0bK6Si3KyYIGCJtLwl/7KN+yN0mnAS6aOxTUHGvxk4zJdz4gS/qr9qWZYd7+Zf57Ml3
	 aDP5SiSSTkECBKbzUaY3a9WnB87Ry5bkw8VLIk2zxfGXBJzOc2yQnbsi4ktM4g181hdWQ
	 VkMOntEPJ2QPWYKt0Qv9tVf2cN0wCCHu0de0+p10mrlm4NoaBy2EMUEN0xP7EUS7kyaJS
	 /IUozGM917pa8bNZb1Y60kr3z3+LGpHRdDk1qOHaIYeA4gSpIseVEPz9Zhl8SGmf9yCex
	 KU+QHbt1jz40z31ouDlQV57nzdHQaY4NG0Zebq9aR27GfGU1gDwecaeM78TNeFFEBJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=no3TwPGFG1MxOrMJHLzWszxB/ksmfixALujtZxX0S44=;
	b=tPT4qFskkaJb7riaGYSq5zMgp7K1ilPuA3Li/fPuG0N5MkcPNFD96WsT8rw4H8AMVeLr
	 iZjwkQKj2wVYIPh/qQwlJH6QpVHbgR+MKIw3a4TCCmrnrM6+Di6a/VP/i4z4hoqLLDzhJ
	 RQjZo5Utj8BcIL0GmklqZn0lBgH3Xik75INTVqm+EfLtNd39+U2M7Dj4QBSYZgn7yElHw
	 Mz4+08i+QXPkF4Xc37m8xg76GCED066hc8uBod74Xa8N3IFrPtQzhNd3B194qIDtj1aSa
	 ri3Kzadc6Hs5Z5N8CFIOa4HpS/YAfE8sRe/df/Wy3x8CSsvqB1rBXrSBxHVgZ4zBxzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eMbKAB7j;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142F560A3815
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 142F560A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eMbKAB7j
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49febef74e3so39420455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534173; x=1796138973; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=no3TwPGFG1MxOrMJHLzWszxB/ksmfixALujtZxX0S44=;
        b=eMbKAB7jkcVpM+GkrKCRY0IoSMH9fabXB1aZjeepFzGopapSu+UVZuRvl4SFY/ux9I
         4bU+vzTMFjGnmsKnX4t9jkfQjRtVBiHCNA0b5/E15MO95Euoki6Vh1Byn9HDvg5p6XnZ
         cJFh19iQm8QPLvMJlpdZ/741v6vQRF828blOSfg6zaeOb6/2v0/O4McUVqbxjN1MiDMl
         SDUoyq44edM6NxKzegmadM4SD45sSF7whHgDznv2TzAdHO0WaJz6dUNZ83BaRhXBLmBj
         LFXVB7qZ3WKGnDpYhU+5KGucthy8cEDM/ojPo3hfmfPhiJTLoxwSv0FY7kxKGgabdCV6
         r5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534173; x=1796138973;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=no3TwPGFG1MxOrMJHLzWszxB/ksmfixALujtZxX0S44=;
        b=Y2noo5D9J9j3iZYb4+maM3/T+f0DL8x+/7SQbYJGjfULBQS6jcbE32DDlPqOCqf5Br
         UBAIiH3sKn+/D6PJqRs9Qg4MPVlvgFIrCnVyzYz8hLw1qUAELtsHQq5hx21iEja3IajN
         WkVUg2YASKqh5qdrAilTSqssOkphUBQx8gh3/DoChTevLFK6qYtuE1H/Q76Yzl3GsO3E
         u97sihlUrbMGJYyGLrgcRqvkyQDEjYW6jneVxPVsYnRoj7f7Bbkgsg9oxzshTE2Be966
         c6a0cwChQFVIfBP49TyFRN6W5bX85DdxVn0yVvGCvOfRjgwbLORP+68n9ONGj/0J/5fU
         sOTA==
X-Forwarded-Encrypted: i=1; AL+hErGRER2RuJdUs4TMW5mqepg0XwWZkmGG/84Fwv8OtRv1xP5vcfW12v/nzzI9GnykGXTVu7sje1KvQ5SHCCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tC+3Dd3Y3b3hADr9y1pqFYMDUavhX+ry4RXT3W+XOYjwdTQ+9
	G7ORvuQY8TnfZhyNAgXq5RnEiqTZPCQwoz+H4l/0moRnLKV6uHZVk2JAWxmWZkkZ7Nu2CsKtPMO
	Rsjfk5kG+OUBOurZVxyhHWQ==
X-Received: from wrxg18.prod.google.com ([2002:a05:6000:1192:b0:49e:4855:28f6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2d42:b0:4ba:7a0:7b67 with SMTP id 5b1f17b1804b1-4bb8613a0b1mr234995995e9.3.1795534173080;
 Tue, 24 Nov 2026 07:29:33 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:39 +0000
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
Message-ID: <20261124152845.2233401-16-vdonnefort@google.com>
Subject: [PATCH v9 15/21] tracing/remotes: Use ring_buffer_capacity() in trace_remote_has_cpu()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

trace_remote_has_cpu() calls ring_buffer_poll_remote() only to check if
a CPU is in the trace_buffer cpumask, needlessly polling the meta-page
and waking up readers. Use ring_buffer_capacity() instead to check CPU
membership without taking reader_lock or triggering wakeups.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index f23d3386da29..3926871924bd 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -351,7 +351,7 @@ static bool trace_remote_has_cpu(struct trace_remote *remote, int cpu)
 	if (cpu == RING_BUFFER_ALL_CPUS)
 		return true;
 
-	return ring_buffer_poll_remote(remote->trace_buffer, cpu) == 0;
+	return ring_buffer_capacity(remote->trace_buffer, cpu) > 0;
 }
 
 static void __free_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
-- 
2.56.1.809.ga0b61035b5-goog

