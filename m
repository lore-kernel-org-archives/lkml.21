Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803748;
	b=jS8l6Ss2q2p5EBkkglhXSZbIvtenfBG4nOU29ByMa4iCDvpuVMi3tVCuUnM+ru5CMs9V
	 VsZ++vNnQurjW2n/3tER3+2+iAEnynk7cbma9DG01Cy/HIhduXTSgzjul5e1zTfr5lYco
	 TyQ9qFwzxtVHShfIPFPMqB8zjF/PZ0GWuMs5lP4WxMZYDFFBcfwgXR/AZWIE55OB9wfTO
	 9aDAPLOkxvy5i2KRy5CkzEfleBzIWoepnwzVpUxtYijVVPxb4HfwFtTZADFADO+CXnoks
	 44mB5nUAspRXCW9TtC8lphYwI7/XFxXt3q48AK1J/X+Iui3F40cb5IbTzbpCPCep62Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
	b=AzBwcfmtyX0xzQLpsPErGPMl7d3Ck0rikPoYGjR4bYG1m+HBEozEKZyQabuWyxyDtyLg
	 VMYgyojSy6RUm20w7IBgdlba/c11cX+d/RhgEw9mt6l8ljpItFZJytUfThKe1WjGxyrDK
	 e4pTmBKtl3UKEUBdsNVjpCUGDl+YyBJ0uGuqDkBKghBXoMawQlLuq7hN+DEIywZZ+yUP9
	 t/QW44/Tfyg3R9fJRNtn4xvqMMo2VIj6pGwZVFfaPot6qS8MAtwuBpND7Yvec8bDIYjog
	 frPLGehYPs7PGB6q78cUeBTOnjq+nwt8f3MM+V2X4UOzLDlrH0tFXiEEYXTvrb9rgQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTzSIHqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F70606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTzSIHqs
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc603a168fso3193500137.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795803747; cv=none;
        d=google.com; s=arc-20260327;
        b=YFfa9UM0Pw3gRvH/FcXNGtZtM+Hyy8ADgJ2Mh094Kw7FbVVxxSvrmf5QxQeuHl/vvj
         LpBCVY7PRwfh26Nbjraacj69pk1PA965dwFHice6GJD/e1JAp3O5tWnbdYGe0+wXDftA
         Zf5EptzCg6zIUCuM1jwk34CuEhXNn6fkqLB+GGuSPr/wSMB9SBYS+JTvU1cgDAU05/WC
         6b+MWzXZjbZpjgThDZZRlE18vr6jMNZgSND18tNbzgq+DGimGk4dihbD4eNTf4HIW6IW
         eKiDnmO6QGEr59OpeZ4GH/6/ooPLuslFBaZL2OPcnfZjW6z5wSMBTimlrzMLOnD0cxsW
         e0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
        fh=Ih18knV65vHG7mFX+4aivw3Iop4OuwTK1WPt0i5es+A=;
        b=iubmmghB2MH3sSFxfJiFj3HefcsE8piRD/AirbgPtlpBqrImEy3trtyudnTDCFylTy
         ni+iWPlZpKhmvrIuGMSR+2ePyKYH0x4ndgCLfAd4PqTk0Yqlc1obntpt5nE1KLoXrlQK
         tRiVUD5Dm11e++q0WUeqTnQcszH6a0VMrjS7NIbgFd5JrcudDcpcnfsMeaHIm2uAmao4
         fnEVWx7Jdcd3w8Yy+hmP5bKYX7c4MdZLtPuis6PKbzcBaNrveF78na6LmnSofakQDY8C
         TG1LyllpGm6SmdfZZGNn19va33uzT42ULfkz/HAxhYB8MQULS9r8BvxWn814WHx7cxtp
         DzSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803747; x=1796408547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
        b=wTzSIHqsZ/Isw3xG+fkfOoOQs9rMaPLjGkOc4pIb6yZOqd9OizXP63FVHw6wiFmE4/
         5Yk2UuK39Wdp6hZAA+zJFwQdyn+rZ1d1dYNfmY3siUDdYwUkStPWL3aNmL5EXrbzRmkV
         d5PMtxOg2prkFCMYYAG+T60FuvZsmVlsxRsv/WQLM8Z/bk6SeVtxbcWgo3Ytw1yn4Z5f
         sbRFNx7d8lp0XFUgnpJbDGUEbnL0qm7IauzrNpEysb4PdoEGGZjMtpb9toQRfWp3R7qQ
         80MvdVinOpIcw9cpjTV4u/AD7cVDauHHmSQARofH1l7MF68nP07GHnPIPvAQAqApA8+U
         XgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803747; x=1796408547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
        b=K3swivrOyH+568NxtCkx9TACy6LEo8WV9AXOpb4RU9Z3QnUL0uxeJ4CI+pQ3ZGdmr2
         ww4huN17XCfimyB8TjVha3DbamPfnrLdtDuW8TM42qf49nf6nFCtHNSB96YmNCg1bGj4
         IodRtnClF3Kc4rqVyS4FfX+GAzLwmMn1YJFbxkIiOoBcT2S94SVe7o52Ml5ae1mGlG4A
         PftD4z5J43ir34dSErziJ+wUgS25OHwDpoYnMEopyinCkGKAbCUsNd3Rz3yVq7FOriXN
         MWiv6mGaiTA1uPmM2aS4mSJEPajk56PXVdMsHllYJM46er/6nVVt7pNz0aZ1TaE4fMcp
         2weA==
