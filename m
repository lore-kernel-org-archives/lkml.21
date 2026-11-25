Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573964;
	b=37TJI91s/E8Y41l/fe6qlVUoYJka1gy2bKFjKMCFxTEAx5jIxCkc6Znm5AnbEmAgKxbg
	 aPSIaNfr90Ac4IZf5l1xsgm99MfRexCpziCO4cNRHSsalv0ylb9fu5AoTdf1aIeUL0CmH
	 cCSBsXqU/xOp5EVK8pRYLjc1YWlsMhSXuZtKWL8jWIyexLwjnXUP4Wuwe+6R/mZEGq+jl
	 AQSXtRO+1N6ULbwwukIgLpA2nO25K1Atip7ekAHRHM3qGEu+GLTsRCNGmMgnYAjDrUCn8
	 yTTK3kFxSVgfek1Ehty3I0GiuLRSMDI4pTPtG7OcIAoYLPm56E7Z/g2y1cdSUuzFSfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
	b=BuivXHt5q6Iqwd2RN8wxyncizc+d7XGfobUCBSkhYqFmDY2mIQswaKu/0aI3YrVpxFiG
	 eMVeZE/RsPcRGtoJJ+It2vKyrlGyMUao9EukGMn9Jx1skuWLMmSnzAremyn8BL/FYF1pZ
	 mdAdAtkiOg+emuvxrJIGyNg2SWB76rYZHvsOx/IfGt/5CSjtZ0dgko4XG4VQzgzP43mA1
	 xpca0u2NF/MB7wZzlcExKsf94WhV7x/17430Cr1a9fRhXiyAMB4/01pEP2vbiSIaymD9q
	 +OVPcdFzQHzM/HFYQNNfjBOzayATMUadxPnMQbnGu7Z16oQv+kgXThHUV3weGe9KuLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGnkFeho;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGnkFeho
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso36240411fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573963; cv=none;
        d=google.com; s=arc-20260327;
        b=BYoNNyJXucr2GZIUDMicrn6CBWUIdpIHTFuSab3Uu76Bs6P3C6Y252XRKEBOvDDIEe
         elj/lwVQS3tCV1gRu7p+g/S+REzhfohvaFF3PVOH/XDOjndF9+KUjKvs6uJmyfgTL6+G
         Q8IPALfHn6A3DFPcPZg7nUqoWj29MxRaHEOjhJ8xTUdr1CscWBZMWzg0GfmJnQN8kGs4
         21tg6r6aiw4HgAKjX2hrRX1j6im8661N28sfyWrqHpTwV3CG4Y91DEq86WwLifAHqqeN
         4APC7n4cHjbM6zEsnVuzoh2g4FL/gX9ayH+p8nXQePKrrs2FFysgQgXpUlkZlREkq7Cf
         iDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        fh=7mXPzxr+geqPqfz9Z6bfFe+MuKIbX3M++pNHLp721DA=;
        b=GKIIfYjYoMnyACri0X+AnloX6dYv8zS7Xee9fGMahangDQ3C7MsN0pBIUkLWtO71LD
         ATvu5/Qf0v9mWBTq8ArfDnFzSytNPBIGWcyrgrFRSIsPwkXaWlNFLCVlHprJ2TVQ5tkD
         jnZNOnIPivfxWEHeByP9ATu7N+PRj5Jwy6oynt3KhhvmHrP31M2PLje24E2ZRE88m8Ts
         2h44uNkq4VaiATw/kVozUfq7/pjot2e3/YtLkBfExiicldtR70iclVxrHJvSSD06Zbck
         f3ir3iMdtfR5dV+4wPggDkBqYmCZ7CLsXYrrpaFdfB4nNnfwSQCZufz5a64oqUsu4+9a
         v3qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573963; x=1796178763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        b=JGnkFeho8NHko3O6xmJmlLpcKz9rm42Ze7zDq5eCUuPWhWk2DOetuwlfUCK/zrNhC9
         TySDjoqzKiD+nr+xj8/hVKIYHrk4RyLvfhaO7iuHEFVN2fKNqz2OhzBu9EkSWerrPTuV
         d/eSBJl+nY1/y9CGxu2xM9b7JYmQzUEWNBSSsJnaPL38DxjT0lyd93+RuyPGHSOBpOY8
         ZJXUfkXr61HXdHPJ3FKISio150uY+TrdPChotPmKCcie4Mv65YZIbBqYcyY2WY9z/YWA
         hRd7dXIMSuhXsVYmuTFOpKeFZJaEQSpGwA7sdfNBudqK80lfpDmagKfurFLDqLPdbK8X
         lDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573963; x=1796178763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        b=G8awwvBXVGjcz9o+cY9pXw69o2f6H4tLTGLmpqqwbD9ymZKgn5C9Q7BP8DhWG2/vwS
         iI4ytgWd8m+CP0vdgW/ZWBr4LMbXLV3xrnsalyCrA2XJxjOXRgHvkag72wl8OlFUGMeW
         eVe/FKjZiJBNerbL2bNay2ki3n53tMScOJsXsipeESD/tbrfKfxthXgigz30mO5riK0n
         d8ScWeS4ymLFVReVKLwPkKw9QXbgiU4tkpVt6h13BUHOZ/3FBHiecbrrWTlVEf6rQw9J
         1tGDZ6EmGsmTal6QyflDbskGyIVwcu09rnY3npfbIwW8QfWehFIWvnqbDd3RUFElhyrW
         CxWg==
