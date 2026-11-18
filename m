Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795010141;
	b=MuKe/0cHy1qtFdbvQJsl+Qk9W3al1kRcFentiGJXxFzQz966uezbh07c1OLoktkkIxBm
	 BXK5hCEUiKsKtW4/ZcRcSd8h7wW/u58VDvUfR2iUigZMzH7LW+yJ+xdzJWXYTsOyzMOmR
	 URYrtXOgG6SHaZ5zMgkciIs3/pbDXg+HfAcirwEuDwnCDAfI113k2KjvYrStUIjR6oK34
	 o9mb1weOO/F2ff2JI3Hp2yQYb2TWcZJw4ucTRILavngPX09i2pOYtJaSe3J+bsJTDMht5
	 ZPRc+zoxBMIvwrvHr/xgTBlSYE82Ru16v83IyTxqxLrSER47nQrJwLALQjDNa5UBieQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010141;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
	b=hRmLVBDbJN3JFLaHArDn9oKJ8nn1rzq+GfWbHFnq/H/Spi43e78m46wrHbhIPyZKoobh
	 HM5Ox1wP09+ONmg4//xvJTJPfIDYTyiRdyyuKP5iTzQTJ+/Lb6cjYtEXD77fiT/dxvRvJ
	 rKiWwF6Ny843qQTfK4IL1rqCTb60A4Bl4P2hrcmT3IHDXwkn/4R1n3XnJ2WQQ27iAuC9w
	 hHt4m19sLY9f1Rbk4JzeA9Ob/E76XkZ1hTHxeIeNuHb/qK8Stm/BWA3DGLJow4GgsxPbK
	 kQaRLNlZOnXhz05+A/wfkN+yC21mxgqFPCdm69SY/39gSA3AwiLqi1VuPIQOTNZeYjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fo+xlKme;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YdeGXNs/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B3606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3B3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fo+xlKme;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YdeGXNs/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795010139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
	b=Fo+xlKmeqSf/JQbAa8zOG/gTkvaio/ifFqWbZtDL2AJXX3E8bfj+fd6RZnYTEceUtuuvHB
	HImAn/70mucSumF6L+2i+AFQoXBIvriUHhalv3zz1ePobrbMF+OjYo9hj2waGf9S3eGgWQ
	jU/HxtWqkkXBjIWKPfdVcl1iSWgyULI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-vT4GaLWKOy2SqSk9zZyNoA-1; Wed, 18 Nov 2026 08:55:36 -0500
