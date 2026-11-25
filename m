Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599615;
	b=uxzNEW6qcg/fDa/lqA6syEsVs/fI28CLZir6fgBvONta6wkn3fHSmH134c2Px453DHpo
	 fy+pIgsfGYA0Q+Ok/cLROghRAMg8syFHvsMWXiXnIbEGMJ8ib+690s8dZgfo5kcgK94a0
	 ZWBli+G7hqiJt+JZBNqDn3wVJ0ny+z56vpUyAgenV35ybue5linjhngt5iLWQwK+czr/w
	 ppk1RIyQ3iCxGBsEIYRkoGRQgjQFA93dyMrCJ3w2YWfgVFVtRxQWTekn2cHbK/xndK5b2
	 xkbPwa6fRwiV14oOUgsPLf6Ut5KtXsRg9DIovX9FFnHX9962b+OCMAHAVpi9USqVg/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
	b=S+ZvFGmH3Ga9PZo8gsVnb8RCvNrRvGmownPb13XqvGpfniFwUiJHwyyzuC3FD2qgj01n
	 XLQ4y5sX6AfVpjRJCPT5dW73pJ/gDqs6lZXQZjzpldSEdOrzZWf2zoyBEPaih3wlDOLNU
	 QvnaU1ZaWtwZWPh9NkvKzkPjvRPtgDkuKoykM82FtUGb4ZU9dmOtVWkJWFtLAjqzyxdhd
	 zu6/kbPDTJ/VxauRQYhUnMBjfbm4bUn2UmugTPBm6ZUDUalNagkEwgXgr2TL3ZupBOmiM
	 Ds29Zs+K5GBtU6Dj2dBTA+pidlubq9FC5l0bcVuRGBQRo9sPcv8McqYxP/h8CGO7glA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXNit3qW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F67C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXNit3qW
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d6deecef6so56121121cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599614; cv=none;
        d=google.com; s=arc-20260327;
        b=PrsoOPgCVWN/LmXO2FsTpgs7+NvPc7zC9nW6Xlif2E9YxhQmJeBbnUMpYB+XjKGIwN
         cPU++j7MJ7wdPMvS3E6xcvvr8JjBfScN5m5L4V2c0VJaOl7iXasrF9RHNBqjd4lT3G9m
         /Rlvw9ksg/cEv6SzTXd0KAqgFd3IPr1fZV2pg5HkoDBjs1QVsHPZSwUPbS5vuXsxmGRA
         jYkqWKlQUWGm77QRcCu0SXfiDrHFhen4ymTSIncHKT2M4ab6uJRV+pWIGyRLL7McL5N2
         J6uaZJNH5hiOHIKYUrY/EfbISjK8HEWsvOqtOdZOZpUpsratL2JAXnvKUQXp0uOib45M
         cURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
        fh=aVgTLd34VQVRVFCanEhOlMj1zMWQ5byfM/3L24AOzwo=;
        b=UA62EkdFc5dKSR0reTMUYeDN7RFsNjFHSRNctEAmDOu3dhvHoxrc3wsxMlYnpXNdRl
         59Sti3QZO2I1/Il9zy9Hve59FnwP2QFiOK3ONWmTFktuCamsCBJeU5FPljywijWGTHFp
         ueG4MEoiTsiCtJZTrKXSpMlIii4DUHLAY21rQz1DloIf9kKFmB9uPr5sL9qFet7V5rdw
         LQ8M63Kc0rRPefmAbCKs9kLXSEhJ1FvcT7y+hPQMoniDLeGr9bnyg2IubPAQoeBm+2ZL
         2Un6v2jSrOrfnf/BEeHFdwr7LlJUIU0x4g+syEocXKYEnH+reJASKFAvkjDVi81A6UhE
         SGDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599614; x=1796204414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
        b=OXNit3qWJI+3wK7LVN3qTm9sB1PO+LHNKpwCawExHAjlr9ANZckKOoRjTn/Bw+IXhp
         9X+ujUGAlA2bOjUO447w5OJNffRvldL6eFIpQllUrnZm7jL71U+SI+CEEPWHV3G1BPv5
         WWCMXsYp6E0PauDGmxW+PNPhTpo2auzA7KACDgMbAsZsSvobOKIU/DIfHwxVzeNPDAOy
         YI9B+LloL9jDa/xeJvPdbPiQyifO0hMlpIhjOpK7yPomwjA/ZHcdkPTCNV44bZNgskAp
         uIN31j9u9K+l/NujBtBNtZplfIElEM7C2zSqd2NqEA4vTkik7Y3h5/aegSwPYwTjJj8+
         5Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599614; x=1796204414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
        b=xo9fX7K/zZMFruw/V8S2QN++aHbYO3wPrFpG4pIuY4fgEaGBpGUD1bYKRNxn6Be0Tc
         9wutAdEoNCcE+kK3iOQJuFTMxckQEwqypuMpEC5sKvrkBnIe31NRoF1/M3wTtP9BUG7G
         nxl9t+UjlOGXeZigZ6AQeeICY33RcKK50/IkxgZhexoZibQcmJG+n6le32FSNU5/oZ5S
         3j3AOfVWNXTIkA2ECCsaMvl6I4xU0hnSd6Pd2KFNUux4xYvnJ7Kr3tUb9VIOJt5wFv0a
         NS5TEXHPhu2W+W3xbChdO6A5OuX1oD2oPJe5qtzb1p49R4Tng1tyObBltQTZCsbdaCS3
         J5pA==
