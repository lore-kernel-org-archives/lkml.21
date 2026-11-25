Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631328;
	b=OWwNK6+4Jl3yYAcDMBCJ3m2HxaCN+fCuIB0UxdU9NTPrlTs5vGFbXHepziMIcmIZ+yJr
	 r33Ml1p1sPyD2lvPF/+/+0yDXUeBk1rH9+Dg8UtmC3zLoammT0cjsBwkIm2Gzb47U5cH9
	 F3dAQT+mK0ctfBMWdrXhjb2PnJSZo23nm+73eAp97usyB2u9qE5MlnQik8Imyku9q0BMs
	 mHxIQWZGnz8rJVIgum85qA4ZNliTpCsBIwm/0ADKA88rsy5Plsxx0OZQjwxQBYWSV7PeV
	 Ya4/W5K2LM21nq9CCYw9evrHIqVC1bH8TPWwJD1roLLU6U5Hzy32EV6XP1XpOwLskIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631328;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s89ULcfJlcdzCl5MhVyPCLu49hljGSQBZ02EqlEm4lQ=;
	b=I+dRqgEgvWzvZ7p3CJViQPp7nsVSvrQD2MeUeHlaU/vYA9Dq/s1A8IpPeAO+dRyDYDFp
	 LGcgc6UeBQOfaxPg1h2ufrSvCGt9a2/M9uQZNNyUk/5ZvnlKQ2CPfvfWxKiy/kinzyy1K
	 kp4mo09wojBxJnZfgrYajNp54V9CUll1lerk814fTT6pzps4RSkS+Uax6wBb7lGXPfnEW
	 aOkWT3WIq+9c2r59eiUEEkoa/gsGrwdN4/q+nq5zN9dSOx2g46XjfaC4xLzYQ6+dmy7Ng
	 0oSOGUfO5M43UQWzMPUaWwlZ3gc00t6BFXIWorQYja5xFwcTDnyFvgwhwSAK1sWyczw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z09Id4Z8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2402C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z09Id4Z8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B521F000D1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631328;
	bh=s89ULcfJlcdzCl5MhVyPCLu49hljGSQBZ02EqlEm4lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z09Id4Z8vbGXWMkS1WR7gKdR39oEkIz1JoFK6v2fcJ3HDWZQEH5Wg2j4BlMbe5Tiw
	 Op07GQ7ZOBQPpPQ33dWnYZbQlClfUZwMO0/aaeAbFHLbf2VuNc/CGRuOxL1ldqWzpj
	 99zYPOLVb2nNRTZejieDWlitrmHVwPhj8LRvDufiId/Sh/nJe7+/4//2GKErIvO2YK
	 MEfTnlSx07Bzs1TEaYccXsWLnUbFHIHvis66TU2ZakXfOkROUwV11u3zZPDyeqv6U9
	 dqbIX3OHFGaCGCsAYinLTu5QObKclEib2rFg46AGmWpBgO5YmZfUL2Q7K9SxTy1YxL
	 TFYxMI+cYPOQw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso521744e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFVYUEPTpVEF8xA0Q62u2Dp5L0epPs4D2gjCNli0Q4K8WIUHMNX7p/HBzbk0XnzLDD/EUU+EMpXxqDhmR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/8gVr4S5Xpctv5PjL1da86HQWgNZKQTJsVRYR/V3jd7J575MN
	rnDoWSQkP1xJ9g4IrpLxjg4PrSL/h72MTZU1ccHIVGyuzTknXLym3m6Hk4HQN1p7lh3q2OVjxoI
	c+h9/QxoqyUy3WR4fAUK/V1X/iZ+ECEE=
X-Received: by 2002:a05:6512:a85:b0:5b7:f75a:ea68 with SMTP id
 2adb3069b0e04-5c1bc7df486mr4990618e87.35.1795631326771; Wed, 25 Nov 2026
 10:28:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124094059.3882014-1-john@phrozen.org>
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:28:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
X-Gm-Features: Aa3M54q4ONvPZcrPiz4EM8PUlUrVb5r4XA_5oO6TkamikfKXWeoyqqveph49Ceg
Message-ID: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	devicetree@vger.kernel.org, lei.dong@airoha.com, Linqi.zhang@airoha.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rajeev.kumar@airoha.com, 
	upstream@airoha.com, Weifeng.xu@airoha.com, zhengping.zhang@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:41=E2=80=AFAM John Crispin <john@phrozen.org> wr=
ote:

> Patch 5 adds the IOMUX to the syscon compatibles. Patch 6 adds the
> binding for the pin controller. Patch 7 adds the binding for the GPIO
> system controller it sits under, which also holds the PWM controller.
> Patch 8 moves the GPIO register offsets to the common header, so the
> AN7589 data can describe its own register table, with no functional
> change. Patch 9 adds the AN7589 pin data.
(...)
> - Split the bindings in three: the syscon compatible (patch 5), the
>   pin controller (patch 6) and the GPIO system controller (patch 7)
>   (Lee, Conor).

Once Lee merges patch 5 with the syscon bindings I can merge
the rest to the pinctrl tree.

Yours,
Linus Walleij
