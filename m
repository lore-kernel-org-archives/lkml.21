Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505388;
	b=OlYJ+h9A0HFvedxTZ0bNndCoQZmvt3lCEMnIBi1IzYkCA5NbMIJFacQP9Bgmm7CVwLe/
	 cCI1lfWa1XEFpmOO359Sh/9UoI49+xX5Jr7buJxV7Pfv/F6sJpUFjQ1MYwzdHx1CQm1wR
	 jykrl0qR/inQ4D78vyvRccesVnB/R1ruTYlU8dMFcXKLdQu1ygmMA8LwEvIDtBUzJh2bE
	 guh7F+TJKyBkWF43vF3smkQUwtPArTqBCgncuX1jZGWA9XSxpVQtQRnunJIQ3WW0GFQsn
	 qw4KLWfiIYT5l4KsIS9+GzCdOecnJ5odAY3P1X5k0paOpdyZu9PD6kzgAqOTDf9JsOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
	b=bpOcoc9dCI+1ZXGa3hfHTa01Goe9YtYYaslRtEGYBisr6mQzeQb7qe51CZ407rpRBIbq
	 F2tBgRxiQycYcWWbZKdiPquZSWwh+izdBYo0GjGpoukPMH9gEGNa3UalOjqafvSr0Bn83
	 OHShm6cw+CXmTuBqTIyGg2v9RHQRTA6JJbwSxYmMd66E7otrG7/c+cdolrbAgKeLJ6EEF
	 0saAHZqBBI6vlJS8Wwzg02ZihJ+z6NXvvgQnSugwidkv6G38W2ByxyxNycngqGGMrM37M
	 64RuOCLuaOu7g8qNjsLoYHf+uiSxz1MYtNkg+ZmoQgkIZEeCAGbh+toIxvPdBW5YCfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAixZFu3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7103606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7103606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAixZFu3
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1479be604so3105781e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505386; cv=none;
        d=google.com; s=arc-20260327;
        b=kdimaxoUDrNbRLrG22ZvmlB2gX/S/v7ae4hE7KRpeXj4IsjFPtYHTGNy6VE33xPajx
         3n0CeAh55bTnBKdA3xinNxWRHiSQGMNV5vkWglkBPcgNsDdvjDt5i6opyGAEhfvlQV9D
         s87RMSHnsAnRhCGCGC5CDkC3cjF1pXWVRAP37is4PIZjk3H+TWHVHvwcGrAfkvEoEm3P
         n6Ty4+jDnqh2h8eIWxIMDVy9XO3W2SitTfJOTQkCIpnt6bACl0M+mBxKLkb6hbf7+yah
         Cn9ztAcv1z5CjoEi2m27Wwj7+k9tWv+293nU9ejkXRsQKKme363luonT1ZxpcGI2/F23
         vNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
        fh=hSpjInVsiWDvCxUn/b4dWzxaQs1WUKeEQ/WLqrlVlJk=;
        b=VwLQLWShBby7eGvbrADwHlpd6AYNiAP19Y2XFUjabwc25l6U0cLux7wZv95wmCYmvy
         Rh9o2AwX17Wr1fB0jkBIun/9CTvA8IkW6t3AxyplWrSO6PxwpLtBysPCW6wPAxz2FI84
         MqHI467KghcsZD7+33OML4ml6eYNEfYLMeP6gmyvzVAh6G7aBdsGQY1r8gb37JBE1bbT
         FvsiPsryTqO9PCaaYyjfzjFjsedSOIl6ec2HjI9hsjG2EVjCNABiZ3r4AmFY00vPZ5ZY
         9mgDndJz+uFMWfv6uBrVBzgj0i8JuxMLWEuXNfoqVHAE3LH2KPg+iBmWRv2DdoF1rece
         ozgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505386; x=1796110186; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
        b=jAixZFu3VW6Q8y8h8D057mrQVPM+4cfJDCrf2C7P5dF2CiCwvXa/9S73S8BIyfE+w6
         nMm3UIXGY/ki8oLCM9C7VtiExP2TlTwc2IqxtH8JA12fJ+5xoZq6fOmNYct4M3xDDnWS
         WmSwRuCzMTiVnVmK3/oaTSV9kFnSDqJIDKKNwulJL7/NjycKbtgB+PIhHexyVbzauNKU
         iv5+2iaDYE30aqXcMe5h8pgUQ6nb4cHD1wBf37onkVkCFCYsiGSxdyYr0C357D4yU+E1
         BlSsT0VLLI/aZ9pGw1OzkSpV2P6r1I7pF33O6VmLt549WoNiM/JHhBAD5oii3QinZRUE
         zC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505386; x=1796110186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
        b=1gl5reGyoONV7YLMYSuMS4xo4YEhI8nqEsD2xnhbtIeklnS2RwDw0EzOgbdYFOQJAY
         lOX6d2bRlHAdlGVAfQ2LyXRNB0geP2c2a64cE29Hr+74R3iLLYUvR8PqsRTUenKIVoCd
         7Se7sr550LJS/LbdE0Mck551UgifzG06wbsqGcL7zo46XJBxuXXCEizmBY7xTrGtf0Ef
         HNkl9v82tEM91yqy4lCRXpoWfGWGxYMd/Jyq4TGVEw8VssuwgDaQwBQ1AdiGe4oK5HlQ
         kHz78zClPAmlCgzkYiUg4dj4ZPRnk+81Fbf78MWNVqcoSpGacq1K0D+jtZB3sNvYYD2f
         hrLA==
