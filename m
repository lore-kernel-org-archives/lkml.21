Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795046369;
	b=ZBfjt+351epxQybiyUQWd9hKtiSaR0rYCK7RfvdQyQ7OVpDriayfydC2pQFjD/Q6T738
	 4nkxs0Q0/Go101s8Ex545x9YWHcONK67VzuQYNQkgtJnF9jCKz7rDMlIQhZb3+pHyRd82
	 FqJNHA7LtJWVAOr71hdv4JGIc7NuX6Y9Haf+YFUKv8BegEfMomU21TWQwjAN9IZ2gUzxz
	 k+wKMbLo2Hx7DLqxTp3qre4ougWcWMQ8yTw/LGLkMJ78a8/KsjJ47yYVcvWZUEexrWriL
	 vSpt/NWn1z6qoXMrlP93AY72B/Y6smLoSlvf9wuLIJxA1oxvrLyeq/ldFc6XAs++v7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
	b=LuA01wx3JZidxxhi0MuzyOXx9t1zZ9/mJ4zO/9Tf3+Vrr2w/yaqsvxBwASk6iOXbPv8d
	 S6ywPAUBA2YQE9i3IaldmYg3f9GOnbLGXZQ8YAYJ5v1qo1i8QyqsBOrhcua1W5LYdpCr7
	 Bh4qcroxuE9CGxZw5w8Nop+9FoU4do/u0WQYA2Npx+zF6PIA3y+wveTi7Eruttfvi7hlg
	 8RmWuSqGrQNombXjFfr0lLxYv/yl4beKTii+zzoaa2jW3E0EeucSm2ttZk+R29DWSZCuz
	 F70+ZveM6i9nT2qV2UP0TJZtaAwNOh1gyWBjN8CRHmskhTOHNra8NfxvwTd/0u8yG2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crosse.dev;
	spf=pass smtp.mailfrom=crosse.dev;
	dkim=pass header.d=crosse.dev header.i=@crosse.dev header.a=rsa-sha256 header.s=google header.b=LTwTP1XC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54304606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54304606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crosse.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crosse.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crosse.dev header.i=@crosse.dev header.a=rsa-sha256 header.s=google header.b=LTwTP1XC
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479a959aso1235271e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795046367; cv=none;
        d=google.com; s=arc-20260327;
        b=AN76nrIZQYopl7quqOlBJUkqhAVuo6hgmBa9B1oSxyBvjSFDsmTwAMVFYGBafNAM0d
         2WehYn0GKggAhZTBSW8od6na4cWC/KjfNaqldkeVIiyKi7I/y9qqBqfMwYAv028gClRo
         NVd7ltpYTCO+CkrRsfCVEg5QCf0cmlKtoh0ZHTm1W5QvSrzsyOLGqu8cJh0cKTxfZXOK
         tnda+jcPgH3CZS84pHE8yW9Yf/q91shu8JrrJMs33GSkOLcVv/sfgwke4mbLL45tb9JV
         ctZRRWO53BFFlII5AZpiGxp0Cr/5fjXxQgzgwk69TmU9r4eZIIXoCUy+5ZR53ikqz1we
         3c1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
        fh=5bwaQzsgMyq1+T7TwggdFYI69pdgxdN4wWuvVYx38Oo=;
        b=pih9/BaIIe4e3xiklh+DlOO4+IocyePZ0je0SW5Fr7pvYA8IuoX54DycqnTe8rxu7u
         qSwjN0m1sYjEdTJLaHpFaTlKEySrlWSBi8ETYxz4//pHRJXUl5csOzIGQITui6fNSNhJ
         jx3Ua0qQ1T5xAQOBhy5wIKtTqH+yrSDoeXZeEkzB0Uu1kQrkVOIVMP++beMJzmmEOHuW
         bTZtHgN60hlwqUyPw1Vbu55v1+R+aG5hYBSJm3YdK6Ygl60Io2s2bBv8CqRIXCqaffa+
         WeG5hONb795/N5ff+VJ8srIplFvKFbU9heChC3nRdQJAka4vav219OeOKTpPlrhZK74Z
         DxAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crosse.dev; s=google; t=1795046367; x=1795651167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
        b=LTwTP1XCBdKUZG4tfRx5wu4oUSByB7xTmM/n1Q8XIc0hQR8QE2hdg+rfBBDhF/eA0V
         iw7ZxjM3xQuOqYSkpaGatIzPD8HZZ80rLBrykozLkXddarwEtW3/YMyRlM3D8h1TqRgb
         iR/K44rgcU6P9QVgvvGwwgJEP5fGU27fYldrXpacoMjmUhzMrHG4b39ain/oV2x+2pvO
         fOp1zDPrICIi8ISvwZhv8KYNFpserQpR6Dtn1JAZZVuqhFoBX/ADF3q8FCZkLtuvHlCx
         TavY2I8r7iKpl+lQCUNOo1/YFUE9XUtHzq/Yi+dSmDd9/hrva4MF2S833V4E5N3KD9WY
         LP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046367; x=1795651167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
        b=rHlzA0Q5cMhhvWb1T768SCoheBgDl4qWb/TPRsdp69+eeG1NXADjIZfQ++T5up9Sjj
         Hh8RTXPWw/tpG2Qvd2u9fu6Xok5qOyh4gYgDmfBTfFJ0kR7H7jwaR0u87W0HxWAyI8sy
         rxWrMGpjt1oFr5z5P4QZ67W21So3zO5vKo2Y8mZ/NetfxQk50vY7PbqSVKPDCXg9WJCP
         eRDfg4go/wxYM8VchytN7WxDnTIyNj/ZPf4hSrozkMZvYDsZNzyddF/tZI1rKpwN7ibu
         z0QCC6fpCaOFepK3dZiAnlczczhI2askheTgDOi2sJ/Y18EkH4hhWvKQ1hAHmyNy3xhP
         jwlA==
