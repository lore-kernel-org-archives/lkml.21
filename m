Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214563;
	b=RGhP0cjUyWpMeTKFCfNageeL/WCGxrL/sU8he8A78zmRKjjmcZgz0JgbdRBg9txOfj0K
	 v8fdaOawnwpLNnr8L/KxwvJypise4cBV8SwNytJOjQGZRm1fs6J+L1C5/YV2Oc2eDXQhn
	 sK5B1al1ny4VZ6qdwpldqZwM8LJ0AyJ9bNeDhHEYkRqS3pxb/hK3w5MjdU427zBzpLWc1
	 7XTOI1MV/eYgXt/QjdvU58MgbQsnnN05umPLt59jtAcBrxeWigDBscg5tfcuyWcubfWoH
	 6ZTxZTfKlB6v3MeqpdNIdmg9fl3zZd12p5iy32uU6LhGrNX8LIqRXcfyT+LJwg0cIwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
	b=mYUh5g4C5+f3wO8MzhDybiaeSx5TNKJKUj2tZ+RfkaOem5MYGXjE9ByItOyZmyJzqFB/
	 dxJrZ2xqzqvhguar46JHUJzCeC7vrAaFndI61ziFVmeZWIawtlbu0tLqQKfczpThnvekj
	 N0mDPT14IN2bzCqs287vldUzui4tINhz0fm6wXprUXN0VxQpYBTQOVAAas6azQK41QH7s
	 3Mb5AqXnO6htydm9sVlp4LAvjyjayHYrvZZG8brdJUsix+5+6ZZbyHceo1FDNgtgK4kdD
	 k3BqmfipAtnLI5pAdjmcoCORRHxkF+AZhpdIDLweUI/CEb70Qf9DWMzVfV1q+0bs0IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=OJwL4udw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD2606A6A5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BD2606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=OJwL4udw
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so569638a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214557; cv=none;
        d=google.com; s=arc-20260327;
        b=oNzMi85AdzqYHPG2aSgoUN/nrOGufm3Nm5+8OPYKJ4IrWQK0+20/ljkvVAeAVkqWsc
         gGN/w305+CxakSqy7ukYVmjjukRRnap2aD7SqcC/6qx1xwEXXR/ETEsiuF+4kU1oBWcR
         ZUfvenjgvKOMbrwC01kgXTzSFKThs7XJ0nLbPKxQjITsintXqzor/bT8fP4ImxQmRSbG
         GfRr67bImyfFmJ02Q+fd0yU2BCNMMWaokb32+FSf0wgy2trFz4dZVJFsVQ2s08GKxy6X
         WSFRVCDgeoBV9xm/S7RNdVCJCVsBUNgOsvXmbnOlDSJXi8ONBTZ8c2lcKXwUkse3Fk69
         LpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
        fh=UjBattdrQH9zIJPhL/Hbkn4pdmPkv5oPz/V4fRhD1vM=;
        b=ZT57nZob1ygqABO/+PDr3hP/+Vfs6Icm1zXmnRrvOmMo4jUVRfvld1blt3G9B/+zn0
         oFSiqux8W3+zO7HsswGPlKF/CefJCor6e07ko6vEesupV/1ybi93E/iSw6Va0r2FLC01
         RguS4MSTOA+IcDt6neIsC3I7VuOQz2ORhYhJHfuXv6pmtZopSuM/oTL0k9Y5ElAYZ88j
         tP635lurkzpisTU+i+hkrMIAxq78GA5sXquzxZe/Ha19af81BIJ/rD/shPJcmIM28LHp
         ZxK9NHAvWIzRzGIow5sQHzP++ZBZ0UfaER/7dqhpxZMenJLGhAwIWyQ9JQJKzy6pk3VN
         YMNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795214557; x=1795819357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
        b=OJwL4udwjxpmrVlLHcONzEvKUwhIev56POEovLo3PpC21XYiIbCLjZym094IUqQtp1
         SzD3eL2YEmvY3tysOdOdNwsBvOmiPtoMmHs9W1NuU9fUrWicTXKcvYPxfOCck86JHzvT
         qbzhYmAnu4rs7/Vg9AJjp3SqzmuPPN3i0oIPTtuiuDD9ncyts0iF5uFGUBBego5huwqI
         UqKAd2WvunRkHPwyE5dN3n7lAhAjzJHhnmA6+dI+i7PADtHvZY9fGm65FaQVH8h/LZyC
         qOPtpKrdHbE2MqbsGQXCYLz9M1C9jJelpoD3tNstDXxXkAUrYEM8x00PwAvGX8rJVyE0
         16Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214557; x=1795819357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHqmqtUv3ldNxNv4goZfjp24sRWMWgjGzY8HbYBqnOI=;
        b=yS0SGknaXwdYSNLkKqXb0EhSUupgMD/J4t4M55EklA0X5ZqbysVEZ+vBMj0+S/4RDO
         W+dzaKQgNaSREKwizmTN6EdlqhZVTalaa+tfr6zHs3s6h/Ltib+OkrXCo0b0GTmDJupK
         uSsVXqDmC78XJYQWB68ea3hLWPYWVsiUZOJvGlkvQc2fyY2JvVN6BAUIiCVqQCVuQkLw
         er1U17xewUspwxi6dX50/jjJl0XP7sdiBOUHhP+om9JCgpAie5Yzvim8IEf+DtmriQ8G
         YEkPDAI3KUb6uxp1XtaioBh3D3ZYLYdVyT1sqVL4hlaL1FcklTS7u5yZRZEgcmCfdVbS
         Fihg==
