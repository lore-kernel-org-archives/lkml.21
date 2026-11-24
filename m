Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542568;
	b=SCuvDfy3ozwVGOz2kkJ80GL39uo/COT5Ulns2OR1hLgl2aBrmHfuV6//oC/1D7X+PFQY
	 UAPCRYSRW3aZL2nQGlVMLTx3Aq+UqIG0gJZzzwDYmKy49xh3+6gG7VZt7y3NrfM7GaiyC
	 cr5Kq5iLvRBWn5+RsaoJVLDlT3XJZM1mNYEErp91Nw22ehs+i9eci4mxl0C1kNWa0AUIH
	 L7qtmf9kteoVuLsCiJBTKpwZpKwPN5WeYhWNbpz9Q71IiWPGBNogiz8+9tCSSOJSCGMyo
	 9lsKFwf+4I1pp5Ay7WklOUGJ7V/3OXLtcWFOtyfpJsjkXKNxMeuCSmrxhAEwzEzrulQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rZpsKsMasCu0VG55k4IFjBDsARDNBPmeWnpoFmnC3rQ=;
	b=nbS79qBRwKwDg/ny7FIeqpkIx6tHRYwdG3ueJP1hPODvbHWgncJxw9NqCAKefheGVBm5
	 n2y7Enqr/DK0EwCBvMewHI6HPrVKkVSOtDl+F4vB0lcTfzLauMQETI986rDH+u0kJQe5a
	 k8aKDHR/xhcJTn+LRNaAiAA3BRwbYaEATvlw7n80tLS0vtv/2nxQY3EfnaWcREH+YJuYn
	 mmGrNtYxe/cNQ6AW1Auf5Ktz8YY2KpHcnLij4hcQAaJOyEdpT//1RnIPyFDRR6ZO+JdT+
	 JLtgPsR+mcS97BIb96EeBc67HzLrse5HueonFsteUaWbnULYJyT5APEr36td0T7b2xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e7UYrUF4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E43606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E43606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e7UYrUF4
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so983141cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795542567; cv=none;
        d=google.com; s=arc-20260327;
        b=GpnXXFsx28DupdUzFeL782dbgk22EK92VntxsMWK4P6GopGXRBzsAHZCFfTk1S0x8r
         bevYlhUZjO8AZt6CUrGiXyKxbggIJ3RG/qOb/SdvQoA3RSkkBjeiRdvvaUvS+6clJgkE
         lghvpoGMcl8xRne/E9+Ww1du52yD28xsDgWKfqktqLt6lPlFY2YvmQo1ozpBKeVJZvYu
         8emPj5kmcUtk5VKx6IHhoE0h8nsRgTxWCVPu1MGAkNHqX+ZiYzffHJcHwe446NoBvCf0
         ymJ0oKsBpVRc9CDavrEoiT49L6ReBTwi/hgrjTvN/oI5WfLUCq2uqZeWE+KgdV6kS+n4
         vB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZpsKsMasCu0VG55k4IFjBDsARDNBPmeWnpoFmnC3rQ=;
        fh=OIrSq1QblWwcvRHXojMH0ZrOBQjyzbtMWUkvQrv6ubs=;
        b=ThZ7qeol/Idv5bUUoGImK7SI18lOA05uWqOibPdHiwxoAF6y2Sa+UQKt65E7e96lEU
         jd1pZW3pdpTKYb4FCneQqEeoG8IXVeycbh8hCjeZUgBXb9TyG74qr/8wtpL7sS8A8srS
         ZnyRlDb3IB8bOiRhloXEs9uvEU24jVHIGoTvdCZuUDFgRxmWjhC4g0yETwp8AfIa+mye
         fWXO5S6H9aySXM8QrFiuL64rng88hEW7ob9tbFwqq8QdzyvlMuxIFv5VDgtGXE6u5zWu
         abbDOwFaA0qIlAELBE3frKBH8olfKiCgpI5Yv7OU6al7VwptWaIC1QuXzs9E23BGd58g
         k7wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542567; x=1796147367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rZpsKsMasCu0VG55k4IFjBDsARDNBPmeWnpoFmnC3rQ=;
        b=e7UYrUF4nKBxaC4jgXXgDe3ZHrbdY4HWtnith9cwWZ5pPz2rLq2vrIC1LAn7Bqtsn+
         qRPXxsQL6IUeSY4EqKzAPkao+gInkgCliPsaW6eapl7cul2FUcBTg/EkOYIKRYDSj4P6
         M0w2/jLe0ObjVWu9Vp569S59fawsJ6IhiF+k1yRM1qhp6QRb1EGhBuNgrjdYc4IJ3nys
         n30s4RRkTEzz0BLshm2yaYf9HGiI12deEVOMMk/qcTkCr6vxyvy+ajm/2kcPSMgGpiAz
         x9uFRLvarokBWXFGSJ6NWWFAY57w03jxyEo90ZmKtqp+G1R9VhLof92MbJKOi4LuM17q
         lN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542567; x=1796147367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZpsKsMasCu0VG55k4IFjBDsARDNBPmeWnpoFmnC3rQ=;
        b=FUA4JmI/NzSLtKHcX2EBUtrmxaC2qdfcTZ0MTw05eXe6iPsL+F8Ql51GRcLSf/q5Ir
         1DgC0XRuey3R0XPl1Bn8kESYSN2aAu1o9zkqOvx++22Wb5pbLLLwkL9AHD0QXOE2uy0C
         CtftTJ8Gc78ml1KHijZfueTAUIx78xqGRp80WsWRihViWtnZ2QMoCtLNas6pTFTh8Xp0
         MNGATo+qWmXufT70Ikk6MDP8UjcuGtkIDYuUrrQhNP8a3Mi1PcyWS6aSWVMH3fbxyoFQ
         k0fhp74WK8wjNfzVxG9NAJZ+gnR/abRrU5YqQ51RqEmPXINFeff6pQay7fWrUTc46Eif
         ev5g==
