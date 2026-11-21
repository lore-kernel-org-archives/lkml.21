Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293735;
	b=iFPKRYGkT38UJa/ejpYJsDoRAOIOGETVHChVZt9x1ZjUGP4kBYa5QH7ARMZFnIFAL1rS
	 eJevL4+AolDirclBOB0kQZzvCA0z2SAibJHVLv5lgPUW/d83O2B2XkHBEKHOoSUpkeCab
	 ms21ZJhI0speB15TusEUAhMKyNZ5Zjv5jxaOnqP0DESFeh/uOAdfjWxvkjmGIpgLX6e3I
	 UeBoaEwMEuE2JNQvOwYqgesCGd1tmVjRiE4Rtzd5gD5wOnpuS+yUftf877pHwA+9AijPs
	 AwUHfx4fN3pwEzZobxyWYerJDSSb3AAciCwERMH1Ceose/LT5LFNwIZMFWDvFbTCs/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293735;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=huxgq6e9wHfksi/drVHaTC3DOif56VffXqVT2Ec+rYg=;
	b=wVQdvcY/IXynonExSxE9cgNvUYxYMJmtRVKPZegRnR/KwsizZCjT5IybF7y0Qxqwj3TS
	 Hcr1P/jd8XxQrjtp7hiwbVDZMmXOPLTYDuBO2W4IBFDdI7qadjn7S079B5iVUU8FpVUgR
	 Y4orfhHpoW/H+xzQP5RlGHgY1HQ74LD2wp4MTmaIMTUCFAWTCiweseQMK7nUnxJ1KWgPg
	 VjgyZIh12IX7ab2CsJv+xaj58uSLBibxI8dBtlguRy1bjSjpJtVscWpJM1eXo0trfeDfW
	 +vlfnNQDVcauLNL84EwRnoVaN5/+syPWzve2A7u1I0Hf0ylHlpwh/d7XUHIS6RH/9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8pXa9Nj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A6606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8pXa9Nj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB36B1F000D1
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293734;
	bh=huxgq6e9wHfksi/drVHaTC3DOif56VffXqVT2Ec+rYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a8pXa9NjEx9NQ/UAZAfVgt42LplORXaYyGyB/rJCfB0Lm4Psbmc1pcOUHjwOnRF7d
	 GEg5NlA5BGM/WsTZZdqoyg2a/wPQkspqE8g1fRMtGD9zbabrEHzFAv9Hwnelx1zYsl
	 hoxYWeYg5/x/whFzryOTt86Bz4uIyhJcArYfdaHg/AZuoFQvW5XBRbFdwSEKwG/igb
	 gmY1DjUP9V0DbMtMWS8YkKlOEvxukraKf+/7QxUSJfIWUQK/rYHtJWWe/eAcqGj8Ou
	 hvBcvD8MvGmVBFAA62UuwzZoyO9MBuUFmonrilpHq9DR10KWMn7pQmDId7LIGndM35
	 ryUMk34EJmVMA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c102ad8420so1068394e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE9LenDZLUZL21aIRRjzJsEW5L3lvwY6Rfo9AlEUyESULVzSksgzvl17vZC1DBIYCDd4nBmsob6LqNsa7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qZD4OVpeon6WQLZm5t2chTwSskhQSjLwW5sIdnnSTC+wgoLTQ
	kuc5VazRklzPIfzfMxmJIxPJnShFT0GW7DPkwRI+Hw+Qr9D17edbmLUpVwtqoBTLyypoxKHKbmS
	SmfCqfBTfCdisyY6C46lReq5AIPz+Guw=
X-Received: by 2002:a05:6512:31c3:b0:5bf:dc95:3817 with SMTP id
 2adb3069b0e04-5c1bc7bcbe9mr2121267e87.15.1795293733675; Sat, 21 Nov 2026
 12:42:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-6-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-6-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:42:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=u2okiCU12RV+nC0NLJEMg49CkhtPKOguapwXBpN9OVA@mail.gmail.com>
X-Gm-Features: Aa3M54q5oFmXwdWSrTxDLECj9BANyp03LDdetIui07Q3S7mayCU0UCP9cIWP9Xk
Message-ID: <CAD++jL=u2okiCU12RV+nC0NLJEMg49CkhtPKOguapwXBpN9OVA@mail.gmail.com>
Subject: Re: [PATCH 5/5] Input: ads7846 - fix minor coding style issues
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

> Fix minor checkpatch warnings and checks across the ads7846 driver,
> cleaning up types, spacing, permissions, and macro formatting.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
