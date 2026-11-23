Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463738;
	b=5OfdBe0MKME4sNUSIUmsr0SVsR/Jr5ZiqjHgvqKxdOqbd4r6u607JRnbyk/BQtm81cTc
	 FFO/MQXeicGWWkuX0XMmVDHEXnq45TTYqnN9VQKsX/6Vk8xWEhmZYKEEKvTauAMgK31s/
	 Ozodd8kyIYw8uF4VxcYdIxE2/q8imVwuXxfRa40jRJKy+zvIw/rZQgpDHnlp7ix74P1pD
	 Yu+76gY626VtZezzHck+6FGfAjlpECXWnU+AZfGNFDfm0QodR/Hzf2yK3VG9TMS9iunED
	 NGLv+G/uAPbYjSJYsefZKC2e4IPVlEUmiRFmq6q9h+LngLaMniEKKp6Gg3aDv72nM7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gd5vkS8rekRzrNw14AZBHfRH+N9fBKRzF69D+TwAlOc=;
	b=iWG+KoXHgh++Cc6NzBbOh3nKXMDN8eYg6VCOc70Ko/YshxbJPm0hkYzW9rPcGiPP6FvR
	 PUCWSv+SXPzIt/o8VHWycepnoVyVObfJ35BkxTEUsTC6rRKIq+t9h8/EY0Hkbz3MwNYu6
	 nhPx6B4v4NX6Dsums/xDoeu2Az8ny+Ixk+AKakYviXnmI9Q43CE+tBXnQmS09RiP9gOZC
	 cGFLt3MrYYlVENBA+dPr1+S2lnW0Xj9Z1Yu6QIgz1ymLx7Zq7SHZhU5Vg3x5qKS9grzFm
	 m/GvXjDRTA9h11wWsk0wDO+FBJVpyeJPAbA+WJphH+wbv2IavSoZL9bxl68+0+ZpcPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klX4BZ2S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54156606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54156606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klX4BZ2S
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso2449855f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795463737; cv=none;
        d=google.com; s=arc-20260327;
        b=hfxTx9OjOjboGX1meob+1Y8QrZC56LsNuQlpntlpvNgVAJer2wZdPVEFA2nbSuYr4k
         lkbe1j9iiaX8MwINiV5Bf5uTw1MA48RMf/7gk1AhxHQVlq6TIitU2MPeo1nxy0d+v7Rh
         warwLJYcGCVbscmLhRGk4vOjXuzKXge5VUHJDSWhz2Y49EQF35TVLgqrQBLf/PIS2KJ1
         YL7dceEqcLIYp48hLTU/IB+USFhvkUXJ48jfZqIZsaCsAvVevgVuqN6zmWTzwVcnYUqU
         8sIRr/FnvOHIVBQ5/T+bCnvHOBhuvq1HLUX8MRLmqpUKEs0HKH4oRKig/Ae05T+Avh0U
         Dm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gd5vkS8rekRzrNw14AZBHfRH+N9fBKRzF69D+TwAlOc=;
        fh=vqqNJKISnVoxrzlv+gBie7Y8rM5FIOIsA1i7yiCTPKY=;
        b=RyYBZtZieHOj92T7KIrxgluCE3jE7/6zYpIPkYX7rePC+eO+40qE48mEuV6aTOdX40
         YfvfQKoj8OjfXoPoTej8mnRPYiUiSHgHGStj/ICnjVsFviLyM6k46wvDdtaJ7I4DaKi7
         RLY/9hJ+wXSBuE20Vc+ccKuf4DqW/o3GyyVC8FvUdMfCDfNAservVUqEZAFfgfDiQoQJ
         rPJ0HQmMYrL9Tm/12eUU/ili0S0+QNJwbxQV+T8PIpEioFBN/aj2phxGlR2DS0d3Rlse
         4WgiB7erdEdFyIn0EF8KOWN0w6alAhymvnI2dHLVzYuL54gquAwxR2NKdFoI4Zyxbf/l
         4+rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463737; x=1796068537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gd5vkS8rekRzrNw14AZBHfRH+N9fBKRzF69D+TwAlOc=;
        b=klX4BZ2SJNTMSrywDGSIV/16noC15wpAvjoBOkCL6VprZy61rDcD9QTHuztfR9Tuzg
         ya2nK4c06Oxw/VjQ01rYZooWGjRYhIlcehQDLDYYHAihJcTUhaX+DcZEH7BVZC7b8DdI
         3VE9xpA6SNF0jRhObUVsSkdyTgO/dD9XZSshAODtcgr/63eyBQDMfk2w21S/AWnlOAmx
         C6Nxy8ygfimfdk7a67J7QXglsWVIVZ87KpZL0j3iWCA02hOY1H6mCULb6CwOnFGgqsaJ
         Z1GsKqUmNaVZa85kFWwKTasKVepJYI+oWjQPr8BOLjrBomj0HKFEKJN0TbNA9qYZJyZo
         rGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463737; x=1796068537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gd5vkS8rekRzrNw14AZBHfRH+N9fBKRzF69D+TwAlOc=;
        b=HNtUC5KRVwloqRzKOPUG7WTmob6CnpwqrVI9N4uiS8bHuzJmjzuahuV1dQQE7t3ZIj
         yMMsZpcWqhZmAVnZ9GjkzLPBc05BOmIdjn/AYgIhegobeef6CKS6PXcmTvrsMAeR8PDi
         2GMGi0JrcJLbxzkLBd59macLeFKG8foNJaXbZ6pLXoPcH9tj6PhVk22VSxnFX7RmNReI
         nhhLvHCHZ7x2lBZhDpPjv9WGdEKiSBvARol3RbiMpT6N/UFmoJ+4QBnF1sboU/ZksuDb
         lryv92P5bBD3nHe9U4KeOijXDuNByOV38heChj1YPWhCGeVcxAFJaSfBxXIQrHHicWRl
         IqyQ==
