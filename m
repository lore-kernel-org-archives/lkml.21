Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051355;
	b=F+Aob/Q7EPYCkzYlHZRnR15aNXFqjCZH9e4wDpLI2KOddz0TjbmXUWdpT9zAAQbeSAtL
	 YP/UQ2epW2DQG+g7OF3kCR0yLmzL/0D6TS2+9X7ikdsFAXvNWaXzkmGH3rinFWKKEnMVH
	 NDpqwMWyPmZ+T/Q3XKQ4dkZLvWHE1DT+rt+XyCuKc9Siv6PuPxQxtlR2RTNXwz9tGD5bB
	 wjkdsVOsUwV9AMHlI0fjpQaiqH6eIP1mrMnLmSVGT10ng28pp8RCSV/tn0mAR3HoMS65Q
	 7ucFH8p3jfVKIyrrbUbgEG27PjoCz/RI5dzZa5Y9+yLB5osAtfYZmYhjgNXJQD5Qv1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=35rvC8/YYvgC7Xip4djWomspRiu6p011YgOpSn3756A=;
	b=4sw2K10s95JfBV4npw7zs6XbmRcZB92WPJJETOdUEx9TKxVioLRV3xeZFCfA4eo+D+mC
	 B0xj684xQFVkzF+chbJC7V/ahnblzGUQT+Uaubs/kSobS36f3gCDfeZlkixFojznW55i2
	 bv1V6Q9z9rO2FHsVsNWnolD2G4miEG28r5m7NihC06l7efEy7wzsj8rRiXaC2LZhZWi3K
	 bbx7QZGu5NGVYS4W4ipeVa+BAoilFmVchAarBqlbo4H1SSUYxQVUmi7IZVgDQ68zMYfws
	 +avQupnqVhVQvpxuQSjVjGTeB0I+kntQq5k14GqDgdp5VFxiDK8UyURRigLKKb1Z/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juUV8syK;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D580606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D580606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juUV8syK
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso643225a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051354; x=1795656154; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35rvC8/YYvgC7Xip4djWomspRiu6p011YgOpSn3756A=;
        b=juUV8syKRXDb4k1gvKdNXG0cfiiIugcjUdDKj9WwfkWPsEcT5MirqAD8B8LL2all4y
         6hpw5KtI1Mh1UE8GfJAZpB5jfJjFtLcyfJ42CTDmG8jtQ/gMMIZS1ezt4uBKR102/kXI
         HCKPXS1WN2BrVBBkKgIiSClFAmNMVe3cea8kU8Gb6SWGLj8asA832d1e5Ylnq9kchfFI
         a+EIAIHCnS/baB0KtptbHoEFiMpt2MYAORp3ZdjottY1VabJsCLryjiA16Mnmp1IPw7G
         MjhsI6o2+vlPGk0LL/bSlfQ7YmAjaU9BrHogDG+tDWBD75Pq4KDnkGjJlEMgpArMWsQ8
         kPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051354; x=1795656154;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35rvC8/YYvgC7Xip4djWomspRiu6p011YgOpSn3756A=;
        b=XdI2Zj6AUhNbNoKVMA6wMSoyeSoWjq8xcANDfmqkShEex7In741XaPfpnFY6hgkh2R
         6HLOVP1szSDWxzCzMahOrMFWs0G/dOtsqII6M97Kh6z2OuKWsIKu473IDj7EyJtCXmoP
         uq1Vaq0up0Q9hMR6DvAqvrjSPrDIXfrUXXsMUg9dd3N9n6edGLVjGh11XufTZaDI5lJ2
         jPr6i4QSJuFrnjcAoPhlmlDLUR8ED8dNcyCVAJ8/Bz1GonPPBcA7wljTj2QQRDhH1jaI
         uZAO5blIWcvOmVr1EpzR0TQvMgw48ZiwAoSvck+NrqW6dNxBntJ8WWZQaGr+lygqDmi/
         JEaQ==
X-Forwarded-Encrypted: i=1; AL+hErEt/JPB2/8lGB2jhsFM8Bt3/csQriM5QIjuX9pY2+SDZpHXXMBNJPlTsdX3I4qeuTXlNefzPAIYpDDbdxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v5KN2fzL3/JG1BQJ8ciJJMtceLVuuSDloK1hdqGrz+NJ+QqJT
	b/zZjFWDpWDdBLnBF9AVLlw4rzE5OOCPgG+KfjkIL3Rq+V8kCktkEQ2d
X-Gm-Gg: AZFdTZdGmACTu4lNYqq+0ioSoMIfNxFJqr4xDmez8nnYk7e3aeHVT0/3jaks4De91aD
	ldHFYG2QFMwg2SSINvAISrERx7GiKqiriV8+diaPwBKYYE7SZXdR14geFYDc9izhaMvD42V07X0
	7FwSEGkiUi9HXrQvbTEkroCE4i+NxsTVGGkDAJjEoMkt17e11HF6EZ0hHfUHofkYJVdGn3uK6w/
	RA2jPlMR6CBU3MH9SBnu9YlnhHyHpSRXH63O2xYwV66RgoBx6DFjmIRRwtM8I6mgJGIW4SCIBlA
	OmnalHMb1k7EDBJEqpzvgfHF3q7vbyJwrA92KUlyewH8mh/28/uRcQn9dXSDy8Noc5O85icKkdm
	StDlRXCBkZjyul4OPmwYVB6e+bKGlv64NqSAa4GonIx4BBi/djdiIhfl+Fc8pinvJLFpWrIhXru
	NWUo3p1HZkUjhkLxRYyVNFYPaNnxCxMbDSwCG0OkwgIiVP7EcyTN9CDvINX6sseOYd/pUJajfAz
	nafmyI1uey/cfJaBmBGuQZGUuAJpEP86IOSqf2wpjfBgve+x7XnfWvpKox5T6VMRueor634nTRW
	tLbUboHUGfjb9Ro+l8nbJrBwQaJ/YaryhEsTJwzHYH88WvQu248I8BfHeijZqPHioovaYIuDFao
	KZe+iBmtV+FnTABH63k0kmv1LAmpMNIS1MgG5+MXEkdX2OLx0CDqzYq0=
