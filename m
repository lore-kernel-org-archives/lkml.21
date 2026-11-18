Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998963;
	b=kojijddFiixip1kcEOS6PB3b+Z3pqBoxUhNNmxsxmM2Oq4KoIvuM57urqlJP6OxTEYCy
	 +oDtfmWcF+CcVZLH4vbD7phaOoMuk5eDN6f8YWPrr4EygpV8h5NPsPMY1Dt5hyaEsSJwg
	 ctuEXFH0YV7GRFzii7SkK/r52oUU98qNHiaUBSl9mljF20+wR9i7FNvum9r2lA/skVC9t
	 0nr2aBlRLbgwjpwOyS4TN7m7huNSInIBvDneTrvkGN5rugy30u7wiWEVEqCyb2D8/gAlf
	 NQlkHpfgPl+UtoTcQv93jd+I1fwlXRRCLkPlrTgQyjm3L7uXJNzQTlkjzk+mZsZ4qdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NP7Egg2cK3GLjKZj5C+bpsjhrjuI4KFrET45ncq+pos=;
	b=j/rs29FMeBArHzWkPmKrLgi8IZDwfIefeaJFvgUIhKlUDZZSeCoeTRWN5NQSKpHoEssK
	 8+FzsuF2r0t1hW39YL/j3Psy83ab4EB2I1zLuEtrvOduSyFyEniNU8mBL1zO1Ui9TbkMj
	 SHNmikuIoJCZuqcztrjVfC0ytGhY93D4gmg+5NGyftKJ3+0K1W4mswsYmjE5kHYX3qeDZ
	 5b3K0BxKrRHrvzrW2URAievEtwyfDPVku55IyV1JA+wRzM5V22UHO/a8Xg6A+YVy1t1jD
	 2bkRA4CK4UJq9Wd0+NcieLxvRuQtJ0ibzvNAb0TIdqBXW/HuEgjQ4BMND53xD+NuecQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nh9L+sZA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4058F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nh9L+sZA
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94961d90b79so121592785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998962; cv=none;
        d=google.com; s=arc-20260327;
        b=inGxMvAObJnwZ+YOxahvaO93rpZ+PGNarMp8YlZpF3yARzTXjLE79Tl6eG+wMf/Nlf
         whu+Y/HslMuVa8VFnp5sVIEZa0ECgWC9QRqvLXEswtUneUvz6Wb/D48lCVDB/IZYyuBb
         7EClIjY6T3kJqkdnpb0kLc9Kv7sXsJSpfxCp8nvt9fn1oMZqHvHzwotuql2NaKau+nQQ
         vYp588Nax550vv7X8DZ/WwBvgcQN0RUmhioDIcNOUDY+kgOrJuGLfyoP5+hNsjnufLmo
         O7sQpF/o+Tec3UIKATyS59QVZ7KYJTC4OVW1GBr7YKwfF/Z96osVI4WekCCSkkk8dTOS
         0mRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NP7Egg2cK3GLjKZj5C+bpsjhrjuI4KFrET45ncq+pos=;
        fh=fATAe60VXNLN5CKB9ldOixvdyWO81TjD+m+iWDPTmyc=;
        b=p8JbrP370xIMA+9uNiE0WbYYSqSq+zoyUlOIehun+xcOsqKDwXMMvq/+HgbttZ4hMh
         3WNdRlX+bEzx/vmgsRy2QC+jjRDzOz51Y0tuvEHLLnCuggsHr8h1hUJPD6RNaaWSzeVA
         On2xXMQKpF+sJ+fzzkQ3GJhCyTMIHQ4Zuprn62UDWhswLGa2kg/y3F0MiDjhY3oD+pyq
         GnMM+wodjxG4VQ1kt0spKwv3c0MhdUPrpv6PBEFlxRexBOLIv1d9f10RgqEZ4/w+hYIk
         oE2c+WuAZ4yUr472FRGdwXWz9oIVrdTernUJhfC+4ClsQyxZLV2kX81CegRyQ/e0W7aA
         +8Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998962; x=1795603762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NP7Egg2cK3GLjKZj5C+bpsjhrjuI4KFrET45ncq+pos=;
        b=nh9L+sZAKj6IQtN+LfWEmsirV1p1oEUtYfGLlqqw28edH4eq6yqTyFW3qjxIlyYFK/
         4eOvtMPpVBVYoY1CIPaGCeFw4zpaONJ/JJLsR97ENjgDGmDH1pepKRX9ivdOLSLp+eZ+
         CpRA1z95LV1DNsv2AVxCJTAwOsfbiDG6FBMgju0ap28Pe645QEtD9wO733jcodWGGnXE
         IpEhpDo02xuoIvJ3pAdlvz0NMsn2Tg+V9hXNVjszc+14crYhtIvQyxAFsZhP9beFfESX
         bRCzKFM78VqZ8uTSg8tzYrdCZ3qJnn+Uh/xJ0yeT+vo8En9qB/4xB1gSVu7ya7dML5wB
         jnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998962; x=1795603762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NP7Egg2cK3GLjKZj5C+bpsjhrjuI4KFrET45ncq+pos=;
        b=eSxZLwBekNYSo4uDnrgBHeA/FY2QOal6IYEDq0JR32dJUOPyRcWnQuXM+s7sKpiyKU
         Z8yxc7ClKwW98Zf6YllNLP2AwjYblHkU/y1GTz/jVg6o3RiDqOv3m2Z+PVD0BStb4ocT
         YKx2wYupvumbl/+chWOlEFb5Neg2p88ZcMUbY1BNG0/m7eNP+Sf7lsr7LP6yYYQZ8jVC
         vYr1KPjc5qsovRV5G951/GSj+xNJUy548pXOP4sw/dQigg+oW2tW+eTetXzUNaqo4DDz
         o4AMnhBral0380PGM2r73+ImEYYmooXRHl6q/vh2Wfg4FPHFCH0ASNp08z6ItRpysPh1
         Bf0g==
