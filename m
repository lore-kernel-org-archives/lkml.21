Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794956686;
	b=W64qWFTwLgmYZXshidCipJO1pCEWgvV8wyYPisTlGGk4x7R3Rot7F6ADSmOhW6FQGzD1
	 vQOpt7qLFiamcHZFeKi5R6pZgBS/86HOBtJF9gtIl5nvz7OkRFNmZrKpo+EqyZ7SHF/mD
	 IkACrM5FLp533ulSjcykKBc40qta1yWteBMir91E1E8vZ8aQiy/ZKXVUXTDn5apcufQ/R
	 BRLU5OJ9b0Jm1VXMmtvBA9HXzvGrDylSsJpUUX7CX4aoB6pYNvt0iWVoK5LPzvW9CRjid
	 bd3OlPv9KuQvshZpGBWdTcsNxrTvQV1wswS+ZVEkcdfmvlMmX5NfBk3DXSIU9jkevZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MF/4k//GXIWfSvHONQUa2JD9KuKF6Feudyoe3NRA47U=;
	b=XIjXHQiZrHRhZERl1PcTUUe9+KeUqZuXBrgcZOWSruUk9ky/d/yunV8Pr3trbGro3w81
	 PYf5Nt5LA9rWdkHJ3zi30Mxhm3bTzYt7WeqJdmlNHocXtKgw5HvvlBFXOOC+yF41cZ+Zb
	 LJrjN05l4hbJOhicskLNsnCMFXMdkb/PMfami9TQAf84Zvbor+91D8PXbH9nNy0i4Rh8o
	 avB7dUxoAL59Dodgf5CBi5UHM/7EFb6ctcBpHQbi/JrroqmQFjvFEg0nsqDf2Qar9pt5H
	 59qyH37dYl0njjaYNScQyYspRAz43Tq5gkr2xLcv0UE/e26i46ISMp1MR8zMmgTx/jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Qe5+c2FS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F91606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F91606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Qe5+c2FS
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso132431a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:04:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956686; cv=none;
        d=google.com; s=arc-20260327;
        b=bqrVjb4HTSop6ueIa4m4dSZSaYqjzf7jgXLAmVwxh+TDK/sTrpWRwbcutseUnCthyt
         kuE41PaZ/bzm5tYXMcBBpCTb8663rnHetO2zv63anCjHlFLhPA2npIczqvz1Fji1bHRh
         /UlIzK710w/u3fVZTslkRuvfajMn26Q6OQM+s4PXUqx4X5L8ynNmsQoi/NevFhtpgV48
         0KxJQBQFmkl6deU1lP3c9JgR2je34XrK/1FjQTo0iT6GAUq13S7TD8nQv9G25Hjsp1p0
         3ZWhfjgpdRz4n1ho6nR5dGaYCTBpCa7zBXTnvWg16Eyboij5j2B1DRho0goYiI19UBdk
         o3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MF/4k//GXIWfSvHONQUa2JD9KuKF6Feudyoe3NRA47U=;
        fh=eFiNzysZe1pLABprQpQSefgXG5T4VlXsR5DOe+BzIrw=;
        b=ezwCVG3SInojGVkEqL0jzI9zZXxoCLDHydjqt6ZXuxwBmnyDnRiWujGdpOyIfNO+id
         mUXqR2fHZzKe4SmXh1PaODuf9c8sXA0dJEv1Q1GxfVoLZn7ZjnjEq43Stz6vJ7fEZehH
         hVwdz7ZTwnn4Qbx+JlpYV/XSKgTx9LUUgbwT/EqI1nCarOviJeLZ9LfWD8qCAsX2GYOB
         DdAt1py67WmnCnEPpR/9ZFxkwjZuSFCW2wE6rKdIoFSH0f1a44Et9v1tpbgzd0EwXTZv
         Z/AotPlrfA2pTbz0/rTwoa+d4dRFAqehZO6KGJRflCZSHJKA1ccEk5S3yDtBIao7szbQ
         2L9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794956686; x=1795561486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MF/4k//GXIWfSvHONQUa2JD9KuKF6Feudyoe3NRA47U=;
        b=Qe5+c2FSJotbj6ldw2lk/0EX2sA4jyvKDd7kSr8ybfRXP++RVUKrchJpRNNgGFhYEM
         zuX3j/KYi2VzWIw+tHJoCbjW3SaqetVEVC7PwIQuTU6aUC4H9dr1rcsmMRm5VnyaA17/
         +QkQgvoiDWgmV5ue/hmxGSStsQzTdyQusSzg7I7t4syqiD9BY8hpzveJcjYYNkcnWiYj
         ajj0pbf4jMCpr9sDqZqZZtM7aEc8KPkk7V8mv8NfIq9sIe4SgXE8w0rfKaQjGxsvPQiM
         tp1P1r4f5nYBZdjyiqzhm3saMAxPyvbIxaiwr0Clw+hKl4UNQfhUJSXdNHqd/fgKb5CH
         zsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956686; x=1795561486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MF/4k//GXIWfSvHONQUa2JD9KuKF6Feudyoe3NRA47U=;
        b=UvjO2hxWcsIPZPJP4IwQVzH+Zmo2UAYvkx7ncVqNGcn4pEFnVamSljW8Yi2j7FibeV
         QlwjXbpO5L7fiJ1wR1WeOO5W3AnhsLM6qxyJKKmpsMs7HIGivO3fnDcLN9GBGBamD303
         LU3Ukvf2oinILzaF6RCa+1905DJmwmYluQpJ1qfqhhkE/VmrZMa+jIDm+rlaSto0BVB8
         rTv0BT+uPTQFEp+97FFiDE/YryOsXJam5dkcWy1VnuqsU+/yvAOf5tTKwH2S8E568K0C
         brYzsPbaHyAJZxekPo9zl6SadgMQdkV4+NmFGWg9cZeZb5H+D5p9PQ2UfcWP3EwTnYRq
         uAYw==
