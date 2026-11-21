Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293685;
	b=pQD1VvtiI18gYUFvWTokRqEmSALGyvEz9X9iq6wnuXrN/Is7F/iCpnBFA4mEAnbPDk1G
	 MmD0WLKBQmIBwoH1s59NXwJAcBo6HQfnTylTxFqvrEBa6MKQCKk32rioOaPddM47KKsuI
	 kJ9cLSR/zTOgMx6sUY+w9Y21Nh2BnkRO9LWbtkW+osU9Z6QGDP+g5RBniiF7E+UpG9hL1
	 H/wuMuJPGYwxJQHKLTveOv9ywunsbiD1K8qfhe3K0s66elvD5zXMeCyzfkLkVWaPlh7dx
	 WKDNdkN5sUV7MxnCFWZ23NFh5FaR9ya3b7oHBFTRa8z8ZPATaujoyKZvJDtQl19PtSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293685;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b4WlBIeYfXjkCDL5Y8Z597JBZPP1KdP6QejXLz1yHIk=;
	b=PUOYv9/wiifX7qj528/UgTEZ8Go8eo9NbXMX+UDi6FZC3YUBIo+fd5FTM6LEwudQJwJD
	 HtTxd/H+nszsB88YLIDVtJ8gcAXxNTuq3qZJLAh+hYBOiDkUd4YcQjE0MpQD8jjW3OBU5
	 N+IiMopqdkjG79XZz5Y2rRm1ob7hJHL0vQKMxTO2unXb/SIgPuRggprgcfXzk2gY978VO
	 M/m0BdPAzGAnqCjCszPLccntrlJygWTu8VeGOJb8drxTtx4Dr9h+R0Eg+XkItMwkvc1Q/
	 dVdqlNc4lehdyg+t/w/p1at+/y+WpTn6MHcDXMKw9HrgEWkhaXTpjOC4wlrXmpVWDtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsSWF1bB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78F606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsSWF1bB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5651F000D1
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293685;
	bh=b4WlBIeYfXjkCDL5Y8Z597JBZPP1KdP6QejXLz1yHIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nsSWF1bBxDCZWEEGdtVr4N7h5O6aivS2ENs9b5TFOKkjggjAm0nFTYcNnAiY4q/yX
	 4HB08kakqiYHrDG8OSSHT63Bp5iWZ8FR7jrmEaWKHtWPBUkEL2ODkcm9alazU0ptPw
	 DnXeZLLqfh4MnXTiGZzKLerlBI1PoN+Iy5E/1bI26H7H5gxa1XZkCkbltw3xI/eZpm
	 fBffjBrqqHJUXQfcVP95sXFv1Tmrhp933yEGCZf4GxwXRphygMDXbSny5K+NEXFvLL
	 4mwd+1jyYif0toej0j2AyUpb+lKCeLrwpx4gxmt66kO3N2ggttGJ5xskzwmg2KVk78
	 J5K0dAFVvRrgA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccecba199so1931970e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:41:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEwHLXa0WKEF6EybcRZ1Ow7ifp6x7X98froO7bgwyLqqQ6jqFBNvLwhK26umH8HaMXGcWWbXo/Mk0eAiZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z98v2FySYmybAXpBR9/ww+kUE5iJRwT/OmBg7RUB8cNkBFt6y/0
	PgrsJD53123DnSv9pk/YKM97AWxugKf8tnnZatSA5t03BnXPC9nw1h1EN8pWmxyYJaiRSeZZsB2
	VV9fiDoQfAV63X00ycl4nK9PT5MqqLwg=
X-Received: by 2002:a05:6512:39d1:b0:5bf:b22f:19af with SMTP id
 2adb3069b0e04-5c1bc7c4514mr2703568e87.18.1795293684444; Sat, 21 Nov 2026
 12:41:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-4-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:41:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLn90_bz3=oE+8rV906pOaLykKFqx4Cp1snLufUu0N2X3g@mail.gmail.com>
X-Gm-Features: Aa3M54pJMyi7VeDQdtQwI-ABSXBp_5jI9c4EBusiNB2hkGon3qtq7U4AzS-lEdw
Message-ID: <CAD++jLn90_bz3=oE+8rV906pOaLykKFqx4Cp1snLufUu0N2X3g@mail.gmail.com>
Subject: Re: [PATCH 3/5] Input: ads7846 - remove unneeded memory barriers
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

> The driver invokes mb() after setting the stopped flag in ads7846_stop()
> and ads7846_restart(). These mandatory barriers lack pairing barriers on
> the reader side and are unnecessary.
>
> The wait queue operations wake_up() and wait_event_timeout(), along
> with disable_irq() and enable_irq(), already provide the required
> synchronization and memory ordering when stopping and restarting the
> device polling. Remove the redundant barriers.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Weird, probably cargo-cult code.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
