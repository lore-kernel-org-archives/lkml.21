Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138617;
	b=E68z1BnuyAgavBPnJWDKbysO/zxIbLQ35p3QTmBCCzTxf/d2blVgsbYHJuAuPfEnixeR
	 NZsJYmrQM1gXt5ukkKPV4rwFfRx8LnByhcHOy7lv1p6WIOqRLHFnDzKhPsCdixskU85Rn
	 szyjSI7BRrnS7Ydl9OF4VtSMI1j5omh3Vqcf98d/ai7WWa8odz6QWxrK3pgt8CPRjG2xB
	 JYBRLwnOk4R+vWLOzHEHGPcYZMGZSFLE/T35yOwKNVoquRrAzXxSa/kB9lEpY9UWlbmH1
	 jU1uhp8j0sqOoy2Zid+ct8bMVN3TedE515kNZ6ZGFeeeI18eyEPGBDoE4rLy5XOdkYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4pJlZsrZ9+5vQ6mSD5Qb2D7JI1+bB6WAnsxnJivNnvg=;
	b=X2vwpFNiEBGy7ostPwCLDI8p30oWGMoXJCk1ZqVmu9dLjfyvo7vvi8vCasNpRgvlT/Oh
	 efgWWKS7sb7ftF4VZPc9fO5utzSSJP4EsTS/GFxgbFDNb+ytIA+HgO5mal2oRh/TxLN9A
	 FvfSXFCZIhdRgR7MQTQhEcJPafn5q3qZY67mqGiqWbAdDU9V2fPC6T5JuS2mTPXSGjAFV
	 r6FjeIG7Ra9NaLlyvYk3JrKtnKswiu95vsmZPJxR5cQFnj9PPA4HGWObZOfxLfjs/uz0K
	 b/sbGhA+Kw5xuYbpp92sOKWS195bV5dsa7WFcFH9nihMDtYZF4bHcDuCwcpp4HQo/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QdA/FnIO";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61558606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61558606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QdA/FnIO
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso1124322eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795138616; x=1795743416; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pJlZsrZ9+5vQ6mSD5Qb2D7JI1+bB6WAnsxnJivNnvg=;
        b=QdA/FnIO7vz95DlEqIN6fqQZ+97KgCLBRu7nhZyxPAFa2NKmY2SZA5Egais/DNRfRW
         llr47H61NolQi1XhMBeREn3dgcXKMvZPApo2OFIZ0sI+igRX2mc7ITaX+8kqOLwguUOq
         RlqC+eo02GMQo94q1VKWJkBiGY3o0HJU/nprvojr+jCd5e2wMPeos/IvDG/hYfruedVY
         Agi7k5K9j/3VwLn0JD2AEbaMQW/1KhRbTZFyveI6wAcn2tYiyPik9KRBXEPAiura2eLk
         UkrBcXolC6oQbAUd8glI7/gmrG3Sc6L+iCS9kyAjt9cWG6e6wmOgzvKwm0QOvmHd5sOu
         z+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138616; x=1795743416;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pJlZsrZ9+5vQ6mSD5Qb2D7JI1+bB6WAnsxnJivNnvg=;
        b=pwo/2f4JJT5Xf4LmjNvkbR2L9k2Vp35hcOQ7o3HeyyTYEzg+o+IobNwk79oiUdgK1Y
         eTOuD4NYlXn6JbyUvxV0ZmBnLu86+czbuHXIpwUIvsLQpLhd8/AdVk4kDsBXnT6wudl/
         TUu7/t64pjsFs69JvqeR+N1F7S/nkvhPHCkviW1hjiQpgd3Hyp5KabV+KAz3wSkGMZq7
         8iBM/aapyma1wyiPeJKDR4qgdvEA8VTr5hu1NVrKRcE8BbM77Ok7QRkmSn22ZGHKjm+G
         X9ihul6GDlvRoUcMHTmh2MMi3tRRS0G6rT0bICGgDIy3Ye5z7qJy+g55TFhSs/Gkbvef
         B5Jw==
X-Forwarded-Encrypted: i=1; AL+hErG0pD8VPCYySdCdmZgLbPfSkckotlhYoEQ5oEg6UdwSNiXG7iLIu+AszlpZuZ6EX2THRXU054DaLvamYuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LDkSnpaQIgPgTIRm/LxFFcsdIU/HNwSPLUkFUC53ZHLTn6Rj3
	VgyT7nbUIvq7NxjUqGZp8GLciNte1ze9kp+y+OGrICmfhvXi2S4Ra03TgP6zd45rbxlyJZ8wCSx
	d2aRhwjTTangsRg==
X-Received: from dybgo26.prod.google.com ([2002:a05:7301:259a:b0:376:328a:f96a])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:150b:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3856ef47c9dmr1183325eec.19.1795138616011;
 Thu, 19 Nov 2026 17:36:56 -0800 (PST)
Date: Thu, 19 Nov 2026 17:36:42 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120013642.1093852-2-wusamuel@google.com>
Subject: [PATCH bpf-next] libbpf: Fix ring buffers for 32-bit userspace on
 64-bit kernels
