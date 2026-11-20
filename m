Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795177222;
	b=5lJtrVJS3F8i2gFr34RHH2fAJYNDVj+R3RJTaJZyE9oyBtyq+LSdVzAmnLYIRVDI24Mp
	 I+roH9LwUs78J6eiNbh3RL4wj1iKNziKrz/JzPdjEKsHrKvyjWY2ng64H8CPQ3NTRCkqy
	 mEB8holra5P008NPlByvoI7Lm+PmtnU96vbmHxtR4J7Qu6kHuU28t8OZbWb8vY7JRr6Yj
	 mNeAgnUhRtYOWB8e3QL8wdm5REfzTCnu6AZicYu0/kDpd/xLeQ6PVUqFmlAiVOZt5oSdU
	 YckY9ORQorBepYCaaHMxAmxarhJobi1Q8/L4ucHhDs8zfl8KQgBPjm9/3vk1OtW2MRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ida7ZOzQmbAaoOpD67ibDsNtLvf5bm1Iif/aInwM/as=;
	b=zksmIhZKJDEWVYXx5NEgDART0uFBxEDM6n9U1tWWKFVnBPTb2g1YEeEClXMS7Ja6el/W
	 1XKRJABohePkeMc3V6BDdFpmIVDL8HGHh/MnsDTAEcYtrQf2lfux9cRXK5Qp9WQop4G/u
	 oDgRVdHWn9sewHy7P6aGNimrdchWQVV7Q+V59bNOYtnZUsAaAJW6kCU+60acgxNz4EXnx
	 GRBU++CR7rQYUbIhzNcesx3zuxGXdFvMb+uQDiBbauDXbV2NATz68OQEst6RPeb2XdiFg
	 LgV0WIJsVF1YrzxHL43Q7SYYPse4bUzkKRTLgh32I8vPAYeWfKSJ/WZb/4i4WrSAfwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b="f/v4uMn4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326CA606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=f/v4uMn4
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c515319dd89so8563566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795177221; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEWpEXT6BUb6Tgk+nAoJNAbct6aXnXMgmfoMB0ZbwRTQl81/aXaK4czUGJZXRwipL9
         U1A9t2oZr1sTpXgy5sTnpNvUeoYLYAwR/VtZwdDDiqSclSIn/5KdiD10P97GOKsmrcIB
         lYvIRX7JohT1B6ZUXJ+9+wec5wA4nwxmRmmTTmiptMcSm0aRDn3QkWAd/9uJ5Pz1Em4+
         iIhMx72hRs4ahy7/xNghdStL4fskUBoc6cK44AEBvbteplaHvJFeguk4l6GMMx8KA4dp
         ypJK8iYpEe0cRz3SVUUp7pS5NIZEzzQyC1J0mhGzl4I9MTqTR5qxipOD68O15OVgcm7g
         i06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ida7ZOzQmbAaoOpD67ibDsNtLvf5bm1Iif/aInwM/as=;
        fh=Lv/21XlxbEXEuuZJXbUXmzscYQ2xD9dvUvu3hZz3koU=;
        b=epNHi/RkXWSKi6UNHYNasDQR20KrqQkV3XVpKPqcPGhvE5bzhjI9m++YMknU/Pv1uC
         d0ORwmGnSdNDIaV7ntf+KS5nMb6foibn9LpncIVLRy8rhE+tADn9EqDdQetHuFmJuZbI
         GFhzru0aQBOEVzUq9AFwQ0hcOxOr4iCEzieZuHFS9/2BN4gnUn5DgIIgO3tdE0iafj/W
         j+7Al2LTL9V5LjSHIOj04dAVMeZJaNXYLWmRVO2qw9ytJjmya0X3mhh5McFdiwjHHMDE
         pcdQNz/yT20QTPdTbqHFOD+wvnXfS9sl/LbfFV/0lHaXSDi7DKKc0iTmbsRvugr5cE5o
         2Atw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795177221; x=1795782021; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ida7ZOzQmbAaoOpD67ibDsNtLvf5bm1Iif/aInwM/as=;
        b=f/v4uMn4J3fQGmL3e8hL8H6GpITgmTc+j+FxBSUEKNQWWCcZHMZO2Tt7vAhawDk/7d
         trHE7f0BDEtIUdZzG0iJO3hF5E5gt/NNUkLKDU8QAp8gsYRxWEQ2DYavxXHQbsuyBs3u
         0roHf7zcHoItpEkApyGHqmHVB2Qb3K9j5J9KRFsv/e7xsQwFeNmaP05ELmyRkOzWiO81
         eYleydYZC/heAiZP7H6TM6wz/Y77Eg+n5V3frhEA6xCtCSr4nirpr7hcOxguEDPo3D0N
         aPbLGMINMqBlgpedk0Eg00B24dolXOAKRcSfek/2OLCk2Sj1dKcyQWWu7fifkIeOKbWf
         4p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177221; x=1795782021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ida7ZOzQmbAaoOpD67ibDsNtLvf5bm1Iif/aInwM/as=;
        b=N5IDEaY3nEKWpirT6K7EmVBHTxZX/FgTInj28RqRa18aGflBSMmOz3xRvs0A0XO+Bm
         qvHUNHaxQe5IBRgID8NVnbzDw9xEyQdrbG2TB29onjR6KU87SSNJRjiRhGQRoZDedqrQ
         j3OOIAcvbbIaW0lFCp17J36jluUe2y2QhnBSyk36DgYAbk5HZWc5JWg7KcLnt8OK8ZEH
         SNJVp24Sjbb45GeRoSLHIaot6M/+Urba9XCUQUBGoUAQmOYpUBLrmWKlr+fcjBK4X6a9
         JXipbNmRAmxqlQp9X1tntIM3hSTyHb2nzAPuoTX2QA8RxGZD3wl38PaMEsr93zAOIFl9
         eHnw==
