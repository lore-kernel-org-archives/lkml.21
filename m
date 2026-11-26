Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699119;
	b=PzkcVdaVi0g1dK6+zWJUELbveo026iqUS3aAx2ns/jNbcJY07Q52mKYY++JW/7u44kZt
	 hzsT+AQgrz2Q0F7cv5Kn76AAEiOsUEM3v96jsiBZa6joJCX5wuzmS9Xiay1OoKX4T4pJk
	 65/5EIs7z50hX4s9qxlgetKI3QrMZ0B6rweIp7zo1pYg25PlDNynpccgc2uHgOds6D2oj
	 OJSEdpzaa40IjhoaSrSuetbOJe1fIE9JHbZ75OosqmfE3tt3ErXjNFYM7Xj+tabdg54Lo
	 AYHGR7iw/kbR5ysjk8bhM/nosZbZaVmRCymdYpv1EAQ7uf6llfwDYuUnjwGpPEcP8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=8lzx438I9zhWgrnJA+oH7tC0er2jtBCrxj4IPB3U0cU=;
	b=4fQJvlTQS+S8xVXBwjzQR25p/9lNV5CBfKpAa5dJAf71WFWMDT9emsPAeEnquVjG5u0g
	 Hz6Gw7FbfrCzmBlp/zweqm3mC9c7mtCJ2Zd3I0QGEVD1m7Ikpr/H7DM/IjZce4aOUJpuR
	 T16cGrXi1nRBCn/gt1WbfcUEEmaJ3TpcQTil3+ajwFmpCD7RHrEX7sQQUYYEmWmEsXqr6
	 y/PH4Zy/DdhYke67FfGnNMeewNkP3QpFVNbNJAR+JEPHzYiYpbqYoZES75OJdpiVdSYdM
	 0xEtVPvvhWCqZve3eZrz91Fa9SFX6F9Vt63IHV14JjunBQoOKMpOzblWf0t/KI9A5Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72128606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72128606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04e3bf46dso51710685ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699119; x=1796303919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lzx438I9zhWgrnJA+oH7tC0er2jtBCrxj4IPB3U0cU=;
        b=2plY3GEJj12/rlpFChnomEFDDrXv39AE6inLrrCRYwvwK2gTtX0B9rjhtqGx1l5Aol
         vmqsdl2twybHOWI9hP29u4VhJIOfXyfXjchp/u0PlorjAhLNTu1bHmGsCyReIZEfMe6H
         VYcdRfaYv/eK22uOXVK+KfnwMDb2vOfFl7iCsuRzcNB87C6HQ8qnu4pyo9vanZXIfqqZ
         qznqJ4BxmQ2LgkJxVxrR8ID/meF+YwG4vLWafIVYHNYxQ8YOtMDzVDkOxO8C1Y/VsoRU
         t78AkpX3zz2cfwQJzmZgqQbuGODkFTXqSog1UzVXDeaQn9E1BSTq/VSLhvxTHb7n14Ch
         j3GA==
X-Forwarded-Encrypted: i=1; AL+hErEIqkl/abZSuBNzpYZeDRq4LT5IedofrG550D+Q+O+lowvt7EYVj7Wfu4oPUHvXqihpk9IWLY8O8ByohZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vMtyKkB8j04poYQK8UXcmKuafatEfnfsMDd5CdNayGW4YNoX7
	olsNA5iuGrXXnj2YS1wC6JiWPKmgZZ/RQUC5Q9Ch+Wsn4SWC7bSLX7d6LKs++TZH
X-Gm-Gg: AZFdTZcR+JV+cAsm6ZqU494iISHrGLXQIyPMvHTuXee89giusbjDSOl4wF5ODK77ZTm
	ZOZNLBVG+Y6QC537u/CG+8ArMDkzg8HUUG2ZZ/PhUdehlttaMPV58MQ3mJxozcfl4YRB+vveoDB
	4ByRjSu+sYUJh/9PGQr5TMZ3sLqmyb4BRy7LTcf6h+R0yUhMk/324H2rfK5ahX8A7MUrabaPHXW
	gHuX2kqwHpHCl+JR2q3mLtCNt32vU7uOqRDpKiwOb+O9Ac5VApzLohHSTftqDArs6mg7N8vxVLQ
	G9pVlX8eTgqDEMPM8pus87DmbvwlFNTc+sK3vSDQ0B477LJQRT+DJ56UDLsUIKPgbt9oa6naIz3
	eGS/9WfWSNfZ9wNdghkpt/pl0HLQQ67C6NDa5Jzja5JLycpg1AUsjaGqh213AsB/JlI1jVAnOO6
	+0ti/n7myGtUbfhhwrxDUFJp9+bWZPi0PDp0WFhLht304HJXg8QsFhAvyACx4LgtjWptTyB7+Xz
	os8bdC5pcOPRktI35Ncfo948BS7zE61disTOmjJJCc+IqLfZ5SYRJDCeebCuLFXcHmJ9lwJnnEI
	1EuVVyBxU8qBjSg+zy8NK+3aU/0fc/eKZsXdbGw1vbdnU3uO6vaaFp5y/4UQ9f7MEQ==
X-Received: by 2002:a17:902:e80b:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2f03f2689eemr217465005ad.58.1795699118780;
        Thu, 26 Nov 2026 05:18:38 -0800 (PST)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm103576835ad.53.2026.11.26.05.18.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:18:38 -0800 (PST)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6625149c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:18:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnb3g35sEClVqnLYITtcjmKZc9grN+l3DV0c6a8qRA07VlyK5oNHpIOf2q3Zqc1hOI8S2IRbxO5LoGIkM=@vger.kernel.org
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id
 71dfb90a1353d-5ee8af79c4emr10201505e0c.23.1795698643771; Thu, 26 Nov 2026
 05:10:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-18-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-18-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:10:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
X-Gm-Features: Aa3M54pKW-6JgYTYZWdXwvcVTMAw8E4E5W6RppZyD7aVJ1bsffJTTTgDbIyWkEQ
Message-ID: <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] arm64: dts: renesas: r8a779h0: Describe the PCIe
 AER interrupt
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controller reports Root Port AER notifications through SPI 454,
> separately from the integrated MSI receiver interrupt. Describe this
> interrupt with the "aer" name so the controller driver can use it for
> Root Port error reporting.
>
> Append the new interrupt to preserve the existing interrupt indices.
>
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
