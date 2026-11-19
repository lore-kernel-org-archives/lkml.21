Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083402;
	b=tFwk1MZqxSxJ9trm4mXFuMmLONySx0U2DHc7egKIwo8L8jApsayFSfg9/zl4cdsnKFvx
	 Yl2SW+ohzl89nUP6auMMYn0ZJ2R5y0Ug7NXlag5CWFsB8dmgzVWirqA7BHhifWJ+e6eFk
	 RvZpQLG3GlmwC1Ae3qaYDEzhlznJ8do7oZUvJOjvruGnHGrcPHuapnXgTALsLgmp0ee/v
	 dhj+5aCTsUB2Y8jJfCFrCTCy1KliK973iXGA0hnjULqkgVy3Y72joT1T9WNngkYF0rEym
	 eayo/Yjb3L6w7MxW+EORnhZDLlyoFYpxwJJ9JvqNf0rpLJlI9HB/o5JEOD0tk2foYTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
	b=dTyo6lf597AWNjWKPf31KlOR9VOqydD4NfQy2Zz5UYlyT4rQIj+Qxwe0qCl0PTDLt0m0
	 kIeJ1z/7sXNiZXvcq/LM8LelDjPwsdRmy8bE+8+TEock5m2M/c7v/zSM6S8UipoxMXYDr
	 rCws40SFnXaaT6AWkvyixTbBG4MJ+RwVe+VR3sJOSXZdoxJUdFvUHhdE+2B3fA7+kKEym
	 JBCYclOYI61PicgX3EpNechq9PfFMBNF4iKwkplGtvy3aFIzaTk2GP5EfN2RZjs7AVPEV
	 DeIlNVKlgsP+3Z6LnpwLL2cAuS5Rt8bWhksJMULvCtzrnnmenT/PIzwLO5KMGuJzVRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfYzBwxs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31225606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31225606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfYzBwxs
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso935286f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795083400; cv=none;
        d=google.com; s=arc-20260327;
        b=S7zpofvjU/WqjZh5BoCsewhyBQi6LyvXAbshwEmHN+dCA95SaopLNPXdZuZy6nj+bB
         sURVs1go7oRcB69viIKuE6rqY6mM//4koMtltV/mujOiwQGtZgHjSDlWxn+8G9eiqWuX
         qw4eeaEbR8w99xjSa9Zw7ZYn98WtO+5oCz9WKwdE0DruJjxzgoZIk/M3S1V1ipNv7UTl
         IQ0cavUuV9lSSV7t1DYZ8Dk++aGju1PuMyMZAjd9Yxuz5LkH8LOLSAXuX9aB2JUjQKHI
         1Pzp23QCZGjYcu6/7eTNbUVxZd9WLHerWErKR4yD/+ALoGP1XP8sn8UCZFOZYhbuCpO0
         RcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
        fh=IDTXtQWOaeVaZVyFNpAvcXIviXYDLPNFpLPTE2rHgPk=;
        b=Ke4ffDH+eWO9ZNqfQiYnZGSmYm+XpoUerYwtO+E8/wjBmUB8ydzycLKUCumOgvSTmI
         Uoqx6eb2JAQxM60nGjr2eQ3zbs1cMM2tekQq3k9y/kQxb+1JjGPVgMSAR79il9ZOuE3H
         kURwepJh742rEWD1bVZmVBbT5wbEC6s8meJbnuyERVhzU1mPLnzIN3gcIS9v/G7Pkfui
         wvgggUgtD2vtbGAdj+GX1auVb/g4MNZRTxwUVrUg1c28RLxAa30H0zFFcKz3NnaYnraA
         BXOFwCoUU8+n/4RWu0TnBltRbNTNDt2BsmcyfhJjrUAakHNgz6s7kK3CT5x7rPMHjF6g
         OwQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795083400; x=1795688200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
        b=lfYzBwxsT9U7ylJXY0sfQJTL5g2+pJaJckEy3Jm7MMozfDKx1lk7v1M08TZl0ESbXw
         p8c234b17gzBV4Rp2pwGQa8FfFCh3MBxjQI3v6lALsKJl00SEXsDdFezGiQHqP880una
         fIWgf600eJxpSpqYjBRDt3oQxKagVBQ12XtSqE77+JJHJtv1iNjGFTa+LrCEy6kbfOfk
         5VwgWQ0kr54h21kXjzkY/CTzjz3SA1rIuKSEz0kV1jE7AHi2w4KU4EzZxtoXYreQaaMA
         oQy3lgYmE6vL/IuMcEiIvJKrGrfKzR7rdqOOBmss5pcS8UQ1MC7Xb6QTuPD33QN6zX71
         wEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083400; x=1795688200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
        b=MGhPI+H6uvBRbDhcsUX1nQb46CzLJwKio0ptkx7n2IpKx1zmkQFXg5Xwk/BDwiqh14
         AImg9JPxc9vfyC9Bcoq9mHJbm68V9VwVawd3vVMmnY5JNhgvNDucBFgCFIc+xpC6Avvt
         EpOaeq9CKT8MPd7hngrelFQwHTXcCdn2IL84PnkiLC80ZtlssW8qXwaUla3iMcjQSoBx
         t0CExVzFNO8wmp3dMSWuplCR6lQ1Mcxi/JFOrw0ptUBe7d6oct33HpjcdGdnagM55QNj
         bdrNbAsXPF5s9VeETdOrhOVln0FYm1nX62GyDBklPrFprcriCtGR8kMMb8lTrRZTAXe4
         b83g==