X-Forwarded-Encrypted: i=1; AL+hErEqllrd/P0lDkHouuWoIHGb3BbJ/XCnBN+qss1Dy0C28+0E89plJXZGfgZRkhg+PFvAP+wTnUkmhAc9ngw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sW7NPNjXWZxRbUJW99cJtbW62rfBce7b/kinJoHUuPoo/K6tw
	fQPNdpES24LNK81UaeGQ9bZ4mwaavzm6OHgA8SRxUjmbhZNhOhNoNqQV7X0MO3pcrsineSHPPeb
	DLIgQUyxnu9mAV09CxmqfWhWDcSNEyDibsHUlpFkhBg==
X-Gm-Gg: AYBFou3H69gHTtSYW+vT/O6ynB2MJl2diAsW/juCP0e4FupU3M2CtqgebBEZjXm/7vI
	3KP8azfmHiVnIE5I5QY/ELvq5IyLDiHzrsHCVRrkPLXefIZic7ce2a7DH0LCGQS2cJYKlbX8/Ik
	BETjVvz4Q0Eqn0yYgFqpK06APfkZXC/i87PTpAQQGZDWlSVw7qqPXoIKigMo/loKxlMosbfZIeb
	XJYpZvOXWvlvtuwSJENLscADt4seeZnKZEltDBaus7ORXOUNCjrcc5A0QTLeMD9M2rkbxwSYfrs
	+r4qm4v2vB2xTLwoM7ll1JBaSs2v51x0K/8nbcmDGKdD4/CWtrLlcaI1tWsjphZCcIPQ87LaPvZ
	rRCFecvmQz1Nc99QB8tiRgv3zYnC/G7wROZJt
X-Received: by 2002:a05:6512:10d1:b0:5b8:f81b:dfea with SMTP id
 2adb3069b0e04-5c1aa2ce5d9mr1273317e87.62.1795046367239; Wed, 18 Nov 2026
 15:59:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-mmpop-populate-v1-0-9c561d178d11@crosse.dev>
 <20261118-mmpop-populate-v1-1-9c561d178d11@crosse.dev> <e32482de-295a-4e26-b6ae-5b8b58f8b98c@kernel.org>
In-Reply-To: <e32482de-295a-4e26-b6ae-5b8b58f8b98c@kernel.org>
From: Harrison Crosse <harrison@crosse.dev>
Date: Wed, 18 Nov 2026 18:59:16 -0500
X-Gm-Features: AclHuK_1VAQDAg1dH3obLDVFJKWckiVyn_K5qUH1FINUpBm1FFDjoVLIC7OItpA
Message-ID: <CAAFYBzy=Rf+gtYBkHfR9MpmakDrZBpOEfk-rLxUtRo7RfiFy+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/gup: make mlock() and MAP_POPULATE handle
 VM_FAULT_RETRY properly
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jan Kara <jack@suse.cz>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Let me take care of this (or find someone more familiar with that code
> that can help).

Thanks for taking this over David!

Harrison