X-MC-Unique: vT4GaLWKOy2SqSk9zZyNoA-1
X-Mimecast-MFC-AGG-ID: vT4GaLWKOy2SqSk9zZyNoA_1795010136
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4dca1ef03so12830327b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795010136; cv=none;
        d=google.com; s=arc-20260327;
        b=kW5eMKIthVnozjHjpFoCqBzKisyDr8Nh+vES83SCm+MPhcXGlR3wCAkupIkANBveb5
         JjAGlaU5YxeH+lL2wceYUzmITyC1EsiTRvbIj25/TexmHTV9V+YtbxvNc1O4UQho6LZv
         8q8pgheGetUWzYZ7sLXLQOul8Ti+F2VeMk3xNNUZpLGF5ygI9tu7AYZzhe6uQpfWt2gL
         WQX5Dzkxu/znFA8a6ozPtATDqojPh1njszrU1SwChxTSu5NnXa0kFAsxmXmzq6xt2+qT
         MQC8ougDqhPBrEgiBG0/5zPH+nYLkbPwzNfj/3BRBlw/VejB3Is2SVy5h05hLRhRvefl
         nxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        fh=PKhB+DqZEuHSSIeB52EXnErt6eWrOAbvefxlkBCnoyM=;
        b=SYUSASAtUkC68Bp1m0fuGESSAjAFcchtvP7NaeM81pm9YE5qIR4E81fqiW54t64/cp
         yE8Na9TPkNJn2Ni45euPtMyAEMakEmYPzuzbb849jhCDZheviFdFZlJCSbZhoTUK526s
         rzlcSmlNF7q4vPPDqfIYvRJzxu93N1jMFbkNjsnwxD3lsSZ9iMCT/PnsyxSJneS4bx+Y
         Z2R1diG302AH/F7nprJ0CKFzoCEtp6LDnghnr0Xcq1LhsmpZaFGBizbyPUlCnOsicsK/
         jkOOTan2MhO+ua4iGoqnw2pgmtw0e1XZ2yhk1WzGmyPs+7chkh+QK8RGxGb5M0MCK7jx
         asaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795010136; x=1795614936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        b=YdeGXNs/g+hxp03HRbQSUUfYwpG+Q463Psgnm5pI6nowFTE0GT/AT+9Eba8UqJXu2F
         Rjm7s6KZtfcTE+jLnJqY9Yha9DiDRbhjBVk9n/zG7Tl/p4QVD4cOVryiVPrvuioWjJ2V
         kC4s94SucOy//FSYm1394CoCF5UK5zXU1gxH2PfPcfRIkd2mTJdDSJhVy7FSL4lT5EZc
         m+HBczANYjijzYP43BM9ZWyF2lkON43QQgIwWQhgllRW+41fvFVuY2rQaXLV1H9y0Dqo
         Sq+5Nt2E0oRySNF5RHc6s28Fs0dEBL+ug6DeSjIEnvBqVwZGg+FdASv6oArpfSCSBBSS
         kWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010136; x=1795614936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        b=kr3AXXTbxpIRhOXQpznX4t+QgnhpdFvUFbl15h/PtpPGCw0rqDnj+iTcf7b32IfXoe
         NHD3gE43tL1PF8HA4WnnH5KvFAH3URiwFQRKcvFa3RJIam9LFZ6LKRKLRyq83EkDyWtt
         +C1FJNLdWx5IrbfEExDIJTGexg8vj7XVNUZ/xZzKDG1+yMTeHUKgSOfqzrjKyZBR4Zbm
         wAQn1cJWT5I1BEu5kRvnb8sOD+z7ZTYcj1oGppfmuC3uK59k/X6wPtiXvSAs8YqlmSjy
         41D5iwmI82yJvVyg7PhcK21UXtkGFWv7Iw6wvT9dCGc18qYvFMJCOljKSz2vlr5Tlin/
         EXfA==
X-Forwarded-Encrypted: i=1; AL+hErFYMJY+9t5qUzS39UhisALIJUTwjA0U8Z4Y9D6eE/iB6MmXqswz4D2Jm1HarhOJTiMdaXBYvm30xFgcm3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u+ypkTKT90DwofSjguC30vXGCaQb0J9Vf05UpFZUV0r9tm3cl
	48JY8Ivvq/uB3FjGoj4oJ/f+db6A2G+CtfZqppBAaeE9VA8BvK5eQ9bhZ/poZxzuuZYukkUVPzi
	nPBqTnnAq8LygUD8EH0Au5/vjTuxd6wBX4DToKkF43u+33Qth/Q5rh+pkLCERIMSDWdtHLFt7AE
	XulVaswRpehQhnIMQg9/+0xRbyb7uJYQdM4hzFK1Np
X-Gm-Gg: AZFdTZc8cHIEsO+nODwxcKIX/u3D90J4OOM9HqI/sYf8wHArBJG8RE0xwGoP5Rr3f0r
	hXjxQg9l4uj/pdLTtcv3EJev0PV4B2bnhyCJRHXyLyOpxtDA1Cjp1Di7qrRW4x8TMwZ0Z18AVTz
	G6pDjaZFSm/X/z0ZCtshVquvXo1ArxpOuQPh827hKdeuL8PW8e0JJ4WUP+
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id 956f58d0204a3-67dd3fdee8amr1338610d50.55.1795010135890;
        Wed, 18 Nov 2026 05:55:35 -0800 (PST)
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id
 956f58d0204a3-67dd3fdee8amr1338592d50.55.1795010135440; Wed, 18 Nov 2026
 05:55:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-v2_20230123_tjmercier_google_com-v5-4-1ce975f2a9ad@redhat.com>
 <44c0c45c0e2f47ed77bc45be47ebb3fb@paul-moore.com>
