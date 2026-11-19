Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111176;
	b=zk/JoEfRci3kA3xxkob/gRH+2HSQPWqdy70FDlmjZBc+gGrmH7i5cKg7EcOFjMY6NoSK
	 dBExu37RRnLc9+x41fyWFiEjMg1ADMIqDs+kQDfAYo4oLk18ko8yg+mJInhJ9z3V+PTIi
	 T3rV4pHC0+bQPYybuBRFdGCgZ7ZxKRFsbrm+eL3jarjCFFDHh8kSCiUalR9A2etMzoTTP
	 rYHIJ6KDGvkhisbuUXddgJtQSmge+x9BcJFbkg10Qai3DHJCcem4u701SMIGxyvWC0GlT
	 dNq16Hs3wG7xPn0leiEpIwAEA7rS1VFDHkQ7XNhKEwXzCdbuZdJ/kbKkRhNFk5/GaRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZgscMLiDCOadJrkoKP6gtckWa0KBy7jbuT5m663Neug=;
	b=ECs9+Wr9IXqKgKlJJx2x/0z8o5OgIwF/PS+k9Bph0YUWrwqGr1nBM+4GQ8vGX6qklimO
	 kpxorvFOn0/nb18jfNNPLB4hOVQxUcTOnNtE9nkC7BuyH2+S50DwMAC3kXcIr6szty5RK
	 WdSpC8GkVoUW8fPnBgpqKU7ez6dS3596JRG8GISscI56KqB2qj4tRp/Ix0LVXLIjq8NEz
	 BwYEDra8y0S5rC4dnz+/Ep72tF2yF+Gapf13rSMtRINHco3xJC4M8aiPAm5sDXGJU01oE
	 AwNYXq96eJHvI7YpAtoL3/31kC5QqT4zjeSs4S0zrlU7F82DglfnNcqLzGo/VZBZmwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gks4Fbnt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4760A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B4760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gks4Fbnt
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1244749f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795111175; cv=none;
        d=google.com; s=arc-20260327;
        b=kruZfuK1kfhZolCw3jeLbfYJSZ9ndAa0+nS2ofDKlZRLKliDhqmC9mRBIfZEyNKcSg
         unJuWcRCTsNLwCngrjd99stZ0oHtXx6LL1TtFDZ0obdM9B2SsTCYDk24Abp0+D1l4Z3C
         +m23M7FJYKx8pd8Ko6lP9kLjj15Rii7sNyb6e8HZsYOQ0hGIPaQax7s2I+uc5HovgGpw
         NeTmH1HzDhG9I/TJlc4skT7TkDPHvskqd0cc+nj0PN6IHqgo0UcG2xqRiE5kDD+QUTCC
         ANMDeq3MaDBzia5OyRFsQQqlS65RVp7ZD6/xwKny1Du2Pfj2vsNVhUsMBiiBeM/WhoQ1
         1zXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgscMLiDCOadJrkoKP6gtckWa0KBy7jbuT5m663Neug=;
        fh=f3RqmR9j1NY243SKTGS5acZCOHXGi1HR4sOZhCoV7RE=;
        b=flO3RMLpNuoEI4AEpNNP/o1370J80SNbu2Vbh3n3FBWO165OlMFmiGr9dgyQ009BVp
         6CFCqHBcZdtFXuwDEeRWBmZZzhW48S0IDcJPx4H7VtmLgHTz5V6b/mt6mA3l2qfjHYjH
         LCBzqEVkFZGGoT1wSQkSTyiP6r6huKDihCuJkmlrreKjH9ESQspcV3qaka47lSws7crI
         Eg9SbApX3RNHrWI6ISLEBNWuE9wGIViVxDt8DU5i/+V+u88Tdowh3Vh478P1dAM0IfQe
         lwmZNZYFXzR66qX9hg6NLA3k9Pm5k4y874roNXePUUwdLNMC5zPxPv27T1XD+WOOM3Q3
         skqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111175; x=1795715975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgscMLiDCOadJrkoKP6gtckWa0KBy7jbuT5m663Neug=;
        b=gks4FbntYhBepMkUAWOCVysyoFVCB3MxTbmyA6XQTxARUjb3+KntQakgQGz9jazu38
         5P9vRaQ5F5ArZZSBoE20WjOdCInkmX+/USedyvOg4j9sIczowVMQYD/APJv1NSH3nOXq
         1pjP8nftNohrYfWdxD1hwfczb6n5zVqQt23SYEghm3+vNETJHOIe++s2pZA5IA4F0MnV
         UwHCBTc8p55S4igq32dqbiex8ONzUvRJqAAtrXgVSrErdOTxcdYlIk4+v1RZkqY8ONa2
         2wvwEE8rn2ztEOEjF4SlG9b7Ef+ckWaZNIbrsbBspEzu41XJGRkVNirO1ZWfAQkPLX/9
         2HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111175; x=1795715975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgscMLiDCOadJrkoKP6gtckWa0KBy7jbuT5m663Neug=;
        b=Dd5hOjn8KDw88d6DX/h5Q7Z/VDipatin3pgapYCRrrB2cMjJsbdmubLH2Vjy3VCp7c
         671Fl81GxroaPU4f6Cvh5tGgII+YuFC42rVmQXtqmVrgc2xFCN5uFyWsICeRghljss8C
         rzp4eolDg2RIh4FQw8V6vvAcWGKgl+fHU075hYw7lHkNrbR9k0daxyAg6SBk2ebSsmTA
         3jgviZ1opd6VbkC4q3OCv58Qsu6/ZgVM4eftq2X+dxCuOAR1yJtAtpV4Yzcr2cmWrER2
         X4PyGbp5ZHPMKwPUVjXVaIjD2ztXfhc+ZLMBjC8Q9Twz5g19JGRJGge2koRAk8pAiDYU
         sdag==