X-Forwarded-Encrypted: i=1; AL+hErFXuI9VS0vPuHAqc+Re4d9uq4/6v1dpblLA6wkHhjWfdzBACAbTY+w97YJRQ7pihHPTHRDrLky6Gzfhk3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zPl7ok74A1SHZPf3ivBuCUbI1BEEX0mfZov6oPrK+LXtQRik4
	FVmJs04RlBJ4rimM4OSCQdhUTAaIMO+G35uWmoS6wINCqC1JQsAMkJlxI6JAAWZWyf9f0puo0ib
	jfLWrGJusGR0rnVhk3o+JGaOSED6II1A=
X-Gm-Gg: AYBFou2S0x1NZCHYM17ILO2Rhg7ql2tNs8B7s4QGB17sR+fU2scB1mhaSpc8irIkXW2
	+v7/Np1RCojGlG30Hv5RSZQCI5QNtX0OOgR+OnOU1DFYKucM+QZKuom3YM8wI4DKffMa3wZpftC
	8mxPX+YLxd6IHex36Gfc9NOtqLnMSjdx61LMLGSKKtNuKGpCFAjlXyynuVYAA+rmURx91yd8Kvf
	2N9M9ldlhiF2KoPEmV3L3lni3sPugv8k8H64RrLKI8bhpOmgYM/zM4bNHyJo0vWOjCfdpubTFMJ
	rI9Hq2D5HOLr+Ul6JzUs9lU+F63UaCJ3TJe6QX8cGHReukr9FmlPOP8CDVQO8vckwqSLI/oAZmP
	LgSJFTgzK17RKi+OMxeiQqnYq3h7/LrZPl4bdKQTxYkspd6g51aGuVxRojf0C9WpcEcdHzVPA8I
	1NJYY3ZrUWplsmUMBgaMM5oIjWAqmbv6bw+D733oiiYa1VT7Y1MNltUWI6Mg4gwb4i/YkHdRdb9
	dwOozIL1cwkBZJzUSWR5ZiToVavjc495WrW3zIqSlGg61/Wfw2chdeUP8KliRS1M1wMkuJCkagc
	l1RwbI9VZKo=
X-Received: by 2002:a05:620a:4590:b0:93f:2ba5:1704 with SMTP id
 af79cd13be357-9499957e2b7mr413791385a.18.1794998961991; Wed, 18 Nov 2026
 02:49:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117225023.36660-1-jain.sm@gmail.com> <DMY9Q4RMBKLM.2F6A6DVPXCTOH@gmail.com>
In-Reply-To: <DMY9Q4RMBKLM.2F6A6DVPXCTOH@gmail.com>
From: shashank Jain <jain.sm@gmail.com>
Date: Wed, 18 Nov 2026 16:19:11 +0530
X-Gm-Features: AclHuK9Fbf94bhZ0Ylf6POnlloUaZD5LKtE05H2BzWQ6S0Es351CCw68RVTKCWk
Message-ID: <CA+FWx==oaq5LEOOkwSvvwVkSrfq5XHrHSjVapY78EtOd3OgpMA@mail.gmail.com>
Subject: Re: [PATCH bpf] rqspinlock: Reset tail if no waiter queues behind the
 queue head
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kumar. Your version has no violation in the model (the NMI
trylock and AA cases that hang without a fix), and the userspace
replay of the interleaving completes with the lock word clean. v2 on
bpf-next with your diff and no Cc: stable:

https://lore.kernel.org/all/20261118104758.98620-1-jain.sm@gmail.com/

Shashank