On Wed, Nov 18, 2026 at 6:25=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/18/26 22:56, Harrison Crosse via B4 Relay wrote:
> > From: Harrison Crosse <harrison@crosse.dev>
> >
> > If every read of a page of a file mapping fails, mmap(MAP_POPULATE)
> > and mlock() of that mapping do not return: the task spins in
> > __mm_populate(), submitting a new read of the page on each iteration,
> > until it gets a fatal signal. Touching the same page gets SIGBUS, and
> > madvise(MADV_POPULATE_READ) fails with -EFAULT.
> >
> > The first fault on the page reaches filemap_fault() with
> > FAULT_FLAG_ALLOW_RETRY and without FAULT_FLAG_TRIED. filemap_fault()
> > releases the mmap_lock to read the page and, because it released the
> > lock, returns VM_FAULT_RETRY before it looks at the result of the read.
> > It cannot report the error then: a fault that has released the lock
> > returns VM_FAULT_RETRY or VM_FAULT_COMPLETED, and neither carries an
> > error. faultin_page() turns VM_FAULT_RETRY into -EBUSY, so
> > __get_user_pages() stops at that page without an error, and
> > __mm_populate() calls populate_vma_page_range() again at that address,
> > again without FOLL_TRIED. The page fault handlers and
> > __get_user_pages_locked() retry with FAULT_FLAG_TRIED instead, and on
> > that attempt filemap_fault() reads the page with the lock held and
> > returns VM_FAULT_SIGBUS if the read fails.
> >
> > Commit 631426ba1d45 ("mm/madvise: make MADV_POPULATE_(READ|WRITE) handl=
e
> > VM_FAULT_RETRY properly") fixed the same loop for MADV_POPULATE_* by
> > calling __get_user_pages_locked(). That does not fit here:
> > __get_user_pages_locked() retakes the mmap_lock itself and carries on
> > with the GUP flags it was given, while populate_vma_page_range()
> > derives those flags from the VMA that __mm_populate() looks up again,
> > and may skip, after each unlock. Retrying with a NULL locked instead
> > would drop FAULT_FLAG_ALLOW_RETRY and FAULT_FLAG_KILLABLE, so a
> > userfaultfd range would fail rather than wait, and folio lock waits
> > would not be killable.
> >
> > Instead, have __mm_populate() remember the address of the page whose
> > fault released the mmap_lock. When the next iteration starts at that
> > address, fault in that page alone with FOLL_TRIED, as
> > __get_user_pages_locked() does, then continue with the rest of the
> > range as before. The retry reads the page with the mmap_lock held, as
> > filemap_fault() did for a page that was not uptodate before v5.1, and
> > as the other GUP retries do. With a persistent read error the retry
> > fails with -EFAULT: mlock() returns -ENOMEM
> > (__mlock_posix_error_return() maps -EFAULT to it), and MAP_POPULATE,
> > which ignores populate errors, returns the mapping. A fatal signal
> > still ends the loop, with -EINTR from __get_user_pages() or, if it
> > interrupts the FOLL_TRIED read, with -EFAULT. The other callers of
> > populate_vma_page_range() pass a NULL locked, so they cannot get
> > VM_FAULT_RETRY and are unchanged.
> >
> > Reproduced with ext4 on dm-linear over a loop device, with the eight
> > sectors of one page of a file mapped to the dm "error" target, on arm64
> > (Debian's 6.12.116 and v7.4-rc3) and x86_64 (v7.4-rc3): mmap(MAP_POPULA=
TE)
> > and mlock() of the file were still running in the kernel after 5 second=
s
> > and ended when sent SIGKILL. On 6.12.116, the block layer tracepoints
> > showed about 280,000 bios a second being submitted and failed.
> >
> > The analysis, the patch and this changelog were prepared with the help
> > of an AI coding assistant (Claude).
>
> Yes, that's rather obvious from looking at it, thanks for documenting tha=
t :)
>
> Thanks for the report!
>
> [...]
>
> > +              *
> > +              * filemap_fault() reports a read error only when
> > +              * FAULT_FLAG_TRIED is set: on a first attempt it release=
s the
> > +              * mmap_lock for the read and returns VM_FAULT_RETRY what=
ever
> > +              * the result. So when the last call released the lock at
> > +              * nstart, retry that page with FOLL_TRIED, and only that=
 page,
> > +              * so that later pages still get a first attempt that rel=
eases
> > +              * the lock for the read. Compare the address because nst=
art
> > +              * moves past that page if it is no longer mapped, or its=
 VMA
> > +              * is skipped, when the lock is retaken.
> >                */
> > -             ret =3D populate_vma_page_range(vma, nstart, nend, &locke=
d);
> > +             tried =3D retry && nstart =3D=3D retry_addr;
> > +             ret =3D __populate_vma_page_range(vma, nstart,
> > +                                             tried ? nstart + PAGE_SIZ=
E : nend,
> > +                                             &locked, tried);
>
> Yeah, that's quite the ugly code. Let me take care of this (or find someo=
ne more
> familiar with that code that can help).
>
> @Yeoreum, do you have some spare cycles?
>
>
> --
> Cheers,
>
> David