X-Forwarded-Encrypted: i=1; AL+hErELIGwpE7RvZW9YupkmXvYbhPYYncli+DRNTEojxQTwRv/DUzZmMDWSadq18ca3Rt0vxF2H4mgfSUPYdow=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iv/XFUau76XqXMTiz89ppcVHVWAx+jswgQwNVBZbaBxK0B7r5
	qnwGMW4pBRbXelu/2MNs5aPRGn2+TLari1vcpIhtapQtszq8izfvhMsfFmJt+5KOaBLzXHelaUm
	VNm7v+i3cJF/UEdBPRvNbhzEDVFXUN0s=
X-Gm-Gg: AZFdTZdvkEh3gDGxbFjW2wIsNUrwz4UXB5ccYEMJU8C+vVMFj77+iW+P6HGX3SKOxAU
	7uuu5+3GZJNOcQlrfgBik9pxOLpzfPHruDxW2enBtUgeyTVKi6v07kVqGx830ALJ8lw9H8j1d/j
	CmICzGl8AtivhxN+ceGDHA/3/+RTtvZRLxMhFBl888Zyrg2vrp8wIKm36v3dxaXPaLIX0nkv+Yk
	J4ymLmuhv0uDSI/ir9GTE/tz/WRq5vTKwzVOZPTeNW8qtZw828C3Kms5rs2XcXBIjwT38C2VEGf
	43grl6HJR9/QiaYHMpVWS78z4PPLQrMPW5h/G+UlBgAKcOk6ZAE8uErTLyXtM1iYdonjbmEtsg+
	eEp0CcWIYvMA4KtajYBGcLXujArvl4BZOp4GLcKSnr8lBVTquhBU3tKBx2Fe3t3K7WX5+gh+6KF
	DOj1u7kiPBBGXCTolkSKMgJo3qI1A/ru3/bw==
X-Received: by 2002:a05:6000:460e:b0:4a7:790c:4a34 with SMTP id
 ffacd0b85a97d-4abb3b42a90mr312581f8f.20.1795111174618; Thu, 19 Nov 2026
 09:59:34 -0800 (PST)
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
 <CAPa8sAh6b5xn4rZzPfM0nZ+_kkywWj22fy8deLq+6qYews0rdQ@mail.gmail.com> <MRYP264MB7057096D13282544720793F2E67A2@MRYP264MB7057.FRAP264.PROD.OUTLOOK.COM>
