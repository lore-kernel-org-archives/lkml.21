Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950389;
	b=mMB06Eh9nvb6PMi+wswENbjk06QpHwwHpwX55zpq7k8j7ENg44cNdM3j9Yt2gEwa7uYB
	 er3+XEuUQSSnV2/4dxAg2eA5kuMlXPaE3hC9qrOKWGZPGUDQfzYQv3LM2HxM+fcS//PvI
	 aVxQRh92uujUVqPqdtmV5qsPReI7Rp0tRSdTKYAJJk1ou/P7kgnaRrCi3Rj1fho2JN7P/
	 SBf6iaglfWNjCBQHYGImFDTefhkqBrrL4NxbhmHnH4wW441Lvjm4LnGihdAaVsk/yNBVM
	 j6BtixKMi+P9cRp6f4vQUOib0n9RmDw4Oeca1892JrGMYepn1OXuth6yHIU2lfze8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950389;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+MhpUSiK+IXbujmRSb4i0Yi0wcelsHhHjMYNDrl5RnM=;
	b=LNuPNkq3zhNdAm4HWyavRTXW6TNzC0DF7gCvLBewXr03b4KKAVWTvwE9TAeMCK7r8Rw5
	 D98F4xdspkpejZaZcxZgfu9ykSAEeK16gO/2KTsm6z+lio7J+l+MiBoinlFoxZEzGNnSF
	 0aGSHtIaIWfdqujZMoSy/T4RsF7ZakLQeMsCBaErQ5Do1KQd2X9BCVfxpgpiqWIOiR8hF
	 +/vKAxIYR2LfInf8vXhgNeUMJlHJDMb6XiJipJMenR26cGrmWN36fjOqnY0Cm+RoFq2HT
	 mw6IQjmoljvOdd9P1KW1KLKvKOKl9AOXYNWTKTL8oSWxYHJQIIr44fB+9vtdYa6Lrew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAWTxZ2n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46383606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAWTxZ2n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE78D1F000CB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950388;
	bh=+MhpUSiK+IXbujmRSb4i0Yi0wcelsHhHjMYNDrl5RnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GAWTxZ2nbhR94NJ7n90jGVrC1thSbsLc5wHSDTT0L7xPzk0+MMwZyVG6Xf1+ogpjh
	 wMwKM1fBJSt1bMBHsvb/fro/WQwQQ9WGGWLzyb1WxoJaJU5qSMrV2/0xA9Kj+ulpEf
	 pjKQ1AExGqL+CR0ivN19LZnHEWbRqTFdZIY1NAxC3yCwWJwjKX2d8pWoFcZ0yF519T
	 MXBweq3WbJh/FOP5NV64xXsiqqZTajo8+SuEKglczZ03TcLm4k2SvyWlPVgsKHxRjP
	 4PfTFXh3wlVqoHaSl+oHixRJsMcqNtYaRfDEH6pci/ndqACufc/7+r+adZytukX8KY
	 qHKWOB7D45Z4w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso3559481fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:19:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGp8A/QFpy3ApO7unhwcayeJd8iV773X9NLzV1d5hCoWYMc6D3AupRqzup9oAirs8WLeta3K0xX2tyyCyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PgTu5d0lfrNkxk8DADJ8zlwa8wqRq4s2fjZn/3O0LQ7Z+DrUu
	yIQIlorWAjABPffr8sXKjzWnFR8ok3erHYoHqiSc9SByFeLvftLzZufkLpc+6Nm7EuP7CqGNwjp
	RGjI0pdCnj/gHO3DtLMXveeQvQ6Mmuf4=
X-Received: by 2002:a05:6512:3c9f:b0:5be:3444:57f1 with SMTP id
 2adb3069b0e04-5c1aa04abf3mr115048e87.63.1794950387532; Tue, 17 Nov 2026
 13:19:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com> <20261109194910.2282454-2-sahaj123.sc@gmail.com>
In-Reply-To: <20261109194910.2282454-2-sahaj123.sc@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:19:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyU4OVTgYtbih7Q73WJB0kSFb64CYJLuiFW0ZUGpQ36g@mail.gmail.com>
X-Gm-Features: Aa3M54o2GcB4ftxhBt5xRh5EJOcNS3butjePxGJPXmqVqLMPZ3xuDk1XYTeUbzM
Message-ID: <CAD++jLkyU4OVTgYtbih7Q73WJB0kSFb64CYJLuiFW0ZUGpQ36g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: davinci: use controller-specific MMIO for BINTEN
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: brgl@kernel.org, j-keerthy@ti.com, nsekhar@ti.com, 
	prabhakar.csengg@gmail.com, avinashphilip@ti.com, sujithkv@ti.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:48=E2=80=AFPM Sahaj Chaudhari <sahaj123.sc@gmail.c=
om> wrote:

> The file-global gpio_base can be overwritten when probes for multiple
> DaVinci GPIO controllers overlap. The later IRQ setup can then write the
> BINTEN register of a different controller.
>
> Derive the BINTEN address from the current controller's mapped bank
> instead of shared global state.
>
> Fixes: 118150f22d6b ("gpio: davinci: move to platform device")
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Look into following up on Sashikos comment separately if you
have the time and energy!

Yours,
Linus Walleij
