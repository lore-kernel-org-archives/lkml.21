Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961447;
	b=YOApjW4f6EJY5hmBlOfkfrKlUkm1PRV4r13ZvathGLYihofSHhMQsg0Uu0rxt6xZldlD
	 xHZm9nIrUmlwoqrsnJd81dvj2EQ/6anOvxpUZB4oq730gatLIM0PuByTYiSgSUoq9XnRx
	 +3TFyMOHgucqVAVkF+FoCJIl+IHcvVkDx/2l+jTnvWfLPqBUzOrbwv2hKZx6bnfg/kXQs
	 3Lu805KdTWMRxwCpFjaxtzuWlLVljWHYB4cLCyZntw0hhAcUbFIglqrpfLIQ0h6ZLCx47
	 GM8ml0eC0o0P1hpJ1jigrRt7kOqvQxHC1WTHrf8oon0z8Wwdk+kSHSlpiAA8O/25EDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961447;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u6oWx1ny/i9E9ms2J0GDi4d3fbg3mrPP6JGKuvrVaXs=;
	b=r0IdfYJwRMzKu08mThurD2tdDT3JzZl4JScnX1TVzWP35jPpxPKm0PCu98Ej4pbzp1MV
	 oSFMInuG8y2LH0aQmv13KVrKaeAYWdNxexiYZH6y7q0kzcTbxLLmd1uBGrJvYZnPuJ6sS
	 eh5hUA5TYPEFAT4SkQYK5lA519V4YdJU7xLA8uhbTKcwblvwoJlSglJHamd0IX62fVVTn
	 phMAp4d0jn+3XPwm+iOSi/O0Hx4D3lyuCiC0O1OGbGXN8n4jpxh3LtIQnzomFWTFoc/7f
	 4PiD1v+HIODrYb4ufz0Xmgxc/IkM97RDQlbxHh6NJBqAudBD4wIn9+RfzVsmuA4msUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et9OPNf2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94734606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et9OPNf2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FCE1F000CC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961447;
	bh=u6oWx1ny/i9E9ms2J0GDi4d3fbg3mrPP6JGKuvrVaXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Et9OPNf2+uEThknGo4NZ5p/dqjt9wBSm0zYWdAuk1PpiWLmyvLOUiBpeQYGBBxVgv
	 HxVZW2L/zeqdRGuPQwPAybTFqeFBOyQdEGMjhWOmiVynGBQ/CBM95KJoz1KXo3wOfH
	 VLs3ePMIgImnHtqPlidYtKYhjcHwBPsnoU+d64p166xMXNTOvtbvtm7/Zag6vJqO//
	 9MxuXdB3AYxZU3w81YZLi3hUEGpvjRxTQ2jGVRgLqtLj7b4RjDLO7Ic4BJwsFh7wt9
	 6OtK4xQhc/AMUVa1RCIHj05nHKhXwFnsDb8iG0HNsir8cIhuiAwh1upw/Rsr+wqNmL
	 JQHBvNsCEd7pg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so301202066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:24:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG6ASXrVF1OMzt8LDBqO9XNcyW8O24za4LXZvsa5E8DBu/QUsaBrbW6MOPVvycBQX7Ugk80FXiE1ev9dKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GNB22VZwSlE5C2ZLreOZg7YQiJZ83bjCbvVcMk7CE1sP6im0Z
	U4sVGoldtNoH+e2U8qf00mumfh1XbgqaDSc+6cP5ojWrFMqzU/eePB5nuSAqw6YLQE5/Rf3csRJ
	8imImLSJ9TmdLkZkuz4w2K352wSnXVzI=
X-Received: by 2002:a17:907:7f87:b0:c49:9247:9688 with SMTP id
 a640c23a62f3a-c50f34ecaf9mr367492566b.7.1794961445932; Tue, 17 Nov 2026
 16:24:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
 <avVVRYkIAQnLC_Yu@google.com> <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
In-Reply-To: <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 17 Nov 2026 16:23:54 -0800
X-Gmail-Original-Message-ID: <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
X-Gm-Features: AclHuK-0l1x5Ka17FQb35YPdKVq1Bx0JlvEgDxgD4J52JUsmFJaic8A5SEFngsA
Message-ID: <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Chris Wiseman <chriswiseman@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Nhat Pham <nphamcs@gmail.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:13=E2=80=AFPM Chris Wiseman <chriswiseman@google.=
com> wrote:
>
> On Thu, Nov 12, 2026 at 2:58 PM Sergey Senozhatsky <senozhatsky@chromium.=
org> wrote:
> >
> > On (26/11/05 16:53), Chris Wiseman wrote:
> > [..]
> > > Maybe we go with Nhat's idea (CONFIG_ZSMALLOC_SHRINKER defaulting to
> > > ZSWAP_DEFAULT_ON) for now, and if zswap adds a proactive compact knob
> > > later we can just kill the shrinker?
> >
> > Sounds good to me (on the zram side).
>
> Thanks Sergey.  Xueyuan, are you still planning to send the 2-patch
> series (CONFIG_ZSMALLOC_SHRINKER + unlocked zs_can_compact() pre-check),
> or want me to spin and post it?
>
> Yosry / Nhat - any objection to starting with CONFIG_ZSMALLOC_SHRINKER
> defaulting to ZSWAP_DEFAULT_ON so zram users can turn it off right away
> while we decide whether to drop the shrinker completely?

I would rather drop it right away, but I am fine if you don't wanna
bother with zswap.
