Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534165;
	b=zuThhtgxarmyehpil/KSDFoSOY6J5gtiCGDAJLzQsV946NA8DilIBPJ5r48xDprRzoyI
	 kjyPmaA999+1itBQw6/ZvjDKjOuCd0OWkzx80yGonXV3aqY61FGLJotYVSPCbhSCVyNFN
	 Kdv5WVGRqmLZnpqVHaRyzvJS3sMRuPoUkVOdYkVOqNm1Rz0Ibh0ZeHH6cZ0h0ltgqVHvi
	 mZHs2RkSz2OJLvzDVu5IOJke1F8ekzRZLgBhxS0WUhhE+37GeePePY7RFXgRTr7LtdXJE
	 AhbDcoTkrWjliKQtv/Ni1/6dsXNxL2+ckVcxWoFpqZiuKK1gGvhxaSi4GIQfe7JYZBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2vr5uS3yighLuzeuugSk5dZHM33++LIDg2lx/ucfIpU=;
	b=GbgIzzDLRDaKd+kTO167bIxntjH6vy25OrqYXsMYTNY3LA6JfRKGmj2DBiS8AgNZ8fjV
	 vMXDGXKcQ3wMrBF8U/3OeFm7FZWocm3ATznrQYiH4uhnwQkzqbVVLItk0vn6hZ8bbGBId
	 2+tDZaaG6bwrC8G6E5YnArfxp2HPBT0GPE+EE05Z3loTl7bSJ2QE0Cip3RNFvaP0JRXTM
	 NJFHoCKKr97iPSowTSnmlGOdQwkE0MrV50FY3PQtABqze01cDRE42CxBpvMOhv8Pplim8
	 QRZ07HEWFOZvIVFrYH1ms4/GTR2+cFYOBpao7WW9mLjr5hkCabILbzORWLhx/rL+36w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RvE+W7nP;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655A606A6AB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4655A606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RvE+W7nP
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso24364125e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534164; x=1796138964; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vr5uS3yighLuzeuugSk5dZHM33++LIDg2lx/ucfIpU=;
        b=RvE+W7nPfJ5BCc1xURpGsHdusHvo0G6LmfioaXr5qFQTi57+2HKShaIqzln7CmWClw
         Tx7eO2U931z2iHp0fTqEvnybth6X5JQiOADwvBZBN9VrVlvM+4pxUBRa6bC6eOi7FHCO
         7dQkTW0n+n9Rp5EgFy4U7MTWK6j3w2MHCM/LiBNKaFNXu30g55xk+p4ClxCHLZQnsiLZ
         /nUAUWLfZvwU9QdMJzRpcEniJWMgt7kFLR/W9ZcsinZDNs2NMEZ0QS/Fq75j4/jIE5kg
         nD458P2rnHoujP5XROyymKpzYPrNqvsxJ8wG+zXcdX5ehtF8ihDEGfpEHkabClVrNUSS
         XsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534164; x=1796138964;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vr5uS3yighLuzeuugSk5dZHM33++LIDg2lx/ucfIpU=;
        b=SMjOYuJAJbkwVYs0BbiTMwAgDcLMf7rEPH1to74JzRp0rEw6brq6PGLg9JDQ3Ulr+T
         v4lk5zTcmngQeNKEppHu9Z+LC6IOxm3PYs3fSZsb50lrXoCQ1lijF2fWy8PkNnsUh8Tx
         q/hXFYMosYbbZ0nIgO/7uMGE5IoDSPOWI5a6h73YEuJflOkBKzdlznNM+ZLGEpNcUrHp
         UBfRXbejzu1A1egl6BlWA2PWTZ0ELERCN5U69O8nyREnq36veKmtOKNaQyR/1UYzu9a/
         wI3Z+rKUwtSuuOoV2n8T70ugVBpSe6C9aoQY4ZroLCRU0x8XZ/QQiWEOWMeAqTZLLYr/
         +g0A==
X-Forwarded-Encrypted: i=1; AL+hErHVkzrBSEqV9THucACShGqP8DECPgrRhW94CW63uzJsJUn7+pNlfbJUSUV9EBapEx+lLUDHvO4Ap86AUxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DMT8r6gSPmm94DnXHQ0w7cREtGL99MDgC5bSLx4Ik7BBI7o9Q
	AdhoAP1cPSZ/WVMfLmuAV0IHbTLGOTdwLamKXXfBLnR8rA1sLYWA9xhNr6V8UuVHYqZArtq0gxg
	Auw3Z//41kwmLKqMzQ/y0UQ==
