Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426313;
	b=ldE/tjFurnzweVhr8pYYXsKn5Y7Pwc0b59IiAL65mENWsR59R5hCnMwVyGT/1+cNe9N8
	 8wPzLBVoPrcUn3K+FjiWw9uek+m1ES1P8bKFwhMt1pTUmwWcw5vTvPrEs7Tbw9ptwe9DO
	 rYcTCUo6UQLNXGcVw/Z8HHNAnwoGqzdq5na/Wox6ZUEZqAlm4JEw7zKqxv3SNFM/JdObD
	 OkF+SN+3Y3PldJ4CetiamlWU0i4aM7nkqgVwtj539mAYpH+CQoPbd8jWJu1kOAvwMnqIn
	 aYWMnnWwlwvBgGem3To3jCVcNEsjAKGzGBEzz39ZsUA767Rg55ad3tJK+jy+jx7acvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
	b=zk22EozUW3Ipb04hI/9yMEnFEHdseOVfyBs7dCiL3GQATdfOoMC26uxYKgdKZcYg80vn
	 4lT3skjnbT1HaffXG9eL+Jfpdz97QHr7ACxf0POPA88s9kKZo5tEsaFqXxRObHsYcYScO
	 ipba6PnkRjQdO+icMknVLy4vcKi7YYJKECKojbHG0eEebDXpEEdPycb6cAJ+QYyqjwSnm
	 xWK9DFmaZyqShhTXuuSPn51V2KOguUhD3Za0NvYVtaY11RZqwFYRWY+NgodaGjulJB5Lz
	 oDCDVr7Z6j/BfvG4u7axXagCllqQWvDCOzm1QhzWJjekMIjmFe90YFYeRRzUyHecyQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7MPJj+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8D606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D8D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7MPJj+N
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c24619b19so2279906d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426312; cv=none;
        d=google.com; s=arc-20260327;
        b=b6CPO6s/9SEYLhsclYAxqJYp6vU/zxQCzO+wCf+3YwK1WzPXkmVKZ/4nVwxpSshzIK
         IcXX38RjBxYBFja2mbnZFaJbnv7awk/fZ2inWzi9DCm7SbulznZ6JqRkiDomw7Qek2Xh
         Jn1zoxh4DlGEf5ddMOtQBSjJYKhoWZrgri1xw517rxEJKvjTaOuM7L/qcNeFYoRL+8yk
         WCGPsyU8QKRMkB6Xqwh0KtsVTW+rOiu00sEyq4lUiR9B9pECtzvRHSpKG9jFRB53ObXS
         QPNnrMCTKdKkyj6lvsRYyUdWI2uoEknisYUpreWTM5+OoNf2uxZbUZIH9UzrZolF2DER
         7R2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        fh=nSC6viCDym0asIKSQ0Dna4iCR7sgKNC9uOSQYqBfwu0=;
        b=gc+hkORbaXtS90X3TzHsoEsWcvEBjGxjsNMMWMzH3n+8/mdnBrvEhfM1gD/a36z2vX
         ugY4KEfT7NDQkxJhxm29un6G++6v5MUWhy4RpDoHpA2awaBqrUsIkASHsGcKbBX/i7Ef
         JHmuBPlgtWcYsS/becD/+WGbaU9R3PV51vkB5FiGHzryZfgJOGlDZzUi0a8FQKBdAXUZ
         /l+ni9Xs5ozXd7UsMvox58EeJ0vb8IW/EtUS2hqgbJmGby1D4mno1jjaIQ5OPqUardld
         1tsVyLhd6m3ZFqdf6SZ/ZfilaReGcYTStMmkPdx9vweM4b1LvFItwC9+4T1io0Y6RgdF
         AlKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426312; x=1796031112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        b=f7MPJj+NtY97fe/TNdFmQRQ+ehXIA6C8YkM83rRQ3IeYxJX3qOe/lH5lYbc+J29V4i
         zoul3btWBn767LPYBnenMzcVsfsWOZGx7GadyaGVGYz+gn19PgnE8qCHX4x5sj2+WuJ+
         lS/fUzoauxfO6CfBMYC/vO7hfrm/Y+NYkeld2cOg6ZUPJgVaDXWNzW8RK2PHhCszZ961
         vTN3CpNTGRsZ/SgjRAtE2zUQFgAYmtzN3Luf4rPC2CwZX8xnK5CzZLITl3ZVfFhdh0EG
         HgZgLMeu0X8mcVPOmBxj9ku5mnVTa1s2S3xoO9RN0msF/QQENJggjg16YFFvsCcUPrCe
         8f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426312; x=1796031112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        b=KyuD6cIS+j/eG3HO6nrTJ+ACbCo1evA9gf55PWoaGk16Z50B55z/wgSG2yNRs3MIXU
         8uC3cRLexJ3DJ+cl0xaFOyC2YAA99tX01yxFiDF76VJlXjYZk9U33JnZVYN48/XyoInl
         XkG9nDZpj6FOxgir+f41q1Wa9/vBHC6QPAOYunRiZSLw6VzYHgISQWZNXC7GP4Q8t8pw
         yY8W0gcLWnpTEduDynHIVjV4bl1LG5BuErVZcuJEQLpRjWLpg/ATQ1FjaBm6Vgm4TgKI
         joHuJ9bCNLDPHBje6SO2xdQUSeRVLOpzL+ry3LKL9RliGaSDpLqpMtNAd5jFymsep14l
         bKtQ==
