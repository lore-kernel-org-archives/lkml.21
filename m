Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445658;
	b=HtC3t48QOVSVSMQ/x+SdczQw4GNZvmszX63v/4xh0zA8N5hw+v+o3ps2eTG3dtoZSy9l
	 qYjQ1bWIvxwTI/KYWCoUi+xoGqE8QnR74vJatMdchxL7QKv6QgH0DQeGDONKoFT9sd1fF
	 7ltC845yLFaZcs7uaxJGuoPZD+nvux7x1jYG09h9ahYhBHnEvq58XHJNKa0Qn0TjsHMAu
	 VIeka09MTK0fDofVV8mv9OL5aAPvv8SbgsIcRMSa2JB4u6ToJ1pr0xuPKJJzhhy1sYg28
	 id3FqM7yFA1D+d1COw7e1nPBqnfVZwB2DF32VLOokCJqtKBUYfs0SLL7soevZJ+CUng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
	b=WZx6V9+m6Hd/ZxFrOlkngRTWX6hDvg+DNA5vk4lW8Smtc8K+7oPPSpwOmE+EVb+IqpjI
	 Zv2Y//rcj5B+begnE20MFkoFY79zfAF32fDh1ucMwO2z0nwLE/CsIB/DL6ur3ERJgeXzD
	 5CcUXLhHglsQRcVzx1tKv/tkVns7xSuU/L5OWcMt5IDmJK8jqb2/pDz46w3rpXYW/PD7N
	 kEPHSq6rrK+WcB1fmpQ0gfSdL6wCSTz3BlSdK76U35EQY0SY2PFOrsWkiO0JruJrFh/RN
	 6nOK14T5K+4vDqDHASn7aDQogLqEGuEXfv+N2CPlHL/TOBqP6rmNUYkoOP0aSJRs2Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vO/o+WDN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC460A380B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECC460A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vO/o+WDN
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cdc606b47so574626366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445657; cv=none;
        d=google.com; s=arc-20260327;
        b=dCJkDONik7nkUwIXldFx3Nf/N5G0dT6Rne9T7t/HXTLHJqQSh+9R0p7MTJcGtxEnqt
         KmQuS7N5gJNARYuqVMi7LXbuUzw+xN66GOnjW/2d74vDzlCPByLfkUUrb4RjdlsNofou
         S5CJWD/bJujZELyV2cWhLMYS50SrC38gN+shXNo2Ew7Kx6OxvshpFPxeuCU0GLt6VGBV
         iTqA66JRtYADCgizumHpphY38aZhAGzW2NCzJmb1zcGKZd20r9cPKi++0UepHGnR70Ou
         uLoarzlu9E/PRpEu1dMUjwZhp5EgkaTbTboKYRtnWu4ZElhCBuz0t0Bnwir8y++p6v5K
         IyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
        fh=7yyX6eJV10ZZ0zh9+pAn2bTcA/hkL1Gc13RWJHYudFY=;
        b=SFOteJl+qcKyYzHghWaUapn1pWGp1pas08VUpjkaPRahjSGMeDu4H8nCxkvs+0SPjx
         mxok22WSMpSLH93VyH12TaHflEnufJl1qnbPLlKRjhHCcsgfHEBDg6va3dkpGFl9QMUH
         HBOIIDP4aLm3uFRau77o2Tzq5iPe1K0q8/Z2FEdVoI54drhpOqCr1PfGBIIVZ/obitZ0
         OC9zhw4V9uFN9rZ5kFFyjOUNF4XS0zugJQ7gNNA7IQsxIDJNg6D8C3pSrzTEY4N/2M5d
         trE3PFmuNTEkbnVUJTWrqDUp7xxdhkELT8urZtblMSeflpSznag1b8ubkmQGSlzCTS8i
         UuQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445657; x=1796050457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
        b=vO/o+WDNz7WgFm7HLgz1Lpw2NYWv+PRCf92k1YVhzyyopl83+yS8ITDt1vLQj4ekk8
         eOOdp9IQKpQw6bhBD9g35dO890qr958mYcIiSEh96QpczeVPAo0IAwu21MQzZz9WVB9I
         3n7usFcUAKdKUW/NVtyrYfNwD3Hf8OrH48N1KT6UIppbEkpuMjq8bmrg0MOrJMqibclJ
         UUE07sXjAbJWm2BnCaBcNhGXFOKmauFWWzqgOUO3m7vX1sreCFHcUxF80PPbtmfbYZIf
         YpzK8Hn8i+h7XyPdUseVYsmEgtJWHGtqMpOjFCXm8GqSpknsek6ZvCSrc3BbNM0IwccV
         FEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445657; x=1796050457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
        b=xZB2mF8QkHLqlRGnbAPwcP/pIjvEvhI10Jq4jFB0fa+UDEI7gnF75FmcczG7+r6yvW
         eyYONoZT5N6BAWtwtms928EyTTij9L7vCl4H7CsFyehHkH8u8tDM7O5NTyt73776kNZc
         XT2FpIYRmvo8sjbRlopZJ1Zu8wD5v5vp8arVLCHql0dKo7ZbOHIxiBdmddzQx4DX8uL4
         ge/1GJTzPZgKYfWvyGklFvVE2lXBaQkD55GU8efYm/zzhQ7nWdxeIT1N00M4ult/mNcT
         biJNpQ724O72D1BXUWLD4RvEbM2HZJ1ifuSJAZQGupZhmG7lg1JKTFlMiQZBdL3RkvW+
         Mhsw==
