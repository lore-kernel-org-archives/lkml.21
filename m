Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422672;
	b=2PSsyD2s9i86m4LZdltZn/XdRrj9nDI0wlve2BTD7aIfBgyem1gkjdWt1kmBV3HsuFaq
	 A4KFh/VwffF3h/1efJeGZLwn5OLl7fhV4YjkeQKtRw3lWFu9rX9iRFM2cuY759d4edUy8
	 GhjRgy2FG5sSI4h4eRZVAu6DzVi2aAOkYx8iaB295/yzwLhEP8qycppan16NQLgB6fABO
	 zFK9sVjG0R05OhZHJ71oUghstBBg/HFUor97tO/jsP3jXBkSQHjW7XszjkyxjzEEnjvIR
	 QLNsSBYOmXbGLS7lUTNU0sZuLsQ0qHx1oMQTEM5u3H7eTmp87hrU0I3aLVG4zkNfe+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422672;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7K9+aOsDuHxahvGj47BL/Y7ZLxT71kzKujqYeEjgepA=;
	b=qFBMOnbsrLBEDHYdlHNcmdzR4davk8pXcr1Ub/0aCAgSxwwJG1ols6c2qDO3e7U8a9cb
	 9iKq6gJdxSqFk8Ya9nLMOfubB141lcZIHZ/a+gxYIBFUA1NVpEfIuIaTCplSaBT0lleux
	 0q0sGuIZGrF7GvXlixrkdLXe2p9iwxOOB9WQw2ZdfhfvZc5VyWBo5Gtl17govx8IW5Rfi
	 7BhzS7aNs5S+DbWJhrg+Qr3CMwLtajW2h7o4YUyng4hOZvsGQi/7TAUnwznZE//1dbNDf
	 et36L489ydWG/DAuBl2SDtv5hDssPg6yFEFzdK0iXMAF4efOAtN7+V8Myr7z9vf1uyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e890Ncmi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624A606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e890Ncmi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0271F000CF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422671;
	bh=7K9+aOsDuHxahvGj47BL/Y7ZLxT71kzKujqYeEjgepA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e890Ncmi276SyaCweelPLqt+Pz4ZSGewFCD4BnHV9q5KSXlIGqBFYopAm0F6xIfG5
	 9qJYoCMeRMSV44yzspXosE7XxQmUR3RDhUZBfPCbRxA3AwJcmmkF7/UJPbqJKWgGZq
	 EWuMGj5EJLjiVv4JysKiYlH4J7kgAnhU0ouLUceCsatn+wHq79GUc1zbHNFEOJ+uLw
	 /luPbBFTU8fZ8va5M/MO9rv7js0t4I8O5juuUNZ+9xwB71PHrFyHBYBOLmzufgthIs
	 puxTKuAmyhnIg1D0Rg5pN0IBRZUYsCm6sOTDHLEUeqw/kQDRW9uuSLTRiLzFDmWpzJ
	 oXUdEQV8h4srg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c10dc41270so3174507e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:31:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqE5YIgJ7PifqPg2cfiC3Kiej3AF0+JAk8iKXoJJw7QM3d/e6O5YZUkjDS2v6+GY35vhbr0pmaEQK8KiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eDS2j2+jpLou6598taRmuSLLtn8vd9p7pd6icb1u3G6PAY66C
	Nvg5HZOrbXitSBFIt2hiz3PMt5F4DWVGw7mK3eSbATbHvEQfi7Z5hbjvOzKA4TPpGvDNLSx3bP5
	dMDNlbwfN2m0Ppq/Th9hMnaF7VDw+NCY=
X-Received: by 2002:a05:6512:ba5:b0:5bf:9f5e:fe0d with SMTP id
 2adb3069b0e04-5c1bc7b4639mr2944106e87.23.1795422670655; Mon, 23 Nov 2026
 00:31:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114164933.2657337-1-devnexen@gmail.com>
In-Reply-To: <20261114164933.2657337-1-devnexen@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:30:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9n_GGtY1J+SpcOODwwocsbVXx5E5yzVHJfUNg_sMJ4A@mail.gmail.com>
X-Gm-Features: Aa3M54q5gLlwxxDHXv-dvL4zSEvM8EU1XrbSQjCzjg7QHjDJYHfM3pc1SEbMgYo
Message-ID: <CAD++jLk9n_GGtY1J+SpcOODwwocsbVXx5E5yzVHJfUNg_sMJ4A@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: Serialise the ISP enable in the params
 and stats paths
To: David Carlier <devnexen@gmail.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:49=E2=80=AFPM David Carlier <devnexen@gmail.com> =
wrote:

> Only the capture devices hold isp->capture_lock around the
> mali_c55_pipeline_ready() check and the ISP enable or disable. When the
> last two queues to start are on different video devices, both can see
> a ready pipeline and both enable the ISP. The second call fails with
> -EALREADY and its queue's start_streaming_called flag is cleared, so
> the ISP is never disabled again and every later start fails.
>
> Take capture_lock in the params and stats paths too.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>

This looks reasonable, have you tested the patch on hardware?
FWIW:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
