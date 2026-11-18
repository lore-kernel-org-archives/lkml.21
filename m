Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795038587;
	b=S8G4KknP+gRJPNIP3AVcN79DRmcv+6OWgWNQay8B2DOOdsMLkt9Mi70EoLZEJAEA1aGX
	 eapTGGTkX6q14KdRGmHxSo5HniDX8EhQ3p7M4mtl5bbSU4TK/7E5ORcq1S4UzDArwtlGK
	 wZFfvA952ZAaFnZdbr1pudOYHDdvgY/x+Fu5M5RtRlNJa9mZ3G3BhDNU+x/WUkuGIe69I
	 zl06e8XE3olv76vlfSSJR+m2lNV00kbq3v74m5f7Ge2NiK/xbt5af5BgVk6LX/JmZt6IM
	 4XIrnGP/G2gWuun2eShpnJctk53ljOWndPbNnHZ00C6KjWxeTDE/9VgLQWECJunJC+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
	b=34kpAzbFai3O6+k88vCbKflGZM9ZKh/UrIOQgtWr/AX8hV6jab/WJZJkgMukc2H3pIb1
	 d8O/8UvLGyBBuEOUs+eZCyFB46cQULTnlvnR9+vDU/PjKYLcWM5KfkNYI5MxGhAUD5jxr
	 26V7EqD4Zde8TGVD6iAtvjUH6RtLhv/8IB/9/G9zFDJ3wavJ9A+WVBNhVsJmi75v3jM2s
	 OMNIdgdiPqy0cBqrTmunjw3Iby5HBSztfru6rsenKblgfMBtXFuil7b9F8pY+qyg3fSJz
	 QhWZ6aanaIn90SCTdn4tERnQP8VmhV1mCV5kNxf9BSLAB2+gnAemXYMHBducio0Z/4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF;
	arc=fail smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96799606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96799606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c15956ce07so284199e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038585; cv=none;
        d=google.com; s=arc-20260327;
        b=arIKg9UhWh0Yh71vyX/GYEO37HoOAa70SbJxoFj2Erp75BJXhYcQK7PHvFIeI/pYo4
         q//zFu4ZxQ3t8J5Ndz13orwlDsXEtZEWanv/gje2uc+F3Isf2p/4eQk4FckP6gM8Z5gb
         z2gQuyFDvoUeHAj3kNCE0414nweKiWOW+mW0NYA8Xw1urE7jAdTDFFlbTknTmuOrJXjj
         xJPEl8KEX/xfRjlb88HK8OOk3KgVGAwS67K5jLZJNbMpmWETa7e1GgWralUB3V2rx+VP
         FjrBI9f/5o7wTYx0YF1AvBitszU6PvESL+qow/kUE72T0mxFSHSJLkSUf5SlRgzLy+QZ
         kf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        fh=T/pt/ofHG6rxv+YOPxGTJ0/8BP+HKnggmMxwoRQohXE=;
        b=l1Wb/HYhscSQbWULYv5YwrkX1ibbt6qpaLcZvylpjyFlap8eENJdth6LxJFxaGi//C
         qAK/fxEVYSQHIQfRui6ebPD6BTYpqefbI/Q4Z0uvcYkqiI4op7NfEYobFw9Z59i9XNQt
         iXR6AhJw+aM96onnVk+iWzdzTQCSHcaGcP34i6rJN7l4vTq11e7DBaQk0oDMBcSAhSKl
         HyjV1kTHzC4on8FHMTirXM78BJc7XTT89TLXm6cbCoF/1HBrN2nL3vlKDm9GtUQTgEe6
         IQiO0eg1rBc6Y+njpr+4HhOYAVdZJzSSe8opn/YXFkIB+X3bde3dU0zI8y+OdKY4zpyt
         OS2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795038585; x=1795643385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=KaciEEIFbL/YwiIDScNJOJE/ZISkK9Hm5quErzyii+lNT1WfC7kXZg/3FpRZhArF36
         Ad6xuGX4OWHMMcj6Uv+Z0P3xjYKr4xdoCcBZYBSZ40V+hyh+sFba/6f/Byhy6/IHBYV0
         /krtJ2/zrzEeNc29BPoEzTEoutLnweqJEraHWGz4Xdqq1myp231uUNQJfdNikDffJxU0
         OhrtcSpB956rNGC7WaELPyoRadGtF0ROnUwsxD71d4jKhm42p47rbfwAaCyy31Ekzp8c
         eLl8tZDuFmJ51rjZGikkRD11SztUd+7xg3bdsx6y/sDvmlwM86hcs70DaEGgQFzFJe8W
         wh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038585; x=1795643385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=bNAqigr22HJyadZ0cQVKwbLss8TPvppEEFQM66onI9WIoeNdrhuSWbQ9qgphotsUMm
         WgUghaItxBrM2M6JaSixuGyaQ4RNcIHrlwmH92vlQPIHT5LDhdSZ+9Jh96vVzhtkS5oE
         rKsb7XuCvw35TQ2szAFY326h5oFRTPpzWtyoYcORETwx6Vta+oJoAr9n1DxACGRTV5T5
         sMpcFz3KEecBXsa9YJFeB7iCV7lHlmOTq7zSYM0TYEcV9wsdPS2UvuVQbbcfFNxDR1lb
         7MnaczmbYuIPqpAHUcaAdCbaKHGrGC6E8bkELKKgHND3eXxEzRm2nO7Z+HeN+luI5xLp
         DicA==