X-Forwarded-Encrypted: i=1; AL+hErFP7EJj80Z9MXG0T2yNLwNdSmNeE1Rmhr7HZxy0yYmBby94qYqkwdQR49CWM/+GQ3irhTV6oGubtZgIUlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZTuGuGM4UXRL488m50nL598/nk1O8bZI+OfD3vYT5XsC9+8ii
	n2L33FUW/1urx0uyLgFEjMc4jAD74Va+qcqK1EjWpWIIaMB/8RIuu4ksYJvgaQWhFrpwCYcuOUg
	zDq8vJoRMiCG+dDPYQPEFa1KjtzFjGjI=
X-Gm-Gg: AZFdTZdz7yTfPNEe+Z9viKaINCHQTFCwlJeqdj7WzVwVA/jpmFozcglkd5SmMOw9i3k
	jp4ShNCVqQeks/sEgUVJ6dR5i4vtF8v4CTfVhyLIof3dG7AgeYO/tcKYfx7+NVSZ8j6OGzzEHiN
	wkMxi91gGe04jC1mXGYvUIU9xhfSyHNcfCTyXSo5HCeMIIU5mGoP05qDdim0cY68FVnfS50yGyd
	Yr0jr+cLqy7/QKQrPWVQpWkZnElYsY4rbhfNiGcZAkArQRxPPUqwfn1+uS9Gdpt6W5HApCt5djU
	tMC71KpjGQikYk9yQZY4J5HDOmT/+37Vj2KjNRpWISEo6fG0Bso5ImJ5WW6F0oZrs9CmgbyPM7/
	jZQY6JfQ7s0YOr/IeFWnCLMIhx3jAqfjNs3vJAE6GIZp3oJwcRU3tCljdDbE=
X-Received: by 2002:a5d:5f48:0:b0:4a6:5954:843a with SMTP id
 ffacd0b85a97d-4a659548d0emr11671217f8f.12.1795083399306; Thu, 19 Nov 2026
 02:16:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116033855.1792036-1-pkfxxxing@gmail.com> <179480061110.3291.15316004866558271126@kernel.org>
In-Reply-To: <179480061110.3291.15316004866558271126@kernel.org>
From: Yong Liu <pkfxxxing@gmail.com>
Date: Thu, 19 Nov 2026 18:16:28 +0800
X-Gm-Features: Aa3M54ogh544PGKFMgJOF_6_QyLKjCrKPu4i3Uzi_u-cmYcNt0aY1QGx5VWRF4I
Message-ID: <CAGAoTxxpSJgg9S0TrpKJ2uHSSpQMsbzWS1CbLAOj-qqnQPGsiQ@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: fix use-after-free after association migration
To: netdev-bot+sinfo@kernel.org
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

These issues were discovered by Qihoo 360's Tulongfeng multi-agent system.

Thanks,
Yong Liu

<netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=B8=80 11:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