In-Reply-To: <44c0c45c0e2f47ed77bc45be47ebb3fb@paul-moore.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 18 Nov 2026 14:55:24 +0100
X-Gm-Features: Aa3M54okPSWfJ_g3ixS3iw1yy5owTDFGTKhnOXZ64bND8Gaqu8R-9XYtSNGyOOw
Message-ID: <CADSE00LVsFVOmezzLgPrPWDd+L+SSGzGvqKTiX25waxRnVPh9Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] lsm: Add memcg_charge_task LSM hook
To: Paul Moore <paul@paul-moore.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, airlied@gmail.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	echanude@redhat.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Nov 17, 2026 Albert Esteve <aesteve@redhat.com> wrote:
> >
> > Both DMA_HEAP_IOCTL_ALLOC and the new DMA_BUF_IOCTL_XFER_CHARGE ioctl
> > accept a charge_fd field that, when set, causes the allocation to be
> > charged to an arbitrary process's cgroup rather than the caller's.
> >
> > Charging is currently limited to the caller's own memcg subtree unless
> > the caller holds CAP_SYS_RESOURCE. But the capability is all-or-nothing=
.
> > A process holding it, along with a dma-heap device node or a dma-buf
> > fd can charge unlimited memory to any other process's cgroup, potential=
ly
> > exhausting that cgroup's limit and triggering OOM kills independent of
> > the victim's own activity or privileges.
> >
> > Add security_memcg_charge_task(), called in get_obj_cgroup_from_fd()
> > when charge_fd refers to another process. The hook receives
> > the credentials of the allocating process (from) and the credentials
> > of the process whose cgroup will be charged (to), giving security
> > modules a controlled enforcement point for cross-cgroup objcg
> > attribution policy.
> >
> > When CONFIG_SECURITY is not set the hook compiles to an inline
> > returning 0, adding no overhead to the fast path.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  include/linux/lsm_hook_defs.h |  1 +
> >  include/linux/security.h      |  7 +++++++
> >  mm/memcontrol.c               | 11 +++++++++++
> >  security/security.c           | 15 +++++++++++++++
> >  4 files changed, 34 insertions(+)
>
> ...
>
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 03cd90d5e623..2e6fcbe14d43 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -60,6 +60,7 @@
> >  #include <linux/lockdep.h>
> >  #include <linux/resume_user_mode.h>
> >  #include <linux/psi.h>
> > +#include <linux/security.h>
> >  #include <linux/seq_buf.h>
> >  #include <linux/sched/isolation.h>
> >  #include <linux/kmemleak.h>
> > @@ -3198,10 +3199,12 @@ static bool mem_cgroup_may_charge(struct mem_cg=
roup *memcg)
> >  struct obj_cgroup *get_obj_cgroup_from_fd(int fd)
> >  {
> >       struct cgroup_subsys_state *css;
> > +     const struct cred *tcred;
> >       struct obj_cgroup *objcg;
> >       struct mem_cgroup *memcg;
> >       struct task_struct *task;
> >       unsigned int pidfd_flags;
> > +     int ret;
> >
> >       if (mem_cgroup_disabled())
> >               return ERR_PTR(-EOPNOTSUPP);
> > @@ -3226,6 +3229,14 @@ struct obj_cgroup *get_obj_cgroup_from_fd(int fd=
)
> >               if (IS_ERR(task))
> >                       return ERR_CAST(task);
> >
> > +             tcred =3D get_task_cred(task);
> > +             ret =3D security_memcg_charge_task(current_cred(), tcred)=
;
>
> Do you ever envision this "from" cred being something other than
> current_cred()?

Good point. No, I do not.

> If the answer is "no", we might want to consider changing
> the LSM hook slightly to help prevent misuse in the future:
>
>   int security_current_memcg_charge_task(const struct cred *tcred);

Agreed. I'll apply the same to the cgroupfd variant for symmetry (its
"from" is also always current_cred()).

BR,
Albert.


>
> > +             put_cred(tcred);
> > +             if (ret) {
> > +                     put_task_struct(task);
> > +                     return ERR_PTR(ret);
> > +             }
> > +
> >               rcu_read_lock();
> >               css =3D task_css(task, memory_cgrp_id);
> >               put_task_struct(task);
>
> --
> paul-moore.com
>

