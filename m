Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795465298;
	b=U/Fa7uHeTIGaBvUcL9Ca4Wv0ZUwy5JVhZyjFGzdKMRd9LeuE0hiY6GTUxX68r4L5C354
	 MPdfFAI+7V+kLUsh1l59TE2nuTeY4bIbV6NvdBUMoJiCJUjj5FZjdWrgjIpi51tPKh32s
	 QbSk5+W+WrcLvYOJi1ScoupZ/Gl14YHpFncez5GHn/XzDceTp9aGJAOe+ctLmaxvi7k2w
	 DCpNymMRvPnBufIiQ+4D1QqSWDvAmnPBoCh3OjNNtWv5UQQsCJyjTGPyQwbiLOpJ3dkQd
	 b7N46kJu/MjPyz586wDWWJaa29EOd8drymsO48RmMbiPCp/oOnt0hv216Giwl595W2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LEUZIAOLddGL7x7aQvXVvqPgmEr8lXGuohw1ryERaEI=;
	b=yxCVRhvWV9X+rUG20tAx+CMInOUzRQPvhnXxtRAPJxF67XbHZLVI6yPl77EqUxSEsnLf
	 4kG0laoDam/Fsf//6VIp3r2i641Tf0A8+tP3GbmGhD0bgpV2bWBEcKuzDzay28oEqAL2i
	 XXE50Hyho2cP20TDi1o4gmq681p4TEkrpjIil3eKLq42Vd8+2y1By3t+5wDMWSoD8tzzc
	 AmvhEyyXQx/KX7AoQFnoHiY5MfhvsAwU5OAYae4H1ayry2Uppq4U44MO9xCblv3Fvqx0E
	 DtG7JPWPGVCO7Gj4ZPUSLq6eC1i+Pj2Eh5Ta1mprIruaLKLNZZs3/5zCWnNIh0Ogq6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=c2gq+laq;
	arc=fail smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954D606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B954D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=c2gq+laq
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so745919a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795465297; cv=none;
        d=google.com; s=arc-20260327;
        b=M+1bGRpi//Rudjl+gYsY2hghUHHprWBVRSBbQFRmBz8AF7A5zYyYth/NdNeybefDs8
         AR0tnczQ4I5g/h4nrszKkYjG4bjU0/S/WFHEJ9PT25kFNk3DiS/rbKjIkEG0JPeZQS88
         qgj9ogJYymStI2+3rWHTTM1OUwKMOYvxuldSHeT57rp9MPwGgU8zQu7+Ot2lnbEQnVhu
         AYOH7NoX4d8Z+FZrPOW2CrCv592Fu2xjkt1U/NLvYjo+80pJFilQHnQKYtVMGalX/peu
         3EUVPUhahYNP7HA3/oeCs1dibgF5Xb2VxFS3xtiicz0GefcZFkIh2TNnr3TzmOrk3HGL
         PKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LEUZIAOLddGL7x7aQvXVvqPgmEr8lXGuohw1ryERaEI=;
        fh=py5fHI/JwDNaN8GWjcSChdZwTqGGv8A2tVDzYOHx+BU=;
        b=fOtQEXaoZit3qvmDVilChzlE3pBaz4lJM52Gvp8E6RY1Sb1w583F9c0OLvgGPRMCtd
         lArCoD5R12puioNzc4FjQw3YMhh3DebvJEHSGY0EN8GNlHPjrlHpGolgTTCh5GfS94s9
         0xwTkb/a0wKZ9rHW6quouAdaOUnApXAFVX4UcRBR4eIeAQJUQ0zz+ohkFDfok+rpJS0W
         CjVfW+hd6iRCsiG1xUFyAWx2dJ0h/C3WvRcuIpM877DR8EUJQc0W13VhJveMY2hBisZf
         PEYhe83ac9GkAhVNNbRZteJQRHG6doHVYRwqUFX463shiBQO1YuHUBNw+XxjQvHIKoli
         BRQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795465297; x=1796070097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LEUZIAOLddGL7x7aQvXVvqPgmEr8lXGuohw1ryERaEI=;
        b=c2gq+laq0yhqp6FF1Vf947qPiE0Z5VfoHe+mggi5Ga9ubu4f4hV81J96iQAbuIZq1L
         3JHWBPlWzOPhLjMRN+Q168fHx8VZQwUSN20XWFGjhVlrtlDFTQpPy/JQOmNK6mqkCM4b
         4xerMMl5+iUABeqLcepD5C/uOmfg/WsJbin9q5Oo3YZv/Y50wEt74u2cZmcPrw1UpOEJ
         GvJ6MU5HF0KnwUevXCTb0SqNtPCuLh53gxMDkKmycj2psn1X6Z/3dxtC3DRm8Q/+eqYm
         WQZCzYcpGWw9wMUrBdZgmMmYcAW3hURjuvmeUGtZnNtaDQaLQoATrhyDTFpjwjrcMA5c
         ZOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465297; x=1796070097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEUZIAOLddGL7x7aQvXVvqPgmEr8lXGuohw1ryERaEI=;
        b=YsdpRluEsw3DaR7/nn/V7OboucatH+hTblrGkDCpSpxYGIEJ5IZtOWvJ44KTcPNnhU
         5EZYMO+VpDB0JvzNSfkqg+GGVppl9C0P8BuoLZptbGpaRCbRLBrsLR0D0gan2Zrba5En
         6G7orbEVDjjQL/8PT0DvGMUaa21jfNcATDQDcoRD/9IdSKh3ez6bi9/Y1VhLJHAk4Mw6
         m7q/9QDkPUwKa87nvKnK62xc6FB4fwjjZQtakKPgAupBEvAvvZeJTeOHqji2adHnPDDP
         lUiWeT98j2rnEPOHlVZH6SCaj7f0ptP8Ut+7xdt+Sr0DNqXQww4PqAmbI0AmRQDQgKmc
         zpyQ==
