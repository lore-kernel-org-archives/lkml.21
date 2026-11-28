Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846897;
	b=kUXy9XMLr8D8nP20wfY4r/pmYg/+6Q7i6vV0KaT4VwVVp+mAbbMvibhQQpWd0CrgaSiG
	 ur8adqNUCNnvzFvEnU7/BsCToMl+jf0Y50of0D22mWw2iip8TvnVFyZBOD+3JO8A94z6h
	 BxylPBhKhrStiNhIOArWISDpQtTdOMnUL60zY6IKj3z0y5L5ol1K2mWYqO0gnBLcNbs2v
	 vpDmUacYtAVzrBcBf0Fp9T6tUtnxS2tiuh2Y4S5TGLOVRZjihjE6LUj/9A7zplqUfYxRe
	 Uwb+NsKOABLV594ME9DHcJ81af7TAYb6U18Z0ENOZ7tQ/E1gQU6PejyiXqQ4XSzao7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CSfllx8i/UgWxWruxGM0kizZw5oaYTKQ+kSHCujk68M=;
	b=lzkbbTGku/glOx3/bGE5CDkl51ij1yZXs6XXnz2Ki25iKnu1oIhzygJQRadDSKTzLm+D
	 jhX5z/8Nvdxe6l6SmZ6tlmCuvX1NQqxC7RzhiY3QaS1x9ffuxxoCX81B0xZTOl30boZNW
	 a+C2pBTK8q0a+F89oOIAG6+4c0vh150wRzo8USN1TWhTxmIVrvG/LfUsSdmLDN4wW6r78
	 Fbu71rowwUN0q6BX4FxhpUI+ZAcXywgSEJH6MwWG7RcAEsHCkR4IGnwAvC4tjIaEXhAOz
	 LKevQ5uEhnP4WZrvuT5lFk7ZWMB0AU3kAy939UlIFIBnues8LvQSSNcJkrBU3748MJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhenwenliang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQWYQa2b;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhenwenliang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQWYQa2b
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0ac2d8225so47243755ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795846896; x=1796451696; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSfllx8i/UgWxWruxGM0kizZw5oaYTKQ+kSHCujk68M=;
        b=QQWYQa2bAhjkojdfuQ+EgC8dQeCl1NxiuEelPr6BOFWCFtxxrkFTyemVv/dJzVoaXR
         PK3sub8CMehuYevdQLUFUyxbXoV9Vi1hs7OeHYmv25KY7SKypj5NX+F5KXUek7WbH/3R
         ADcED7B+805GAJKRCUnUYgejAE7QkIn6ZFNKQaQMKEi5GloCAcThU/XmcQKeJ46uJIFt
         JJK0f3lHWF4UvDlMExSrOkXwKeHCw5bldbms+XVsqXpM+KyWhA8hQeFu5LK45YqBqvuy
         2Aw7qdYz10YjHzNU5URohamFUeDokB316N7gRtkjsXcVIIILG/ba/4hIqr2ATGKg5UsP
         isCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795846897; x=1796451697;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSfllx8i/UgWxWruxGM0kizZw5oaYTKQ+kSHCujk68M=;
        b=aW3MTPlYaFAmpZqx8j0ma0xWW91WHLbpPJiimdgDv1UftiziKod1f6Ahmr/oSUWLQv
         IaP5cZIfw7r6YQgWAIIwElE77f8advrcBJuXe0rJf21MPHBV/AinzRbfE6GtjlJqn2Ud
         t5V7/8J9t3hqv1tBs2IdWW2WBtIXhPj2tTwn8GKpxFRfd16Ts5QKIgEi/MwiKNpOSjvy
         ey+b/arZRrFsv2CX6P5n+l2KzaEFflHsFaNXVrSaGKE1yLs+LP76kx8i35x6zyXRDo24
         TSSnSd1R8tD/5apBrvdRFv6jmVvG/a4lh13AZIjVbDhKB40wFemCN/qa7oQUqkQnuWIV
         53pg==