X-Forwarded-Encrypted: i=1; AL+hErEjXmLu/C54TOa7Xn/mjvLHeUxt8RJX6hdqf0sO3n4pMDq0cGJNGPndwMuGExW3RWRAUk0X3D3Ge+oYReI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/htNULyfuxmukETW6XcmbDrcURo2oLyXiKY4TXpqIXWezc4mor
	EAn3vjz1D8gIkq0T4nT5lxd7qvFRIKqVuMD+/ULZIsDD0B50TaVlhC4OKvnEP5EwJg+wDysXonz
	n7VMAgCW5TvYKsdFtfluwGH3ygSEFVkM=
X-Gm-Gg: AZFdTZfZDUGnS5aqYq1I6CDRqQ5L5G3h1eTZZgtoYteBCQ0eTu0aBSgoAVnzydZ0va1
	5bJnKPhLRQkNxNMBBCT9ed4ZzhX/FbL8BFIuDMh6SwsxMkJ+QF2HcgOW4yztNr/xyFKeXWzlxsU
	PbqFuCts7zQw54cu+tSsTknXBV1/OCFQk7gUiM85T6+1gWRpyyJsmUI1aCZyhzOYWNVx9kJsp/p
	l+7o/Yhc8ur2JF0GJ3ailuAvyPcF4wRHHeVG4Y2NUox3SzTd6RwJqjCFPsrYpqLGKK3U9tJJ3RQ
	8fLo0v8FOVqDRERcP54dOlPPRiCju+chlK+5YfQACUSiFzvye8+LnsXjS3aHwXHDWusTuT/3DuB
	CUqg2KgCtfwpa83cso8t604Qg+98mPVNwZkT5cdUKiZmZf+8dz2SOWXseb34LgGipmHh1zjq9t4
	vL6lDc/B6snupCSI/BE5bjTL4Logvf2ev3ug==