X-Forwarded-Encrypted: i=1; AL+hErEyvcnmU0kZipqYLbbrPwhpQUuzg+cjT63T76Lh19enejt4cmi6zzl6QJHW7R8Nf7exg6E2CJV77LW4SDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8duIcNXu/LvaETQ7vONyuF7ohJM5UEEV3mPBL6teeHS7gk8P7B
	d7sJOYnUFVKQBF07ewYAznGQiMQ8hM9w8KVvNkivEbIEWFGSRetPdNMvpLsOugm3ER1ZkOtvwwh
	Wyh7gB0bQyxbzPv1le/ROL8uAv3kUZha0DN2cDijy
X-Gm-Gg: AZFdTZcS3SArNZnxxtVZEwgOLCR0lZ1GFNbpJUeXjZylWg9UB7v48o60ZKDwLH80y14
	CSiBcMwwyFMBMZ20y6ymu4f9JoOikN/J2EbTLqBEhuOu0zau4HnhO65krAuIRSFKaVDFkOOLOAL
	0k3xAxKqwbJ06r7/HX2qJ1ux5ju4A5J5qt2sJ4EgpKhy20z+SHKPVBeFoTVuixQ5pzkeez60ul1
	Pue7ZijoYHQLRlI8VRyW7OaUrwkhmWiX/MXRDRei/sZini/NrzNKm2ivst149PsFu+xZN6NlDq5
	uhEie8go+/2p3YOvB7YZiIKdWO2b6ohmeevA2uKUthuxdQ8vE9nY0Jf/YinAewwVOp66QliVN3B
	ZB2Mu3IRCLD+NLxvls6EyElzYqDUMBNHPfW1FrwWihZKj/UmgfBVz2LCAD6vaR7b5Z1EflzjUlV
	Z/GD5yJTXvRjYaxzlZipcUOLYxnMwPJZVF0y9LT3rpw/g5L07L
