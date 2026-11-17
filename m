Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941109;
	b=gMNW0hFIdvdTWxyobQjsax0Jy2DUCv5VoAMDvvS+MVJhOVBed0TgNTV1H6HHW+zD7kAR
	 962dZaN1ywDp88IycnUqzBlqMCd+aHD/3wBdQ2uH4m+CrtDzpjy/XiJK1Dy41Xl0Fx9oe
	 PS1AXFht4hEpQKWnXH/JW17WxdSa0OZi38obJ7yADW4F8L1LRk4p1mLiX9B345EKIUKUT
	 ljdQgakLkXN8rg8FcgSI2SyYgOK8ZHO1gntFCis8oT0bPH3dmIpHPamHqtI4Zrit8eBnK
	 ySQzToTi9l5GEkqQvIH+aaNM7SUnA+UTpZtjFQSRpad7RlYytfUG7Q9RQqWCn1CtkTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941109;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uPOBkM8XHvjxf6D69jNgl5qPdmKhqGLkdSlcUC+YtjE=;
	b=311z1SJQv0Ve7f1eLA6wolh+6fH5gsgS1zE4pPXmCooAkpMlfpsVzoEskEg+DFDwAo+F
	 NcybRdekeoCUKzXIKDN7asy+nv79OdZJoY8Hchxz2VvCvf1xz0HlQsYW8T/UYJK0qQMix
	 WptOy/Iv/bd0XxKoF0erLZ5eyAjFNO6QOHJVa1Sa06AAxgGo4UfOAcOYcmrDjYnxbuLc2
	 CCN4HKO1aE7GCG+dq6wU0odAZOnDy8Y0Qvw5yeo8oB5Wj27DHTB1oeGISlgs8uL6oHqv2
	 cX4OQ7YOULHiAxiCp0UBtl4JySTszg6YM188lCmMHF+uMLv5MDgf2fsYTkpmkUbiheA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpWnjZFe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F05606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpWnjZFe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE7E1F000C7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794941109;
	bh=uPOBkM8XHvjxf6D69jNgl5qPdmKhqGLkdSlcUC+YtjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VpWnjZFev7hqxJNnHkW9IJkptijODim3FLkLoIuM/cpV//MAbRRyFtQTgh6BtszJ3
	 Nl6vWsnBsbYlwR7miREdM74QZDlKxovSmfh6OtgJnirjOxq4LFS1IH8E6SCl6QD9Sv
	 xw73a7mUXpDkP7ylyKktSlUssuQSxXFdx3F8wOjfXRfK0OdNR7/KT96Jyr2BKhjH+0
	 pO37BJEEh3ePXtwPkMhiizGdy9+W5+W9+Xj+yLwIboVfdbDax4wL7TtdUimt7SFy5a
	 I1HRvPoSDgif7TdE+GVsKlNLHMVKwb+wbu5zMXoJWXx046lzUcTzfL7ae+smC+9T0O
	 zwMCV7rpGILrw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so68748e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:45:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrcIgZSXwWgzDEI217GwH4jD3PJpYLG9Xipu6urYihJVif/JdoNVQ0uQnKkFOArYFBxl2Ccoxbmnz44MQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BJhW0ap/u75v0b6iWva1rJYXzC3yRaJ3c6WxIDkpFH1MrB437
	GJnC3hXD2j6ghb3i/WkJjYk0IJz2MA7dQGHqc2yBb5wWxeWj+t3EwQ9oST216vJixPwTnCsvDaN
	eVa5OJiR6KaoUb08Gg9lxCg/3BgYriKg=
X-Received: by 2002:a05:6512:1192:b0:5c0:d7c:7a1 with SMTP id
 2adb3069b0e04-5c1aa08118bmr1807e87.25.1794941108077; Tue, 17 Nov 2026
 10:45:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117163809.622249-1-lee@kernel.org> <20261117163809.622249-2-lee@kernel.org>
In-Reply-To: <20261117163809.622249-2-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:44:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLny1FRt8v7NwX8FHYAOC_mdygcV3FtscFwzfxHEUgBDGw@mail.gmail.com>
X-Gm-Features: Aa3M54omOtNfN5qw5Jdx7qnLkJd6KWvB55VIdOj8gYh_ahd_56SSbUwGQ5J1bxM
Message-ID: <CAD++jLny1FRt8v7NwX8FHYAOC_mdygcV3FtscFwzfxHEUgBDGw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dmaengine: pl08x: Defer OF DMA controller
 registration until slave setup
To: Lee Jones <lee@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Peter Pearse <peter.pearse@arm.com>, Joachim Eastwood <manabian@gmail.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 5:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> pl08x_of_probe() registers the controller with
> of_dma_controller_register() before pl08x_dma_init_virtual_channels()
> initialises the slave channels list and before
> dma_async_device_register() registers the slave DMA device, and
> pl08x_probe() does not unregister the OF DMA controller if subsequent
> initialisation fails.
>
> Move of_dma_controller_register() after dma_async_device_register() for
> the slave device and unwind slave device registration if OF controller
> registration fails.
>
> Fixes: aa4734da6674 ("dmaengine: pl08x: support dt channel assignment")
> Closes: https://sashiko.dev/#/bug/linux-4e233fb9-3b0c-4442-b601-c6706c9f5=
aba
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Fair enough,
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