X-Forwarded-Encrypted: i=1; AL+hErEvId1nTgInBTSReDHDICALqn3xhDIxSp5Rb33gJAj+/muQJh2NCWOaHZcTv3+ZriWwsyUp3Pqy57ezso4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GLM4NQd7AB1yw1OhSW5L+xmBtGqeGm9eipIt38FVvCH+/8Emz
	2OVkr5MtneY8YKMbGpLutvt+F7JoqwMxjT4IWhu0mHUO79th2fa6bwYR8hhTRKLZVlwlgKuR40+
	H0qNU3eHPNu39Ur0EaBnr9wwS99jhDdBh6oBkUspy
X-Gm-Gg: AZFdTZerV22EvvVjOsjUn69q2vtY5EcUwxjadCUJ0RKs+Oqj84Ss0gvla09ingTAft9
	xqyM0kh8kyUFabR88cevKNUgd+sJ67U2lJw36Gpt0bLpujdC7r2w7P/DdsBHmP0DcV4cPYXGxpQ
	sRLAU/m4nfxiLaC/qVS1WejhDiP6RqZaw/4kxnnh0ZVfhxOkdMcI5BQxQlp8gC9EEMNmJrhutaa
	PqYAGzHy3dotuBagGvqVFttyj8bExnAWQFC1CcIRrd7dHR+iO4bqrIGOo9nq9VRdAWG88Xnq++r
	XNUfG2eDbLHjKtG4Cx+lW3gvgxANb0rbDvfsOQBFbt/3PXuEt6FDfGLRrcH7XKGGEXJFBi8gSIo
	vONuVwl3q4npQiUhxiUSigtBpCQktLIB5/L0U+p3zwEisvSE72/t6r3yEwhDbntt4P7Ib
X-Received: by 2002:a17:90b:2e4b:b0:3ab:884b:659e with SMTP id
 98e67ed59e1d1-3b41c8e1705mr3678138a91.9.1795214557060; Fri, 20 Nov 2026
 14:42:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791023194.git.tjdqudcks0424@naver.com> <d7e10b50556ab3b79c7132018249f6f7c608411b.1791023194.git.tjdqudcks0424@naver.com>
 <asLNxHYQ/xQ6KaWy@hallyn.com> <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
 <CAJ-EccMjtVkvM5bZzUKDAPcOAKZbd1Lc59oNrW0U8m=s+4R9eg@mail.gmail.com>