X-Received: by 2002:a05:622a:1f14:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-55d890663bamr62644371cf.12.1795542566115; Tue, 24 Nov 2026
 09:49:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-vma-read-lock-mmdrop-async-v1-1-257f99f551de@kernel.org>
 <awWLCZ-jBjSD7V3M@pedro-suse.tail5790ac.ts.net> <CAJuCfpGk6eYK43Unxo+O4ML5=GM_siZ9owp6oa9fO0ipZXVg-g@mail.gmail.com>
 <CAJuCfpEd1rz3P7fB7W_mHkyzbpq9TscRE+QNwvHdYME=WJj6cw@mail.gmail.com>
 <awWz3nc_b8x3mIXq@gremlin> <CANk7y0gAxY18Ew+6j5YsqrOsf5Dx+v5M78r7_8JLXh5RHZj4qA@mail.gmail.com>
 <CAJuCfpFuDCUPTUi3SuAhmbtw5tubRZ0+YEY3PotjyJ8Or8pdQQ@mail.gmail.com>
 <awXHR007d8MlhJUC@gremlin> <20261124093328.3ba2e066e5d5081c69e0e667@linux-foundation.org>
In-Reply-To: <20261124093328.3ba2e066e5d5081c69e0e667@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Nov 2026 09:49:13 -0800
X-Gm-Features: Aa3M54rJtgRgH_rcKNgpafDHAbKng8SpV3uhoRslOvIjTwkRWkSfaO8JY91K7G8
Message-ID: <CAJuCfpEmFEX5iqLw_c94a97rVrC+xBWpKnO4rVpeDgkUfAPq7Q@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: drop mm asynchronously in vma_start_read()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, 
	Pedro Falcato <pfalcato@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 9:33=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 24 Nov 2026 17:23:35 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.or=
g> wrote:
>
> > On Tue, Nov 24, 2026 at 08:34:40AM -0800, Suren Baghdasaryan wrote:
> > > On Tue, Nov 24, 2026 at 8:06=E2=80=AFAM Puranjay Mohan <puranjay12@gm=
ail.com> wrote:
> > > >
> > > > On Tue, Nov 24, 2026 at 9:28=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@=
kernel.org> wrote:
> > > > >
> > > > > On Tue, Nov 24, 2026 at 07:51:42AM -0800, Suren Baghdasaryan wrot=
e:
> > > > > > Actually, VMAs are allocated from a SLAB_TYPESAFE_BY_RCU slub. =
With
> > > > > > that RCU unlocking move you don't need other_mm copy and the co=
mment
> > > > > > that comes with it. VMA won't be freed until RCU lock is droppe=
d.
> > > > >
> > > > > Yeah but they can be reassigned? They won't be _freed_ until a gr=
ace period but
> > > > > they can go back to the slab and then allocated elsewhere  right?
> > > > >
> > > >
> > > > Yes, they can go back to the slab and become a different VMA.
> > >
> > > Yeah, you are right about that. So, we either have to keep the RCU
> > > unlock in place to keep other_mm comment valid (my personal
> > > preference) or update the comment next to other_mm to explain the new
> > > reason it is needed. Either way is fine with me.
> >
> > I think let's just change the comment?
> >
> > Andrew could you change:
> >
> >        * stable and can be freed in the narrow window after vma->vm_ref=
cnt
> >
> > ->
> >
> >        * stable and can be reused in the narrow window after vma->vm_re=
fcnt
> >                            ^
> >                            |
> >                            just this freed -> reused :)
> >
>
> np.
>
> --- a/mm/mmap_lock.c~mm-vma-drop-mm-asynchronously-in-vma_start_read-fix
> +++ a/mm/mmap_lock.c
> @@ -300,7 +300,7 @@ err:
>  err_unstable:
>         /*
>          * If vma got attached to another mm from under us, that mm is no=
t
> -        * stable and can be freed in the narrow window after vma->vm_ref=
cnt
> +        * stable and can be reused in the narrow window after vma->vm_re=
fcnt
>          * is dropped and before rcuwait_wake_up(mm) is called. Grab it b=
efore
>          * releasing vma->vm_refcnt.
>          */

Sorry for being pedantic :)
There is also this comment later on:

        other_mm =3D vma->vm_mm; /* use a copy as vma can be freed after
we drop vm_refcnt */

That should be replaced too with:

        other_mm =3D vma->vm_mm; /* use a copy as vma can be reused
after we drop vm_refcnt */

Again, just replacing "freed" to "reused".
Thanks!

> _
>
