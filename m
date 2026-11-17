Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794951887;
	b=e8p7xLQmof3cZVJ6ge1pKoEXV4dRO+hVSooAFD3/QLRkNI5zBTB2ptFvaUP0jfQPF3OU
	 ecrzfoZjb8CMT1n0Xw/ESD0NsujUeJsJiXSRn974i5MBu5E9m8dDzfGGM0DUcTChqP3VX
	 zNlciN07oXsFqJ8Shgl3SAgEsGyymHdL+R/Bd3mNmRy0T4rkalCcHbiShvvN8bobeXNQQ
	 uo2KTWX77Zx/liwicCN4gR5oPuPwKpC92TEsBrdabLDQTRbkM++OpqEPGNbZ/ewkY5p7J
	 NjO62ZzzrrSWgI/0a1z9NzNgjl1WZWP+6mjtI502C6fBeg0bX136/GyZHnN0eQJO+8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QCHf0rhDeEETaZD4vNh0xBLfMvMYAYCFBm3oqRl3Mdw=;
	b=NntpacYCyetevUuDrYLG/0cNlVGvw8D8dhxsY+5udVKjtXSOUHeh7ghXcjUmHD534tZ0
	 ScIa6UGvk4xnNhcmdNm8ExT7l3aIQeYC6dK67Uswaa7T+GKvwbPc6rHg4jiz1LlzY4OE+
	 HW2cHqWrLp0XF1vkq5tasEEXIYuzv32YX10+5WEGfp9AeAwep7OmjprXACMYajX0nj4xU
	 4brIRAV5P30J9X3Mq/BEEbJZ8YAMUvtD7fVOBbwbuyUaumDgWY+e87zkx9rcQ29eLjegz
	 GrSb8RyXO8BZTIEGOkTZeRoGMmxiKeR0rqUjupXd2k22kEzriw8JAHF+4tAh7jEtzqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4akuTuj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DA606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3DA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4akuTuj
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492690dd5daso186651f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794951886; cv=none;
        d=google.com; s=arc-20260327;
        b=Pgu/YOh8CeV/Efo+I/6qO+jxjjZm+WOBQ0uI4iVrAD5MlEt0dEJJZI+QQ0kJCgVSeP
         Pc/ft86k9DglK+XBQgyoiOcH+vNfgoRIopUUKrVwQENRD36DmaoS6YLwezmyGJ+9PZ41
         iVDaAIT9zSMTjXE7LqCMg/ieRL1aWoUDMDP/tVGRCdFCm86JJVlHeLuUYlqBqxtwXkje
         oyPAmDjhIup3H78uU4nFNCPh3n6y4bBrtQLwHUzoMsgUhjhCJFDD+IH1T2N/bMhpoQl0
         7d5qC7DzWq7Hsby7TpW3stOaiY3D3PWPdHIzNZQoqBXV1fsdWFypGzs9SbKrlQGlNL0G
         3qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QCHf0rhDeEETaZD4vNh0xBLfMvMYAYCFBm3oqRl3Mdw=;
        fh=jDd6XuRiuO2EoPlCPDH4mdFAyXypEOyOFbDCWvSfNWs=;
        b=C3maF5DLCXWo2m+imrxjfhK+An3+VKkJuXnNmxRTy1hbrHfbBTFodFvDLjZTrCOHyW
         +Cs+Troe3QaRKHz8dxGDwN25EUEHKDCy5DaAqx9C9AJufPL60/cBdCjTmYIWmWkf2keH
         8w2XRyuS5x4j6ow6koImIZ17ujBqUzDH1QAmeDGmdCl4KRtZw0ZESws8ldTbiEJfwQfC
         OKfP/mv0oxiD0ut/6ebJcy9jDuWdejaqeAE+Fk5Sx/VP2F2AKf+QfhL2tzdN51txrhr2
         FBGSAdDA6wekKhVKch+xcKohS1uxw3F4JCNC3SB88r78lGYP3JQw5B1EMXCaiR6Clblz
         q5RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951886; x=1795556686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCHf0rhDeEETaZD4vNh0xBLfMvMYAYCFBm3oqRl3Mdw=;
        b=Q4akuTujr5pbvaLa0lhDO0YCADGQAgjj8c2bG0N995NS/8kAVFkkoWtJjNIQKLY5fT
         4ickiyj2FfqJOk8tH16u9eywWyjjuOmFE2Z76cJqYpJth3IvCSP6L/HCPzEW3Ho9Hm9R
         tVV8fupVGdTK9lKvreeZp+la3khqvF/seI5TtqQYoDGbT3AdKpvkVfS4+/OLrjJtWqFm
         UtMTRjJm6oOzhtgyNQyGNCyQanScn66u9qQY/VN7Qc05wwVkkDuuToTv5Je99B09RCnZ
         qaWDLTWuUDigZ0f0SuJLY+eUXdEfA0Fv2meq2PbnYvGEcToaK1tcPcGI2VgejyWZ0b6Q
         Li5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951886; x=1795556686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCHf0rhDeEETaZD4vNh0xBLfMvMYAYCFBm3oqRl3Mdw=;
        b=uup0gFkXRDA+zxoOTPLnEN5O7cs6mJiAMaDlZKzJNrbltsJHwg9bxYOiD6AZSnnzcR
         rNq4p1HTSVGcBuGAy7OhOSFSwVkkMEp8+3nuR/sJ8KTofZV2DdU6YW1HWAr1JntcBsI0
         of47ZxvwvmqyuKlGva4xOgJ56dxTk4Mo9u105fUm9tpDpAUDjB+UIlCk1xSUCx/GjcIf
         zIDVjT4/l4X4O78Hvg4CrKw51eoA1m7EfrRjLmy/DOxKyugj1aYO4+rgPoTUT/wbYmLO
         T2m+oI2lQJ9pMRU0XMoRbvhigPvc4L8Yw0sGpC/AP9X6yiYxD8EuHmmb8igk7g7KCeES
         94Ew==