X-Forwarded-Encrypted: i=1; AL+hErHV22xO9lbzuFLJxIOfZyn8+XuOSL7VHVfrPFDiD6yOkz8s9UsGvuI/sGqZd/wFRWQFK4AHwYIHZNMlMHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PTtdcwvxHjvQp9e/BMK9aNE+ND3EGwKuGtmTYWomLV+5hWnqh
	G6aKY7O4egsPwTi9MeXCYtxy58W4F6pYym7c6cus2NZnWWb+y2/bivoVUid0M2WTYi7hDFfhajA
	kLXaT17ig2aBZBxFGtTihke72wlBaFcI=
X-Gm-Gg: AZFdTZd8zzGmBStDIShkHgVJktxlAKFIes4sVMOsyEzpbP10CJaxwAN5XCkXqWJblsT
	v44qcjajoYfatS9lTSro1p7OKjU2iQLHPycwMCoKarIga5fFdqgJnG9yma4jYC1ALuktX2gWKQZ
	ERxWKVKI+1kdShwvU/dA689rqvmGMHj1gofhOurC9zml8mKFj8R6hJaiblUm9kmIu689SWGs0p/
	Kzcte5Rt2Cy0NBXxBwPawZ/J180230K6ybpWaTAAQLEhbx8s8Jm3fRyKTE7XXWW3gJNEKPD0+q9
	+qsFvuDaFjhH51qAAT53cdVdJ7EHlbhdb6pTcZYCvY1XSirYShhOh/ng1Oe08pofTjCGppCEL/J
	zFHfMrhaTFsq3Gl4rJCrbVS+UwWYjD8Tvhm+14w==
X-Received: by 2002:a05:690e:438c:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67df4508943mr2085122d50.106.1795426312499; Mon, 23 Nov 2026
 01:31:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
 <20261121034053.39878-3-prasanth.padarthi10@gmail.com> <awQDxB-09pHSgfJ_@monoceros>
In-Reply-To: <awQDxB-09pHSgfJ_@monoceros>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 23 Nov 2026 15:01:41 +0530
X-Gm-Features: Aa3M54on3hjaWixdom-MZvFvoY_Ect6i0Ad8JpXIU33APeKTiBCUcj1JKRPJeMs
Message-ID: <CAMFFDGh=7CtLR5bOyzP0SuSXVaXY=5H2UajaFx6pcescqfYjYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, tan.siewert@9elements.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Uwe. I=E2=80=99ll drop the linux/mod_devicetable.h include in the n=
ext revision.

On Mon, Nov 23, 2026 at 2:45=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Sat, Nov 21, 2026 at 09:10:53AM +0530, Prasanth Kumar Padarthi wrote:
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/unaligned.h>
>
> <linux/platform_device.h> already provides of_device_id without all the
> dependencies that are implied by using <linux/mod_devicetable.h>. So
> please drop the latter.
>
> Best regards
> Uwe
