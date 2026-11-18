Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998115;
	b=PqEEWjmVJxMIJBTe9/y8/iRZEYVda1wMW6hkyZEztPDaMhdDLCOkKlxK7x3p6DxV+03H
	 yFis6tWBhL9aGcuLSabV81d0g4M8m1TvXFErdDUbwaR0nOgaoe83DbEzC5I4clGjVlfKU
	 L0U5obwDdnrko0Mfryfp5ZJY1AZ6lrNSYcXfIVeiK4tI9OyLTtuofINSDqGykJgdSoFVS
	 1fYX6VA6F9lcedYky0DmRt110Z32V9W/6xKLy+QuRcXeZWbPYMvnrudVTKmJuOGWCRD+s
	 UHUup/YxSxmmzmvBeiOzG2ZzDD1FUHpBux4VB6r06NYieVXo3FAzXaUm1eKZxnZ/obw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=V/rcDmWi1GhtPKbEjFzCUZhJ8UrOGyK/nBYXCR03k6k=;
	b=lwKtOl+7WVbdiBRLSNbGvXFAW1dEB+Qwrfem7UcSGFW62yBY29YsCM9fIfHYJTzjA7xa
	 XCKGkq5Ps/hG/7L/ZEBmvsWl1d/DhcVL6VjK/9MqFoQ3oPZMcUipM+X5Ur0LQly+deVgo
	 GwOz9zu+qnnfdhpTAM2YqnXouBQm2wOWSXh7/wPgUZ1PrBZimuD4YgZFODTyZOj0qfHHe
	 VuIVJudKzor/qCuj/yKA5032uO6fRvWR6PN52E64mfJO4af8zwVy0+lJuw0m8XrKtreO5
	 jByLiXDh3+vowOX7KbRhxrxPub9rApIhZyN1DdZ+KMmXFFAbW5zPhuMmOR2BH6LefFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEQaPypI;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EEA60A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EEA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEQaPypI
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4bb68c48655so3685625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998113; x=1795602913; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V/rcDmWi1GhtPKbEjFzCUZhJ8UrOGyK/nBYXCR03k6k=;
        b=eEQaPypIwfhomdAqEvFeeYyFXJIk1zUNJ4899C3azLdFLU3mWkK9maUI1it27Aopnf
         Yizybi1/pD9i0ZCeQITUUuNG8TntDtwcqEbtyVwbh58Xwd5n9dG+A+BEsRPPgxbkaLkB
         ySRo4NRcQh2C1mKZvddkxfB/au0fyXHnAh68lVNdDTRbVW+fc11Sksno+oER3qnxUNgH
         pAsP8hvtnKppFMoqZGOGNyLDYukOVcJJrVuSb/9HTWERBnsN+5IyI1O6Ol1Ot2Ieef9L
         zvR52lKXr7fiB/GWfn1C7aidLj0NBH/uWMnEG41mlTIhuKwbVrxEPac4eMA4r9U+c8qr
         o+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998113; x=1795602913;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/rcDmWi1GhtPKbEjFzCUZhJ8UrOGyK/nBYXCR03k6k=;
        b=Z10Ma6jjh1+CLGfpGiOgoSsS3Z8X6hAPtEjeK0EAJnaG1igCN6sulpGGIfDFr9IJcM
         QwnJSNQD97KvL8pM8YkHUAYeeRbnGN0FhK6XWzBuyTa3TzJJhs4Au1L13PSF/n/bDnKM
         GB4vWnwwLA9N42jCAp5QHhOmKY93GEJfuMWc1r/pbBh7eVo7cv4UZdcx3X02H6+YGl2R
         Iqv/lmz4I7rgsgKQnSLDvp9ZY2U7GLOHLjJ9T8lltm/HQUtMcF1zYWdInZOtYJEoQxjw
         z3KJcm9CpQ9EIYa3TNe26H+JqU9ZTqxZOozLcBLpgJB8zxSg6zpgcAT8PJ2jWpIJpnwq
         bEEA==
X-Forwarded-Encrypted: i=1; AL+hErEwn9QWEFugqVo/WkJ4i1Zr92HajdADnT2WX3sARMe2Po7BjvHTQy/ue0vMPyEH6AEa1xPHhHXEa20di34=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e73x4xTRx00Q+I4+OJXtL2hdynQN2zTSsEYBEBjrVobB3/Uo0
	Q8VUGV+NEwdS9Q5ZLN/Yj4an6rMy8U6rr7yUi07ZPnew8LfZkGAhD4Bz
X-Gm-Gg: AYBFou2+Ibs+e880ZeG1c0UfnZF4qmiVavAN37Sx5JE4xCPlOfQxN9h2F4BHWrUUMmL
	Is1911sg1FuzO+6QH5ULavv9xKuXO30ITqS97RVHxegvObJaP8TpEpaSR13/0W5JBxZEj28z8V9
	Uq9qPgOj+gEC+R2w7VCdS4WtHNkxnIHxdL4MGXY7Z4zLrdUnZX02M1jn106aHdpiRheIxVrFRSS
	9Q3CDEoqJBaJhtlfuaCQqt7bo3M6NINEm+fY8e1sIrxFJ5DpRiOvIKNhSCcFN6oK/O1RcVMeHLP
	QK5+hQbxSboHE/7/c8zDdLOxw8BkjO+NRbFWvX2LsbKrfbiRQSnP1swRrSW6Kpk/0BV4vPbDaxb
	Gsf3CGs0qsTWjri3zL60b045mhJ2trgAfF73+m5kr/4KyiHN+2XCiudPv/QXPHKJiA6uaVj1XSd
	oPXNDp2qhYhv0ITqzb89QU9IiI5a5bZRxlFmL8VG27VTOZrL7KZ2MGP+nnUtn76Urx8zfnn0DxE
	lxu4jDpej5bSjG75VMnGHE0D1SRmCFVnk/WUVmZp7lpkHruGGsZazELZL2zpLGDIDjVOYOAbRWN
	c//7boQtxXJPqGAjFQT1J+xQXOxTHNOMZfiUMSe2CqgOSx0Ed1NydjIarWHEokR+lKdxiuGDBMH
	WAM/8DX2ZYt5Oc11OGiauwB523dKdjfB6ol1JdiqOStVFe+S7sNv9saa6zKwt1UfIVNIc