X-Forwarded-Encrypted: i=1; AL+hErFGB1JGUnN0b2tyr/mAsz2psiwbXbtXUqyyWdceqQZi5DXIAaM0kYCGEwKKRFCL9FwZbRIjEcEJS4buR9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Kx6A0kABMtv8Mx6ddfuSqC632S5+vVe6Rr6+5mOC3vMaCRa7
	xN/E8pWr7d8NBexyaTkRBWnF4Jyft+c1z+lQ02mzWYYCVvn5neQXFpYuqz57kDwobpbsqt3F1q9
	+VQuKRKP6BitKjEp/8no0DorRjQhgMh4C4lgvNP8=
X-Gm-Gg: AZFdTZdyuk+6vPKJZ09fb5+AFpGHci0NQ9BmHdm65xWDd5KEunIk3qCuL9H5g3zvmDP
	RuS/Z+AvIT4ASTxMiXiCMwPbBxML7aLi66/n63dYbFkRPl6U5vGS6UAQLAECCzzWyqOyatoUuFT
	Wn6Y7y5bWlcS4fq3XH10ZwlExbftU2Ux26oR6az+vZ5KC3y+o5ctX6zz5MRyDSyhIg2oo5kxCG0
	SAzP5d1p4Lpc8ZLd2twwE7DhuOIfhLvhsY2fBNxvWzpbOmJrSHBc/9Jpap6VYD5BHdQz2b3ySnS
	lcmPZC+sppmpRhFaBkdpCkk+app6H5s8TKge1iYu62HM06vh96o9/7n/iYlul13Fu+PrbA1N1yf
	2IkLB+BLo485gOEu4NNyBKlcOwA6CL4PYQuuEdTqZzaUlMnqHDxBPKl15
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr740199066b.15.1795445656730; Mon, 23 Nov 2026
 06:54:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122152900.1113961-1-sashal@kernel.org> <20261122194200.GA2122@sol>
