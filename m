Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632765;
	b=C8fQwSrPdxN0j4ApkrJBNEfL1jcmQ1HDJmEhBHUphK2Sms6zQJs7N7nSFuZHIFkMOMeA
	 dTA+7HteLyHWfHsdInxNyu4jccSQ5fuCsHMxJKOaDarpYXczUYyLAfLeI3Fp/RGy707CE
	 Yj7nt5RoS1RsFSAWK40WiibyBM7xgXGTWp8e8iVzY2E7uIzuksjzSJVJ50RxZt5oCccp0
	 aVoNUmi11P92uQywDFpwG3pG9qwqRXQ9tFZ6zENvoCc5zDDQgenXqKgRsWQFf2xw13KwZ
	 DNaz3K7wWEEIlyTvWh4mTOgfRtp3uJfHNMki8G/w2NkI7v4eQh95nS4nxb/roUDr8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632765;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Io0n1UM01FxM2YuoZdeUpAUXrSxW1m5V/EllWFPRYM=;
	b=Fdpegx/71ipekE+IlaT72Q3rO1uCjQQ9doxOz6FFZY5K0nY1mqK50VnumGrSQaowOk9P
	 8eS5WRqLFizctTROuaGPY1U5YEdK/GHRYOhyZr/ZpqhF316jhKrzSySYJUVrQfpD0zgAm
	 eY4l8W/Iht144wrsjUICqKX695OCvp/jZjORkdl1gsIcRlWHRsOK/c8O0jLkhlFMnpyw9
	 wQ31rdK0CyBuoc4sQBZKXPXJ9veznOXMLcVkr10xm/JMSjDM8UJdHh0SnWlhDWWxIagea
	 F17lMk103Ccl/Tbwo4xbw4qmmoWoK1Lhw26ySUON2Z8oTrb9OAOloZLuFJvCeYLAHCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNImb11Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNImb11Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597461F000F4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632765;
	bh=5Io0n1UM01FxM2YuoZdeUpAUXrSxW1m5V/EllWFPRYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SNImb11Qh/3b5Ium5CpmaPgPI2mW9SNS4hZxLcJW/z2GMrUd6mP3pUUEnfAj7GHUd
	 iEKYBQDo+EHJXn6ONIU7H5CYk8GyA93WA3xv6eZaqQcW3ut9KaZcFtERH9b8hZXOzw
	 A1SrKwbevpCWFx2RpXu0NBXb9oPM81Xw/FWdUuWMIovl4jBacH7Lot6mNzFF11nmL2
	 k+XF/A/e5PGs40zB8yCgiwH0l/vBXTrXvy4+TzibyY67iMJ39mn2wdkjbaINNfKhgj
	 RjxvhxhKiZxJjDRJKvpGDkukrpQopYqwZYoZqcw2b2iUn3Q4vThmcNHF3W8W8LdPVQ
	 ryCXAaaa8T7UQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so53487091fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:52:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHM9jLoAs/K6MAZhL4WQ4KFJytubrJ09EmRc7d9ADDfdFbNS53M8LQDxD9w1Ou0gOGDQS7PDfelS10XTSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Mxz12gQLCMkS9G/rjRpg71kaQR+dtCUJWZSw89O89isDN0bz
	0nMGuMtNpeipuohxTeKQbDLTdjlVTpqWIP9xXiEy56usgBkodfeHSBJsw0nc06HE9aD+k6U10o+
	0kzB1WBkgUzU/v9EwYq+97k7ER8jNZyQ=
X-Received: by 2002:a05:6512:1042:b0:5c1:4bd4:9913 with SMTP id
 2adb3069b0e04-5c1bc662a16mr6789010e87.5.1795632764129; Wed, 25 Nov 2026
 10:52:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:52:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
X-Gm-Features: Aa3M54q07dB3zIMCACk22nx6jx_t6LUDnGDJTlh69A3EwVTfFUig6AKIR2eUh48
Message-ID: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:


> Cl=C3=A9ment Le Goffic (10):
>       pinctrl: scmi: report an off setting as not set
>       pinctrl: scmi: refuse an inexact drive strength in milliamperes

I applied these two as fixes, waiting for someone else to pick
the firmware patches (or ACK them).

Yours,
Linus Walleij