From: Samuel Wu <wusamuel@google.com>
To: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, David Vernet <void@manifault.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The kernel keeps ring buffer positions in unsigned long, so a 32-bit
little-endian process on a 64-bit kernel accesses only the low 32 bits.
Reading them is fine, as positions are never more than one ring size
apart, but the upper 32 bits are always zero when writing. After 4GB:
- RINGBUF: the kernel sees consumer_pos 4GB behind, so
  bpf_ringbuf_reserve() always fails and epoll consumers spin.
- USER_RINGBUF: the kernel sees producer_pos behind consumer_pos, so
  bpf_user_ringbuf_drain() stops returning samples.

In a 32-bit little-endian process, write the position as a 64-bit value
that carries into the upper half. On a 32-bit kernel, the upper 4 bytes
land in user-writable memory that the kernel does not use for that map
type: consumer-page padding (RINGBUF), or padding/pending_pos
(USER_RINGBUF). Big-endian 32-bit compat is not fixed because offset 0
maps the upper 32 bits, so even reads do not work without knowing the
kernel word size.

Tested transferring >4GB over BPF_MAP_TYPE_RINGBUF with 32-bit
userspace (armeabi-v7a) on a 64-bit kernel (aarch64), and verified no
regression on 32-bit i386.

This needs commit fdd4fad0bbbd ("libbpf: Fix ring buffer consumer loop
on 32-bit position wrap"): without it, the consumer stops when the low
32 bits wrap.

Fixes: bf99c936f947 ("libbpf: Add BPF ring buffer support")
Fixes: b66ccae01f1d ("bpf: Add libbpf logic for user-space ring buffer")
Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/lib/bpf/ringbuf.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/tools/lib/bpf/ringbuf.c b/tools/lib/bpf/ringbuf.c
index 78fcb3df243f..254e19ec51f2 100644
--- a/tools/lib/bpf/ringbuf.c
+++ b/tools/lib/bpf/ringbuf.c
@@ -58,6 +58,35 @@ struct ringbuf_hdr {
 	__u32 pad;
 };
 
+/* 8-byte alignment lets compiler inline 64-bit __atomic_store_n() on i386. */
+typedef __u64 __attribute__((aligned(8), may_alias)) ringbuf_pos64_t;
+
+/*
+ * Carry 32-bit little-endian position updates into the upper 32 bits for
+ * 64-bit kernels. On 32-bit kernels the upper half lands in unused padding
+ * (RINGBUF) or unused pending_pos (USER_RINGBUF).
+ */
+static void ringbuf_store_pos(unsigned long *pos, unsigned long val)
+{
+	ringbuf_pos64_t *p = (void *)pos;
+	__u64 pos64;
+
+	if (sizeof(long) == 8 || __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__) {
+		/* Pairs with smp_load_acquire() in the kernel. */
+		smp_store_release(pos, val);
+		return;
+	}
+
+	pos64 = READ_ONCE(*p);
+	pos64 += (__u32)(val - pos64);
+#if __GCC_ATOMIC_LLONG_LOCK_FREE == 2
+	__atomic_store_n(p, pos64, __ATOMIC_RELEASE);
+#else
+	/* Non-atomic store, but it only transiently fails reserve/peek. */
+	smp_store_release(p, pos64);
+#endif
+}
+
 static void ringbuf_free_ring(struct ring_buffer *rb, struct ring *r)
 {
 	if (r->consumer_pos) {
@@ -290,14 +319,13 @@ static int64_t ringbuf_process_ring(struct ring *r, size_t n)
 				err = r->sample_cb(r->ctx, sample, len);
 				if (err < 0) {
 					/* update consumer pos and bail out */
-					smp_store_release(r->consumer_pos,
-							  cons_pos);
+					ringbuf_store_pos(r->consumer_pos, cons_pos);
 					return err;
 				}
 				cnt++;
 			}
 
-			smp_store_release(r->consumer_pos, cons_pos);
+			ringbuf_store_pos(r->consumer_pos, cons_pos);
 
 			if (cnt >= n)
 				goto done;
@@ -412,7 +440,7 @@ struct ring *ring_buffer__ring(struct ring_buffer *rb, unsigned int idx)
 
 unsigned long ring__consumer_pos(const struct ring *r)
 {
-	/* Synchronizes with smp_store_release() in ringbuf_process_ring(). */
+	/* Synchronizes with ringbuf_store_pos() in ringbuf_process_ring(). */
 	return smp_load_acquire(r->consumer_pos);
 }
 
@@ -652,7 +680,7 @@ void *user_ring_buffer__reserve(struct user_ring_buffer *rb, __u32 size)
 	/* Synchronizes with smp_load_acquire() in __bpf_user_ringbuf_peek() in
 	 * the kernel.
 	 */
-	smp_store_release(rb->producer_pos, prod_pos + total_size);
+	ringbuf_store_pos(rb->producer_pos, prod_pos + total_size);
 
 	return (void *)rb->data + ((prod_pos + BPF_RINGBUF_HDR_SZ) & rb->mask);
 }
-- 
2.56.1.809.ga0b61035b5-goog

