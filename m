Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094722;
	b=xzALYj08NkfpwKGfm0HRlD2tBRDG6ABxGv+XNi/VsgkvuqhwNU7ZL4Nejs01YMkZZb7S
	 xmn1rQy9yF5ycJd0f9rHdemHRde/snRQ/FDru1fD5auAOpMGkjlljt77JmwjSPjXdU4wP
	 tcyXfCVxW/AhwpyGi120MhteVb0pY1tBqt+tBL3ndxmEqRUb3X2rsaV/IXJMTc9V6+5So
	 U4wtV7C4uXySWip1zLDTIFcUIV7vrX/aQ0hGog+pxlTQ1Fe/Tdmp4b2PlbFaVtksM3AVW
	 i09CSQ+YkD+c51jXUjUZ+a4PnB7lcRNg/3AFrkZkU6gnvDre4cnSq4xDwdyoQ97jP2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
	b=xy0MZ3z42csJMXrm1tYftw1Lt5p03lo40mr9c8zoBgaEtiOWytK0+llGn1z94w0vHHOi
	 AJk5L3y1bw+hlSkPlOWTf225lXTupisHnz6lWCOaetJBeIitIIlstdSVbm+iDzl0OzyGc
	 LZwE1tWkdNPntK+dmLn1oJ652agyL/2fQN8BOual/w+4YseWM4Cj7ecITYftlKCTsJoeh
	 M+/8QgldHJN3aa8N3bTvTq66kzFf8BmrxLf1iZxV2yg1oBjCtsRIekliTXH8x6fdU5xz1
	 ewVCRNitxrph6R9UQDfHwQp2SqvqLYV7k+HUUzQuORYDt99Qg3ypfF3Zyn2piacS2hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzH3FWyv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85B606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF85B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzH3FWyv
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-381d542bc29so4080676eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795094720; cv=none;
        d=google.com; s=arc-20260327;
        b=kDVXhRlqxnI+RuOe9rwiqXe92iTYAovQJgQoEZSIjGryAc5O+Msxdnv0YUsb5isGAR
         PpjFARDKseahGuY472gAO1nKfJUiPmS7NLuBB7hd/a1VIAjRJhLhOmaNUKuLDW7xj6/f
         C+J6dDe/0TQbO9jBRCxQ0KY/0/RAtFaH9yS8MkNmkx2I1p8gZS/MHqIm3PxyN+13EGph
         DGuT+6o676nGhxA3P9AQ/J0JN1UVjUXPwLJ1rW6VaS58/HHkLoQrfitOqdO2HPGvmmiU
         sdXEZNPFIwP8tTTHCTNdITZKZZox++mrSo/nu1lwGUTfyqrHUmBRTaDrCv8tW1PGt5iS
         EvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
        fh=Tww+v0Wmv4hQAyV4UWu1P+HLzHTT1ESEkDD3e8sMBwo=;
        b=aH6MDxFNEzUSI09Kd1gt7pRDC9ndIX0kCv+Y6GXYdY2J23jzRwzNYdbmGD2ZTcGDc9
         P4wpOPlMver6qpuJaNlUDzEZMebj6xHIXsikF13cc9HoQgpF24MH6+h3wClWGYnvaM1j
         SzZ47l6FPM06UMAmW4ewrbuBBlgomcCG0iC2fT0hAA+nPXOZYRyeURc6gdiSSHiqJZS9
         RlxQbstepJosvWRl1oU9ccAxdLK+h1nw+c7IoYfT/pA/8LwZ+vjrs32pTGcl/w88006h
         PJwB4dZO722zLqrScS72+qp7ri8fL1TLA1vUbQQhPu/NKtX6/M7dzrTin8folaoezxWL
         TvsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094720; x=1795699520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
        b=YzH3FWyvCslA7vMobf7qLaUOeC6g2jhmXWuFZHf8ddwn1zqrbF+eDhUD3L1flLIfWj
         uFiD/sXUKtWs408RBoSYBWLnu/OiNRF6l8W4PRoqlonZaBGyZgdUmAHYbDBkqhwBE0bC
         PGnCWvbbAc37L1EEjR3CgynSKfKdQaG0/JNGMzin71maQ9X5IzXG3+eQaz7qovwv1xP9
         H7UgiubcQ4J4qOPdiuVB7moyvKtlIqSnKAFKM8BzXLrHLzy25rySwhSYCMrIQv8lweYI
         zy1MUKxBWTolou0eicamjUCAwTpzR6ET5YkE4gXHf9SU7kVepVDQ3+s6mPmDMNEoPANz
         lSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094720; x=1795699520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgmca7XuOnynXT3mQi31mFdatxGlHzSq89iOdzC/zQU=;
        b=lQczMzXRvVzIYKd6Ww9U9rG84edpHtw3otI9KH0HlhtUZuHApLarceCaV6Fa4wcaR/
         dSCZqg2IJhedH/jZcbwyWCQMyty/lDKhjQW79UL1kDzq+EFH3cWDk/ng7DfEGQdx5Jn3
         yVa3o0jlv3RgS41qG0T3aoLJCEQPHO5g1FjXjzhCvlJWgRxw0Q3/VoYX325tX2a5y7o7
         T4JgTC5PKBDfGzGMqmdTGmZn3DEt6TGqVqDnuNgYqCex7iOPzO0Ar+74MshycTSqeVMy
         +TqIkLEmqRGhddQ+UIbe65Rt0RbKE7cQ5uyvHiTeRNDFzJfJYQpO0+OHd4JwHy/mr0SC
         b5lg==