On Wed, Nov 18, 2026 at 4:05=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Tue Nov 17, 2026 at 11:50 PM CET, Shashank Mohan Jain wrote:
> > When the head of the wait queue claims the lock and its cmpxchg from
> > n,0,0 to 0,0,1 fails, it sets the locked bit and waits for node->next,
> > with no timeout. The comment, taken from qspinlock, says the cmpxchg
> > can only fail if somebody queued behind us, or if a waiter set PENDING,
> > which will then see our tail and queue behind us.
> >
> > In rqspinlock that waiter does not always queue. After clear_pending()
> > it goes to queue:, and two paths return -EDEADLK there before
> > xchg_tail():
> >
> >  - the trylock fallback for an NMI waiter whose per-CPU node is busy
> >    (in_nmi() && idx > 0), or when idx >=3D _Q_MAX_NODES;
> >  - check_deadlock_AA(), when this CPU already holds an entry for the
> >    lock.
> >
> > For example, with the queue head H alone in the queue:
> >
> >   CPU 0 (H, head)                    CPU 1 (NMI, idx 1 on another lock)
> >   reads lock->val =3D=3D H,0,0
> >                                      queued_fetch_set_pending_acquire()
> >                                        sees tail H
> >   try_cmpxchg(H,0,0 -> 0,0,1) fails
> >   set_locked()          -> H,1,1
> >                                      clear_pending()   -> H,0,1
> >                                      in_nmi() && idx > 0, trylock fails
> >                                      return -EDEADLK
> >   waits for node->next ...
> >
> > H now owns the lock and spins until another context queues on the same
> > lock. For a lock that is rarely taken, such as a hash map bucket lock,
> > that can be a long time, with interrupts disabled, so it shows up as an
> > RCU stall or a hard lockup. The same happens on v6.17 and v6.18 for any
> > NMI waiter, as the trylock fallback was used for all of them.
> >
> > The AA path needs the interrupted context to have taken its entry for
> > the lock and not to try the lock again, so it is much narrower.
> >
> > While waiting for the successor, reset the tail if it still points to
> > us, as the deadlock and timeout exits already do, and keep the lock. If
> > the tail has moved, a waiter has done xchg_tail() and will link into
> > our node, so keep waiting for it. try_cmpxchg_tail() reads the lock
> > word first, so the loop only adds a plain load while a successor
> > finishes linking.
> >
> > Found with a TLA+ model of the slow path. A userspace port of the slow
> > path, driven through the interleaving above, hangs without this change
> > and completes with the lock word clean with it. I have not reproduced
> > the hang on a running kernel.
> >
> > Fixes: 0d80e7f951be ("rqspinlock: Choose trylock fallback for NMI waite=
rs")
> > Fixes: 087849cca31d ("rqspinlock: Precede non-head waiter queueing with=
 AA check")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> > ---
>
> I am aware of this one, but I don't think it's that serious (of course, n=
eeds to
> be fixed). I was going to send it in a couple weeks with some other chang=
es for
> rqspinlock. For the next version, let's drop Cc to stable and target bpf-=
next.
>
> How about the approach below instead that I have? You could check whether=
 the
> violation in your TLA+ model goes away. The benefit is that we don't pena=
lize
> the loop that waits for next, for this very rare condition that is not li=
kely to
> be hit.
>
> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 111ec80ea958..f6a938ee7ab4 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c
> @@ -624,20 +624,23 @@ int __lockfunc resilient_queued_spin_lock_slowpath(=
rqspinlock_t *lock, u32 val)
>          * Otherwise, we only need to grab the lock.
>          */
>
> -       /*
> -        * Note: at this point: (val & _Q_PENDING_MASK) =3D=3D 0, because=
 of the
> -        *       above wait condition, therefore any concurrent setting o=
f
> -        *       PENDING will make the uncontended transition fail.
> -        */
>         if ((val & _Q_TAIL_MASK) =3D=3D tail) {
> -               if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKE=
D_VAL))
> -                       goto release; /* No contention */
> +               u32 new =3D _Q_LOCKED_VAL;
> +
> +               for (;;) {
> +                       if (atomic_try_cmpxchg_relaxed(&lock->val, &val, =
new))
> +                               goto release; /* No queued successor */
> +                       if ((val & _Q_TAIL_MASK) !=3D tail)
> +                               break;
> +                       /* A pending claimant can abandon before publishi=
ng a tail. */
> +                       new =3D _Q_LOCKED_VAL | (val & _Q_PENDING_MASK);
> +               }
>         }
>
>         /*
> -        * Either somebody is queued behind us or _Q_PENDING_VAL got set
> -        * which will then detect the remaining tail and queue behind us
> -        * ensuring we'll see a @next.
> +        * A different tail proves that a successor will publish node->ne=
xt.
> +        * Preserve pending while installing ownership; a racing claimant=
 may
> +        * still be undoing its speculative reservation against this queu=
e.
>          */
>         set_locked(lock);