X-Forwarded-Encrypted: i=1; AL+hErEc1JDukMEJQ5COfUtkNulAKATa5nWew3htlCFJVK28/5tT8cQ7bDNc8Z3qYcYuRO1A2g3jazUfB68e//0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/itIRhAvMXTMQu3mQwfMFK/UVc/f26NqMJsUKmBjlZsoahHkWS
	DHLwe5VpoMPxBSKBhW2/btdRFCOJyGU+cIaagfO3p9e8btX+mmW3H4ra/6fBgeM9PvEYp/7WQ/z
	glm0+geI8lMVHucDrBCgrbSehfMESK3M=
X-Gm-Gg: AZFdTZfcgyXWxPimgzcGFaC053FdMbDNDpZOumTftKChT6EYF0fhZL75EbF40n6aXmZ
	VU4D4BnpA5AoTQ2mYSkXrFVzCXaUKrlTETVYKVdmYhDb3kzyUGiIXXm3pSDe/8ZUFIK6c0GUQKv
	OUxGvBC3goJJTAX5c1tdNNL6U3JtgaHBn4brqIT0zx1FJ9kfT5evSUvx5SVho+bsB8YpnhckAgw
	4NpIkd8nSAmUI2Bc356IMnYT4YWIUgj6RdmtJB+iv6cUlc8BPXw6UFAEDWYjx+iMPQUSvbzCYZd
	4PnmnngfrrDtIv1ncWyn9BjXEzG+iaGUQtIeKO3nb90zGbFMi2BqKHCktf3oQgNjLkI0G9K035L
	vVLRA00VBosXryc7uR6iNZRQuIgqlQVN4iA0I
X-Received: by 2002:a2e:a98b:0:b0:3ad:f236:a652 with SMTP id
 38308e7fff4ca-3ae7fa6ce1cmr44004651fa.25.1795573962416; Tue, 24 Nov 2026
 18:32:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-3-muchamadcoirulanwar@gmail.com> <947615fd284c416891ac6de5d16cdd00ec5267ab.camel@posteo.de>
In-Reply-To: <947615fd284c416891ac6de5d16cdd00ec5267ab.camel@posteo.de>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 25 Nov 2026 09:32:30 +0700
X-Gm-Features: Aa3M54rr1ufHp2-DDunLUXvNfYN2DvOkdEG5zZTIMyDI3WVeYzjwx6EaEbPlUvU
Message-ID: <CAO26r3QL4R_h4DGWE9CpYE_=6PW5LXo_qy+xKgxZndSUcpbGwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
To: Markus Probst <markus.probst@posteo.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Shuai Liu <847807867@qq.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 20:34, Markus Probst <markus.probst@posteo.de> wrote:
> Hi,
>
> please add me to CC.
>
> Could you make `I2cClient<device::Bound>` Sync in this patch?
>
> `I2cClient<device::Normal>` already implements Sync. Functions exposed
> only for `I2cClient<device::Bound>` should be thread safe.
>
> I will need this patch (including the change mentioned above) for a
> future driver.

Hi Markus,

I added `Sync` for `I2cClient<device::Bound>`.
Thanks for pointing this out. I'll Cc you on v8.

Thanks,
Coirul

> Thanks
> - Markus Probst
>