In-Reply-To: <MRYP264MB7057096D13282544720793F2E67A2@MRYP264MB7057.FRAP264.PROD.OUTLOOK.COM>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 19 Nov 2026 09:59:22 -0800
X-Gm-Features: Aa3M54rI23MKqBWHsKCyo3oqXGgxsyN6jYM1v0m1--b9Se0lLJrl3D4bMloAJWc
Message-ID: <CAEf4BzZWEU24+ZC0W_20hc3t+qnEHncQA1ztTF7ZPPOf3DDPVA@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Paul Mabileau <paul.mabileau@harfanglab.fr>, Paul Moore <paul@paul-moore.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daan De Meyer <daan@amutable.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	roblabla <linux@roblab.la>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:14=E2=80=AFAM Paul Mabileau
<paul.mabileau@harfanglab.fr> wrote:
>
> Hello,
>
> On our end, we also have already merged code to adapt our eBPFs to the ar=
gument order change. However, we would still prefer if this easily-avoidabl=
e breakage could be fixed by moving the argument to the end, even if it mea=
ns having to revert our fix.
>
> This is motivated by the fact that such a change is not made in place on =
our end because we ship our software to environments we don't control, mean=
ing that any and potentially all versions ranging from 4.11 to the very lat=
est should be supported, so the change is made by compiling and shipping a =
new variant of the concerned eBPFs for the version interval it is valid for=
 (7.4+ in this case). And that has to be done every time there is an upstre=
am change like this, so the total installation size and overall complexity =
grows accordingly.
>
> If we could avoid that, especially for such trivial root causes, it would=
 be nice.
>

I agree, and that's why I'm asking Paul to accept the patch reordering
the newly added argument before 7.4 final is released.

I do not think that the maintainer's personal preference for argument
ordering beats real user pain.

> Best regards,
> Paul.
>
> ________________________________________
> From: Daan De Meyer <daan@amutable.com>
> Sent: Wednesday, November 18, 2026 3:18 PM
> To: Ihor Solodrai
> Cc: roblabla; Andrii Nakryiko; Paul Moore; bpf@vger.kernel.org; linux-sec=
urity-module@vger.kernel.org; Paul Mabileau; linux-kernel@vger.kernel.org; =
Andrii Nakryiko
> Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silent=
ly breaks BPF LSMs
>
> Note that we've already merged code in systemd that depends on the
> current argument order, so I'd really prefer if it didn't change. If
> it does, do cc me on the patch so I can fix the issue in systemd.
>
> Cheers,
>
> Daan
>
> On Wed, Nov 18, 2026 at 1:52=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linu=
x.dev> wrote:
> >
> > On 11/9/26 8:07 AM, roblabla wrote:
> > > Hi,
> > >
> > > Thanks for the replies!
> > >
> > >> [...]
> > >
> > > So what would be really nice is a way to make eBPF code robust agains=
t
> > > kernel changes such that it either works, or fails to load, but doesn=
't
> > > do the halfway "loads but silently misbehaves". Here are two ideas th=
at
> > > have been in the back of my mind that could help solve this issue (th=
ough
> > > I understand that they may be rather large changes, I'm putting them =
out
> > > there mostly as a conversation starter):
> > >
> > > 1. Could libbpf/the kernel have a mismatch check on hook arguments? I
> > >    understand that libbpf and the verifier don't know the types a
> > >    program expects, since BPF_PROG() only casts u64s. But the macro
> > >    does know the types at compile time. Could it (or an opt-in varian=
t)
> > >    record the expected prototype in the program's BTF, so that libbpf
> > >    can compare it against the LSM hook's prototype in vmlinux BTF and
> > >    refuse to load on a mismatch?
> > >
> > > 2. Since kernel BTF has parameter names for the bpf_lsm_* functions,
> > >    could we maybe have CO-RE-style relocation to resolve "the argumen=
t
> > >    named dentry" to the argument index at load time? This way, adding=
 a
> > >    new argument could happen anywhere in the argument list without
> > >    breaking eBPFs, and removing an argument will (correctly) cause ou=
r
> > >    eBPF to stop loading. It does mean the eBPF programs must provide =
the
> > >    same argument names, but maybe that's an acceptable tradeoff?
> >

[...]

> >
> > ---
> >
> > And just my 2c re argument ordering:
> >
> > Paul, with all due respect, prioritizing code style and personal
> > preferences over backwards compatibility is unreasonable even for
> > unimportant applications. And here we are talking about apps
> > implementing security policies, which many organizations (not just
> > companies) in the world rely on. Given the recent flood of
> > cybersecurity issues (in Linux and beyond), I don't see why would we,
> > as in kernel devs, intentionally make the defenders' job harder.
> >
> >
> > >
> > > Thanks,
> > > roblabla
> >