X-Forwarded-Encrypted: i=1; AL+hErH1KYVs/ApTldW+0LABDEQn//bcBwHd6Mt/X1hrI2YsWVvxohjh7+USPk7tQYc3j/99LLVX3GADerILim0=@vger.kernel.org
X-Gm-Message-State: APuU4Z954TTpKehB+W3VueZXaiBO6Zf+l5f2rdcs5G2A3uA9qji7p8aK
	tLEmWdLPhoE9GCN/rHdOm2/crb7Wb6N93znjzLK0NqvKcShnKE9tArWyVyYaugrzbV7CbmJQjPU
	IIICRC3Rzq/C/T4q1DG+r5tMLniFmyQz/xcpCHBz4zi4U3z3Yqxiw7g==
X-Gm-Gg: AZFdTZdDvdRjPrxTW8v15+5H3QzXPnXK9C8CKCUbqwO/shClCekINvLhPOPEnBsqoJm
	dI1OOB5jeK5ndNgxxWTBN2e4yH0ZLCDgiESbmIf3PRPF+TzP5L3mdW+Cync+xfSCqsIaWQpjzy2
	qRb2jpzNf+ddL4ivAfEp4MFhwCNEJiGD6X9DEGvO30aI7lsaSMPdrD6iIc5XZ8yTFzML9vSjmrH
	SylJV1FgMmfrAynvK6lkoPgMBCulc+nSG919dy849FMFDkLwZkGhbeED3pKnWNS90i1gNiiqp9O
	gaagd7Jt3NCgwVqFAduKhcbEUxhpjGtgeKoMtz+JhNShW6S0zkxSXnPVOW+k1VjlfQBtj7/b+gH
	gfqq2dJ/XLa+UhRSCAddI20daPEF320Aw8Hu5ZJ9SfPOpubBTd7rc/uCkeCc9XsppY0kSsw==
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b373:6a6a with SMTP id
 98e67ed59e1d1-3b41c9e45c3mr11852486a91.28.1795465297053; Mon, 23 Nov 2026
 12:21:37 -0800 (PST)
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
 <CAEf4BzZWEU24+ZC0W_20hc3t+qnEHncQA1ztTF7ZPPOf3DDPVA@mail.gmail.com>
 <CAHC9VhSFvOiP5Tyt=rOFMwg=Ro1jRw+hfcw4AdCkEyftZJHQCQ@mail.gmail.com> <CAEf4BzZqjiWR4EzBFdV-czH-GnxqOeOAsMLgXtQ6TwN2ZiiT8w@mail.gmail.com>
