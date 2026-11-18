Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025940;
	b=AqkiRPj9gNZZl1Wd5p7OgG7sDZU6qgpK4X/PtJ6RcUfYiNq8XY7wMiOsL2K+ljne3Vzf
	 XNltPE4iNeTcL82WE0DiQhmT5tzBxmFBXy6de56mwyjF1HQlx0kQloFxz32kQuN5xhCp8
	 bzVAxpVZnOef3hLo3+d0Hn8WnnIjeZ4nQiT/jPL1Adb2fNqfs+iupUxV8c/SeGnV0xmgC
	 UCWcajfCgniVC/qW14aqC9QGhkWsjaKXJ3iLPN3FM4QrPXlTyfqvPSRbBORcyb9YroAb2
	 AiJzLQJbhbmlkF/WB4tR908OR55HA3eaw+PEB34Shh8lT1nNbvZEJNXmErM9eo3bT9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025940;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=;
	b=0r1GKAkcXeMxichfB9Xj72Q6pHqHvrUxNSAg9qYnDfggPxmNhZgIZ1EHIXlgoa0JsWgE
	 c5w6WClLok7Hk12ZlP3xJ+Dx8UcHAqlvqnnI0jBxon/ORJJbeEtBRf4SQCOaqmUEQTJjt
	 /1A+YtcUUhvKniOd55y+aK3JEeO9PYqDYTANDLUIk2UlimhtWYf2w1dOXQNf9tiz5I4fD
	 8LE65A7d0NOFn5wFidoCTbHmeAwWzP1JoqXzZyqcmT2tXHuopDiJU79h1X076yAOpc6rp
	 m1V3EFFW/QmvHlHzfoQNXfISJePvNsK4MaX3Kw3JsVcwHSibwBVuD5dhst4f/t2WDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjJ9tHlI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46045606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjJ9tHlI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E3A1F000CB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025939;
	bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fjJ9tHlITqozv2A92bNFUGPP3O63gD73RHRUV66TQHLqaE4cc6+TzRhFOqy9gzhem
	 GTHREosT5FaTm2Pjdg+AjYNxu5//4SEZfEhEHhiozX8SZeWZ/8dEtGFuYPFxYwM4gK
	 etPTTSZracOXrm1gcffhReZFmNPHRh3Hm7sBQgaV8+PuzeQ/1B/K/+OagIpFMxgsFY
	 jkFkF/peQjEbokh2deNwGkjXqHFoWqnVcoWlqBfshEuyRIR2UswgkPTtiN2rgj3CcH
	 snSBneN/QS5am26e2yW9pua73F29jEy+Csb7B9imBfYjzayRVV3WVJ7VRlyQkE0aLl
	 GLz3xpVN2IP9Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab46699a09so12791901fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQ3pJQhqjTFfMziBjlAvA8w9iAAs8Con6udm9dBEB36v9NJrlYqPNaZbOOPPP2l4BR9rAM1xG/a3RmPc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xg7kEej5TYsbXlZSjkih/WfcS+ga+7JcqAkKrdRop+vseCzLJ
	W3xs5mo6Hi3K5uQGo/n7DfrfmpA14xBTpn0nC08vG4T+VoZix+kmXAzJHahgYKNMMDbPH1NchvP
	Kuyrs16j3jvIGgYf/BQGDXOibNdmQ6eA=
X-Received: by 2002:a05:6512:401a:b0:5bf:d54c:1fb1 with SMTP id
 2adb3069b0e04-5c1a9b709a1mr1153837e87.2.1795025938593; Wed, 18 Nov 2026
 10:18:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
In-Reply-To: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 19:18:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
X-Gm-Features: Aa3M54oSzmSzW6vVL6kt_cC3y7y55k_eM3IqSPDViqpXGwp_Vn4eEmeBhlms50g
Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:09=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Allow function nodes without child groups during device tree
> parsing instead of returning an error.
>
> Only count and parse nodes with the "func-" prefix as pinctrl
> functions, ignoring other non-GPIO child nodes.
>
> This allows the driver to support function nodes without
> groups and avoid treating unrelated device tree nodes as
> pinctrl functions.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Add debugging information for error dts and Error pinctrl config not affe=
ct normal pin work.
> ---
> Changes in v2:

Dropped v1 and applied this instead.

Yours,
Linus Walleij