X-Forwarded-Encrypted: i=1; AL+hErE+B2BiJGHH0h2e3ywAG7OTR7c1Cv75ebNujCQll2b3IlHS2UnxrJ8fji5IK3SAqUUyEE5ZuxOZA7Dqdww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WXfxIefKlkNT17zH6KLaDLoxQguiq5ePPAHBxtjKNhGUB3SfM
	Zbe6HBkEdB8asNS0vuJnzPeSMK8r88ICGBPqtXGWkbzH36CHomHgb6i3a394Yik3hYt1SA5ng4n
	1f8oUxubUVzg/2gtaEIRp7anYs/JqXK8=
X-Gm-Gg: AZFdTZeRhmGj+7g9pDYVlYlocYh1MURv9eaoAVCq4QX8hRld2eshQwYw9QM9U1eTggT
	rB1n6DekMI9Ni6FYaMUGIcZyVVLwqtwccbCuheO0nJ9PHPbU3o9RcAHzqZRo6OC/ZVscyY+wb2Q
	fYYTwPTylQKSY0O3Rsfu+yOngiRp5aKWtYD3W6If3W56JPFkqLKj1btoae+UFqDnob9goTyTwBk
	NCVOHyrAbOjoK3DQidVeh+hjbgiE1ED9Ly91yD3eVWsWsqiLVVHApl4NsNIgyXFyBoWuBG9WGcE
	mqN4s+qUuqLB8zW+zPePbZOQ6XokBH8uFZrHiUvrYIbqC36U69RDbUrBV96A5/N/dUU/FhIn6t2
	42IS50b1ySAb264db8gglup8i87aEVqECwek78N7if032H/2U1eKEpIaIt1Zscf0sD+afIYAQta
	Ft1D9qO+SyEJW6Zg==
X-Received: by 2002:a05:7301:4d0b:b0:369:f18f:3492 with SMTP id
 5a478bee46e88-38281b03d18mr6111471eec.35.1795094719830; Thu, 19 Nov 2026
 05:25:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119083959.1599898-1-hj351016@gmail.com> <2026111913-hulk-attempt-905f@gregkh>
In-Reply-To: <2026111913-hulk-attempt-905f@gregkh>
From: khj <hj351016@gmail.com>
Date: Thu, 19 Nov 2026 22:25:05 +0900
X-Gm-Features: Aa3M54ryYvpRhTygUp9ra3za2GRssMOntZpGUE4ymj0rS-2Zx00kGP6XapwnBzI
Message-ID: <CAGr5VtPbUdnx4UOMsikDkjVZ_kr+faLgB2suRm2XJ0oFjiTjEQ@mail.gmail.com>
Subject: Re: [PATCH] usb: usbtmc: reject a short READ_STATUS_BYTE control transfer
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guido Kiener <guido@kiener-muenchen.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, sorry for the noise..!

buffer[2] is only read when there's no interrupt-in endpoint, so
rejecting every short transfer would break the devices that get the
status byte from the notification instead. Dropping the patch, I don't
have the hardware to test a narrower fix.

Hyunjung

2026=EB=85=84 11=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:13,=
 Greg Kroah-Hartman
<gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Nov 19, 2026 at 05:39:59PM +0900, Hyunjung Ko wrote:
> > usbtmc_get_stb() asks the device for three bytes of the READ_STATUS_BYT=
E
> > response into a kmalloc()'d buffer and only checks that usb_control_msg=
()
> > did not fail:
> >
> >       buffer =3D kmalloc(8, GFP_KERNEL);
> >       ...
> >       rv =3D usb_control_msg(..., buffer, 0x03, USB_CTRL_GET_TIMEOUT);
> >       if (rv < 0)
> >               goto exit;
> >
> > usb_control_msg() returns the number of bytes actually transferred,
> > which a device is free to make shorter than the three that were
> > requested.  When the interface has no interrupt-in endpoint the status
> > byte is then taken straight from the third byte:
> >
> >       *stb =3D buffer[2];
> >
> > and the caller hands it to user space with put_user() from
> > USBTMC488_IOCTL_READ_STB and USBTMC_IOCTL_GET_SRQ_STB.  A device that
> > answers with one or two bytes - with the first byte set to
> > USBTMC_STATUS_SUCCESS so the status check passes - therefore leaks one
> > byte of uninitialised kmalloc memory to user space.  Both conditions ar=
e
> > under the device's control, since it also decides whether to expose an
> > interrupt-in endpoint.
> >
> > The same leak was fixed once before in this driver: usbtmc_ioctl_reques=
t()
> > bounds its copy_to_user() to the number of bytes usb_control_msg() repo=
rted
> > instead of the number requested.  usbtmc_get_stb() cannot be fixed that=
 way
> > because it reads a fixed offset, so reject the transfer unless all thre=
e
> > bytes arrived, matching what usbtmc488_ioctl_simple() already does for =
its
> > own one-byte request.
> >
> > The check is not limited to the branch that reads buffer[2]: buffer[0] =
is
> > consumed on both paths, so a short response leaves the status check its=
elf
> > reading uninitialised memory.  USBTMC-USB488 4.3.1 requires the three-b=
yte
> > response, so a device that sends fewer is not conforming either way.
> >
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> > Cc: stable@vger.kernel.org
>
> This is a "fun" one in that LLMs keep tripping over it, and they
> generate a patch that is usually wrong, like this one.
>
> Be very careful here, and test your changes with a real device please.
>
> thanks,
>
> greg k-h
