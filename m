Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271576;
	b=nqMkNORsYYmJj3hpk5uOqTWhYSqkletSjhlAZQr6YMkaClgIgv5dhjXPTltb8K+NzcD2
	 OJFMsdRwtwOM9wGJvSHSLHIyltb8p4pNVcxYPJWW0MQV9Zy9s0k2Jgm13gUxHsEpNY0II
	 OZz4GPcM733ZPM2MIoEeozJUHm29vJQ22aG8kHoEQbNOKTHxM5PUqt6oJpdPXTx+dAiaa
	 Imd0RBay4Gz3yb1RAnW/MTYYnw4TSx0M035nGjeXVyherQqqL+wDRQw0c4jZ81ZV91rZS
	 fn6GpOgnyrZv31/7civxV4jfjCmBwJh6lrn9UTHPJ9T6X6aw0Fs+QLo2osteQQW2pqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
	b=UOq/cJxTwdgZk7Kw6pZFYl6XDOdbwGducywbGUkOt/GJ5yb6WQwy8J3YFtaYR+4Yv2KB
	 f90IzNR3AX2K52n2W3KqPb7SqUZj/KqnBsdwO2/gTW0CRyjP3WP1m1fJ9pISA/YR2Ru/k
	 rya1uwgajdQOpAu6LTFbfw19kpxBO0ju2ayxQBHk0sBRJss37aUxM7BKBHbzslU35DU6t
	 l1VLey3WRP8sW0rzf5z8WdpgwkxmUTS4P8YCAUa2UAJNUvQKUuPRNt21CKa6EptvVZUjt
	 I5cK95YC3+MzI/XOCqvNbZoQ5idsmzUGneGlS9MFqVJQpjLFnyuiUYgktpz0evr4TjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2vq4kFx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB685606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB685606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2vq4kFx
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so14793657b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795271575; cv=none;
        d=google.com; s=arc-20260327;
        b=lzvLLDnQDOXtZMPNoytXgkA+dfFS2QuBt8mXm8WPgIQMwDH1MP1UlaEfzeaGRdPY2n
         0gbl9qft3964m5Z8J7lgyoB0PjB+p+6zuLSkGwclhZqexs62YI/bHMBKPOL77l1HG1tU
         d4DndEImsOMBiUV2HzkIQ0eFp4aGbKt4tWQb+/2HbN9NL22k0M+DJnxdwCefZnrLHr6e
         DfhRVRgdgAXjz5Ca3iFf8Qvn6e+g6G8M9WYB4tmP0F3etmOERxOOwjfz1sjn1hUQ+COR
         MercduFnpj/E8dReT1qEGLUaHCnHiHoNcDNqFRFUOlpuoe0u3F7MwU1bZLKOHFURl30K
         LgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
        fh=uJGXoFiTL1Y6xX0SY6F8M5rP16fq4NyxNrotDlpzILk=;
        b=dV4y1XwlwQhKIbWjGGNtQBLpsHeTL44V8IvQ5QTSW17c7JzQyv4EVeP0bBaz1mL5Yz
         xbMEaAcmWn2l4s8kZCFgJkzDKN8sC/zWjDTSMbm2+kLPCLbE19AvhBH3dIrrKFrfvQN/
         IibVQFI+ARHZMj3vuLbnTTQXoBkBiKZH+RVHyZ8y1INT1QoE6WqXVXMng8XlwCbm43zT
         2VnjlfgL1rWP1aefFmpoLI6xkf/pnmfLuHGextHxJ/xbXIjAq1rCrx0VdD9EFFTszkmh
         7yxlfkJs8S19QS3pOytZsyyRHXf0mB1tIg/X3FW04Gq5QCfhGSlg9tsFUtp8hv3d19Jf
         oR4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271575; x=1795876375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
        b=m2vq4kFxNBvRwZIpgD6G3WFh9q8jSMNeDEVeSRi8c1R/vzeW1yMmFIirqBxZORDIE/
         ALiddfk8sUyGQ8eYOzuzOfQpLWl7NGyTaE+hyMOBzbG6xIHvzJ9r59ClAwwE/BX69vSz
         Whx5f0cZwBi/SRkW9Kk2bRQUX/IhLVeRw8NPDbaglWO2o2DjJ+C33/GHYUlh62F/f/fQ
         KbMCbp47X1B6eJGRSM1QtU8LULHIfASDw8+4uGwx/W+DVwjdr4GXZLAm+QE2u0cAeyE/
         178A5veHonuWOlk6nvOkC5Mstfm9h+6LhgFMu4X40H5eWi0as3WcMJ3UnppqIHZXN7Dh
         6Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271575; x=1795876375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
        b=UM/n3gYVL221ODJ7QyEeHWweM8PXvwYpV0A0yke1hs2D5NDSq7+x7KhXi7u0yLFniP
         LJLtd5Jj7AtxfgzSwD1bD3pHf5IDHr01Ptz4aGIpQUgVJj8e2mm3aUNiPoXyyKZ8KeSU
         ZHafBinBLc9Hhhzd/oMRC/n3EKMizpo/dPqhCkKrkxbqEgH41pVh365CS0YQ7OGtF3l6
         WLxiwd/FTuRV/l1UeJgGa8B1cYzDmiFvG3/+BBAG/WIjepPmIzRsYwlzWup/iI0tKRWR
         skuCNF/YpeIQqria0c+3QD2CTrqiHCQUGddC7aVWL+jGy1KYUPeo6TUQoVxbUKNmlT9d
         iHPw==
