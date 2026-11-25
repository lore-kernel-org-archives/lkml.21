Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630437;
	b=OG8qKiP7CuackLHHl0pGFIyeyhYgG7ouCvIcp6R1c7b0ODKz4C9w4r/aVRqACg58N6jg
	 Gh17FEGe7y/RUtGerWWfE2qWZyaa7YYL2DpinBBV5n6htnXyfCTTyex30/+8UUR1U8qYs
	 V+gJ1FGJbgg9Ei9+NdfkXHbig+Axd7ufvwtXOtKN0dkVb1wgsMLDSD4JUZzyLchmL0nIE
	 05HHtqaTW6hPNLneAnOcNLjar9/a5EYQKZcGQYh/jf5SExbjPvkWhlX5bEJUu7qlLCI0C
	 9yVRSkMQG9/uqlJ8UU7Tmdma0W3o4HM1GbPltmX7YsLKi/Vj4LjH5+4sWBQMcl1+Xcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630437;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UQyjdIZXnyN7pbRcpgqMvYP2FTIzZjKLrH9OPluFP54=;
	b=nYLIY9ohH2LOjIq2Wl477CJQBOm5zswV3unS6T3vzeewuXyo4NfqrBrd5/ncU0KDA9Br
	 jGoyzOR1hj89lMmu4ZV0dc/EjSzd0TTFf3aH/9aoO6dAJ+Pc0ptvXU4V4XCiYkSLCtNWE
	 wL8GemOPs+3g7RwZdvLOYNa2Wa2ay+EmFf8tIASIWg4kPaCuWUN5G8B26RfGNJm+PJvpi
	 oPKH9acX6LoLhaXxRB7gvk0s9iYJFIFyOEBovyrAyxLCOS90Sb0xx/60f/Z7tMHUiT5OC
	 4vRZCH0tN1p09VRjCLPIS3Gy/Ca76XndD3RJi1A/fJ0EYOM2BKrj4ILNh4WcuxdrSxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iz93ajdg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BCE606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iz93ajdg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5256C1F000E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630436;
	bh=UQyjdIZXnyN7pbRcpgqMvYP2FTIzZjKLrH9OPluFP54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Iz93ajdg1Nd8CJzVL1szboFhLn8kqrwe/ZCcJh0uQLv97qGaDfCqudOjhaTObJBfO
	 BXliTF/2V/TQYgVUCimigeZEPsiVStwzRW9nTEorwDTwgV+1TdSU3Sj3OJotAvi4f3
	 pboPW9r1qTUv2Kmgl/FZmcBd+gHS2PVVDPbSGlTWWJHmygCPpZDJlJj7NFMQnsgMJF
	 uTzw/hoQUm28x9z/+JEJKdADDjK/nyr/I20r5dNvMXoagOwwilIjGY207fwZ1PpqQN
	 43F5dyWPzJx37IRk/janFiAMuKhnZYrpEgdmaGC5zeyma92Y8ooRZcnw47XBw3qZGa
	 4/qGZJmZB82tA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso7511924e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFyf1GyBrIRK6VyIggm8PHmr3pr52gGJ8cIqTzT1xpUAW5EH1PDEBbv4OFb5jmkkLl49wCQ/qgQolMQyws=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K2Vu4uXSTe1A00ZE94jL9AkrB7PAbLcoWSrEaInoCtNDzj3kN
	2yY4gKuZ/r+MutT5hp5C4dkUw+YXX2MEiJKO1sOp4VKfSak4LM1TW3tlsnV3dIjurQmaz8sF8II
	ZDFZwUMmxDUo+jbL2kP29CJt64rnuRZ8=
X-Received: by 2002:a05:6512:2313:b0:5c1:5457:a147 with SMTP id
 2adb3069b0e04-5c1b7c5f28fmr4759565e87.32.1795630435118; Wed, 25 Nov 2026
 10:13:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:13:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLmnHp-TVDj4-CKqH-020GkmRZmgVx5-u=Uem8c0_NhTBQ@mail.gmail.com>
X-Gm-Features: Aa3M54qKCffdcCQPk9s4DaSpiTPHhKFZVElFuVJfZUz3prnPo1qEkIVkhJwQfoU
Message-ID: <CAD++jLmnHp-TVDj4-CKqH-020GkmRZmgVx5-u=Uem8c0_NhTBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:16=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=3D1:
>
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
>
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg =3D <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
>
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno So=
C")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
