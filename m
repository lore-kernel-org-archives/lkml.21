Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702895;
	b=CACePcZ5PCfwvIHJONBiDmwM4dwtu8THhWVXCy6XxyBZdZAhmp246jkX6rqF5LpIJXQs
	 7mi/DhpZu3wyYupze+J/NUteMNqf2PQb3kXm03ZaXhqBHKIpWWY4Jp5hWaMMSYmVphx4x
	 ggdUhmYe3/qY6ov425rt9pfgYjkNd9kjci3FpLGK57hvdWsX4TDjUN1Kg36Lx9avvRTsH
	 mKMqVS7QXq8QPuGYvIQ4VTxiUbLBvWDcXoLb4plPKhhxEMgDvvxxVzj8BIQ4+23vjd06t
	 hmv0Mi69d5Fvwnu3YSTcbVuIO5T8Z25YNYKvS+hOcHBJlIVvYYn5ekX4LUcna2wFflw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G5RY+0srkZ4dl/m2XGcBAxCwTBJactXCq+wpKVumJ4I=;
	b=YmQ5avblcwLd281IbD+mwohIJ97spB+XceLp/AzMC+MmebGBt1l/VjCd1jNDAQwfd7gu
	 czwfgNAPaYOxNAf0l6wUZgsW1GAljmn2VTyWfrIGdRl1bxlJy46ppCIudRhu+qJGeQcuZ
	 ftVsMtcQ6kyXJZQCupV4y7SCb1kACHfp6StBoNQSkOd7q6vPSwLibQCFh6atgc6k2+R2C
	 NMMLJ7dOx8Xav04Dphgh8QBGSsHi0aEo7R6fxYYb6Sw4ZbgN1a6YjI7b4sxAu6wU7lul6
	 YLNZPXOQ5NEFEYhbxEy4Ami2lipYyqcEYrc/o+b0sJAfzIzl7s/NDE5jdr2FLJLqXow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=dk1PfrRF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CA606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=dk1PfrRF
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5118deebcfso1050686366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795702893; cv=none;
        d=google.com; s=arc-20260327;
        b=fLedbd9e4v/F4hpTWcDoItt47xdA2M+0sDYwD+qGxit/NFlUCZnDur642thqh8BdSn
         JgYpUmGLFFeIMRw43iJAUPEWOU2sQ6NCY1qpfgcq5RF1T6Wz5VaWrV325bfGEaI+hNaB
         mRGJC611MSrbRYE4JHpBc/U+OeHhjVGKFxHIUG6ZGRjZr0k4aILpM6+GAClQZQAeAWPE
         x6x5QSiQTVswW4YpBECXduQzcsKijhdWzaA+TbuA8ITtTSa7ifGP5kjm9ohwNmDs2mOP
         2JETK4XQcDYB3jr0F+yf9nInPDPIZi5FZR2ckL4/VSihmIVDTBlZhCO9Fy073QkcAfJj
         Smqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5RY+0srkZ4dl/m2XGcBAxCwTBJactXCq+wpKVumJ4I=;
        fh=cBwwheYcwaM1KINu3W940hyS/T/pDkxKdp8NO9jdYmI=;
        b=Cw4yMvxVZqER1C3SVXBIoouQJXaB34xcD7uJbdQLyEQngnmF+bduVMWUQj4X2J+0ah
         ECA7zT2nQdDutQky3uHa7WxedR87ya+Ml/95mfxVgaVyGLrPdeDDmU+5uCJZp+wtdi+N
         62/ARHvYRsd5IW7Ru8VV0g1Dc3ICVoUlzx2Q10YTQ8Nz/+E+HoXHkJyfgpc6awRkXyEH
         g/rGKBrSGBwOVeauQ7ESNixxED7/mgPCpcvFqSrDQ+C6WqXpsOJoay9hwDpVNG/X7Ka8
         42MPFiNecdbEnBSKYCOnJRD7+z4aCCUwjX8WxdV7WA+k3b21jfEpO1e6NJMaKLrYGfSk
         8A7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1795702893; x=1796307693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5RY+0srkZ4dl/m2XGcBAxCwTBJactXCq+wpKVumJ4I=;
        b=dk1PfrRFkowNWEKu3GINuXpjpLOVyc4gXrjdp7mELO/8uGhXjBKUFc7yeYO2u0K1Xk
         kaP//g+oomq5BqAxmnIyg/vJVU+StPZITcbwUoiK0AJwNkMJ5b0nhkMNm6Sy6dDnL0fY
         FE7XVehBge+TzTEejHajpEOwfwZrhnk24WpJtLvsirwY/J8s7A/HrxKQ8sx7rJ/B/GNj
         qbQ/fjPXiMviW8fsWPFQM3TA1pCfM3TU+flIdlZVd4CAejmtCh8jGYLz0G1vrZu2vIeU
         v1QxdvbVxQIN2zVxfX3U9vRNFJLX5OjBKoe7AQunGZBKyj2Ki8wirBzmZcxcYEC6z4aZ
         xMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702893; x=1796307693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5RY+0srkZ4dl/m2XGcBAxCwTBJactXCq+wpKVumJ4I=;
        b=2KSd1IBrRN8QaE+HL8Msl05KvIrMFa7wCwKstozZjKAb3WOs1Ecik2gL7vt3iRJdAR
         7Gs/tZLH/CTlH+022ml3kPYw+Nv4EmD3oAvvfZVZzivgEyrbwdWh6Kb/9D2SC1zdRgUw
         wp4f9hmfuz4e6FDX1sVO3nSg8zTT+RLeM5yRyhi7JvaG0lcer5YZaTxTIly4sOYFlscm
         F7uhtKEjRBHp14qlXmR42kRe6/pUuGFtmWkn+wIY+FqDU2Bmx6GAw+qWwWXhDOmb3+Ps
         M1KuudQBDtJ6t293FVEK5VMK2ma79hYEtOUInFKLDz2MbJdAv5Wn2SBedrUbJKnxdoCb
         B6HA==
