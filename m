Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293719;
	b=5nUORPNmYXx6D5MPW1FTiwPQSz1QuGyUXkxbzSNEZb8yaw/yMQwcSIomieK4douUb30m
	 tEt9U0r3d7VSpoFJ3x2h1b+hZhR7jDVVIEcvdAGF+2oIYYzGWEarK3ESCJg1/2vBUFGd+
	 8DQO/ww8Xr46fT6awyEU9sY5GIi/AiX6z/EjViyyHZ/dOnaNgO/vZUZ+OrhErzcEGf3Gw
	 Mu6jyn2NQe9q4ZUIl5JgBEC5ZUTPsmYaIazS/kzU1+Iqyl7Ng56pPRKXxtN+NPGTqMoTB
	 I05XUlPKW88lcoXq0NcRlFugcDg7QCCr9l8sK0jZ1Wc7FSFlHHN5GLfTkSRNUT5lJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293719;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S0KEtbQt8GRBQii0toPIaQocuYt1n+g/sLHZS8pvKLk=;
	b=2iUHn15FUE9lvu9O/LNKr1sS4NmVftaxM3a+J38LDiMKzx+RgZvw97OVC0mCWPdovhvR
	 41njxvaNbuOvxR907NWvfg5rIqDXh4GNN3fjQuL+B/JAkEjOlH1bNhEaK7oFQW8aEjJyJ
	 3Iq6bfBZMoTWXh/D3GoDLg/j1dw2zoaRpyAnIS0YAg9Ja7Kfn1TWpOBvf/dOMHzzIiMDh
	 KGo5TkP0d8fG5m/YEBstmTdDv+67pZE8I8qg2HW4dyyzVnuY7p4cq4VBHln+Vg8U6rCNz
	 rW+T8UubvOu8D5GCO0ZHUyrh/00v8tVEOzyTgeKwkkakfUC9snOJySSxRPY9RolS9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tzy8D86J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0FC606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tzy8D86J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3731F000ED
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293718;
	bh=S0KEtbQt8GRBQii0toPIaQocuYt1n+g/sLHZS8pvKLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tzy8D86JZar495yRQAG/65mVNGhyCfKZ5L+iBZCJ6QjFgum36aHL55ANEzOtPPdam
	 I27chwcNdefUyX2zCTZS0nPR7luaQk5V/m+NJgvbO0DmYUlGxykZue07+Lfwz5/x/O
	 Lt1coNjQvqDM+FNVRngzpuYv8VFp+uvQDRkZNOuZ8rSaRp29eXMp53mByE9daw0KRe
	 AkhBeKePK67El9rbzIZkcjp/DpqqLU2UqCuO20+W9HCxpTZwrGWRpiVoKjV0J6PWOC
	 +q2K6mauqv6d+Hsm6J/05vKBfV6s0AVUmo8J5djhkQqYaA53Q5zfi0vNkBePylYU45
	 dQKCQqnJkfkcw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so1640116e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:41:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEKmzPmxwVkuafDZhq6HofrLfq5zgz8ZWWj7W0q1U0wCxCCalkacRhXVub+MnCQtrbwFB5O6A0wWEWzJg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fyxvEEZiiiR0rqjh+Od3zylHOhQ4fhvtXmjei1Dw1p5vHNucg
	1OJFGtIkaiUeIqkYiM/eAFAPdbeFY1AUfkwmRICdTf3jGuPILa//UBMymQsRgFDaq7yzlXcGVYc
	IwZa3wI8IIq+zbCNkI3IXzOkmf1dqyx4=
X-Received: by 2002:a05:6512:2c9b:b0:5c1:ace3:12c1 with SMTP id
 2adb3069b0e04-5c1bc575979mr1899458e87.0.1795293717533; Sat, 21 Nov 2026
 12:41:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-5-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-5-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:41:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRGBk=kQ48AiR8nreGH5qqmgPpG9seh9nRdhsoQAO2XA@mail.gmail.com>
X-Gm-Features: Aa3M54rjP1A51PecTmry92kFaSGq6HbI8P0tn6phUpG9qNi3VmLI5ZCflHpwjkw
Message-ID: <CAD++jLnRGBk=kQ48AiR8nreGH5qqmgPpG9seh9nRdhsoQAO2XA@mail.gmail.com>
Subject: Re: [PATCH 4/5] Input: ads7846 - remove unused code
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Kris Bahnsen <kris@embeddedts.com>, 
	Mark Featherston <mark@embeddedts.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-input@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Remove the pwrdown_cmd member from struct ads7846_packet, unused since
> commit 6965eece2a89 ("Input: ads7846 - convert to one message").
>
> Also remove the unused REF_OFF macro definition and drop the CS_CHANGE()
> macro along with its sole call in ads7846_read12_ser(), since the
> request structure is allocated with kzalloc_obj() and cs_change is
> already zero.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
