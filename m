Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795041051;
	b=Yi3PohrJGKKqL7iG29JufViK1lk2b+ZlzwkrM+hRpsVIzFT000vM5z3Xp4BCtlopFgEB
	 QI1Cr9ONvI8FhLMSxS3EDx0TPHsDPMDzGXvLjgSlXIL+aXvkvlRkTWwTiFBZ17YrZW5wE
	 VrXwhCzA/gr3xRNC/VfCpitRnjj39dQfS731sBCWirfHvpDcF0DJiKCAjKM+XoeGhSxxV
	 qKJxYGrlBYJ008HeFdvdUxoJIZhaDKIDFR50tTyrN/8P/lYuF0Jx0IeCL5bPIXp61NXHN
	 CUsiL2BUYDQ0iXjBqIoB4VgAfZiWq+bLYzjg54Rm7i3TiwmW0kWGryZmIVm0miiP+zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yqnC38uWfwKQrsdALtzn7RtsAAUyiJIP1ETaKtJsGh4=;
	b=qKp3COSowU0JJMh8JTePzrdb036Vz2M9D44OmBH9HuMVbvGlPLJKHgn/2fyzZF+izKEK
	 UTAiiZHX2ZDxaxt0Bk49zYOgPs+Yn/vZDjuHIJDXbuRpVeDDUk2pI2CWFQYz/+AHHmG3Z
	 RJKUogbukYW6GS5HSTF/3JvHMaN9oJpxnOlT7vcB2tnAjuWdFesl5zn3e1vKIELrla5E9
	 WEpHrtOnAQw2qt988OXEuje2Pb/ZgGpvDWtkUWBgSHIiCJKbSWWWPEIJl88YGclnCPrf4
	 c0+L8cZS4tth8e9HEfIMJVN7910p+8si89xbVPVT6LXjyaduN8nuYAx3G+Y48C7OAPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b="j720/APk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75432606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75432606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=j720/APk
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso1733707a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795041050; cv=none;
        d=google.com; s=arc-20260327;
        b=Cj3yZBc2OMf2HQTGy2Ue49GhLi9qeN53ZdvU/ejIRynxmC2QDiYid2HvhtKU7m1mOd
         MVfiSnnw5NaAyZGN4u2bOv0F9ks8ffRxSCS7BAdHFDi/bj+4SNXA6tFVniDsrjlPj+vq
         5nLKHD1YBxzWX//fV0/SdfCKlFmvMc2HahtaGLYuVHxTRk5n3PSHpOaJYgEj2/u5omcW
         l3wR2aX1SFQJ/goMdNrYi/it5vZ9aNNFVnU4j5C6pFRd5hdWlMwDY/RJCEwhDWHwLAW0
         EXNKAouDPM12/oLxhapUAY4W+7yFH4+cGpxSXDSVkmHMEukfRYAVs0q2hgzt52UXlbg5
         CCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yqnC38uWfwKQrsdALtzn7RtsAAUyiJIP1ETaKtJsGh4=;
        fh=TmdqbIftPqfOurmAlJAD5OW7tyVuQYAoMg62hqKW1IQ=;
        b=sKjFgV46Ysxz82InhIGgNOAbIoNZsZrIBRwlkVuy2r2A7h4RipsxCU5fYgjhRJ1bZ3
         BO+uKYKSF8ZvwE6RsydmEZ062vZOIA3nmSqD59JwrWFO5ilksbLVVYy0RfbqYRWd+pzq
         Fcw/3MbSelkbAytbXHScV9BXw3PicoCzqR8zxXp+OwYB9ZCWlVo5ZIKcnb3CseYdh3pb
         Ui0e0ewmuveXlGGBq70I9q5LWRJjAmrzPLlhR21ehQ3kavrHONBtQjgsV5f/YPf/MRNY
         j10lX12UGlaApXzu85rdrgh27n1BLbojxfheBzlys2x5aSpJ/ZLgRR/No6pjtgxveQFJ
         QlNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1795041050; x=1795645850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqnC38uWfwKQrsdALtzn7RtsAAUyiJIP1ETaKtJsGh4=;
        b=j720/APkNMB4KlTPuSGtbxUcf/iLf2ONTwKmWwt8QoG1MMewhomk0jJwJojhXPKZyP
         jJ2IWad1RnF9Pd1LpMcy6XrPqwFPXtU+UKbqveYKpxsMyG0JNeMt5a2TtTz33TBs932k
         YabJLIpbp72FaP/dBJzLjcG40rFglJ+prpmhDXFCtEm9UyzqytW1vsPQlzf9P4NMSjpm
         Y7IUDZpgJzswHMNlR7YOUaEYE2QRuHiWSMBbUcfiiVORCVOGb34+tv4V3Vqgtg0jqlFa
         agSaBIj8Toy1JRwb5EczwR+xtY/WVPgp4PpuW/ZiXQhc8pjSnhjqRjT140ZheX6KHGSP
         ZVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041050; x=1795645850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqnC38uWfwKQrsdALtzn7RtsAAUyiJIP1ETaKtJsGh4=;
        b=I4VOUFYXCuy+rrm0OiGJ3JiqLZABoXmxS7w91C0pKrE5kdnrMIZtGYe1yehUrDz64F
         mkyvzBUwPQNRVZu9i8oXthb1Aw1YfgSrLbVj0roGnmjsA0vkvbCA3M17lNzbvtqLt188
         4vH6PVApwOWv/JCJLdZaZKPxPUbJHMgDysmp1DKdH/MxDFngsFnsvUxFWCC+PfVNLl88
         028NMmtVC55GVrPraaNrV3/SFV84gZidRSYGHG4u3YyvmEPUNB9pl1JrDByPgNuDi2fV
         IPY/wIL7x649Fku7za/DsEfFYI8LQN+MqAU2xJ5S0+Bl2HctQuOjIkl6ib9PpNJywvk+
         QUVg==
