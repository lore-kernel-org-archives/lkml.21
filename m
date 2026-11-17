Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943828;
	b=dSocrXu98zGzm3JGIK0bSKmuevUsvoh0Osw4f4egmerBZ/JdzLrpL8llEy+4ZQlTk7Fe
	 uw/geWdRMQN4hB1g6YUYDJIQPsg7uStNlikqEGlAsmt9kI0IaXcmDwSZbEuqSO4f+AKod
	 0nXyXM46j1ks7PoU1b9fGeFaKCyV1koHiruvw87HM0oUnQcVP9Ijdx7KjIWFO7+dYqmr9
	 RRQ7mcW5yY904Xkk7bok40zjLvGXqiyF9/FFdcuFdQ1TnSw5T11596sJB4Z2CfaZRiJlB
	 /GenHs4LhoS3qEVZgrpH44bkqMg0AhgWenXoQLMz3Tqsd3bOWFCK22GLMKcw8MJPj3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sj3hBjgFsqV+K2H84i9mKjEVi7Hj254h9Ue/yqcHRR8=;
	b=3Ie11fcRwXPlMcUbB3cTHaee7cTzRXG3AJcPW1dlrAPQxqjur6YN903k8fXJmPG6o5km
	 AlquxQwmrW/r85zJNxOK1+hJLqO7I7D6lrsjtyjzsw4dF0XgNUuMnuGKbH1LDYiCee5JL
	 AZhMOx7JqGVKITyO9/tWDrPEG64VuvWP1dEEwWVoldBFhs6JsjRk7TIJvufAZLcMy/pb9
	 ydG9/YxFbrWIYl0stwH9TF3iOWg282xsYfij0iaK4lX9yQLBctOI6ul0u5uZXIRSxgAlj
	 CtiHHcqvkd4xpjFBVrsoRu2TTFu2xu8YhisVEnYZVy21mZ+/e4Jq8dEEIiQuIYCq7jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=VR8IlJuU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668D606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4668D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=VR8IlJuU
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so39729b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794943827; cv=none;
        d=google.com; s=arc-20260327;
        b=M9tmaZoFca6o6qRutNCSAVosMcvyMNTrLu283n9Gwjk0mYUULaGcPfIR4Nt3w6r7wa
         P7ekn0BnB/kDMG6upyBvWpm3xeps1xKGdD7c/BQBukOcD6lve8/XnFEMhCi1+I17D2eq
         9YrjtQyrTbOa0eJvwrSPxf5cquU9gxQCIElI53yvn+cdLt1KLrse1QujzDvAzbEM9xU1
         3lINaC58zCTpyTssGbmEYS25SrCmg3h8db5ihvbn84FkmepYWRfkJ6t3jvlyTzaLrJXY
         C0m9sXpTe3cL66NnYHKFohfHVI15pXVTaal07QefMhoPPC71B/ugSSFt/pvSsZJdMKrI
         sRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sj3hBjgFsqV+K2H84i9mKjEVi7Hj254h9Ue/yqcHRR8=;
        fh=pRxPsGBjayjUH6wYq1/ElLZ/FNiPmX4mlLUQnPKOc7s=;
        b=ToEH2f7zma6S6GQuk0+aSZKIpzD5/aXSbYKA9spQJkJCrPwnYJqDqy/O5J9HBwvDrL
         K+9+wi+o6H7HyefB8kysOeSrK0WMRDpmplaRnLJ2YjtQS2l4FVTpRBQ/AYDe1CD4k7rX
         QwAMVqV+PjfHVTlNCmIaaLcDr5PPDjUrakSUWuyWnWiAxxdlVerq24vDiCmcBiXZm6Wz
         W+HTPCWgutDFYqe6d3yunSv8xdMljklLL2UCeQ1emfcsMd0krz+B+N0INX+xX8poZonl
         pcURR3CCHeFZMucWsRgP3Hl8j0BzDFMlDDnPVw5jKXh1n81BXJAeFA/v2gMIVnGbrySc
         JW2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794943827; x=1795548627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sj3hBjgFsqV+K2H84i9mKjEVi7Hj254h9Ue/yqcHRR8=;
        b=VR8IlJuUxEu9TYzVDniE5LhVZ+4g7Nr7Fd7jiQAG2y+N/K5TwpW3dJQNxvjxL9x9Yc
         +/LAooYdXV5cRrLaQgZlAAgRbONAt9gBIuqKMTtyIvJByYGewNc0cGzjkkJlCyenH09E
         73gfP+kxEkfcIEEdvAjz8Xt6zrVvuiIIqhOx1qZYt6o/SQYoeIeiSGiuTqScWZhhCCO7
         U4QMhJAeN1EXrwhX92FMUIb7d+vlrGGqcG+Tvg2bxgxRo6DIj1686baaVBKFXKA2ef6+
         3qPQ6s2zWSAqNdbNHheWFCbTUdmtVaxhlKbtz/qkAp7qAPyaoR+Xq638oKhLGTwZ3fjO
         gNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943827; x=1795548627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sj3hBjgFsqV+K2H84i9mKjEVi7Hj254h9Ue/yqcHRR8=;
        b=wX+MM4Ybhi/FBD+KyWVVbXTovhPT3fSmKasJnubtGva1B6J18hHqp86rs5q4hT8Ppb
         k3moCp8QVklmn5aVc4FKc06NUjZSXdnuBBTHsJoIYp4bST3J3Y+dm4Ijcf3p8UsDfXnH
         InuuOSg5DqADOXf6fQsIWlPYycMXZ0AVzEsgyxPfU5h+5vWzmLGU2uJzbdQdDE/5xyVG
         9vQeJqKH+YLcw+vG5pMdw1FHMj27jTBgi5A/NS/kvnK0VbfScWsQgqbsV5aSkvpbQW+3
         fGwTdYxNQHyB5XsugqjPJKjZUGX77x1ExgWtpHk1xEfWGakdo7M9UlyFS4xfeeWlp2MA
         tBiA==