X-Received: by 2002:a05:600c:4e02:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb7da44054mr39406725e9.29.1794998113097;
        Wed, 18 Nov 2026 02:35:13 -0800 (PST)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm144465015e9.0.2026.11.18.02.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:35:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 11:35:11 +0100
Message-Id: <DMY9Q4RMBKLM.2F6A6DVPXCTOH@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] rqspinlock: Reset tail if no waiter queues behind
 the queue head
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Shashank Mohan Jain" <jain.sm@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261117225023.36660-1-jain.sm@gmail.com>
In-Reply-To: <20261117225023.36660-1-jain.sm@gmail.com>

On Tue Nov 17, 2026 at 11:50 PM CET, Shashank Mohan Jain wrote:
> When the head of the wait queue claims the lock and its cmpxchg from
> n,0,0 to 0,0,1 fails, it sets the locked bit and waits for node->next,
> with no timeout. The comment, taken from qspinlock, says the cmpxchg
> can only fail if somebody queued behind us, or if a waiter set PENDING,
> which will then see our tail and queue behind us.
>
> In rqspinlock that waiter does not always queue. After clear_pending()
> it goes to queue:, and two paths return -EDEADLK there before
> xchg_tail():
>
>  - the trylock fallback for an NMI waiter whose per-CPU node is busy
>    (in_nmi() && idx > 0), or when idx >=3D _Q_MAX_NODES;
>  - check_deadlock_AA(), when this CPU already holds an entry for the
>    lock.
>
> For example, with the queue head H alone in the queue:
>
>   CPU 0 (H, head)                    CPU 1 (NMI, idx 1 on another lock)
>   reads lock->val =3D=3D H,0,0
>                                      queued_fetch_set_pending_acquire()
>                                        sees tail H
>   try_cmpxchg(H,0,0 -> 0,0,1) fails
>   set_locked()          -> H,1,1
>                                      clear_pending()   -> H,0,1
>                                      in_nmi() && idx > 0, trylock fails
>                                      return -EDEADLK
>   waits for node->next ...
>
> H now owns the lock and spins until another context queues on the same
> lock. For a lock that is rarely taken, such as a hash map bucket lock,
> that can be a long time, with interrupts disabled, so it shows up as an
> RCU stall or a hard lockup. The same happens on v6.17 and v6.18 for any
> NMI waiter, as the trylock fallback was used for all of them.
>
> The AA path needs the interrupted context to have taken its entry for
> the lock and not to try the lock again, so it is much narrower.
>
> While waiting for the successor, reset the tail if it still points to
> us, as the deadlock and timeout exits already do, and keep the lock. If
> the tail has moved, a waiter has done xchg_tail() and will link into
> our node, so keep waiting for it. try_cmpxchg_tail() reads the lock
> word first, so the loop only adds a plain load while a successor
> finishes linking.
>
> Found with a TLA+ model of the slow path. A userspace port of the slow
> path, driven through the interleaving above, hangs without this change
> and completes with the lock word clean with it. I have not reproduced
> the hang on a running kernel.
>
> Fixes: 0d80e7f951be ("rqspinlock: Choose trylock fallback for NMI waiters=
")
> Fixes: 087849cca31d ("rqspinlock: Precede non-head waiter queueing with A=
A check")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---

I am aware of this one, but I don't think it's that serious (of course, nee=
ds to
be fixed). I was going to send it in a couple weeks with some other changes=
 for
rqspinlock. For the next version, let's drop Cc to stable and target bpf-ne=
xt.

How about the approach below instead that I have? You could check whether t=
he
violation in your TLA+ model goes away. The benefit is that we don't penali=
ze
the loop that waits for next, for this very rare condition that is not like=
ly to
be hit.

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 111ec80ea958..f6a938ee7ab4 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -624,20 +624,23 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rq=
spinlock_t *lock, u32 val)
         * Otherwise, we only need to grab the lock.
         */

-       /*
-        * Note: at this point: (val & _Q_PENDING_MASK) =3D=3D 0, because o=
f the
-        *       above wait condition, therefore any concurrent setting of
-        *       PENDING will make the uncontended transition fail.
-        */
        if ((val & _Q_TAIL_MASK) =3D=3D tail) {
-               if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_=
VAL))
-                       goto release; /* No contention */
+               u32 new =3D _Q_LOCKED_VAL;
+
+               for (;;) {
+                       if (atomic_try_cmpxchg_relaxed(&lock->val, &val, ne=
w))
+                               goto release; /* No queued successor */
+                       if ((val & _Q_TAIL_MASK) !=3D tail)
+                               break;
+                       /* A pending claimant can abandon before publishing=
 a tail. */
+                       new =3D _Q_LOCKED_VAL | (val & _Q_PENDING_MASK);
+               }
        }

        /*
-        * Either somebody is queued behind us or _Q_PENDING_VAL got set
-        * which will then detect the remaining tail and queue behind us
-        * ensuring we'll see a @next.
+        * A different tail proves that a successor will publish node->next=
.
+        * Preserve pending while installing ownership; a racing claimant m=
ay
+        * still be undoing its speculative reservation against this queue.
         */
        set_locked(lock);