X-Forwarded-Encrypted: i=1; AL+hErFmdadGhnMWuJiwOEMZPwOZVZP/X9xuIqef28pdQaWQVhQmiakiex3AdsSQ70ZgeSlNq1Q3Ce13kFvv9PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IBj+LJz88GFqcNnNoieCveMK6LEWlCK9jRCE8wtWRyeQPveFO
	xQhENEGlhWwZI421xCTIVEJ6XD6dfZL17TOkz7KFqrjH3nylJZd0xBApdqAx3NFb/Z0FFgw13B9
	RTKcEPitgEyM4Vft/yOgIemXU68u0eeUt8Y46JTkz
X-Gm-Gg: AZFdTZcYZYF4USwnu0lPbEp7v21SHEdDQv+txj7Vb0XvDfWrU3DiI5wka4MHswNRqau
	ZIxPJXsD9luK3IvF/xYsPuKTCnTe2H0tKSyI7tA6miT1Bo/NfouYMNXjE4skDvu/XqR7SWFt41R
	bXsWR+6Qyjw1ijI30iOjFuf2Y+SmM2WxHHKRa2MmbUudd9Yiwzimjp/H9BucIljnT4g+EftCeGK
	qhRvGnQlJWtLtNuZ2zrj+/hyF7HYpROUQvw/EUgOz04FhH10MAreuK2dDp+yKmZB80X1oUVskpd
	DumrsTPvB8mj2UeiOwNaS3eLnt/Zo7PvINYZpDQ9WndjOOpfRzJBspTsPOkmhujByR1WfZCcA5z
	UhQ5ikMhJ5kcXK46EuUHD734osVlst0f3BXb7vwDaqufTzZyxuMZFlHR+v4T9wCbK1aVX
X-Received: by 2002:a17:90b:3f88:b0:3b1:3e7a:6d8e with SMTP id
 98e67ed59e1d1-3b3d0763251mr719188a91.10.1794956685614; Tue, 17 Nov 2026
 15:04:45 -0800 (PST)
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
 <CAHC9VhRcT3rmdpeadwi2avhwvr7aEZYStZ3bbEEx1hm=wtBGhQ@mail.gmail.com>
 <CAEf4BzZ120age2-M-a_TJ07xohb7-s=xn3e1W_-V0kopnATq6A@mail.gmail.com>
 <CAHC9VhThV9xiXr8j5_+W__CBKn0JqUiZ-RGZpF4Nz-i_RZprAQ@mail.gmail.com> <CAEf4Bzb5Y5TUbN3kLBJNPn5Ae+_nbc7YhJice_wUzqdvpjFr_A@mail.gmail.com>
In-Reply-To: <CAEf4Bzb5Y5TUbN3kLBJNPn5Ae+_nbc7YhJice_wUzqdvpjFr_A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Nov 2026 18:04:32 -0500
X-Gm-Features: Aa3M54qoHQOE3oB857KKbkDUHADETGjWV_M0UNRiQstMuTOvLZrm0nW0htwepiY
Message-ID: <CAHC9VhRRe8xOmSAdmEWOwHiEDrZ96ZamH_stLPAvw6jYny7Gww@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: roblabla <linux@roblab.la>, Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:44=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> On Tue, Nov 17, 2026 at 11:30=E2=80=AFAM Paul Moore <paul@paul-moore.com>=
 wrote:
> > On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > > On Thu, Nov 12, 2026 at 6:41=E2=80=AFPM Paul Moore <paul@paul-moore.c=
om> wrote:
> > > > On Thu, Nov 12, 2026 at 6:00=E2=80=AFPM Andrii Nakryiko
> > > > <andrii.nakryiko@gmail.com> wrote:
> > > > > On Mon, Nov 9, 2026 at 7:08=E2=80=AFAM roblabla <linux@roblab.la>=
 wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > Thanks for the replies!
