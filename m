Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702124;
	b=WywygQq1VjZT6zHvdAVq6aUzB3S5E4S+PgjRZT4PHBIvciqHnkRNgBp565vhDiVT4Uko
	 MA22y8W6hqJUverc6u+anUxcXNuj9B3qkcSyFasm/TBBu5f7Ls7MJJaGkUlUaXu6l1OhR
	 n37Y6Pvt/rFXrMayvnuzWqjwCcfu06XF+haryp7DcXLrCgincM+G/dzolNJFiM9Rndeei
	 9yvjjhZvhuQ69MMHLwNvegPQfbDgu0RAyf5bPYtzF38A7bBcfjvam6p68ZcyzKD2ob8af
	 WAtxvqHL5nU88UILMo68+CxLJ54ncmnccIbBafDYFQ0FVM+sCOafN3NRy1SCwb1GZ+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
	b=t8NNg3PugEoqgZ5iGfZRegsjOtShScYgR9btyUxTMK/VTGK6g6aJd723W71e06T19NCE
	 orls1IAlKeMccefnAeP8W0aC7S6EbQH4pHmLWOKDOfD2jfSEMZbwYhMPyFooBjKjJfgYI
	 6CAPWjP5bEg5Wi+PD73IZWaEHuqG8aa3eFLjrREWocFAJWlkkCpw0f1lPSyOpXzHjUMW1
	 NutMXeI+59FQ5RBVzG5UW7tug5nWlv3Z4O8j0fPzQZYMRiEyhlPPOtLPbhVxqKaH/NgDL
	 K4t2n4FiHvanGasYeWAewyig4Ld/YVMXcJY/MOSBxrb7aUE6Vh+cV/735lYlWJ6d/1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAFC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBAFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5126505cb3so917364866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:08:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795702117; cv=none;
        d=google.com; s=arc-20260327;
        b=YESj/xkwS7IbmstcbysIj7RSdhhDzugR32h3GxWRz7M5ii5UyEihr4hfLkN3nQxmI1
         oCz3jg7jbQ0jTKmj1dINQGA6aBH1HiVHvJgeoPPs5NcI6FUwESpKL2hqupe4k7hnIvPH
         iysNcZj/rkPh96idD6VrbvckO3xYMaEx3P6slM6J6YmfMHLnGEh6cfOG124Eek7g1iCo
         FEdyn/ZYNHvho6+zJx4KDgNLp+Yq3W1qWjnDy+onyX+/7BUwPq2PJNcFyfJATcvqqY/v
         S66/TFygvYRF2K7akl0XqS34NitKfUjbsw+X2RQZiWTfBK5LEywq8CHNC8ko70zgFV8h
         Za1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
        fh=m3YPBo86Fin8KQ5xk+2v/5yTVfbaONabfcRY5w5kv8Y=;
        b=f11yblaKJEa+bzo/qlAWeORkck/2JPpVnfpnCf3NQdu1DXnsRY6n9CUQ1XRs5ivXxL
         Hnae4uwq9sqBXMTyqFz+9oOrg96tBPhm0ovYSZcl0ryz+Sz93MuaPDuBd99Gjxm8emha
         cJYS+LZGlR8KBedvmemWC4pD9/q0dT6n1Mw2fvgkpQzmc3ur+IMLQC+oxhHU/Gi3lOeP
         Qn9c5wBnfoPtwu0BLKzHUZe/z7lU4YXAL3BPV5fQiYKMvygNU36Uhs5uvLqZq0c2Z01O
         eEYB5bGEsYDbH5tG9E+HC+sYl6a1EDDHc96B5CQiMfrqliN5WLBoymoVTruPKEldu+zL
         4nuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795702117; x=1796306917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
        b=HR8ahns3qwuAhoW0hw9HTmgsr0BAAW0rNNJQsSEr+jLXiCNzUBG4/kyaapy4P2cbxJ
         VrDfk1DVPaJuxlzqMTLYlB26btFGHFZR4GRcVPQu++pKTCZyG0lTG6ICUyz6G9POsRDR
         toQJ1aszLe6o70KQaksYZ9qnsxKbUOu15LVA6bkfsSY4U28i8HPS+aAcYnmPk4uDl8Gj
         8oDhGuV7HAY9mhG+TXno2m54MtIjOnGZtrjFdA1+VAN/i6rr8ANK72Tuo9UcYg7F6jd3
         NBIAlWRey6LPB9Pfk82xyJawMysA2JSGMO4bAgSd91FS/2clRduTDEY9Q68+g8paeIJ8
         2c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702117; x=1796306917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
        b=ZEIRHUfWFNyVBqiHWOV7D0epnM7FrPo8KiV32L9lxjo2nREoAesijeTTM0G/+zjKt3
         BFnU8XAl7oZdlVN+oZ+BTY7eBt/8Y3FaNleN2kmpjot/NV9N0/BllnmaPeeftiAdbXbZ
         7qtZ2M+Yug0Uw7k4ikWMG0x5/xPJrnUEiI1XxD/8Vr1jggG8Izyuf8HbTwA20PWbMcXO
         uESn/nXHr8mLrRgNXtRp50YTwtU7jTEMznWogkqT1KpLykLvnFBMtAlsT0oxEJstGLqZ
         OvDvLU/qf5VrUICQRQAjDgILEQDO5touOONeQDlsIlwx/bxIsOJLmMKIzxx3Y405yfOZ
         jNAA==