X-Received: by 2002:a05:6000:29d2:b0:4aa:831a:d0eb with SMTP id
 ffacd0b85a97d-4abb3c37a50mr16976489f8f.9.1795463736432; Mon, 23 Nov 2026
 11:55:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
 <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com>
 <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com> <9695ec3d-7b81-488d-989f-0bd411d673f2@linux.dev>
 <CAPa8sAh6b5xn4rZzPfM0nZ+_kkywWj22fy8deLq+6qYews0rdQ@mail.gmail.com>
 <MRYP264MB7057096D13282544720793F2E67A2@MRYP264MB7057.FRAP264.PROD.OUTLOOK.COM>
 <CAEf4BzZWEU24+ZC0W_20hc3t+qnEHncQA1ztTF7ZPPOf3DDPVA@mail.gmail.com> <CAHC9VhSFvOiP5Tyt=rOFMwg=Ro1jRw+hfcw4AdCkEyftZJHQCQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSFvOiP5Tyt=rOFMwg=Ro1jRw+hfcw4AdCkEyftZJHQCQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 23 Nov 2026 11:55:24 -0800
X-Gm-Features: Aa3M54rW4zsDQnYRhxM3Ycfdbtgyp7iJNkovd2OcGLgGuI-HlydZfB9BSFPhl3s
Message-ID: <CAEf4BzZqjiWR4EzBFdV-czH-GnxqOeOAsMLgXtQ6TwN2ZiiT8w@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Paul Moore <paul@paul-moore.com>
Cc: Paul Mabileau <paul.mabileau@harfanglab.fr>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Daan De Meyer <daan@amutable.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, roblabla <linux@roblab.la>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:37=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Thu, Nov 19, 2026 at 12:59=E2=80=AFPM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> > On Wed, Nov 18, 2026 at 7:14=E2=80=AFAM Paul Mabileau
> > <paul.mabileau@harfanglab.fr> wrote:
> > >
> > > Hello,
> > >
> > > On our end, we also have already merged code to adapt our eBPFs to th=
e argument order change. However, we would still prefer if this easily-avoi=
dable breakage could be fixed by moving the argument to the end, even if it=
 means having to revert our fix.
> > >
> > > This is motivated by the fact that such a change is not made in place=
 on our end because we ship our software to environments we don't control, =
meaning that any and potentially all versions ranging from 4.11 to the very=
 latest should be supported, so the change is made by compiling and shippin=
g a new variant of the concerned eBPFs for the version interval it is valid=
 for (7.4+ in this case). And that has to be done every time there is an up=
stream change like this, so the total installation size and overall complex=
ity grows accordingly.
> > >
> > > If we could avoid that, especially for such trivial root causes, it w=
ould be nice.
> > >
> >
> > I agree, and that's why I'm asking Paul to accept the patch reordering
> > the newly added argument before 7.4 final is released.
> >
> > I do not think that the maintainer's personal preference for argument
> > ordering beats real user pain.
>
> As stated several times in the past, the problem lies not with the LSM
> framework but with the lack of an abstraction layer in the BPF LSM
> providing a stable API.  As far as I can tell the lack of an

I think the problem lies neither in the LSM framework itself nor in
the BPF LSM in particular. Neither have any abstractions built on top
of LSM hook prototypes to guard against argument reshuffling. And
that's fine and basically inevitable. If you change LSM hook
prototype, you'd need to adjust source code of all LSM frameworks
relying on that LSM hook (which is easy for in-tree source code, of
course). For BPF LSM, if argument is added at the end, that pain can
be avoided completely.

> abstraction layer in the BPF LSM is by design, and while that does
> provide some advantages, one of the notable disadvantages is that the
> API is unstable.  If you want to be upset at anyone, direct your
> frustrations towards the design and current implementation of the BPF
> LSM.

What upsets me is that your personal grudges against BPF community
(or, perhaps, just particular members of it, doesn't matter) gets in
the way of doing the right thing as a maintainer and putting Linux
users' pain above your personal preferences and/or dislikes. And
hiding this behind "I like this specific order of arguments" or "BPF
LSM should have better architecture" is just petty.

>
> --
> paul-moore.com
