Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016450;
	b=SWrkoMrTawalSVhSP2TVyax++agRzJ5LgBDtdppIa4TLKxvY0kuCJHJ+NT6syR34WXjF
	 Pyep60RKBZ/OSIltpH1J04KyxuSdi+/e6bo5y/DvpZqphqek9svCRfI825Y1UrgrcR2Wi
	 ZA2JcvjiQJrJcoJNqci4QA3LTCwbxF5Ax2GrUmUArfqaD4mgAsiSXTCxiLg5vupWO2ZW+
	 jwwK/luP5aj48sYYnFqdw7++X4o7h4ciPpMUkJfQ3twDzsKarUzPZ59YrQ7NLTgoM2ZPw
	 efHlKT2DzYbek7GAPtRH6QNSh6e1Q0ih96FuNvEWCPA+fcLsdiS6XhsGx98XZ6DPhvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tm6dB1EUYOThFG6qE8KMMgbho+/lR/6Gk/9spMdJzlU=;
	b=iYzJW8GTYabeUZmBG2LJl0TdHxadNkqRIWLOJlsznaOaLofx2b8BWNEtB7RM4ArfT1l4
	 hWflBD+THOujMyAYEKAChrWJaYpswNv+ndyPeh4paptp42YfyODA0bNCX6HYgS7Kcyw6P
	 Fc/Db600Fkyp3YUpWSiKmwiErWJ4dp/hg3eSlx0dZMWcnzJwoX8fTCyszJv9Soj/aoO3R
	 wd3Pr+WvecVQBW7LAwzoi2SGNgk2s0BhHYg6fX7oqhCPjmvom8H8capsBkOul7Pzc7Bfv
	 C4fZavMz0PQiPrGDEhXtgj6KE9e5hPiAoGeHNF5dxd9nQzfcYPxsqG/R1JI0DtsQU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/T+wXSc";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E05606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E05606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/T+wXSc
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so811307b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016449; x=1795621249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tm6dB1EUYOThFG6qE8KMMgbho+/lR/6Gk/9spMdJzlU=;
        b=F/T+wXScP9Zgh1uofVaMqzOlFgqfmKgwCctq1qXcplNMa+wjBVSQAc7SSMeRLdzPB0
         aZ1GrJrH5iye0o4/LLMI2fA25rH7UfxV1ehkUE7OC99in1a0QZS4q4fUT1mZWt1NMlya
         gIwScpx9+n0G70Q0jOcfxLy+AeOQGv591C0uGFyEAHz9ZnLD0ZPavJuDzCS5ZaYKLAvn
         6pxQ0tEw9NUG7Dmh4UdLTFYgD1RdG/Yy3r4oDl+vYou7NUVAtvVOSdOwQBIm1lDnzDne
         iwJ1y8JgjfqQy1FPn6+euDTe3FiV8I9E4eClxfNeRAuzzroJEQOGh0/mIeVlCC2JDxXj
         qTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016449; x=1795621249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tm6dB1EUYOThFG6qE8KMMgbho+/lR/6Gk/9spMdJzlU=;
        b=b7u5CJ5RJJ+MrdgB8iZSPKi/XyCsgUUgqsB4qqGzDJW8ORuF4fWPyBxP2yxxNpDQMq
         +yv6LaidX9uhiPMOwxEpEy0UBuZ2tDT9pMMxtUMXT1KlEXl50m8BhvlW+yNjp50tBPIn
         0IBPoryZCf/FsrHQEI3t4N6MSoo8rkXuSmaKoDtuEFPGViE3DUa6JM5CDd53Cc6wYTBA
         4NVks6EeIJ61FJHTDbPSIVlYy4AiocpMrnLqJOZ5upj2iXM/40BSMdsS8Ct4b3zYy/a1
         ZzO1bxispNKLc1bhRmS/mX+aPzXFszIjaZaTgc4gN3aiiWlPzNjrggoS3s92j8PutKSn
         TT/w==
X-Forwarded-Encrypted: i=1; AL+hErHsXzHYREb+jd0w3sPvyiPXDsNAZ/9VzRvyAB0vipv6oUfFGN9TXNllgBoulNqQ5JpwkBpEt01LU0RlAck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SWgSWpPJQCl+i2bhGnbAtmFaDXPCRACQ9tfYof83PaBIhzvdP
	9Oc0wUvVsMtWsUdgbZfkJ4uqyAf6HI6Wo3oe6TGb2idSpGJk+f8by1I7
X-Gm-Gg: AYBFou3pF2qtbMohelIy28BZzp1QlFNRpmb9uqRb0zje59FUHBNUoMX/DlEm8TmV31F
	f+H+qG1MeDMyq4wzVJ95zuKtPSIFVoClPuggT7yJcYaQOu6zJoPEtRy/n7e9vewwJpk6S5G/gQI
	B+Ttp1CU+3vsv1L2tU5zeOcdzLRdtmKrBnSgMQe/EAJWNVgAvfJ6yuBVVJG0BINYkq1QxjPF97+
	ArLH/IgLAECKntJJeTx3n54WsaPhk4iRyARBq1q3V6gWP2HBS5OOkytxIoa2+ceFW4AlEXayyJh
	wGIY4HjJrCX906mSvhy9mx+MgITKnn6dPTfTR9KaCobsUXuAFu7BvIWLihvHGmKemYyr6kKsIL0
	sElGbmTUx8BuwWubk4RubjeI+AlrdC58aXLPdr0KHHEp237DJQ0ZeB64cxmAxobqpRtmEKdJ+77
	ITaoHeWzS+IIMf/7wbeL/nw+Vns5uV/e1kIZ0Qj7dArsYtTLkWqlTmr/bBPVR9JMApVPyMuPtk/
	4fMVmphtpDa6KgCl0HYZUxlDaHmSRoCaVUig149/uxypnk5TNh1Bn2tzP09jD8lQh7TcZMdvzFO
	awNoj2Ck9tAxuljQrB8TaQ4zrL1KgDwKp7OUTVY6nO11aI+c
X-Received: by 2002:a05:6a00:a244:b0:892:e080:4ed8 with SMTP id d2e1a72fcca58-8c5d48d82b8mr2645070b3a.47.1795016449055;
        Wed, 18 Nov 2026 07:40:49 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm1421203b3a.20.2026.11.18.07.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:40:48 -0800 (PST)
Date: Wed, 18 Nov 2026 23:40:41 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 4/8] gpiolib: cdev: don't sleep in the SRCU read
 section in read()
Message-ID: <20261118154041.GB46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-4-aambrozewicz@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-gpiolib-chip-removal-v6-4-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:07PM +0200, Adrian Ambrozewicz wrote:
> linereq_read(), lineevent_read() and lineinfo_watch_read() stay in the
> gdev->srcu read section while they sleep waiting for an event, so
> gpiochip_remove() blocks in synchronize_srcu() until an event arrives
> or the reader is signalled. The device lock is held meanwhile, which
> also blocks device_shutdown():
> 
>   task:init state:D stack:0 pid:1 tgid:1 ppid:0
>   Call Trace:
>    __synchronize_srcu
>    gpiochip_remove
>    devres_release_all
>    device_release_driver_internal
>    platform_device_unregister
>    gpio_sim_device_deactivate
> 
> Check the chip in a scoped SRCU section only; nothing after the check
> dereferences it. End the wait once the chip is gone, and return -ENODEV
> if there is no event to report.
> 
> Reproduced with gpio-sim: setting "live" to 0 hangs while a reader is
> blocked in read() on a line request; with this change, the write
> returns at once and read() fails with -ENODEV.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