> > > > > >
> > > > > > > LSMs that need to provide a stable API must provide an abstra=
ction
> > > > > > > layer between the LSM hook callbacks and their stable API.  T=
he LSM
> > > > > > > framework is not responsible for the stability of individual =
LSM APIs.
> > > > > >
> > > > > > Understood, that lines up with my expectations. I think the big=
gest
> > > > > > thing here would not necessarily be stability guarantees, but r=
ather to
> > > > > > make sure that the eBPFs fail to load when the compatibility is=
 broken.
> > > > > > But that's probably a problem for the eBPF side, and not LSM, I=
 assume.
> > > > > >
> > > > > > > So, in short, would it be possible to send a follow up to Daa=
n's
> > > > > > > commit and move `struct mnt_idmap *idmap` to the end of LSM a=
rgument
> > > > > > > list?
> > > > > >
> > > > > > If this is possible, that'd be nice so that we avoid this break=
age in
> > > > > > the short term, since the change isn't in a released kernel yet=
.
> > > > >
> > > > > can you please send a patch proposing that and we can continue
> > > > > discussion there? please cc me so I can follow along
> > > >
> > > > Considering the original patch was submitted, reviewed, and merged
> > > > with the BPF LSM being the only user (none of the existing in-tree
> > > > LSMs use the idmap parameter at present), I'm a little surprised th=
is
> > > > wasn't brought up earlier.
> > >
> > > Yeah, unfortunately this was missed. Not sure it's surprising that it
> > > wasn't detected immediately, though, because unlikely someone tested
> > > an unreleased kernel in production. Luckily, this was still detected
> > > early enough before the final release and this gives us a chance to
> > > fix a mistake.
> >
> > I've been surprised lately by apparently how little the BPF LSM
> > program interface is tested with real BPF programs before landing in
> > Linus' tree.  I know the BPF folks have a pretty good set of CI tests,
> > bots, etc. but there do seem to be gaps relating to real world usage.
>
> I think it's a hard problem, yes. BPF selftests test latest kernel, so
> this issue we are discussing here just won't come up there. Then,
> e.g., for Meta, we do have internal tests that validate existing BPF
> LSM programs across different kernel versions, but unless our internal
> BPF LSM programs utilize specific LSMs, this won't be caught either.
>
> >
> > > > Beyond that, from a style perspective, I think I prefer the idmap a=
t
> > > > the front of the parameter list in most (all?) of the hooks where i=
t
> > > > was added.  I'm not interested in moving it at this point in time.
> > >
> > > So on one hand we have a real user pain which is easily fixable
> > > without burdening kernel and LSM subsystem in particular, right?
> >
> > Arguably changes that negatively impact code style and readability do
> > affect developers and maintainers.
>
> I agree, but argument order is not that big of an issue

It can be for me, and in this case it is.

> > > On
> > > the other hand there is a minor issue of argument ordering with
> > > mnt_idmap preferably as a first argument. I get the preference, but I
> > > think fixing an unnecessary (but easily fixable!) user pain should
> > > come first, don't you agree?
> > >
> > > Can you please reconsider?
> >
> > The user pain exists because there is no abstraction layer between the
> > LSM hook callbacks and what the BPF LSM makes available to BPF
> > programs.  That's a choice made by the BPF LSM devs, and while it's a
> > valid choice, it does have drawbacks like we are seeing here.  Changes
> > to the callback arguments and/or the semantic behavior of the LSM
> > hooks are going to continue to happen regardless of what we do here.
>
> Yes, just like it will for tracepoints, kprobes, etc. Sometimes it's
> inevitable and BPF ecosystem does have tools to deal with. It's still
> a friction and pain and burden to do this, so if it's avoidable at low
> cost to the kernel, we should try to minimize unnecessary pain.
>
> That's really what I'm asking about here. We did do that with
> scheduling tracepoints, I think it's reasonable to do this here as
> well.
>
> > It's better if the BPF LSM figures out how to deal with problems like
> > these rather than relying on a set of bandaids at the LSM framework
> > layer.  If the decision is to push the pain up to the user to keep the
> > BPF program interface thin and flexible, that is their choice.
>
> Yes, thin (and thus performant) and flexible is the design choice and
> I think it's fine. That's not really the crux of the problem here. As
> I mentioned, users have tools to work around changing unstable kernel
> interfaces that BPF programs rely on.
>
> But in this case we are discussing reordering a few arguments *before
> they even get into final release* just to avoid unnecessary pain and
> workaround. *Unnecessary* is the key here.
>
> I really don't think that's too much to ask in this situation.

As I said previously, the current ordering makes much more sense to me
than moving it to the end of the list.  I'm not interested in moving
the parameter.

--=20
paul-moore.com