X-Forwarded-Encrypted: i=1; AL+hErEb7/R39sJ5QqH8xaEFKCCUgH+O3x9n2dXCmgVILk3MfriIpkyPH14WDZqvcPhj8O6vWR02QwpLeahOuvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t25ObU0Zc1yUr2Hq5WzU4ZEhU2eeS0EDhFdA7072ESLTdFNnp
	fOicjuab2KUgmueXGXZjx9OD5LsWTI1YiJ7I+zOKiJf4tuenXi9xIUT9p2F7/IksaH7dcMLwkcf
	pJ7LprzbT8VdZ71Dfms8RvDootjlYsZI=
X-Gm-Gg: AZFdTZd2oEOiTbPO7gHQ3Pd+fnJnRJtVuq3AGG4NFFHltt0D9rllpOOl9vLQksoKUnU
	A3/FP4lDQdnKDTU0/D40duZcgoYhcK13LL0WvkzxRAhcxtVMk9nUQfzNO64AqC9dew3YW1FWlgK
	y3ntse3Vd4BqGG3exZKeEcm4ct7HZKLg7mqYmLYW0k9IizgzGjeIeSSb/iXp3MS+nfWQYZW+Ryb
	yG+lMdkccCZ7G070z7Z8qN1wscrOK7TLaYoCoMjNOglu3ovxL23OvntsFXLGGWoNDQNEIoVdF8/
	kv7/bD/jy4hTCfqKsNt3vgf7wdTbyw3VRWZjrxjRQFYMgoowvyYa0IcDivRKXy1RAmC10d95LvC
	LLeC2VIIO+sRiFzMHIPmALobTI+opErRoE9kgRQ==
X-Received: by 2002:a05:6102:950:b0:7d6:48c4:ed56 with SMTP id
 ada2fe7eead31-7d7393cc6d0mr14612336137.6.1795803746639; Fri, 27 Nov 2026
 10:22:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126232159.68334-1-artem122novak@gmail.com> <awkvNgFEHgBX9GhI@hovoldconsulting.com>
In-Reply-To: <awkvNgFEHgBX9GhI@hovoldconsulting.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 12:22:14 -0600
X-Gm-Features: Aa3M54qcaPJoraFS5xeCM2KAkZy4LXml-K6XaQT-iMStFyV84RU4AOEe8MmPCf4
Message-ID: <CAPufuhYX42uiiUtnsYLB1Yk=DdGBj-Qw34VD8P3M5DQx_VCbUQ@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: cypress_m8: remove trailing whitespace
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Johan,

> Don't run checkpatch.pl on code that's already in the tree.
>
> The exception is when learning how to send patches by working against
> drivers/staging.
>
> Johan

Understood.
Thanks.

Artem


On Fri, Nov 27, 2026 at 1:20=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Thu, Nov 26, 2026 at 05:21:59PM -0600, Artem Novak wrote:
> > Remove the trailing whitespace from the else statement in
> > cypress_dtr_rts().
>