X-Forwarded-Encrypted: i=1; AL+hErEVPJXga6iy1EYPaABjo2e00+vNZT7c5nwOuVzomI9zvB2dpubRrVIptpkIG2grfLeE9qr8iE8oPC0q48o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eI5X9ZcktZYv6/R2O9fJ7Ue6dopZgJaLHdrbalcqGwNvD7SlA
	9UCo0ywt4oqF9ipaqZE856PZmIU5fA6GFnM5mg7ShUgk5QgUG5s6FotUPctG92k1/RBG0sDY9An
	kIzkNHbJsFdNPqhrhnZUehKfPLiTbZd9Q0Ep1ySyRyQ==
X-Gm-Gg: AYBFou1RJeqMHMRdY1uoHFt/HeHtJhjfre+LZeUyIzIw36VyUQd3tzJxn9dnxVLDIoZ
	nPsPKxsRER/XZzOmS0+104F5PhdL2J5ajTAmTrCHVLFjcwIgS/mGyZuJ0VV/pJyMHPJkpYTDd5i
	1qWGEanBhTkEdz3uM8zjgTEuma1peUcafw6zs61fO+52j2gg327z7M0lxENbaQWa59FIh4AovmD
	iZrA2e0or7fyyVJQKpyAOAdXPm+IOofpyJaW30i/nmp/VW8sPZSfWuka8pY7zqqphs7ruOeDbwL
	K5PJWXOw6gE+5Mq1pQpop6RJZ0+sGvJNuBqDeLSLZ/4s9bYezDmJ8j3BbOAKHiI3wGtgLUT7Wjk
	gIz9m8dwBdoCJkMzZP2/pimvPoexwIOTqTD7y5iyEx2+VR8SjQIQUsYK6uA==
X-Received: by 2002:a17:907:3da5:b0:c41:26b8:c49c with SMTP id
 a640c23a62f3a-c510e169389mr367702866b.10.1795041049337; Wed, 18 Nov 2026
 14:30:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118150247.972732815@linuxfoundation.org>
In-Reply-To: <20261118150247.972732815@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 19 Nov 2026 07:30:30 +0900
X-Gm-Features: AclHuK-6KSFdeiMC8z3chBPKy6DS0Q8xZ1fgA_xjvJB7kCL4tYoOxjNdA9E-2fQ
Message-ID: <CAKL4bV78Ze=q5THC2pbgfczSEH37KbaYKBerS3eXwadJGpx+hw@mail.gmail.com>
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
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

On Thu, Nov 19, 2026 at 12:08=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2651 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 20 Nov 2026 14:55:47 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.6-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.3.6-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.3.6-rc1rv-g62eba995b019
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Nov 19 06:29:24 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
