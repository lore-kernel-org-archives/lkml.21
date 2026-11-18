Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016495;
	b=5HoCOYgfzDERw8PAEf7QJW6Fl9diCMuIjV9OLQy/CjhjYlQV2e+NvLA2m7Qasf4aI51B
	 AL5liiKu33slZx9VNMg240AWb63f4MaJVjJVsYzD6i2JAwB+qPPfRMYSQ4EyBFbyU6XRe
	 ZX7LwZpJ9eAyU2f2+FlYBLWqDwIo1XSYHY2IyQ97tdRsfwxOZ1zgGULefEHWWeev/NRoC
	 eAX0ZF0YR0XXktujBJAgHsgdpJnfcIQDJQ4ojrkvJo1aDXArLVbDl6n4/lnqG6tJMUXX7
	 3onoHj6F4S6cXTEPvP1HMCJEh3OC+W95jnbebUJyrocHXl0y5m28vw5NIBn3rV64Ehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cD/07tCbP0c2PveFePONvl73YWhDWOPfUwb001eQKwE=;
	b=qcymVtk+O4WhrWoTWEjzl1H6ZB4YWJ3OimQYlAcKsZTHL8+WjmVbMLh6jV99HcQAo6iL
	 tHzAS6ZsMcukYxZ6OYYNaAycZH4QXRZUMOJuUs/AyO5kimD1c9WR8LBhqNMlZ+iDtTMr/
	 om8F6H8sMrLBctxMfZjDElIMA5+UNqzI5BBmuaOqoRtEEP7gHR20NF764FBKPSeoiYZbu
	 SDzbPaWHW8gIR4/W1TpgHuIcMFcagS8L9Pmjc6ja9r9nbE+VfZiUcAAsU2YiL6Ft2l/QY
	 xixpSkwnHxcnZxCqzPoBxvpB9OgJlA9Tce/k1Pi8/lCqpNttEu6IoJp+TDkKr05fVGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4RhHqr;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C02606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C02606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4RhHqr
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2128868a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016494; x=1795621294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cD/07tCbP0c2PveFePONvl73YWhDWOPfUwb001eQKwE=;
        b=Xh4RhHqrHc3yc56+v81B6EtxtJ0ODDySLnhAH6Bcyo+2KI4tb4m0sow/x8cyaDqfJO
         8Q+GA32xhbsvG9hVZ54LsAdBS8FFPPokzwLwGrQKCbwVfwV2vmeKVJ3C/5b8PX71niNC
         WgAHlQxGht204JVx93ADZwzNuyhN1HX2gaOxQjuZBijmqfBBjB/y8GerqI7D9v4uBTHt
         TWnxI7Rvl1PkKhiKF+n1daFsNkmMPYiqIX0/orF6Lxw7IgqtJnpp0OYKfEgvJJCyBWmE
         e9VhAkiD5Uw+s2MVjs4DGBkwBAJh4QgIIu65X56e50h5v1v8WE/rzC95z0A1Ph6CFlrv
         nhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016494; x=1795621294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD/07tCbP0c2PveFePONvl73YWhDWOPfUwb001eQKwE=;
        b=098CP4An9hY+3l7kY+kt1h0NpG0AcWKqtJGRYCQoDLD0yuvyO8PuwXbfmTt9YCaXnh
         Cn+EpkjB/Bgrx6dAL2op2ux9LDhhTzm243CIVVKAozRc8+fuG/Qa8Zg2ev2YROZfvbT2
         pGC+UkGQE+zT4qGM7boMM8qcf/+KVd8A6449X2Cy0PfwufjflQsld1xl34u2kK/r6MyA
         GDLh+sz1+VgkOi8jH4lMcEi3zKuGij9rFBI378n6OohujMaYJ9HE1kTSLF5p0NYYAenp
         Kjw5XMrTpCAmeIKVFFOP1t8881+NYpfvp7SdE5fSE3HfzDcx1N5/ZAz6wJOO2iGK5Y6/
         1ILg==
X-Forwarded-Encrypted: i=1; AL+hErGRU4m0zTdUFSSWXBFTr3ZaLEqTNOuE/ryNo1WSuyXfdwJRA4PbskAqdEy8QdcPmuzv6X/LCXcyEGwI3fU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tm0/j5Q01Of79F54l+rvwsmTb6mzJ4USoE10kvfGzmEYDonKR
	pliKzYlJizrHB8NbzYYKZ0dFeU9284iRdPHHHzN21IdjcbyFmAdMs1i5
X-Gm-Gg: AYBFou1UVjluRpl2rHkmPu0WCT5xAwaOLeHshhtdFdxnyt7wP1KmmqOmB+uAauzcrI+
	bHT5I70W1RXHjPQt0DbqOf50vMCL7PO9VTnhDvMPWzB5g306UEWjHet4HTm2boDwNYm2Ny8XwRS
	01lWe1YApT4n1asRLN/I06BWHn8ctn5At1b7RrE2/JQEaybQZCl1Em3BmNvNjh6Q1DDiGerP1q1
	YOEfLlTMkVqnLs8lEki5bU6i73ZKKljrv1aK2Zwnv3///s9tFxBsM9uzvLdCjKWJkbfvz3pB7Fo
	qb8K3V9cxfDq4Z4cN8Z2aQxtKujzo9EbjY5co2g4jhAGFoCfdm5S/CxBM1CqNncp2vzOK7aN6Zn
	JcMDsex5ZO70P4lUk+YaFHLSRMBe2BijForNUkHAmyGDisPDy3rWybC5fDYhcZShG1mFUDhbrUF
	F/vqQMN1A4R33PSJXQ0YNibisVRP2uA7pzwef7G1jq+65ht2FQToMYro8yVfKCviTWH/JWm2vxJ
	I5ng2HNjvrh5xlEDAoxh0azoJlZWogc1/BE1lSC6FicNMtPLLakp4rZL4yGqf9Zez97G6WwiaRb
	hSLuN1+3hEPhkDbR8s/LPwWxsM4YdU8ZHARk0xf8d7tuD5Xnjw==
X-Received: by 2002:aa7:d0d1:0:b0:6b5:8cd9:fc1b with SMTP id 4fb4d7f45d1cf-6b887f0e5fcmr1777268a12.23.1795016493632;
        Wed, 18 Nov 2026 07:41:33 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a0021d0sm1192372a12.22.2026.11.18.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:41:31 -0800 (PST)
Date: Wed, 18 Nov 2026 23:41:21 +0800
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
Subject: Re: [PATCH v6 5/8] gpiolib: cdev: don't leak the IRQ name when the
 chip is removed
Message-ID: <20261118154121.GC46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-5-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-5-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:08PM +0200, Adrian Ambrozewicz wrote:
> The character device requests line IRQs with a copy of the consumer
> label as the name, and frees the name that free_irq() returns. When
> gpiochip_remove() frees the IRQ first, it drops that name and the copy
> leaks:
> 
>   unreferenced object (size 8):
>     comm "gpio-hold"
>     backtrace (crc dc8eac94):
>       kstrdup
>       kstrdup_and_replace
>       edge_detector_setup
>       linereq_create
>       gpio_ioctl
> 
> Keep the name with the line or v1 line event, and free it there,
> whoever freed the IRQ.
> 
> Reproduced with gpio-sim: remove the chip under an open request with
> edge detection and a consumer label. kmemleak reports up to 23 such
> objects after 30 cycles; with this change, none after 100.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