In-Reply-To: <CAJ-EccMjtVkvM5bZzUKDAPcOAKZbd1Lc59oNrW0U8m=s+4R9eg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Nov 2026 17:42:25 -0500
X-Gm-Features: AclHuK8McY1ik9ic5I54PqjcEuVP28e3vO7azigKd93SO_GqYl3O-C3M45QZMNo
Message-ID: <CAHC9VhSZVo-TMR7Z9xM=ECVB5xFZhdnHK-OHpE_i=1g4dhTfNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] security: safesetid: use real GID for GID policy lookup
To: Micah Morton <mortonm@chromium.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, tjdqudcks0424@naver.com, 
	linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	Thomas Cedeno <thomascedeno@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:44=E2=80=AFPM Micah Morton <mortonm@chromium.org>=
 wrote:
> On Thu, Nov 5, 2026 at 4:26=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Sun, Oct 4, 2026 at 6:05=E2=80=AFPM Serge E. Hallyn <serge@hallyn.co=
m> wrote:
> > > On Sat, Oct 03, 2026 at 07:34:15PM +0900, tjdqudcks0424@naver.com wro=
te:
> > > > From: Sung Byeongchan <tjdqudcks0424@naver.com>
> > > >
> > > > SafeSetID policies constrain the ID transitions available to a task=
 for
> > > > each source ID.  id_permitted_for_cred() always builds that source =
key
> > > > from the old real UID, even when it is checking a GID transition.  =
If the
> > > > real UID and real GID differ, the policy attached to the real GID i=
s
> > > > therefore missed and the lookup can return the unconstrained defaul=
t.
> > > >
> > > > On current mainline, a test task with real UID 1000, real GID 2000 =
and
> > > > only CAP_SETGID obtained non-allowlisted GID 2002 despite a 2000:20=
01 GID
> > > > policy.  The bypass reproduced for setgid(), setegid(), setregid(),
> > > > setresgid(), setfsgid() and setgroups() across three clean QEMU boo=
ts,
> > > > and enabled access to a synthetic group-protected resource.  This s=
hows
> > > > a SafeSetID GID policy bypass and group privilege expansion; it doe=
s not
> > > > show direct UID 0 elevation or a universal local privilege escalati=
on.
> > > >
> > > > Build the source key from the old real UID for UID policy checks an=
d the
> > > > old real GID for GID policy checks.  In three fixed-kernel boots, a=
ll
> > > > tested non-allowlisted transitions were blocked while the allowed t=
arget,
> > > > existing-ID, no-policy and UID-policy controls, and the existing Sa=
feSetID
> > > > selftest continued to pass.
> > > >
> > > > Fixes: 5294bac97e12 ("LSM: SafeSetID: Add GID security policy handl=
ing")
> > > > Cc: stable@vger.kernel.org
> > > > Assisted-by: OpenAI Codex
> > > > Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
> > >
> > > Seems obviously correct.  Thanks for the find and the fix.
> > >
> > > Reviewed-by: Serge Hallyn <serge@hallyn.com>
> >
> > Looks good to me too, thanks!
> >
> > Reviewed-by: Paul Moore <paul@paul-moore.com>
> >
> > Micah, assuming this looks good to you, are you planning to pick this
> > up?  If you would like me to take this via the LSM tree, please let me
> > know.
>
> Hi guys,
>
> Sorry for the delay! Yes this patch looks good to me -- thanks for
> catching this, Sung!
>
> It's been a really long time since I sent any pull requests to Linus,
> so it might be a good idea for this to come from the LSM tree if you
> are up for it, Paul.
>
> Let me know, if you think its better for me to dust off my old GitHub
> repo and pull request etiquette I'm fine to do so as well :)

I guess it's up to you Micah.  If you want an excuse to get current on
merging patches and sending pull requests to Linus this would be a
good one.  However, I also understand that it can be a non-trivial
amount of work for one patch (which is why I made the offer).

Let me know what you would like to do; both options are fine with me.
If you need some help on the administrative side, e.g. sending stuff
to Linus, let me know and I'll do my best to help you out.  If you
would prefer me to include this in the LSM tree, please reply with an
ACK tag so I can include that in the merge.

Thanks!

--=20
paul-moore.com