X-Forwarded-Encrypted: i=1; AL+hErEleTuX7qt1UdkKXjTo2CUzQ3w+1rS0kCpaY4sdSCaFCqY/CZMxaIV3UK8l1oicSORqgmXPRJLqGzQfxD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVcczl9gMlNtxL13ykrkWe7N+Ell7rRdXJXq3l815tZqhKIvo
	RgJRw//dpY+9Z+6FQu+4f473XjGSIolbWkLYapttZmSHFsOByr/VNsa6TPN1BkooUcflJZSqwEN
	JzZIh5zabJFIVYJuSeypNT35eGs4mJSlZi6BU5aaurQ==
X-Gm-Gg: AYBFou388lZRIoFiq9ohXPdzumpOy5eEpHeU++wp+pnntxiOje1z9olIp73l8iaPk5h
	tXv2WHArU6BqAzwOU1D/0dARzFkWR2O1vHKDBto6PWiCvqdtIxGXxlJ7N2BATsA3fSl21WfVu4X
	uKidwMlYT8DUhpoC7LEuXZpKgK90M1qm3aEtEHOpncx5Ti3gdPRSuRhr2T37bagB9rc1Cut/D+g
	2bTIhD44AIrGiFgHSIyIVbZSGqJr09Q0VlkivqXm9zTMrUWF5ljjPfxrauBCrpMSxunb+2NfrIM
	hpXG9xGK1njfxX3kbKJ0vGzYNWbDkn76Z5eTNyTIVc6o7FEWxjqtgrzR2ROR2AIyFEKGZnW0NcP
	VB4Aiu5uumEk9P0N//vo1l3NcRY9CWpjCGMr3Qbq3Rt2sBU+95Grl8aU=
X-Received: by 2002:a17:906:1ed1:b0:c51:2fb:a039 with SMTP id
 a640c23a62f3a-c513a850365mr243467866b.12.1795177220590; Fri, 20 Nov 2026
 04:20:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <alvD5nOP15O5B8Ai@kernel.org> <20261117104838.2650999-1-rmustafin@cloudlinux.com>
 <avwzid1Ovl4ACkaQ@kernel.org> <avxJ9MxZ0PoWbQTc@kernel.org>
 <avxKqn-PlzJyxVdK@kernel.org> <CAG6=z5sxUo1x6mpotkNZXk=nQYvD2AyMLSDhzD3B3kqxJ1=iaw@mail.gmail.com>
 <av23L5HBpy2gbm3m@kernel.org> <CAG6=z5u+qK3JQ4OwqS8e9ncfcasYPWLQhU9Y4iBFi1pEf0QFuQ@mail.gmail.com>
 <av88MkHFBHTD8Rqe@kernel.org>
In-Reply-To: <av88MkHFBHTD8Rqe@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 20 Nov 2026 19:20:09 +0700
X-Gm-Features: Aa3M54olXavvLpImCYcikZbsYtV4fjBy_7D-xUAbTEHrCt2I1nTcWgO0yQSHO6c
Message-ID: <CAG6=z5tCq-THqRRgF5vMs0=MNmXMp80g8HiQmbyov0i-9pRFXQ@mail.gmail.com>
Subject: Re: [PATCH] tpm: track the response read position internally, not via
 the file offset
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Jaewon Yang <yong010301@gmail.com>, 
	Tadeusz Struk <tadeusz.struk@intel.com>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 1:13 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > 1. ->read_iter and ->write_iter that just return -EINVAL.
> >
> >    Simple, but readv() and single-iovec writev() stop working.
>
> So. What would be the use case for this?

I don't know of a real user, tpm2-tss uses read() and write(). It is
about compatibility: readv() works today and can split a response,
e.g. the 10-byte header into one buffer and the body into another.
writev() is less useful, since a command must fit in one iovec.

> 2 is a bug fix, enabling is a feature. I guess this is the confusion.

Adding ->read_iter for 2 also lets vfs_iter_read() callers such as
Coda reach tpm_common_read(). Their requests look the same as readv(),
so the checks in 2 cannot tell them apart. That's why I sent the read
position fix as v2 first:
https://lore.kernel.org/all/20261120121614.978396-1-rmustafin@cloudlinux.com/

With it, tpm_common_read() ignores *off, so io_uring reads and writes
work correctly. I'm not sure about blocking io_uring on top of that:
it works today, and I can't rule out users, especially of /dev/tpmrm0,
which many processes can open at once. I have 2 implemented and
tested, with -EIO, and can send it if it's needed.

Br,
Rustam