X-Forwarded-Encrypted: i=1; AL+hErGB0Z0f7Rf5jelS328iNd7hHR0FC6mLGibSf8GMV4fLtknyi6oMiwCTuiny6SoCaKcXW9I2izkmLqbOzok=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yK6UxsDLQ0igQimbAK0xmkPkt4U+TVzKdpBSJTRXFhQM/mQP3
	8yJ+TGvk6fU+F2j3rOZpnr8OR05WNi+Jm1fmamymTsftHsf90hFDrzaMOXaxjM9zcclJIWs3rL/
	RLbcROozsxNynCPeq+9A59qY+3gM14VQ=
X-Gm-Gg: AZFdTZdIkL1IzfZZlse7m3FXMLyDPDdZ3zoC0UoAG83C+NhqT6u17J4IsYUnkLPD1Ys
	IArYdjToikQfmaddTIZJRHNcrvBbCL+Ja19kzFf+fOqgD4tact2P5vPVSNS9/oyTPQ7MsoOKsLX
	+CUlV8IBhn5o7JfJ6oijN1zYEC3rbvmfrbWVscrGATa2izeipuJ4nkg5D/MW4/7mQJ4eLiplPtq
	Gw+Yn5PRgL+HKHJYK3GFpY8wWWHTSva96niSkg1SclMSmgun1o0BmPImD4msHfyLD9bhnvQnQyx
	sJb6YN+7yMDSkk3WBljQcmmET7j9x4AgrWk3cjECFVPSIkRP7x0eEZFyytV/vYMao8VsC+/viGK
	/KrEWFKWHu/P/fPC5Oi4VwKa95xpYtsIPo9/QYW4=
X-Received: by 2002:ac8:5d49:0:b0:55d:13c7:c231 with SMTP id
 d75a77b69052e-55d76a9b7bfmr318118231cf.58.1795599614000; Wed, 25 Nov 2026
 01:40:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>
 <2026112516-germicide-viewing-3a9f@gregkh>
In-Reply-To: <2026112516-germicide-viewing-3a9f@gregkh>
From: Ruide Cao <caoruide123@gmail.com>
Date: Wed, 25 Nov 2026 17:40:04 +0800
X-Gm-Features: Aa3M54paJFPTDXCE5Miu03up-m6akxgB5vbSJVh8_ZPgYo3CgB1pJ7CDMM4GuWk
Message-ID: <CACveakRWUr73N5WZ4a=07QQdiK3+=Ct=BSB89TS3wnx6Yen+kg@mail.gmail.com>
Subject: Re: [PATCH driver-core v2] kobject: terminate the uevent helper environment
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ren Wei <weir@nebusec.ai>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, dakr@kernel.org, 
	johan@kernel.org, akpm@linux-foundation.org, kay.sievers@vrfy.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Sorry. We took your comments seriously and did not mean to skip the discuss=
ion.

I wanted the reply to include a lore link to the new patch, so that
you could look at the change and the explanation together.

Going forward, I will always reply on the thread first and only then
send any follow-up patch.

Please find our reply to your previous questions here:
https://lore.kernel.org/all/CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nM=
SxYQ@mail.gmail.com/

Thanks,
Ruide

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=B8=89 17:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 25, 2026 at 04:51:00PM +0800, Ren Wei wrote:
> > From: Ruide Cao <caoruide123@gmail.com>
> >
> > struct kobj_uevent_env has room for UEVENT_NUM_ENVP (64) environment
> > pointers and add_uevent_var() lets all of them be used. Once the last
> > slot is filled there is no room left for a NULL terminator.
> >
> > The usermode helper path passes env->envp straight to
> > call_usermodehelper_setup(), and kernel_execve() expects a NULL
> > terminated array. A synthetic uevent written to a sysfs uevent file can
> > supply enough variables to fill all 64 slots. With CONFIG_UEVENT_HELPER
> > enabled and a helper configured, kernel_execve() then walks past the
> > array into envp_idx and buf, and dereferences that data as string
> > pointers.
> >
> > Lowering the limit to 63 would avoid the overrun, but it would also
> > reduce the capacity available to every uevent, including the netlink
> > path that does not need a terminator, and could make existing callers
> > with many variables start failing.
> >
> > Add a dedicated sentinel slot instead, keep the limit at
> > UEVENT_NUM_ENVP, and keep the array NULL terminated after a variable is
> > added and after zap_modalias_env() removes one.
> >
> > Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struc=
t")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> > Signed-off-by: Ren Wei <weir@nebusec.ai>
> > ---
> > Changes in v2:
> > - Keep the capacity at 64 variables by adding a sentinel slot instead o=
f
> >   lowering the add_uevent_var() limit, which would regress callers that
> >   emit many variables.
> > - Compare against UEVENT_NUM_ENVP explicitly.
> > - Keep envp[] NULL terminated after zap_modalias_env() removes MODALIAS=
.
> >
> > v1: https://lore.kernel.org/all/cover.1795426787.git.caoruide123@gmail.=
com/
>
> Why did you not actually reply to my previous email?
>
> Why did your previous patch not work?  What testing was done differently
> between the previous patch and this one to require this patch?
>
> Without an actual discussion, just throwing random patches at us does
> nothing to make us want to accept the change at all, for obvious reasons
> (i.e. what would you want to see if you were in my position here?)
>
> thanks,
>
> greg k-h