In-Reply-To: <CAEf4BzZqjiWR4EzBFdV-czH-GnxqOeOAsMLgXtQ6TwN2ZiiT8w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Nov 2026 15:21:24 -0500
X-Gm-Features: Aa3M54qJwPl-ABfK7B5B7-sJCPY_acwvpvVOTnL9PsRVe-QdqJj1wCPpuoy-tHw
Message-ID: <CAHC9VhSOz-ThxXL+5MkScd6Yj2thCqE565zXg80K_cWHkViH0g@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Paul Mabileau <paul.mabileau@harfanglab.fr>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Daan De Meyer <daan@amutable.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, roblabla <linux@roblab.la>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:55=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> On Thu, Nov 19, 2026 at 11:37=E2=80=AFAM Paul Moore <paul@paul-moore.com>=
 wrote:
> >
> > On Thu, Nov 19, 2026 at 12:59=E2=80=AFPM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > > On Wed, Nov 18, 2026 at 7:14=E2=80=AFAM Paul Mabileau
> > > <paul.mabileau@harfanglab.fr> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On our end, we also have already merged code to adapt our eBPFs to =
the argument order change. However, we would still prefer if this easily-av=
oidable breakage could be fixed by moving the argument to the end, even if =
it means having to revert our fix.
> > > >
> > > > This is motivated by the fact that such a change is not made in pla=
ce on our end because we ship our software to environments we don't control=
, meaning that any and potentially all versions ranging from 4.11 to the ve=
ry latest should be supported, so the change is made by compiling and shipp=
ing a new variant of the concerned eBPFs for the version interval it is val=
id for (7.4+ in this case). And that has to be done every time there is an =
upstream change like this, so the total installation size and overall compl=
exity grows accordingly.
> > > >
> > > > If we could avoid that, especially for such trivial root causes, it=
 would be nice.
> > > >
> > >
> > > I agree, and that's why I'm asking Paul to accept the patch reorderin=
g
> > > the newly added argument before 7.4 final is released.
> > >
> > > I do not think that the maintainer's personal preference for argument
> > > ordering beats real user pain.
> >
> > As stated several times in the past, the problem lies not with the LSM
> > framework but with the lack of an abstraction layer in the BPF LSM
> > providing a stable API.  As far as I can tell the lack of an
>
> I think the problem lies neither in the LSM framework itself nor in
> the BPF LSM in particular. Neither have any abstractions built on top
> of LSM hook prototypes to guard against argument reshuffling. And
> that's fine and basically inevitable. If you change LSM hook
> prototype, you'd need to adjust source code of all LSM frameworks
> relying on that LSM hook (which is easy for in-tree source code, of
> course). For BPF LSM, if argument is added at the end, that pain can
> be avoided completely.

We're both repeating ourselves at this point, so I'll refer you back
to my previous comments about the LSM framework not being a stable
API.  If there is an expectation of API stability or specific
extensibility in an individual LSM it is up to that LSM to provide
those guarantees, not the LSM framework.  Considering the current
design of the BPF LSM, any breakage caused by this change with
existing BPF LSM programs is solely the BPF LSM's responsibility, as
far as I'm concerned.

> > abstraction layer in the BPF LSM is by design, and while that does
> > provide some advantages, one of the notable disadvantages is that the
> > API is unstable.  If you want to be upset at anyone, direct your
> > frustrations towards the design and current implementation of the BPF
> > LSM.
>
> What upsets me is that your personal grudges against BPF community
> (or, perhaps, just particular members of it, doesn't matter) gets in
> the way of doing the right thing as a maintainer and putting Linux
> users' pain above your personal preferences and/or dislikes. And
> hiding this behind "I like this specific order of arguments" or "BPF
> LSM should have better architecture" is just petty.

What upsets me is your assumptions.  Try to be better next time Andrii.

--=20
paul-moore.com
