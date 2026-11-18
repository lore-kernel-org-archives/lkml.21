Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968203;
	b=L2dAm5zA+AgAzitDEwqNHtXLTpFRXjNugTgi9v4eSrTKWsyMIuPf2ZsPveFYk3j7IQPw
	 vYNkf6lg7sP7+5zjUYK5NWciEecqKF7TGkbnzHMAEucM+jKrv2svhuhInKamjfhnCqP9e
	 WnX788aG7+c6r5vJsHhYJA0U/FJoJ0CRCagVkKpDaoPZ6QuEztbNXhkxmI81idf+TYKkJ
	 dD4mSzrtwB+XlpDFql+aDFfoET0LHubHvLL+6Kv1CXpYncaqavyPKrDOMeE7JmGYVWf5s
	 F+AS8AvkiFipWtBn2xtmkRA4aJf1phdNdD7il+/oSQXCj9gEBXMrwj9oXbd8JhJvK3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RUN4/XekwGukBeANDHZYj2pG8A+8Y1wLE0QDevY31GI=;
	b=rSj6OAGoQ+BNHbo6Iy63/u/r4sB2BKSVrG2KQNPFbGWV2fjSrd0iBZiHEotMSLj4XFU2
	 2lFWfS89gzNIaNJFG9vi4tV1akAg4/Mk71pfqHX5IfI91OadPntL7vgY/ESU1mev9WHbK
	 VYmm/Tv/6hADUR2Fg4+bydgLE1SZ+Nq8mVay3/KRk7YmHQz4344QTHWFONONmn1u1mk/u
	 //TOnpmhC8DuRgN7Jvls+WlcA7YAwV/klKKrVd4ILXIIFRO/iLrE/7ZH26JSiiEQC61xb
	 fPRVnFGlr8gYFaCJs+CtFM2E6+5R06VYhW3CHl7KT3s7BMVdyq5mh7pLfcJtk7Ynruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLvzh7Tm;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8613606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8613606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLvzh7Tm
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380c28f9e35so1762410eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968202; x=1795573002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUN4/XekwGukBeANDHZYj2pG8A+8Y1wLE0QDevY31GI=;
        b=aLvzh7TmrJQmsKxZ3p4l00JnOMwV1+eSfabMwypUjc1VmM5qgDfZ2mE8VxdcKQaIlX
         E57k195r2iINV4t2BN+AR9LNERcwahvmpROMB8PJfCYXAXwmgNCSXVFqk73XW6feEiuC
         zGSYDUC0qi3vCoHGF5mI8WLPRqvyajol0jG+b8+n/rLnCf0QVp6X1uOHAz4gqQpubwaW
         Ts0YABGgelzj4tlv2eGuXrj5LlOlbzh4+K/Uk1VI9p1XwTwtIrpoq98bFzblWBVcHRTi
         xM+vRB3JF4lPDLcPUGivxMXmi3TJyVdqAbvhkLW2cV/EsMzksEcZZ6W0r4n7FciiM0c3
         AoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968202; x=1795573002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUN4/XekwGukBeANDHZYj2pG8A+8Y1wLE0QDevY31GI=;
        b=I3/r4pIRIoqoWahsStcRks4sYWSk0twbE5YXf0Vg9a5F4anb3DWldeZ2WXYESAnxFO
         +HnuoTOmLgm68jyob1UsvhHeqo1Kqbz6yVzLpet7Atu4R73MogWKKq95WtjqcfGObaw2
         5Ke2d6RbGjcsXTKFq+htpYn2M/TY8i67lPeDY5wGtbpW8oheZpLHB9fuJxJZjSAmwnHY
         VHx+n2431y0YzGoaG9ukRM4FLZVMD7bIZf0JB5F+DzFqrM7pOpielM/q0J7QPhKLTcki
         gn2Vdm/cNHHGszNV1+T0hyxc8Gj911MmBiSY6SPPOfo40ucfYQg7mdtLIiaZXPw/0ozh
         kX1Q==
X-Forwarded-Encrypted: i=1; AL+hErHO5A8xN0V1MRIr7T/RWQl1mqEM4RIG/ndpIqQH0MyNukIc4ZbYBWgA7Ca6cxtKl6xY+4d3Ya/csUj3HKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YhGb9iV7/XSXEThNB6nMp/ofgHKz+jN0F4Ra1T03/DqEZIaL1
	r5oou2rkA9pAuttIX2uGFkLZJF7Ybm3pwssL9IZSKMcDolB5QjIu38M9
X-Gm-Gg: AYBFou1VhRbiI2rLw8kwafBfW2Jrxwdf88p0KJCgx9q5qLh9ZhI0i1s0EpFjFs0BYqd
	lm1jamE7KCNEl/fn6oyneqsZ7qzzp0FIfSNluDo6MMe65IIL33ciF+2moT3WYz8jILnGg3NYZt5
	4hZIcwcIluJ/H6l4FwCL3Ipmq8uef4pQ5vH9/uApdQvzQwRIrmXDj7cVyUyey43lJFeYLn3OLxk
	6vF5HbexQTpPX3fDuahvmWur4ozC3UgaOa5REJ1NuNUODdMlGpvCdBfiOqmErQ50AzojFXL9x8p
	zLjhBuFD2OwQ0bKiBwn1x6jT2+XkFNdbKzwd+YLBJqm/hoINCAS6gS1xlHJx43HTVAagry7G06p
	yHg6um5rQKvtyMcwyuz+gx07SNYNwlkzTThQ2aBHt7TQh8AVnh5JedrBFVySrZBsGWhpI7vCiot
	vg3Q7dPx5bsTbYqgFirc0gOLstxyqHRXByr1cij5CDo9gW1Re9+orxob44ViSALkIIQ8BobYn+t
	ndAIXoht+pjileAHlcgI8e7HgV2yGV/0LGGsI6Oo16Z6g0eYKsB7vERkXdekMfyueFFDOG6iVuT
	wRC5IRnCvM1iHGjfvIGK3D0L57zI/+0hxQLy
X-Received: by 2002:a05:7022:b052:10b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b53a469eb6mr3927988c88.19.1794968201793;
        Tue, 17 Nov 2026 18:16:41 -0800 (PST)
Received: from localhost ([2804:30c:914:4500:cd15:65cc:e2cc:7363])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f954dsm2207436c88.2.2026.11.17.18.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:16:41 -0800 (PST)
Date: Tue, 17 Nov 2026 23:18:04 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux@analog.com, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 0/3] iio: adc: Provide mult_fract() and make use of it
Message-ID: <av0K3OIrxq5Bkjpw@debian-BULLSEYE-live-builder-AMD64>
References: <20261117091638.1463621-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20261117091638.1463621-1-andriy.shevchenko@linux.intel.com>

On 11/17, Andy Shevchenko wrote:
> In a couple of IIO ADC driver the suggested new helper mult_fract()
> may be used. So, provide it and update the straightforward users.
> 
> The helper has potential treewide, hence it's provided directly in math.h.
> 
> Andy Shevchenko (3):
>   math.h: Add mult_fract() that takes struct __Txx_fract as argument
>   iio: adc: ad4030: Switch to use mult_fract() helper
>   iio: adc: ltc2378: Switch to use mult_fract() helper

For the whole series
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Thanks,
Marcelo