X-Forwarded-Encrypted: i=1; AL+hErHcFVZnWH1x1Zw5i0RPHsaAuJnlSciVCcNGFJEFPW6ieVyiW/Ha+MEm+SENCM0AbA54rR4FHCkx3pHSFlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WMspG2he4tjgD671wDS58UTBY9moLyRGepUZhPHclrefMJ6eZ
	qGbIvrv2fW8KEahk0x1wHCajbBUPDFxMD53RM+vGsIosrQZyXyEJPLnnAi03lpcY9Pat6HI0ITj
	eg9l3phhqgXJntLbI+he0he+JTsIYZqg=
X-Gm-Gg: AZFdTZcny6p+CSBb/y5OXcSIVdYN6lxaSSWg/GevFJXSPHQXxBn2ht0Q93aTlqQ1ahy
	gxIg1LUxTy/AAHxOlCR+q70DfSX8vBMLJATXI+91qlGI/oVcjAv6G9NgTpSt0ZvnfrBs/Ham7P6
	bu8pbwr2pFFPQDoGCRY0EMLaspy0i26/RdbETIwtrj5v6gQ2t56mTeL9DLUGcN2kQtI5mRhBtlm
	yVr+m/aQQ6PyGsuOjXWRMTwqko7miuw74l3xNAl2pGO2NqBiURJzFnZfHkikukx7NcObWqMRKSz
	WU/5yqRGA00p75HqGK1FtF/Tx8EZ+JtI0LGt2AW/KS2oiW9fc78A/Hi2NWh/Fs3+GZ5PHzhF5V1
	ih/6BtkR6gkEEWtON1x6TzAFEuivGbLCfkEVUK1dO4l2j5ZJFr6MDsbbf2JxqKM7D912pugbQfM
	h7Ogia7Knc0jh3z/hdykO98VoYPuIgUlZxF304w6dUo6tZYU2ymSl+8J8=
X-Received: by 2002:a5d:5f05:0:b0:48f:cb37:3ec3 with SMTP id
 ffacd0b85a97d-4a63b22de8emr1573091f8f.41.1794951885727; Tue, 17 Nov 2026
 13:44:45 -0800 (PST)
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
 <CAEf4BzZ120age2-M-a_TJ07xohb7-s=xn3e1W_-V0kopnATq6A@mail.gmail.com> <CAHC9VhThV9xiXr8j5_+W__CBKn0JqUiZ-RGZpF4Nz-i_RZprAQ@mail.gmail.com>
In-Reply-To: <CAHC9VhThV9xiXr8j5_+W__CBKn0JqUiZ-RGZpF4Nz-i_RZprAQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Nov 2026 13:44:33 -0800
X-Gm-Features: Aa3M54qGP8nd7yA_gOyJhY4In2fLuAhhx8Joode7Q3Ty5mdfX54Ucq86pk3FqTg
Message-ID: <CAEf4Bzb5Y5TUbN3kLBJNPn5Ae+_nbc7YhJice_wUzqdvpjFr_A@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Paul Moore <paul@paul-moore.com>
Cc: roblabla <linux@roblab.la>, Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:30=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> > On Thu, Nov 12, 2026 at 6:41=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Thu, Nov 12, 2026 at 6:00=E2=80=AFPM Andrii Nakryiko
> > > <andrii.nakryiko@gmail.com> wrote:
> > > > On Mon, Nov 9, 2026 at 7:08=E2=80=AFAM roblabla <linux@roblab.la> w=
rote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Thanks for the replies!
> > > > >
> > > > > > LSMs that need to provide a stable API must provide an abstract=
ion
> > > > > > layer between the LSM hook callbacks and their stable API.  The=
 LSM