X-Forwarded-Encrypted: i=1; AL+hErEqiAMTdx+5OFv8XJwWnn8Ra+9EBHr0NbszKRnv5IwQpBxeK51jPh4X2+AVMhqGD7Iqg9rIpjcDJjDQCmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o0xW8w+fBPx/4r2+8RIlLPhBVm1yTptrCfRLKu8hOz/sWjMsN
	EkqLgChZOpAltpYPxtomWaUXah+ocOf5YsHewlfZCQOAjyMBwpA0iKMQvBlJu/HtPxQynlYDx6S
	OkoPmIS7xLY2uwxs6uBbkQhmr8uqIZZLXIdBNYsKm
X-Gm-Gg: AYBFou3IkbG5MDs9pVp/p8f0/Wgntn53i9LEWcVRJxGW3K3bAERgNoMih3H5RT0S8Rh
	+6umhI7Ih6pyyftgYe2mlSNERdW5SfvQ/hdPtu9ZdoxqqY5cxqbyMaXO9TToyCJbn8oDMkF6scp
	2j4LZq1PLw9H5KNPpgcn1pmezV6DBIdH7T8gBKrS3SPpZrU07uRLbwbZ9UYY152PUG7wYJhg4AV
	TUgt29Lt3L9Disk6u7ARN1ORwSeBbnPDP1p9GOFVDcO6yikbgJ30ulv3RZs3LmsvuRSIt8S9K0n
	5x7D2raZhBGTTMJFXrOD2zGplyjmHjPmqY6k+ji6MNZOOszJe3gyYoPilJStkXPSSchCAjihaxf
	0drOGeWEtixs6FOk4uMvYrGT5CJSARE9iNQ==
X-Received: by 2002:a05:6512:3c8e:b0:5c1:ac5f:e596 with SMTP id
 2adb3069b0e04-5c1b40e9b72mr9362e87.23.1795038584801; Wed, 18 Nov 2026
 13:49:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
 <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
 <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com>
 <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
 <CALCETrWhuOnBy0N0KznmczD4S2XEK0fbr0C=1KFQqTnoTJbQbg@mail.gmail.com>
 <20261118-stapeln-eckpunkte-lesbar-ee73537f474d@brauner> <20261118-zufahrt-baubeginn-gutsbetrieb-c09004227e8f@brauner>
 <CALCETrUMNr=32ENT6VBKPzoyJDfaX6nzZsjMVxuz9O3z+6LRhw@mail.gmail.com> <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
In-Reply-To: <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 13:49:32 -0800
X-Gm-Features: Aa3M54rEY9J5hVHcO1DPxjhsi7Vv-UveBjN-XrYjaJlUs9gt6QOZEnzJ-89YhLo
Message-ID: <CALCETrXAGpb=OZyGQ2=VfKmA6xeizAsusGZ_HmRtp_s99RpRJA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: lennart@poettering.net, Jann Horn <jannh@google.com>, 
	"Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:37=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Nov 18, 2026 at 01:12:45PM -0800, Andy Lutomirski wrote:

> > > > * deny privilege gain on exec in the initial user namespace and all=
ow it
> > > >   in nested ones. I mused about this in
> > > >   https://github.com/uapi-group/kernel-features/pull/38
> > > >
> > > > Also, since v7.1 there's CLONE_NNP to spawn a child without no_new_=
privs
> > > > set.
> > >
> > > Forgot:
> > >
> > > https://www.thkukuk.de/blog/no_new_privs/
> > >
> > > has an overview of where we're currently at.
> >
> > Nice!
> >
> > I commented in the uapi-group issue:
> >
> > I think there may be a rather more direct solution to this problem. I
> > seem to recall advocating for clearing no_new_privs when entering a
> > userns way back when, and IIRC I dropped this as part of the extensive
> > negotiation to get NNP into the kernel in the first place. (I think
> > dropping it was probably the right decision to keep the final patch
> > simple.)
> >
> > But I think I would still advocate for an option to let clone, unshare
> > and setns callers turn no_new_privs off. The logic is that, if you own
> > a userns, you already have all capabilities in it. If you enter it,
> > you get to keep those by having them raised in cap_permitted. Being
> > able to clear NNP and thus drop and subsequently regain them does not
> > let you do anything you couldn=E2=80=99t already do.
> >
> > An LSM hook for this would be needed because this argument does not
> > apply to non-namespace-scoped LSM-based privileges. But the LSM hook
> > would just be a "may this caller enter this userns and clear
> > no_new_privs while doing so" query. In the absence of LSMs, the
> > operation would be allowed.
> >
> > This would allow a fully no_new_privs host to run an ordinary
> > container that runs, in the ordinary way, without no_new_privs, and
> > without hitting any new LSM calls after it's started.
> >
> > The API could be as simple as a CLONE_CLEAR_NNP bit.
>
> I think that sounds ok. I worry a little it since it would somewhat
> alter the promise that NNP gives. What model do you envision?
> It seems that CLONE_CLEAR_NNP would only be allowed with CLONE_NEWUSER.
> I _think_ this safe even for privileged users that create a user
> namespace and map uid 0 to uid 0. So I think this could work.

Whoops.  I thought that and didn't type that.  Yes, I think you should
only be able to clear NNP with CLONE_NEWUSER.

(And if something like cells ever lands, presumably a task with NNP
set should be allowed to create a cell without NNP in the init task as
long as the same LSM hook says it's okay.)