X-Forwarded-Encrypted: i=1; AL+hErEqiac/H0M6OmSv35UvqMzba8CTiI/50qw3dc0hZtgKbvqrftrihaW6iYzv/MN4DZx1nGdfNyzZOY6REVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LtB50NyQhPJNQKNUlMog9iHH+zcx70nosl5CSZk0QStFFrvPi
	1f6ty9lJtcUyqICPID06CBTAOsN/f0kBer7yIXRwtwiO/2SP4L9h+fq1wWvJpfmhf+0oyApyXbj
	Bj03YqlLj9ffXOQ5s1egLt90K4ilb++DBEGYQAr7SoA==
X-Gm-Gg: AZFdTZemMNz0dWiR6Alh66704VsnAMZvJdMeTK97i6b9G5ydzC3a3RNdc4d4wKXooTd
	ERHQhu2vuzrrzttgUFs9HosvEn0pdEgZK+Lng4XNWxhfeSq1bkIovToDgJMkCflYjEHqHM7Xzrx
	V2JPR98ozkaOYqrdIFDW7fsj4WqSece0CuFi84YEMzohH8yME4iWQfB5ZjFpQl0zFkrXZjiby6M
	LT0Q5hfCNzdij/H0xwTREMBYzImxiJLJS7/+7HaILrHcT+Gk/mdwJijAlHD3mXPHxA1GnUK0eNc
	nzdaimjqaIOZpjwQPxaMS/q2d6wSDmz2/QwBco33u1KerqjlP/d8xtnV1zKtNFcw9snQzSDX/1k
	ayEBcwGgW+53gwA/DXbWUlX9igBRGHjs9PQ==
X-Received: by 2002:a17:907:1b1a:b0:c42:102f:15e8 with SMTP id
 a640c23a62f3a-c513a999e27mr1682615766b.14.1795702117183; Thu, 26 Nov 2026
 06:08:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awXHzblUfp05jZSQ@kernel.org> <20261125065429.1483868-1-rmustafin@cloudlinux.com>
 <awcT0WnnJ-fyovnn@kernel.org> <awcW90qZvOim7dbh@kernel.org> <awcYZNG9f2YSIz49@kernel.org>
In-Reply-To: <awcYZNG9f2YSIz49@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Thu, 26 Nov 2026 21:08:27 +0700
X-Gm-Features: Aa3M54pYCLcfNb7xtzLqr27MYGtUyFN9A6DJLgyYcVB1PLXNJ0HDOIerUcb9Tb8
Message-ID: <CAG6=z5sThdfZLY3mQ+NdzpFYj7bSN-CsV1bEdKCASw7b_b2g-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Shuah Khan <shuah@kernel.org>, 
	Jaewon Yang <yong010301@gmail.com>, linux-integrity@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2026 at 12:18 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> I got them applied with git am. It's better to use separate threads per
> patch set version.
>
> They are in  my master branch now.

Great, thank you! Will do separate threads. Thanks for your guidance
along the way.

Br,
Rustam