X-Forwarded-Encrypted: i=1; AL+hErFWqE7kqsnb6/9rbZt7Rt/Az7jnRBJR5VFBiHZZ1rt7lWoFDzhFAVyVHO9+6uDEU5rqO+fkswIprbWimq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C4KloJXupDJ9randWs19EJFm5uopW9I4wBOuZpF/3djVRDW/e
	EE963zgUturh/AmEKo/aCq1e4i0dz/msgeS/AT+l9SZrZovVYzNBCGx0kprneEG6qTMGloebZYw
	CjVzDcJbvQB5W0+od3lHdSX7GcPM6IJo=
X-Gm-Gg: AZFdTZe3CJ3qa5PXQpud+OPa1x2oKPgB5zgJrX40wmk4+fag7/wjxUvZo4qE+depVBq
	QpQkpa3hL4a+D8aDsATAwF54m7TFPbC9RSMlOXLzOqR8tlupI60WMJt5sIVgNwrjbMrY2MDNP1t
	iPgMJjxLjT+B4JSoyJnPC3F08hC+Md/CPXTXw9n9748w6d9bVp9duAh759esxE/bvFYs/ak66Ku
	HqM+mx4sStpWje/0QCL9iQbHmUQFEHVqghrAdp40PKENDo6JQ4VFqk0cZ07AbW3thVHnuErNY0b
	BsfAtxPd44WdCX6oZCiWRuuf7huxpUDMA7Z3Ko5U1rDJxR+7Rtf1rJnbbXTBTjau7DwTOceqErM
	25hIx8Q8ZGY/CurDXmTQATpxQ77oOvmDPjOY=
X-Received: by 2002:a05:6512:3087:b0:5bf:e540:8606 with SMTP id
 2adb3069b0e04-5c1bc898e67mr4261475e87.59.1795505385842; Mon, 23 Nov 2026
 23:29:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-regmap-kunit-val-bits-v1-1-a1cd02063217@gmail.com>
 <av1qOFxolvDhQTKs@ashevche-desk.local> <a93f6d11-22a2-42db-81d8-297240c9bd2d@sirena.org.uk>
In-Reply-To: <a93f6d11-22a2-42db-81d8-297240c9bd2d@sirena.org.uk>
From: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
Date: Tue, 24 Nov 2026 07:29:34 +0000
X-Gm-Features: Aa3M54ph22eAMFVDyRykrIGrEABI6AhQfgi6d7a7zVpyiMmcsmVRWIA2hsRMJvI
Message-ID: <CAJsKa+4KEU8ejsDvj0=qCh3=XC5dZZNv_X+Saco4Ln3Y9q9dOg@mail.gmail.com>
Subject: Re: [PATCH RFC] regmap: kunit: add tests for values wider than val_bits
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 11:30, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Nov 18, 2026 at 11:04:56AM +0200, Andy Shevchenko wrote:

> > Do we really need those explicit castings? I think they are already inside
> > the byteorder macros. Also we have be16_to_cpup() and le16_to_cpup() which
> > might help.

> If we do need the casts that probably indicates a problem.

Yes, the buffer was declared as u16 * while it holds __be16/__le16
data. I will use be16_to_cpup()/le16_to_cpup() on a void pointer in v2,
which needs no casts.

On the main question, Andy wrote:

> It means we can't enable this test cases without addressing the underneath
> implementation(s) of the regmap. I think the proper solution is to cut upper
> bits on the regmap level, so the cache and HW will see it as expected.

Mark, would you be ok with masking in the core? I would mask val at the
start of _regmap_write(), before the cache is updated, so that the cache
and the bus see the same value, and document it for regmap_write().

Some regmaps leave val_bits at 0 (e.g. ad4130, ad4170-4 and
phy-cadence-sierra), so masking has to be skipped for those. The
reg_update_bits() and reg_noinc_write() callbacks do not go through
_regmap_write(), so I would check them separately.

The alternative is to reject such values with -EINVAL for all buses, but
that could break drivers that currently rely on the formatters dropping
the upper bits.

If masking is fine, v2 will be a series with the regmap change first and
the tests after it, so that they pass.

Best regards,
Raffaele
