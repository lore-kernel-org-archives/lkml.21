Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452874;
	b=lmNmCUJwvi0kJZhjkjo20Er9wsnGmHiDuswQDeoXmgnpFTRpugfSbzo+V+ITbxpaJWRL
	 wIftM1qfV8zHbG8wGqyR3L4A7ovGufuFpNURgOd/XBk9BecIGoBRy1TyD/6hsIWncgi1y
	 nMFIrrz/ZYZ6vMz7kNTpHDtQ3Z43CRbJHRPSMAr/x3CK3WYcKwdwaEDKFO+w8pebf9fAz
	 36cp2YqpJjayWt79FlgqTZcRYeANbrh3urrpRHxhi8P/dJFzJRqUrp49GTHbR4M5RY1HJ
	 4/2sInQBeUmbglhPdRPyBk898Kz6s70mnTLxeQCAG4Bi6KRqsVrcJo1iaC0sCy/slMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
	b=dRIIGDr3MFVm+jFeoTLe145I75dIgyhuOYFgevb8/Cxg3Kwt1FsF08GdwtDrpG2ksKtn
	 RU6Q4LB9/HxpU5nn3q2/Oql23jGk1zBu7znUgEGErinr6TcECepYrASvuARlYoDIX9bMd
	 0I4IDWkF8k8y7UFXrFQGAgvavHswldYcfrXXu+ce9na6jKqbf27rRsW0paRpeFD5OGkwu
	 G+k5asavviPbiRiwSYt15Vg2mVTxZ1ETzoz8s4uf1hsy5ybV1g1UTkNqANJcGVxsyNEKj
	 empHwhTGXOLfnZaaOetyRi95lLhAdY8cKjCGi3vB00fN0xBcdqvskuLB/QA6Xi2XB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aXPKM/S3";
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPKM/S3
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so1173713e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452873; x=1796057673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=aXPKM/S38flefNKGTptTtuMYnOiOkoGm8ZN9Rnhdn+Jyb3d7ciCDFkndBnvC++NWOn
         bYVaVcJgFBsk4PhWaHrcqSWr8C33Kel8/7Mm+RETdPhFFiV4KoDvcDPqXS4L1HwgIb1t
         WFtTepftqNcFksNx94VMDKEawcymO5Vw9sqqb8ea6NaWYZAz+gd6YVbLmpWr9YO6VwXR
         zrVZp9F9ktbVND5CLgwDRAjXd/w5YYZOCWqR1dQhns72ssJgGD6E8+xWzv4J6DrMP121
         0UnO7Sc6HatDBP2HQmNU/NM3WGO18QcQKYDHC68ALxnAmYzzD+zI+RYRcaOEk+gWQnNV
         KkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452873; x=1796057673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=cwplTef1HZC2JcL6DUeaEc9b+3aAbsmdJdLoWKlxGscXwbNs/tfsFxJxeBrC3Sjeyi
         uIvKqH2JMi2hA3/MqzUSBmVk82Ns87C77U4cELIX8MnVlEu4Cy/uXbO7NSDmlhxCzwgd
         DGxF3snS0ijxNl/0mo0fx4EejgCLf2DA8I4VFYJx5kzddU9C0219EYJuVVNkDTSmEfgO
         pvWLGKRloF3Ho2OmVl7dP3mwwsg/+YA0r7Ggo44nd0yY/yLm3NrZfPl1dOb06xKTK67E
         SVnxsJ/ZYasQZbhLaZEcFlMSK/I3jA0nBxextXt+eISdMkw77vls1wbeYKOHkLwYznJC
         ZuLQ==
X-Forwarded-Encrypted: i=1; AL+hErGSCNLTX7HxNELK/jSknSBlfwy+9D0dtg93xWrUSo6n2cHGgv2lv4XURCwridzXBssseNdg785lDXNVA7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dSPQQPYT6H6tQWDwSewycqw92rI1jXv8HYTuaws+XpoCb60te
	BEYId8QQmXN3/juC3tOJWnfZsT3QnCDAm6s/bqifqUzbdZ/z/kHBF1C9
X-Gm-Gg: AZFdTZenZl2gxxBKzhvZ8GtTkZrUoCYAfR8difG3Wi/QlbBioRsEP0VWRRWToNPzAdE
	MXCDJNSpfe6iTUjLnmhwt1brqr8uTl72LuTHvAIYw3+vRTQ1nCU4udTPlIAO4tca0+rNby8Xl9C
	oxE2jqUPXUGkPE1Ubn/b2cWKWlySL7X92YH9x9fqNNCFzJrCgewk5JlXRyF7PufV93RKZDSNdat
	ztLM/shN77VX8DJh36cD0J39NBUmVeF2bSeOp5cDGANefThB5XzPd5mBwMawjkzPzKm3iC9vDFm
	YDL8AqQ4I1kmp/TDolAxZhYynRHEHX4FuXsYqdnzEwsP4q4vxsQG9MV7WES7ZO+ABnOeOYOMZYG
	0muW8+S09gU9h4DoJmLSfXNW3OglPldfCuXTQo+Sia8KlSZQHLprZsWd0XdFqKMDLnTWa9Cx7r+
	nFgVsOVaVxpN0WdbaJVnSpzEZTUglx6Yk4lxYkuU2K4vTsgVvYRThG+REtM8NxH47R2eFUgDI3A
	63IM5aLqnHD6mpB3wGDoKa+cWAOnG75Ak3YX0J7OQ3HUwSXQbSBhmvt69c9Y7GrJbUxOJIjee+6
	azFpNIhPF5j0qMkTvAbmh1CjCNp+hy2BBJfzmmpO1i3GahsAQGDkW6IWdOWp2QTDqFFNdYNww/u
	NzFdgsCkxF0RWncVyH16mHcTA6JxF7Pc945FB
X-Received: by 2002:a05:6122:488e:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5ee8af3457cmr6237914e0c.15.1795452873322;
        Mon, 23 Nov 2026 08:54:33 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5a8fd3sm11386824e0c.8.2026.11.23.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:54:32 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 13:54:15 -0300
Message-ID: <20261123165415.69710-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com> <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 1:11 PM Andre Przywara <andre.przywara@arm.com> wrote:
> I wonder if this works anyway with using both the internal pull-down and
> potentially external pull-up resistors? As one would win over the other?
> Can you try how your board behaves with:
>          cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Tried it on my v1.11 and it doesn't work: card removal is detected, but
reinsertion isn't. PF6 stays low with the card in, in every attempt (two
DTBs), although it read high at boot with the card already in.

Neither one wins cleanly. The A733 datasheet gives PF6 a 15k typical
internal pull (9k to 21k), so with R59 (10k) the pull-down leaves it at
roughly 1.6 to 2.2 V, below the VIH minimum of 0.7*VCC (2.3 V). That's
my math, I didn't measure it.

I then tried GPIO_PULL_UP and GPIO_PULL_DISABLE. Both work: three
complete hotplug cycles each, plus booting without a card and inserting
it later. With no flag it also works, but only because U-Boot sets the
pull-up (sunxi_mmc.c requests the CD GPIO with GPIOD_PULL_UP in the
2026.01-rc1 tree I use). To check that Linux applies the flag itself, I
forced the pull register to pull-down in U-Boot before booti, and Linux
wrote pull-up back.

Could you try PULL_UP and PULL_DISABLE on your v1.10, card in and out?
"grep 'pin 166' /sys/kernel/debug/pinctrl/*/pinconf-pins" shows the bias
Linux applied. If PULL_UP works there too, one DT can carry it. If not,
I'd add a small v1.10 .dts that includes the v1.11 one.

Thanks,
Vinicius
