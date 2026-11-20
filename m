Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184682;
	b=12oSjKZH/Y+DMoFTN/3+lhsdzLL020odl9SibJccUXW9wD9+F1ObWVHjC72xLXKaqYxw
	 mf+T4QzGHnUcyEmLxQUXxszku+omJ5soJSJBzunwsV/0Qb998thNuXE84ODMA7NEHZeBA
	 K7zJkwT0k2fozOoLLxwCaS7sFW3D+UNlk52Rh9C9xQ0QFI2tY7IL9m6IMVjixjGODxTnZ
	 HXaygKoPHR7NsWmd+JMXUIVFCGOMA2YlJP7ucYX+sjM522dFBX8CcJ/6lGo2yzyXAGTHt
	 TueB928Jqvu0UQsRa4ONr0MvRJSEUAEmw4NPqLWKn3DYpNW6KNMNPO0WO6M4uxyPMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184682;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p9Rh/hXvg2jsBJjP0Yu4C+Eu3X6GZTjBohZpfnHeVMg=;
	b=3d6HQj0LzhXmMzv74s20tW0Wgo+/CJkGmKrKXfCq96VbmMe6fvvZJttfXmnuK/ul55MB
	 LswmPs1ks3cIvQ+ZEmCt+9izVzw9vKC+G7QNYaCdu9cJ4Se+dPnneQd6hhgqR1CzIjuzh
	 ji0pY+Hv0q2GOmFJsHL6naJ2noiBvzvoFdIZ9oG+Op7sku7wD7sV2j19i1ZlXVfKg7VKs
	 ClAF1OxFchTPAaZ08Y1Vw4JwZBqyU+aAPWq3E6BGMltI37gnWA1RZ3Q6a+rOsRNN6+59z
	 JWdNbaYLGSrW1izElIaUZCnqFY37EdYLvLICszBKBMrU68HtSmVQS1jfXXTPvmYXxXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kk4sEdJL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61801606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kk4sEdJL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AA01F000EB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184682;
	bh=p9Rh/hXvg2jsBJjP0Yu4C+Eu3X6GZTjBohZpfnHeVMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kk4sEdJLgOE+Hjw8W3OrY9BNWMGi5VD2BniHHp/u1AH3+J52/BtJTNBZ//LCWHyWE
	 ZSh7uMep9ihvdeKPnjnkAFffnkhvycoFWp9cfd8mLmrYCRl9EglIsN3BH5vcqANK3s
	 k38f8GHL60LxbqRyMurjMqOgkPpAP/YAGnZ1arararMBd/3Syj5njelU5RMpwr/oXw
	 LegRyo4kYLpNVK9PJHUFm1MQtYxVLiPODRcBFK+jCq7OOD8eIlZiOabDIDpA7hvYI4
	 0f1HVtfr1ITLQyqTurwLliT2+w8j40h1skqu/BTqIMSxtbLvCckLRt6g8dj+GoO0mK
	 Si6nuU6e63Ldw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso764710e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:24:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG6TG8rJbmryULmfqy4ETA/Y7kaOw7EnmJS5bEbWE6mrlRM+yZXF3TYnCPLhd7kNd4W6yN47jADsGBKGQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xCH32Ps3YnJnhhfDBeHMJyujFm4gJbQQME1mKWHKSagtwCYZB
	R6BwZT0nUqYxpzPgYTSYeDaVZXEijL2s+96r70zvls4uY1kh9IiOklAu5utVnMtIiTt8xBexTFO
	39hnJpqTcvNAG+a+4UtREkpEE6fBJjfU=
X-Received: by 2002:a05:6512:3d23:b0:5bf:f76f:b5ff with SMTP id
 2adb3069b0e04-5c1bc8c950emr1064542e87.52.1795184680432; Fri, 20 Nov 2026
 06:24:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
In-Reply-To: <20261120125722.209609-1-paul.cercueil@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:24:27 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jNd7GofuUwWHvebMg6Sptwi_t_tV8ooncCA-DJjfyDbw@mail.gmail.com>
X-Gm-Features: Aa3M54omc4JKmC3wru3Fek3ksqLimBrHCDgOmZzphfIO2NeKkgojyLoxQOCe-CQ
Message-ID: <CAJZ5v0jNd7GofuUwWHvebMg6Sptwi_t_tV8ooncCA-DJjfyDbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ACPI: platform: ACPI 6.5 fixed clock support
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:57=E2=80=AFPM Paul Cercueil <paul.cercueil@bootli=
n.com> wrote:
>
> Hi Rafael, Russell,
>
> Here's the v4 of my patchset that adds partial support for ACPI 6.5
> clock resources.
>
> Sashiko complained about the clock names being too long still, as
> ACPI device names can be up to 17 characters and the limit of clock
> names is 16 characters; so I now name them "acpi-clkX".
>
> Note that I expect warnings from Sashiko that I got on my v3 and didn't
> correct, because they are bogus.
>
> On the clkdev patch:
> "When clk_find(dev_id, NULL) is called, does incrementing match here
> give a (dev_id, con_id) entry a higher score than an exact
> (dev_id, NULL) entry?"
>
> My answer is that you call clk_find(dev_id, NULL) when you know you only
> have one clock provided, so you don't need to care about matching
> priorities.
>
> On the ACPI patch:
> "Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
> instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
> NULL prevents wildcard connection matching in clk_find(), so any
> consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
> fails with -ENOENT."
>
> That's completely ignoring the first patch, which addresses this issue.
>
> So I consider that those two issues can be ignored.
>
> Changelog since v3:
>
> - [2/2]:
>   - Change clock names to "acpi-clkX", because ACPI devices names can be
>     up to 17 characters long, and our clock name must be 16 characters
>     max.
>
> Cheers,
> -Paul
>
> Paul Cercueil (2):
>   clkdev: Improve clock discovery with clk_find()
>   ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources
>
>  drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/clkdev.c         |  4 ++-
>  2 files changed, 67 insertions(+), 1 deletion(-)
>
> --

Sashiko has feedback on this series:

https://sashiko.dev/#/patchset/20261120125722.209609-1-paul.cercueil%40boot=
lin.com

Please let me know what you think about it.
