Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371952;
	b=cS07S8NrrusiHZ0/sS52BD9ZiGYr7AhrhAa+U42XfSPc+hH8/N3l9k08Th9FIt4v9WL1
	 pW+lJugdzm6+um5qnQD2j9BJfYYaRWDiiMcdSVONyk/9inCnBfyz57XkRox74X1o5PJra
	 xeyyGxsONDNVQavPqXCMV1/O0G9ICO9+zZQhhNkSGjB+2konzKkldV54467vLNaBKW/8U
	 CvEO7NlYqI6YfphAoFNbGaZnmtBG5uk5OH+NEBai74kHuytsy8VCjFV6Z/XGc/YEeOoYW
	 kmmf0xSrF2YfdkNA2U00pBxWHR2wWP8t/q2plQHdyuMz1BIj4wY6gsFd4VM9IXjrDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371952;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	b=a+RiwLl5tEJYAG0d+Ca3LPZP94VNtxqa2B3hmFEHax6a2lumyoTsGzyuChRVsFiRWDQf
	 V2Dz9lW0HIFDYO6E5a2h0VGUD3SnGZZu5qmZT7qWqnDf2QwYTFNOFsp2LYXFEcqm1mlBG
	 o3Rvmcdu1Cse6HKNZrOgRYNamb9RchTSHY1owDbyDVcYqjnDiCdXqYW3FDMPESJtOyq6A
	 PAgNx+Hv9wyFmllmBUUP2sgaxRXB7Ab0YfyQ+hXA8OpaKIY/D07bX/KAvfMsvAx/SvqP2
	 Orse/KDL09LYPArux8pScpol6Jm51XkYnfAh7BSxWQnXdOMJMOpTMmIO9USTJ58MofQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LGc/9FGB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB38606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGc/9FGB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFD61F000D4
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371951;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LGc/9FGBPBQZUvNmnpW9aoAV8DRN4f++L4BqYc5ofUu3imrsycqXZMRcVEBlOftP4
	 vqUSv2ddiGT8RF7fySiPJY4OCXr+N9UBJewMpLaZV5PW/2ggNoZZFKTFBjOTYnyc7D
	 79wisqxD9VZDky1SD0clVI6y5/AKpoUdxmnLf4iXtYiyRraYk8SLRMeqRC1C15AJVs
	 5Z6mvSNeDKCG3CdgJt7EnNrcGIaG5B5PNHiDeR/dULP6ZZ2SypagrvzPfAq0QfmVqy
	 mRjtpd8gKMvNXE4FMqpuahcZlvUqm9DGbYBFVGmqKSasaJSjjMyFMHHe1TGuiDCKU3
	 xZXITtGy+mlxQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14a204305so1634366e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFOrvw7h5y+aSEXoa3iqof0An8JA9Mme/IniBNe6+7FIdhWB4qyKhuYL0mCgJ3O9eftA/vi+SdH23AYGdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qA3fFLfG14rjwtyCIxjJ0J/aBqWPd+8wbJBBKU4OBaiGYBxBL
	rldBye7jTXAgErY95EE8MyGNkbXMKU4LMwfAj93xTB8ZQU78nI26k2Vln6TiB2xvEo+0k5hKKgJ
	iwTy8cqxCkAYEyUE7voq9H7db+hZOnlE=
X-Received: by 2002:a05:6512:6d2:b0:5c0:d9e2:f66 with SMTP id
 2adb3069b0e04-5c1bc7b4301mr2437293e87.20.1795371950328; Sun, 22 Nov 2026
 10:25:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com> <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
X-Gm-Features: Aa3M54rbItLFWFNiExC6gKouuAtPmZpVlhpXK-hpWeRjgFU7aqgZIJC1n_xCbCk
Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 4:09=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