X-Forwarded-Encrypted: i=1; AL+hErE4UXPVFMA7Z6ChWVjh3dt8KNiUWJJsEaSx0XzUJs0qzzJVozUY6/EIXGgV8jQoPkkh6+cIZrelJ/LTCkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vjIzGYAJiP+AWRgwZJO9ow4aUh8gDM2y3fTiA9zdLe6gG0z0C
	7ECX8Sr+cutfaOVZnB8yWDQY5sigZlfDhgdH7lVFdF6imh3zER6MAydCiLKTwhnNolYQ/pDkQuT
	0LyA2u0YYQLr+mI53uBkuEF3NLTngLQ==
X-Received: from plpj15.prod.google.com ([2002:a17:903:3d8f:b0:2ef:a836:c1be])
 (user=zhenwenliang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f07:b0:2f0:a027:7226 with SMTP id d9443c01a7336-2f0a027731fmr187347005ad.57.1795846896334;
 Fri, 27 Nov 2026 22:21:36 -0800 (PST)
Date: Sat, 28 Nov 2026 06:21:35 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128062135.3041832-1-zhenwenliang@google.com>
Subject: [PATCH] kfifo: Use acquire/release ordering for the in and out indices
From: Zhenwen Liang <zhenwenliang@google.com>
To: Stefani Seibold <stefani@seibold.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <kees@kernel.org>, 
	Xiao Guangrong <guangrong.xiao@gmail.com>, Yulei Zhang <yuleixzhang@tencent.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The lockless single-producer/single-consumer use of kfifo relies on
smp_wmb() alone. The producer writes an element, issues smp_wmb() and
then increments fifo->in. The consumer reads fifo->in, compares it with
fifo->out and then reads the element. Nothing orders the consumer's read
of fifo->in before its read of the element: the comparison only creates
a control dependency, and a control dependency does not order later
loads. On weakly ordered CPUs such as arm64 and powerpc, the consumer
can see the new fifo->in and still read the old contents of the slot.

The consumer's update of fifo->out has the mirror problem. After reading
the element it issues smp_wmb() and increments fifo->out, but smp_wmb()
orders only stores: the reads of the element are not ordered before the
store to fifo->out, so the producer could see the new fifo->out and
overwrite the slot before the consumer has read it.

The read-side barriers were dropped in 2010, when the kfifo code was
replaced by the generic version. The missing read-side ordering was
reported in 2018, and a partial patch was posted but not merged; the
review noted that more sites needed work. Thanks to Xiao Guangrong for
the original report.

Use the scheme described in Documentation/core-api/circular-buffers.rst:
each side reads the other side's index with smp_load_acquire() before
it accesses the data, and publishes its own index with
smp_store_release() after it. This converts the index accesses that
order the data accesses: it replaces the smp_wmb() calls in kfifo_put(),
kfifo_get(), kfifo_peek() and in the copy helpers of lib/kfifo.c, and
kfifo_skip_count() now publishes fifo->out with smp_store_release().
The generic queries (kfifo_len(), kfifo_is_empty(), kfifo_is_full(),
kfifo_avail()) and the DMA helpers are not changed, except that the DMA
paths use the shared kfifo_unused() and kfifo_skip_count().

The first reordering is allowed by the Linux kernel memory model for a
litmus test derived from kfifo_put() and kfifo_get(), and it was
observed with litmus7 on an arm64 machine (Neoverse-V2). The second is
allowed by the memory model and by the arm64 architecture model; we
have not observed it on hardware. The fix was checked with herd7 on
litmus tests derived from the patched kfifo_put()/kfifo_get() (LKMM,
AArch64, PPC models: forbidden).

The problem has been present since 2010; maintainers may want this
change for stable.

The problem was independently rediscovered, and this patch prepared,
with the help of a formal analysis tool we are developing that uses AI
assistance; I have reviewed the analysis and the patch.

Compile-tested on arm64 (clang) and x86-64 (gcc) with W=1; not
runtime-tested beyond the litmus tests.

Fixes: 2e956fb32056 ("kfifo: replace the old non generic API")
Link: https://lore.kernel.org/all/5382d3a8-08e0-5429-0cd3-36f9c69197e1@gmail.com/
Link: https://lore.kernel.org/all/20181211034032.32338-1-yuleixzhang@tencent.com/
Signed-off-by: Zhenwen Liang <zhenwenliang@google.com>
---
This revisits the kfifo ordering issue reported in 2018 (links above).
herd7 with the Linux kernel memory model allows the outcome for
a litmus test derived from kfifo_put()/kfifo_get() (the consumer sees
the new fifo->in but reads the old slot), and the outcome was observed
with litmus7 on an arm64 machine. The patch converts the index accesses
that order the data accesses to acquire/release, covering the other
sites Will pointed out in 2018 (e.g. kfifo_get() using smp_wmb()). The
fix was checked with herd7 on litmus tests derived from the patched
kfifo_put()/kfifo_get() (LKMM, AArch64, PPC models: forbidden).

 include/linux/kfifo.h | 22 ++++++++------
 lib/kfifo.c           | 71 +++++++++++++++++++++----------------------
 2 files changed, 47 insertions(+), 46 deletions(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 8b81ac74829c..8f6934d208bd 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -320,7 +320,8 @@ __kfifo_uint_must_check_helper( \
 	if (__recsize) \
 		__kfifo_skip_r(__kfifo, __recsize); \
 	else \
-		__kfifo->out += (count); \
+		/* pairs with the producer's smp_load_acquire() of out */ \
+		smp_store_release(&__kfifo->out, __kfifo->out + (count)); \
 } while(0)
 
 /**
@@ -448,15 +449,17 @@ __kfifo_int_must_check_helper( \
 		__ret = __kfifo_in_r(__kfifo, &__val, sizeof(__val), \
 			__recsize); \
 	else { \
-		__ret = !kfifo_is_full(__tmp); \
+		/* pairs with the consumer's smp_store_release() of out */ \
+		__ret = __kfifo->in - smp_load_acquire(&__kfifo->out) <= \
+			__kfifo->mask; \
 		if (__ret) { \
 			(__is_kfifo_ptr(__tmp) ? \
 			((typeof(__tmp->type))__kfifo->data) : \
 			(__tmp->buf) \
 			)[__kfifo->in & __tmp->kfifo.mask] = \
 				*(typeof(__tmp->type))&__val; \
-			smp_wmb(); \
-			__kfifo->in++; \
+			/* publish the element before the new in */ \
+			smp_store_release(&__kfifo->in, __kfifo->in + 1); \
 		} \
 	} \
 	__ret; \
@@ -486,15 +489,16 @@ __kfifo_uint_must_check_helper( \
 		__ret = __kfifo_out_r(__kfifo, __val, sizeof(*__val), \
 			__recsize); \
 	else { \
-		__ret = !kfifo_is_empty(__tmp); \
+		/* pairs with the producer's smp_store_release() of in */ \
+		__ret = smp_load_acquire(&__kfifo->in) != __kfifo->out; \
 		if (__ret) { \
 			*(typeof(__tmp->type))__val = \
 				(__is_kfifo_ptr(__tmp) ? \
 				((typeof(__tmp->type))__kfifo->data) : \
 				(__tmp->buf) \
 				)[__kfifo->out & __tmp->kfifo.mask]; \
-			smp_wmb(); \
-			__kfifo->out++; \
+			/* finish reading the element before the new out */ \
+			smp_store_release(&__kfifo->out, __kfifo->out + 1); \
 		} \
 	} \
 	__ret; \
@@ -525,14 +529,14 @@ __kfifo_uint_must_check_helper( \
 		__ret = __kfifo_out_peek_r(__kfifo, __val, sizeof(*__val), \
 			__recsize); \
 	else { \
-		__ret = !kfifo_is_empty(__tmp); \
+		/* pairs with the producer's smp_store_release() of in */ \
+		__ret = smp_load_acquire(&__kfifo->in) != __kfifo->out; \
 		if (__ret) { \
 			*(typeof(__tmp->type))__val = \
 				(__is_kfifo_ptr(__tmp) ? \
 				((typeof(__tmp->type))__kfifo->data) : \
 				(__tmp->buf) \
 				)[__kfifo->out & __tmp->kfifo.mask]; \
-			smp_wmb(); \
 		} \
 	} \
 	__ret; \
diff --git a/lib/kfifo.c b/lib/kfifo.c
index 2633f9cc336c..33dc88d31781 100644
--- a/lib/kfifo.c
+++ b/lib/kfifo.c
@@ -19,7 +19,8 @@
  */
 static inline unsigned int kfifo_unused(struct __kfifo *fifo)
 {
-	return (fifo->mask + 1) - (fifo->in - fifo->out);
+	/* pairs with the consumer's smp_store_release() of fifo->out */
+	return (fifo->mask + 1) - (fifo->in - smp_load_acquire(&fifo->out));
 }
 
 int __kfifo_alloc_node(struct __kfifo *fifo, unsigned int size,
@@ -104,11 +105,6 @@ static void kfifo_copy_in(struct __kfifo *fifo, const void *src,
 
 	memcpy(fifo->data + off, src, l);
 	memcpy(fifo->data, src + l, len - l);
-	/*
-	 * make sure that the data in the fifo is up to date before
-	 * incrementing the fifo->in index counter
-	 */
-	smp_wmb();
 }
 
 unsigned int __kfifo_in(struct __kfifo *fifo,
@@ -121,7 +117,8 @@ unsigned int __kfifo_in(struct __kfifo *fifo,
 		len = l;
 
 	kfifo_copy_in(fifo, buf, len, fifo->in);
-	fifo->in += len;
+	/* publish the data before the new fifo->in */
+	smp_store_release(&fifo->in, fifo->in + len);
 	return len;
 }
 EXPORT_SYMBOL(__kfifo_in);
@@ -143,11 +140,6 @@ static void kfifo_copy_out(struct __kfifo *fifo, void *dst,
 
 	memcpy(dst, fifo->data + off, l);
 	memcpy(dst + l, fifo->data, len - l);
-	/*
-	 * make sure that the data is copied before
-	 * incrementing the fifo->out index counter
-	 */
-	smp_wmb();
 }
 
 unsigned int __kfifo_out_peek(struct __kfifo *fifo,
@@ -155,7 +147,8 @@ unsigned int __kfifo_out_peek(struct __kfifo *fifo,
 {
 	unsigned int l;
 
-	l = fifo->in - fifo->out;
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	l = smp_load_acquire(&fifo->in) - fifo->out;
 	if (len > l)
 		len = l;
 
@@ -173,7 +166,8 @@ unsigned int __kfifo_out_linear(struct __kfifo *fifo,
 	if (tail)
 		*tail = off;
 
-	return min3(n, fifo->in - fifo->out, size - off);
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	return min3(n, smp_load_acquire(&fifo->in) - fifo->out, size - off);
 }
 EXPORT_SYMBOL(__kfifo_out_linear);
 
@@ -181,7 +175,8 @@ unsigned int __kfifo_out(struct __kfifo *fifo,
 		void *buf, unsigned int len)
 {
 	len = __kfifo_out_peek(fifo, buf, len);
-	fifo->out += len;
+	/* finish reading the data before the new fifo->out */
+	smp_store_release(&fifo->out, fifo->out + len);
 	return len;
 }
 EXPORT_SYMBOL(__kfifo_out);
@@ -211,11 +206,6 @@ static unsigned long kfifo_copy_from_user(struct __kfifo *fifo,
 		if (unlikely(ret))
 			ret = DIV_ROUND_UP(ret, esize);
 	}
-	/*
-	 * make sure that the data in the fifo is up to date before
-	 * incrementing the fifo->in index counter
-	 */
-	smp_wmb();
 	*copied = len - ret * esize;
 	/* return the number of elements which are not copied */
 	return ret;
@@ -242,7 +232,8 @@ int __kfifo_from_user(struct __kfifo *fifo, const void __user *from,
 		err = -EFAULT;
 	} else
 		err = 0;
-	fifo->in += len;
+	/* publish the data before the new fifo->in */
+	smp_store_release(&fifo->in, fifo->in + len);
 	return err;
 }
 EXPORT_SYMBOL(__kfifo_from_user);
@@ -271,11 +262,6 @@ static unsigned long kfifo_copy_to_user(struct __kfifo *fifo, void __user *to,
 		if (unlikely(ret))
 			ret = DIV_ROUND_UP(ret, esize);
 	}
-	/*
-	 * make sure that the data is copied before
-	 * incrementing the fifo->out index counter
-	 */
-	smp_wmb();
 	*copied = len - ret * esize;
 	/* return the number of elements which are not copied */
 	return ret;
@@ -292,7 +278,8 @@ int __kfifo_to_user(struct __kfifo *fifo, void __user *to,
 	if (esize != 1)
 		len /= esize;
 
-	l = fifo->in - fifo->out;
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	l = smp_load_acquire(&fifo->in) - fifo->out;
 	if (len > l)
 		len = l;
 	ret = kfifo_copy_to_user(fifo, to, len, fifo->out, copied);
@@ -301,7 +288,8 @@ int __kfifo_to_user(struct __kfifo *fifo, void __user *to,
 		err = -EFAULT;
 	} else
 		err = 0;
-	fifo->out += len;
+	/* finish reading the data before the new fifo->out */
+	smp_store_release(&fifo->out, fifo->out + len);
 	return err;
 }
 EXPORT_SYMBOL(__kfifo_to_user);
@@ -440,7 +428,8 @@ unsigned int __kfifo_in_r(struct __kfifo *fifo, const void *buf,
 	__kfifo_poke_n(fifo, len, recsize);
 
 	kfifo_copy_in(fifo, buf, len, fifo->in + recsize);
-	fifo->in += len + recsize;
+	/* publish the data before the new fifo->in */
+	smp_store_release(&fifo->in, fifo->in + len + recsize);
 	return len;
 }
 EXPORT_SYMBOL(__kfifo_in_r);
@@ -462,7 +451,8 @@ unsigned int __kfifo_out_peek_r(struct __kfifo *fifo, void *buf,
 {
 	unsigned int n;
 
-	if (fifo->in == fifo->out)
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	if (smp_load_acquire(&fifo->in) == fifo->out)
 		return 0;
 
 	return kfifo_out_copy_r(fifo, buf, len, recsize, &n);
@@ -472,7 +462,8 @@ EXPORT_SYMBOL(__kfifo_out_peek_r);
 unsigned int __kfifo_out_linear_r(struct __kfifo *fifo,
 		unsigned int *tail, unsigned int n, size_t recsize)
 {
-	if (fifo->in == fifo->out)
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	if (smp_load_acquire(&fifo->in) == fifo->out)
 		return 0;
 
 	if (tail)
@@ -487,11 +478,13 @@ unsigned int __kfifo_out_r(struct __kfifo *fifo, void *buf,
 {
 	unsigned int n;
 
-	if (fifo->in == fifo->out)
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	if (smp_load_acquire(&fifo->in) == fifo->out)
 		return 0;
 
 	len = kfifo_out_copy_r(fifo, buf, len, recsize, &n);
-	fifo->out += n + recsize;
+	/* finish reading the data before the new fifo->out */
+	smp_store_release(&fifo->out, fifo->out + n + recsize);
 	return len;
 }
 EXPORT_SYMBOL(__kfifo_out_r);
@@ -501,7 +494,8 @@ void __kfifo_skip_r(struct __kfifo *fifo, size_t recsize)
 	unsigned int n;
 
 	n = __kfifo_peek_n(fifo, recsize);
-	fifo->out += n + recsize;
+	/* finish reading the data before the new fifo->out */
+	smp_store_release(&fifo->out, fifo->out + n + recsize);
 }
 EXPORT_SYMBOL(__kfifo_skip_r);
 
@@ -524,7 +518,8 @@ int __kfifo_from_user_r(struct __kfifo *fifo, const void __user *from,
 		*copied = 0;
 		return -EFAULT;
 	}
-	fifo->in += len + recsize;
+	/* publish the data before the new fifo->in */
+	smp_store_release(&fifo->in, fifo->in + len + recsize);
 	return 0;
 }
 EXPORT_SYMBOL(__kfifo_from_user_r);
@@ -535,7 +530,8 @@ int __kfifo_to_user_r(struct __kfifo *fifo, void __user *to,
 	unsigned long ret;
 	unsigned int n;
 
-	if (fifo->in == fifo->out) {
+	/* pairs with the producer's smp_store_release() of fifo->in */
+	if (smp_load_acquire(&fifo->in) == fifo->out) {
 		*copied = 0;
 		return 0;
 	}
@@ -549,7 +545,8 @@ int __kfifo_to_user_r(struct __kfifo *fifo, void __user *to,
 		*copied = 0;
 		return -EFAULT;
 	}
-	fifo->out += n + recsize;
+	/* finish reading the data before the new fifo->out */
+	smp_store_release(&fifo->out, fifo->out + n + recsize);
 	return 0;
 }
 EXPORT_SYMBOL(__kfifo_to_user_r);
-- 
2.56.1.839.g22a8290db9-goog