> > > > > > framework is not responsible for the stability of individual LS=
M APIs.
> > > > >
> > > > > Understood, that lines up with my expectations. I think the bigge=
st
> > > > > thing here would not necessarily be stability guarantees, but rat=
her to
> > > > > make sure that the eBPFs fail to load when the compatibility is b=
roken.
> > > > > But that's probably a problem for the eBPF side, and not LSM, I a=
ssume.
> > > > >
> > > > > > So, in short, would it be possible to send a follow up to Daan'=
s
> > > > > > commit and move `struct mnt_idmap *idmap` to the end of LSM arg=
ument
> > > > > > list?
> > > > >
> > > > > If this is possible, that'd be nice so that we avoid this breakag=
e in
> > > > > the short term, since the change isn't in a released kernel yet.
> > > >
> > > > can you please send a patch proposing that and we can continue
> > > > discussion there? please cc me so I can follow along
> > >
> > > Considering the original patch was submitted, reviewed, and merged
> > > with the BPF LSM being the only user (none of the existing in-tree
> > > LSMs use the idmap parameter at present), I'm a little surprised this
> > > wasn't brought up earlier.
> >
> > Yeah, unfortunately this was missed. Not sure it's surprising that it
> > wasn't detected immediately, though, because unlikely someone tested
> > an unreleased kernel in production. Luckily, this was still detected
> > early enough before the final release and this gives us a chance to
> > fix a mistake.
>
> I've been surprised lately by apparently how little the BPF LSM
> program interface is tested with real BPF programs before landing in
> Linus' tree.  I know the BPF folks have a pretty good set of CI tests,
> bots, etc. but there do seem to be gaps relating to real world usage.

I think it's a hard problem, yes. BPF selftests test latest kernel, so
this issue we are discussing here just won't come up there. Then,
e.g., for Meta, we do have internal tests that validate existing BPF
LSM programs across different kernel versions, but unless our internal
BPF LSM programs utilize specific LSMs, this won't be caught either.

>
> > > Beyond that, from a style perspective, I think I prefer the idmap at
> > > the front of the parameter list in most (all?) of the hooks where it
> > > was added.  I'm not interested in moving it at this point in time.
> >
> > So on one hand we have a real user pain which is easily fixable
> > without burdening kernel and LSM subsystem in particular, right?
>
> Arguably changes that negatively impact code style and readability do
> affect developers and maintainers.

I agree, but argument order is not that big of an issue

>
> > On
> > the other hand there is a minor issue of argument ordering with
> > mnt_idmap preferably as a first argument. I get the preference, but I
> > think fixing an unnecessary (but easily fixable!) user pain should
> > come first, don't you agree?
> >
> > Can you please reconsider?
>
> The user pain exists because there is no abstraction layer between the
> LSM hook callbacks and what the BPF LSM makes available to BPF
> programs.  That's a choice made by the BPF LSM devs, and while it's a
> valid choice, it does have drawbacks like we are seeing here.  Changes
> to the callback arguments and/or the semantic behavior of the LSM
> hooks are going to continue to happen regardless of what we do here.

Yes, just like it will for tracepoints, kprobes, etc. Sometimes it's
inevitable and BPF ecosystem does have tools to deal with. It's still
a friction and pain and burden to do this, so if it's avoidable at low
cost to the kernel, we should try to minimize unnecessary pain.

That's really what I'm asking about here. We did do that with
scheduling tracepoints, I think it's reasonable to do this here as
well.

> It's better if the BPF LSM figures out how to deal with problems like
> these rather than relying on a set of bandaids at the LSM framework
> layer.  If the decision is to push the pain up to the user to keep the
> BPF program interface thin and flexible, that is their choice.

Yes, thin (and thus performant) and flexible is the design choice and
I think it's fine. That's not really the crux of the problem here. As
I mentioned, users have tools to work around changing unstable kernel
interfaces that BPF programs rely on.

But in this case we are discussing reordering a few arguments *before
they even get into final release* just to avoid unnecessary pain and
workaround. *Unnecessary* is the key here.

I really don't think that's too much to ask in this situation.

>
> --
> paul-moore.com