In-Reply-To: <20261122194200.GA2122@sol>
From: Shreesh Adiga <16567adigashreesh@gmail.com>
Date: Mon, 23 Nov 2026 20:24:05 +0530
X-Gm-Features: Aa3M54oFCYgRDogfTqeuThv0nhidW6LYPLzRsNkekwYNrTVHMWAhXuqfICGEcXo
Message-ID: <CA+-x59aKkxNODACP=HcG8g=Z2i_=pGyVOJve=r45Gm2N8Ks+Gg@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: Use uint64_t for the new NEON crc64 fold constants
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Mon, Nov 23, 2026 at 1:12=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Sun, Nov 22, 2026 at 10:29:00AM -0500, Sasha Levin wrote:
> > Commit ff049836f05f ("lib/crc: Don't include <linux/types.h> in NEON in=
trinsics
> > code") in mainline switched the arrays passed to vld1q_u64() to uint64_=
t, since
> > u64 and the uint64_t that vld1q_u64() takes are different types on arm6=
4 once
> > <linux/types.h> is gone. The two arrays added by commit ef4102757fdd ("=
lib/crc:
> > Add 4-way folding in NEON crc64_nvme implementation") still use u64, so=
 the
> > combination fails to build with clang:
> >
> >   lib/crc/crc64-neon.c:66:40: error: incompatible pointer types assigni=
ng
> >   to 'const unsigned long *' from 'const u64 *' (aka 'const unsigned lo=
ng
> >   long *') [-Werror,-Wincompatible-pointer-types]
> >
> > Use uint64_t for them too. This builds with and without ff049836f05f.
> >
> > Fixes: ef4102757fdd ("lib/crc: Add 4-way folding in NEON crc64_nvme imp=
lementation")
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >
> > crc-next is based on v7.4-rc2 and ff049836f05f went into mainline after
> > rc3, so linux-next will hit this once it merges the two. all-next hit
> > it already.
> >
> > Tested on arm64: lib/crc/crc64-neon.o builds with clang and gcc on
> > crc-next, and with clang on crc-next merged with mainline 4843f6873f7c.
> > Without this patch the merged tree fails as above.
> >
> >  lib/crc/crc64-neon.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
> > index 03b46d0abcc41..f36389789fe65 100644
> > --- a/lib/crc/crc64-neon.c
> > +++ b/lib/crc/crc64-neon.c
> > @@ -11,11 +11,11 @@
> >  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
> >
> >  /* x^575 mod G, x^511 mod G */
> > -static const u64 fold_consts_4x_val[2] =3D { 0x0c32cdb31e18a84aULL,
> > -                                        0x62242240ace5045aULL };
> > +static const uint64_t fold_consts_4x_val[2] =3D { 0x0c32cdb31e18a84aUL=
L,
> > +                                             0x62242240ace5045aULL };
> >  /* x^319 mod G, x^255 mod G */
> > -static const u64 fold_consts_2x_val[2] =3D { 0xb0bc2e589204f500ULL,
> > -                                        0xe1e0bb9d45d7a44cULL };
> > +static const uint64_t fold_consts_2x_val[2] =3D { 0xb0bc2e589204f500UL=
L,
> > +                                             0xe1e0bb9d45d7a44cULL };
> >  /* x^191 mod G, x^127 mod G */
> >  static const u64 fold_consts_val[2] =3D { 0xeadc41fd2ba3d420ULL,
> >                                       0x21e9761e252621acULL };
>
> Thanks Sasha.
>
> I've dropped "lib/crc: Add 4-way folding in NEON crc64_nvme
> implementation" from crc-next temporarily.
>
> Shreesh, could you send a new patch that folds together that patch with
> the two fixups for it?  Then we'd get one clean patch.
>
>     lib/crc: Add 4-way folding in NEON crc64_nvme implementation
>     lib/crc: arm: Support partial blocks in NEON crc64_nvme
>     lib/crc: Use uint64_t for the new NEON crc64 fold constants
I've submitted v2 for "lib/crc: Add 4-way folding in NEON crc64_nvme
implementation" which essentially contains those three listed commits
(I also changed u8 to uint8_t used by vld1q_u8() in fold_partial_block
for consistency).
There are some checkpatch CHECK printed about usage of uint64_t and
uint8_t and to prefer the u64/u8 though, hopefully that can be tweaked
to allow for neon code?
I've rebased the patch on top of 7.4-rc4 latest master so hopefully it
should be sufficient here. Kindly review the v2 recently submitted and
let me know if any additional changes are necessary.

Thanks,
Shreesh