X-Received: by 2002:a17:90b:3c83:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b3d074cb2cmr4421381a91.14.1795051354333;
        Wed, 18 Nov 2026 17:22:34 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402804679sm140447a91.2.2026.11.18.17.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:22:33 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:22:33 +0000
Message-Id: <DMYSLJIVTW06.330AM0ETRNHEG@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] rqspinlock: Keep claiming the lock while
 the queue head is still the tail
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Shashank Mohan Jain" <jain.sm@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261118104758.98620-1-jain.sm@gmail.com>
References: <20261118104758.98620-1-jain.sm@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 02:47 AM Shashank Mohan Jain <jain.sm@gmail.com> wrote:
> Only a different tail shows that a waiter did xchg_tail() and will
> link into our node. So while the tail is still ours, retry the claim
> and keep the PENDING bit of a waiter that may still be backing out,

On x86 that waiter doesn't always back out.
queued_fetch_set_pending_acquire() is lock btsl and then a separate load:

	val |= atomic_read(&lock->val) & ~_Q_PENDING_MASK;

With the patch the head can remove the tail between the two:

  CPU 0 (H, head)                    CPU 1
                                     lock btsl          -> H,1,0
  try_cmpxchg(H,0,0 -> 0,0,1) fails
  try_cmpxchg(H,1,0 -> 0,1,1)
                                     atomic_read() == 0,1,1
                                     val = 0,0,1, no contention
                                     waits for H as the pending waiter

Today that load sees tail H and CPU 1 calls clear_pending().
The new case works only because the head keeps PENDING.
Does your TAL model have btsl and the load as two steps?

> Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>   The diff is Kumar's from the v1 review.

Pls keep his authorship and SOB.

> +		u32 new = _Q_LOCKED_VAL;
> +
> +		for (;;) {
> +			if (atomic_try_cmpxchg_relaxed(&lock->val, &val, new))
> +				goto release; /* No queued successor */
> +			if ((val & _Q_TAIL_MASK) != tail)
> +				break;

PENDING is zero in val on the first pass. The wait loop above checks it.
No need for 'new' and the second tail check.

Two comments in this function still describe the old code:

	 * and nobody is pending, clear the tail code and grab the lock.

	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
	 * on @next to become !NULL.

The head clears the tail with PENDING set now.
It waits for next only after the tail has moved.

Would the following be simpler?

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 111ec80..14d3798 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -378,9 +378,7 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	/*
 	 * If we observe contention, there is a concurrent locker.
 	 *
-	 * Undo and queue; our setting of PENDING might have made the
-	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
-	 * on @next to become !NULL.
+	 * Undo and queue.
 	 */
 	if (unlikely(val & ~_Q_LOCKED_MASK)) {
 
@@ -616,29 +614,24 @@ waitq_timeout:
 	/*
 	 * claim the lock:
 	 *
-	 * n,0,0 -> 0,0,1 : lock, uncontended
+	 * n,*,0 -> 0,*,1 : lock, uncontended
 	 * *,*,0 -> *,*,1 : lock, contended
 	 *
-	 * If the queue head is the only one in the queue (lock value == tail)
-	 * and nobody is pending, clear the tail code and grab the lock.
-	 * Otherwise, we only need to grab the lock.
-	 */
-
-	/*
-	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
-	 *       above wait condition, therefore any concurrent setting of
-	 *       PENDING will make the uncontended transition fail.
+	 * If the queue head is the only one in the queue, clear the tail code
+	 * and grab the lock. Otherwise, we only need to grab the lock.
+	 *
+	 * A waiter that sets PENDING now may leave with -EDEADLK and never
+	 * queue behind us, so retry as long as the tail is ours. PENDING
+	 * belongs to that waiter, keep it. It either clears the bit or, on
+	 * x86, no longer sees our tail and becomes the pending waiter.
 	 */
-	if ((val & _Q_TAIL_MASK) == tail) {
-		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
-			goto release; /* No contention */
+	while ((val & _Q_TAIL_MASK) == tail) {
+		if (atomic_try_cmpxchg_relaxed(&lock->val, &val,
+					       (val & _Q_PENDING_MASK) | _Q_LOCKED_VAL))
+			goto release;
 	}
 
-	/*
-	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
-	 * which will then detect the remaining tail and queue behind us
-	 * ensuring we'll see a @next.
-	 */
+	/* Somebody is queued behind us, ensuring we'll see a @next. */
 	set_locked(lock);
 
 	/*

pw-bot: cr