X-Forwarded-Encrypted: i=1; AL+hErE3aD/HPHUxmynx8zyVrr2WG4NLOB5Yyb4jzk+sJ3UCZ4ZhJDsHjT5le7+Lp6W6m3I+vjFac+rDeP8xVRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bXevqfxajUVPh4+Ff9evBZIx+aROVeQOGv1Q4VM01qytA3zsz
	26bHQKlurfC8UNsr8bK30p9QT7V6JCd/bxOhuXPX+LNQQAYOxwJVRfp9+1NzRjt9Gsyu7WsCGwL
	tTznAppIcOlEX3u3zMbbjOA/KOgiPrfU1LauMAAXR
X-Gm-Gg: AYBFou1QTm7paPQZqKdLeebDflA+40eiOr83LA5QdnBFXhIYXusb+qp9ziW3CpPq/eR
	ZaJizABWgmYNOjNq1bP9W76OHWkuYljANWfv/ykhTPKpHot3vhiJwMnQcTceiMmZnBEz/8QiAcc
	mAd+IIYoT9Kuzm+rgSasfS28OK34mbp5X3FUfCbMOw3gHrIEdy2EI+P9lpHldGL9DcoU6ycGU+f
	Fc/2Jn9/oXhv6nCAwby4Vd11WayFsc4TFRUKT+pwTMdwfPS5QKztXKxZSQ/xqCE3tRELiYO6Pme
	Li/FbRyCwffgLDMjz4qp46gtZxxxCGl+TiifkA/lowsZKWUUHRxgfWjOfUFTnxQ7M3TYJJ0ArrL
	TdsnAbqoPypq7WHq1/mblR+Z+/aD+IHn4REkM9TbhoqgVuf2K9lI0wRLhTY0DKTMBQ+an
X-Received: by 2002:a05:6a00:1f11:b0:8b5:a10a:a3e8 with SMTP id
 d2e1a72fcca58-8c457e2e17amr2269626b3a.44.1794943827559; Tue, 17 Nov 2026
 11:30:27 -0800 (PST)
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
 <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com> <CAEf4Bzb+oYDqO20v4YbJ45wdtcGgJT3xVse822P+=oA7fpFAOA@mail.gmail.com>
 <CAHC9VhRcT3rmdpeadwi2avhwvr7aEZYStZ3bbEEx1hm=wtBGhQ@mail.gmail.com> <CAEf4BzZ120age2-M-a_TJ07xohb7-s=xn3e1W_-V0kopnATq6A@mail.gmail.com>