X-Received: from wmqb19.prod.google.com ([2002:a05:600c:4e13:b0:4a2:677:24c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr313796985e9.28.1795534163528;
 Tue, 24 Nov 2026 07:29:23 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:31 +0000
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
Message-ID: <20261124152845.2233401-8-vdonnefort@google.com>
Subject: [PATCH v9 07/21] tracing/simple_ring_buffer: Add support for
 compressed length
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The array length is the total size in bytes of the data for the current
event. It is possible to compress this value into the event header type,
which has 28 unused types, saving 32 bits for sufficiently small events.

The compressed length is expressed as a multiple of the ring-buffer
alignment, 4-bytes by default. Enforce this alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/ring_buffer.h       |  5 +++++
 kernel/trace/ring_buffer.c        |  4 ++--
 kernel/trace/simple_ring_buffer.c | 23 ++++++++++++++++++-----
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 649b2276b557..f0e2be7f5cad 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -67,6 +67,11 @@ void *ring_buffer_event_data(struct ring_buffer_event *event);
 u64 ring_buffer_event_time_stamp(struct trace_buffer *buffer,
 				 struct ring_buffer_event *event);
 
+static inline bool ring_buffer_event_needs_ext_len(unsigned long length)
+{
+	return length > RB_MAX_SMALL_DATA || RB_FORCE_8BYTE_ALIGNMENT;
+}
+
 /*
  * ring_buffer_discard_commit will remove an event that has not
  *   been committed yet. If this is used, then ring_buffer_unlock_commit
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a5a0adc934fa..554013a189b9 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4146,7 +4146,7 @@ rb_update_event(struct ring_buffer_per_cpu *cpu_buffer,
 
 	event->time_delta = delta;
 	length -= RB_EVNT_HDR_SIZE;
-	if (length > RB_MAX_SMALL_DATA || RB_FORCE_8BYTE_ALIGNMENT) {
+	if (ring_buffer_event_needs_ext_len(length)) {
 		event->type_len = 0;
 		event->array[0] = length;
 	} else
@@ -4161,7 +4161,7 @@ static unsigned rb_calculate_event_length(unsigned length)
 	if (!length)
 		length++;
 
-	if (length > RB_MAX_SMALL_DATA || RB_FORCE_8BYTE_ALIGNMENT)
+	if (ring_buffer_event_needs_ext_len(length))
 		length += sizeof(event.array[0]);
 
 	length += RB_EVNT_HDR_SIZE;
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 2dddaef638dc..c64d05d5686e 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -220,7 +220,13 @@ static unsigned long rb_event_size(unsigned long length)
 {
 	struct ring_buffer_event *event;
 
-	return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
+	if (!length)
+		length++;
+
+	if (ring_buffer_event_needs_ext_len(length))
+		length += sizeof(event->array[0]);
+
+	return ALIGN(length + RB_EVNT_HDR_SIZE, RB_ARCH_ALIGNMENT);
 }
 
 static struct ring_buffer_event *
@@ -236,12 +242,15 @@ rb_event_add_ts_extend(struct ring_buffer_event *event, u64 delta)
 static struct ring_buffer_event *
 simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long length, u64 timestamp)
 {
-	unsigned long ts_ext_size = 0, event_size = rb_event_size(length);
 	struct simple_buffer_page *tail = cpu_buffer->tail_page;
+	unsigned long event_size, array_size, ts_ext_size = 0;
 	struct ring_buffer_event *event;
 	u32 write, prev_write;
 	u64 time_delta;
 
+	event_size = rb_event_size(length);
+	array_size = event_size - RB_EVNT_HDR_SIZE;
+
 	time_delta = timestamp - cpu_buffer->write_stamp;
 
 	if (test_time_stamp(time_delta))
@@ -272,9 +281,13 @@ simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long lengt
 		time_delta = 0;
 	}
 
-	event->type_len = 0;
+	if (ring_buffer_event_needs_ext_len(length)) {
+		event->type_len = 0;
+		event->array[0] = array_size;
+	} else {
+		event->type_len = DIV_ROUND_UP(array_size, RB_ALIGNMENT);
+	}
 	event->time_delta = time_delta;
-	event->array[0] = event_size - RB_EVNT_HDR_SIZE;
 
 	return event;
 }
@@ -297,7 +310,7 @@ void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned
 
 	rb_event = simple_rb_reserve_next(cpu_buffer, length, timestamp);
 
-	return &rb_event->array[1];
+	return ring_buffer_event_needs_ext_len(length) ? &rb_event->array[1] : &rb_event->array[0];
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
 
-- 
2.56.1.809.ga0b61035b5-goog

