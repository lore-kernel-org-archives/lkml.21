Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698438;
	b=y7+VqFG3q7jGhVru7eh3qnRU+FrAk1NDDLjx6TvIFQbqbSF19aV7dtYBD+C4XP/FQQ/0
	 H6sE9SJfPWrS6IlHBH3gYp4khwFdAQeAdHnVkuHfdDKjOrm43dLLsr/i3BM5sc4n/thV8
	 avpnLvWKzjJHFjq679Gvr7/lgbHE6wV5vwnhJEgb8bUU9HxxBLZbVk91DubVLvhe74uYL
	 /TlHvHhvhkPfH4lqKCMyepK1yBqVVxT9Fv+vwPG2bVkPIrcwUBbHnFVQkBE+9PdCbib1e
	 IRlTlOt923rHiYAcLQFHNap2zTNL4bCW2c1B8fOUqU5CKmucZM7SGBTBptqUDAEyIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698438;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k6MLydfrU5dN1iQDZDbtilSOMTOBZOStE4iUqdVk/Q4=;
	b=TiM/6luqe96zoPb+dNzVZKIl7mMiXcQ18t8CSJq/c7xCWA4CvkygDbhbX8/DdFK1poQs
	 qE6ZZ/M78twNL5CXkQYV9dP02Thk+ahl1Z/r6h45hLEGxdd6TQCyhKm+xgRHFVzQP3GkB
	 ZXn8zn3jK7oSu6EK0UN7IJ8qQS/AEsj6YAmDUaJ6aWAY6rzL6a0F1LEuw0OLpYsiz/4Zv
	 sjVWgcYdgM00B225L4lR4KIHnhyfYJ8QdnyDAq6v1KtL6k1aoA+K4rn/BvX3Nm1eWm42b
	 6zsQKUvKOJmtiGNCX4H1lNtA51LDOb4Az7+jNr+fVG6sV2gyjIOjg6EwbaJ7Ri/SaRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkwy0Pw6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkwy0Pw6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370C21F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698438;
	bh=k6MLydfrU5dN1iQDZDbtilSOMTOBZOStE4iUqdVk/Q4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jkwy0Pw6kheEy3Bf54lDMZfIwZbTP0UhNeq6TrUDmAwiib+pNkpMEpSZMLBkMFpk0
	 9QxxnryKn7D4iRJQunPjHgv0MQcyA4WveEXdsAh4Om4HwcNHnppuzXiYMAVG/nBxfM
	 N451kxiOk4jDmJMI4fXYIqZP8XMVWFZ9R1NFLO8BHJhZYp9ryFtXWPMXRf3Qk/Nlt1
	 7uRpvWq3GVmLQcMoyat6UoUTOwsrACZdsRoz89k8wxpNUi6OMcStndOvPUP+whZgSK
	 2ls2p8yhJSgYsHw2e5RZZYqbZu1YhAaobwvMmyRZwQJ98xWNZqwM9j82olirp2/kv4
	 YR8u2DQqYHCeA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c08539c827so5513235e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:07:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHThpjZYIIxX7tNHiiTG9j9Xf/bdAJIwUCQDim3ylAaGanqh090yMoVocxokUgYL7dEHJ3DFmOBuijXphY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v7bOfltOEBOzIxZwS6yxnZoHlORbq6+lP5hQa3OAtxrMgl6Rl
	9kzylIuPLxCypXDU6g9QeJSC7kwohx6t9WKy7rVhVt4pIHMg2l7OGHVQSLLb4jnod//u81YaQ3Y
	8Hh92Nv/00Rd8EKKWYhe7mO2IXf1rG9Q=
X-Received: by 2002:a05:6512:3b14:b0:5c0:465:3fb5 with SMTP id
 2adb3069b0e04-5c1bc806862mr6763468e87.10.1795698436999; Thu, 26 Nov 2026
 05:07:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261116031043.502-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:07:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmJt8+Yz3hWPwA7wo63crAj6E+qD2b83h9pPLSV4ktu_A@mail.gmail.com>
X-Gm-Features: Aa3M54oOpmRcJWcEY0wb-eeul9G7QcTYb_X8Hc7Y0lyAIc5DHSEcaFmVlL8EIqk
Message-ID: <CAD++jLmJt8+Yz3hWPwA7wo63crAj6E+qD2b83h9pPLSV4ktu_A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:10=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> stm32_pctl_probe() acquires an exclusive reset control for every GPIO
> bank with of_reset_control_get_exclusive(), but none of the error
> paths release them again: the bank loop returns directly on
> -EPROBE_DEFER and on a failed clock lookup, and the
> clk_bulk_prepare_enable() failure and the err_register path also
> leave the already acquired reset controls behind.
>
> On success the reset controls are kept for the lifetime of the device
> and are never released either (the driver has no .remove), but that
> is harmless.  On a failed probe, and in particular when the probe is
> retried after -EPROBE_DEFER, every attempt leaks another set of
> reset control references.
>
> Release the acquired reset controls on all error paths.
>
> Also release the clocks of the already processed banks on the
> -EPROBE_DEFER path, which was missed by the earlier clock leak fix
> dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak in
> stm32_pctl_probe()").
>
> Fixes: 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is no=
t yet ready")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Patch applied for fixes.

Yours,
Linus Walleij