X-Forwarded-Encrypted: i=1; AL+hErHG/3i6nKBkj1qKlJR5M2nzAeIImA8cz5NaBsUCwQnYPXjQvb8R2oKV0eC/Ll9diLHAehj2hFwN3CcTM2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FPm/tFNlxf9bP8Hs9RAUDYvJJtNALn76m3jd3K+37oOkTMKRW
	EbHH7YbR6dmRiI4zPv2fB1U4AMCae2M3Pds/HG3P9h/fS4EaBm+HcZ6ytxxDsHEjBNo4HlCyCTd
	NDqZVXsRKnZqP6xQG92wCf1BgruG0mX8=
X-Gm-Gg: AZFdTZcDgDb3p3C9P29DUOMerQ51kiZUtFv9UGV3EJSLSby4WyhUfcB0+C/4Frd9pRn
	gnxI0ENqGRB1iq7Rts0a5Mz/6DcAmkoN+IqVSPPAgUvfuXweKIKHvgaNWXUV/E/7OXU18YPF3as
	/Uicygx7SgnqZa5ShAGFpQkCSCCmZd4HGxiEftuktRKKEofsZPnfLVmLvu4W3Ya1YUJskAfU6ct
	Mc5o7J1QHQDpNQpaySBiUEZ8hw0c6FBWtS/z2+RVYvilhEZsqXWaE384qLISazzTYRt1xl/in2R
	FtdMxr2kUJiwnrj+tce3p9LPUz0MN03KLJjENhiT+AW6j1LptTrink7lSd9PEIdM4UpyRFVfsHA
	J0qroFmJwaEtdNXN1OhvB3FuMLiyWVzLadWNCQQWJn2bEXrzSbIx+N7Ndqn3F42LnoFjHazNoBA
	Xn5GRrOlz9bpH6HvdI3rU87U1E7/mWgQRPvd2PR8UTK14Jx2M9SGtNEZnkJ4PCUVwp8EpucSLVw
	vjwZdijd5c=
X-Received: by 2002:a05:690c:c15:b0:8b3:27b8:2bd2 with SMTP id
 00721157ae682-8b52042f569mr29562167b3.10.1795271574490; Sat, 21 Nov 2026
 06:32:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
 <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>
 <2026101828-oxidation-squishy-51e3@gregkh> <CADhLXY4N5ia9-J7ahmnOE2i6r5w-SMZC0KiezFu0P1n7=O_xrQ@mail.gmail.com>
 <2026112002-unshipped-refract-b827@gregkh>
In-Reply-To: <2026112002-unshipped-refract-b827@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 21 Nov 2026 20:02:42 +0530
X-Gm-Features: Aa3M54pmSP3r2RDx14c9yHGMuKb4EPQDSaLBIa-qjaYbhoQVx0B1zY6be2Acqk0
Message-ID: <CADhLXY6oXUKd7u+wXNxBOz6cVabUdnOjt6V+eeHL9n6WE9-cnA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:04=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Nov 15, 2026 at 07:16:56PM +0530, Deepanshu Kartikey wrote:
> > On Sun, Oct 18, 2026 at 5:24=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Sun, Oct 18, 2026 at 04:28:49PM +0530, Deepanshu Kartikey wrote:
> > > > On Wed, Sep 30, 2026 at 1:48=E2=80=AFPM Deepanshu Kartikey
> > > > <kartikey406@gmail.com> wrote:
> > > > >
> > > > > On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoun=
dation.org> wrote:
> > > > > >
> > > > > > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wr=
ote:
> > > > > > > u_audio_get_playback_srate() unconditionally locks and reads
> > > > > > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > > > > > p_prm.lock when p_chmask is set. On a UAC2 instance configure=
d
> > > > > > > without a playback direction, this results in acquiring a
> > > > > > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > > > > > request targets playback, triggering a lockdep "trying to
> > > > > > > register non-static key" warning.
> > > > > > >
> > > > > > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > > > > > before touching prm->lock.
> > > > > > >
> > > > > > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playb=
ack srate getter")
> > > > > > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmai=
l.com
> > > > > > > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badec=
c32d45eb
> > > > > > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > > > > > ---
> > > > > >
> > > > > > How was this tested?
> > > > >
> > > > > I have not been able to test this since there is no
> > > > > repro present in syzbot.
> > > > >
> > > > > I verified the fix by static analysis of the call path in the rep=
ort
> > > > > (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and conf=
irmed
> > > > > in g_audio_setup() that uac->p_prm.lock is only passed through
> > > > > spin_lock_init() inside the "if (p_chmask)" block, so it is left
> > > > > uninitialized whenever p_chmask is 0. Leading to lock splat issue=
.
> > > > >
> > > > > This patch is compile test only
> > > > >
> > > > > > Did you forget a Assisted-by: tag?
> > > > >
> > > > > Sure I will add assisted by tag
> > > > >
> > > > > thanks
> > > > >
> > > > > Deepanshu
> > > >
> > > > Hi Greg,
> > > >
> > > > Please let me know the status of this patch.
> > >
> > > Burried with 2000+ other pending USB patches, please be patient, ther=
e
> > > is no rush here as this is not affecting any real device you have,
> > > right?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Gentle Reminder. Please let me know the status of this patch.
>
> You said you would add an assisted-by tag.

Apologies. I have sent the patch v2 with assisted-by tag.

Thanks

Deepanshu