In-Reply-To: <CAEf4BzZ120age2-M-a_TJ07xohb7-s=xn3e1W_-V0kopnATq6A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Nov 2026 14:30:15 -0500
X-Gm-Features: AclHuK-RtKReAlxzWgT2ghpIFsZj6qbY4_JP5P0ehVqwzT5eB9L_2z4RTCFLPcA
Message-ID: <CAHC9VhThV9xiXr8j5_+W__CBKn0JqUiZ-RGZpF4Nz-i_RZprAQ@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: roblabla <linux@roblab.la>, Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> On Thu, Nov 12, 2026 at 6:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Thu, Nov 12, 2026 at 6:00=E2=80=AFPM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > > On Mon, Nov 9, 2026 at 7:08=E2=80=AFAM roblabla <linux@roblab.la> wro=
te:
> > > >
> > > > Hi,
> > > >
> > > > Thanks for the replies!
> > > >
> > > > > LSMs that need to provide a stable API must provide an abstractio=
n
> > > > > layer between the LSM hook callbacks and their stable API.  The L=
SM
> > > > > framework is not responsible for the stability of individual LSM =
APIs.
> > > >
> > > > Understood, that lines up with my expectations. I think the biggest
> > > > thing here would not necessarily be stability guarantees, but rathe=
r to
> > > > make sure that the eBPFs fail to load when the compatibility is bro=
ken.
> > > > But that's probably a problem for the eBPF side, and not LSM, I ass=
ume.
> > > >
> > > > > So, in short, would it be possible to send a follow up to Daan's
> > > > > commit and move `struct mnt_idmap *idmap` to the end of LSM argum=
ent
> > > > > list?
> > > >
> > > > If this is possible, that'd be nice so that we avoid this breakage =
in
> > > > the short term, since the change isn't in a released kernel yet.
> > >
> > > can you please send a patch proposing that and we can continue
> > > discussion there? please cc me so I can follow along
> >
> > Considering the original patch was submitted, reviewed, and merged
> > with the BPF LSM being the only user (none of the existing in-tree
> > LSMs use the idmap parameter at present), I'm a little surprised this
> > wasn't brought up earlier.
>
> Yeah, unfortunately this was missed. Not sure it's surprising that it
> wasn't detected immediately, though, because unlikely someone tested
> an unreleased kernel in production. Luckily, this was still detected
> early enough before the final release and this gives us a chance to
> fix a mistake.

I've been surprised lately by apparently how little the BPF LSM
program interface is tested with real BPF programs before landing in
Linus' tree.  I know the BPF folks have a pretty good set of CI tests,
bots, etc. but there do seem to be gaps relating to real world usage.

> > Beyond that, from a style perspective, I think I prefer the idmap at
> > the front of the parameter list in most (all?) of the hooks where it
> > was added.  I'm not interested in moving it at this point in time.
>
> So on one hand we have a real user pain which is easily fixable
> without burdening kernel and LSM subsystem in particular, right?

Arguably changes that negatively impact code style and readability do
affect developers and maintainers.

> On
> the other hand there is a minor issue of argument ordering with
> mnt_idmap preferably as a first argument. I get the preference, but I
> think fixing an unnecessary (but easily fixable!) user pain should
> come first, don't you agree?
>
> Can you please reconsider?

The user pain exists because there is no abstraction layer between the
LSM hook callbacks and what the BPF LSM makes available to BPF
programs.  That's a choice made by the BPF LSM devs, and while it's a
valid choice, it does have drawbacks like we are seeing here.  Changes
to the callback arguments and/or the semantic behavior of the LSM
hooks are going to continue to happen regardless of what we do here.
It's better if the BPF LSM figures out how to deal with problems like
these rather than relying on a set of bandaids at the LSM framework
layer.  If the decision is to push the pain up to the user to keep the
BPF program interface thin and flexible, that is their choice.

--=20
paul-moore.com