X-Forwarded-Encrypted: i=1; AL+hErE6yqnXjbgs9V89uyDKMIkWAYf6U99CX3UrcLT7Dq6MlBZTW7oNUM5BMH42EbHTJyzoCE8C28aAZfJXoMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sqwlvrRQGf4onRdlCYuCHNni/bO7/DYytlxjZ8NIL+KLZYTbc
	6ir401VllVZr3oTPdrStL/ubFA9Q+fLnBWKBbkn8V4ritXi5LvI1I9VF/EgaPNksc45rpDcgnI5
	rkGOpHSobcD0avcSGgascLRxJvoznmFW7XQPpfaxdZg==
X-Gm-Gg: AZFdTZfdF0g35l/Pz+ka45H5yNVbiwqEWHdx2iwsD0ETeNM8Hzm4SVaj3V7Ff1ZWMvD
	A+P3Gq6X7EqN2oYiZdlJByfwqviI8aP6vABsvPw/85tj8nyopT/Fi5YONZdMXJJIWnN7ZNWTbmu
	sjrE6LUPz1wsGsk2BPWFQwWyU4D5vzqEvFMdXzNdVK8zXs3mIqjeWDpzXOXNm3h+kP4qzv64GAl
	PydnVodqgHLgSnNyMGjdNZBGJlF+2QEBvBz3XzsorCDM0U/iVDbFR17tY0jmq6Gcg5GFMXscbWz
	H1zfWqrSRxP6RVz8VaZyuEya3yX0MIO313x3FnvblpdOBrtHzYN7bIE5UFM/pfXb7eShzByGNgv
	XrywA0kTfuPJwXERveMnn2Siw33EpryBBH3k1
X-Received: by 2002:a17:906:9c10:b0:c50:e9b4:3c9f with SMTP id
 a640c23a62f3a-c513a88bd77mr1318692766b.14.1795702892675; Thu, 26 Nov 2026
 06:21:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126105729.110697432@linuxfoundation.org>
In-Reply-To: <20261126105729.110697432@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 26 Nov 2026 23:21:14 +0900
X-Gm-Features: Aa3M54rDhX9gPPGUUPqGNn55Em1IdriVZL7YAVT3nsPcx51a8eHytUToqjQjQi0
Message-ID: <CAKL4bV7H4EgWB0j-0KsD1bxNWwaad94Gvg86+vNVNDh5vR+ZZA@mail.gmail.com>
Subject: Re: [PATCH 7.3 0000/1002] 7.3.7-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Thu, Nov 26, 2026 at 7:58=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.7 release.
> There are 1002 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.7-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.3.7-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.3.7-rc2rv-gce73b94700e6
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Nov 26 22:44:37 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
