Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001885;
	b=Io26KDD9qgJvMcQrydfAB+JZR+b5qOnpSKZzOW5VHUYlktsiNpflSelDz1Yza3i4iBju
	 TTO7hjcisGD7Kct6LL7jfBu/XmD0ksLnX2XQ2YIfEwWxlgMUK9NnhJT04ZQyJ4BiTh+Hl
	 m8u4UlRr8FexujHnNoBUi6yrxkMkuRTEW2GSrj0jTZVVT3Q0lnG/zUu5xr3iDmcGCUNS6
	 pwZqcY+yUuqKqzvh70m6Xifexx/YXiEt+fXrje0y9u0C0pBOvolctwnbAK49dDQGlw61I
	 vLmlTQssWKi8Lz4kGZPtAK3eOySTPW8GbXGnuRq7P5rcBhZPKrikSuMH/NVDRujJZxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
	b=kmkdSxugi/03TLNwrelcagyI9gV1/0/+8YngLkDeFrw+55H7NuCB9jQg5tgExiyuk5pe
	 RAbs5hOTfOGituZyRWHtZ+oals1FYxrjt8tVm/pLLWlDR58+mcKZxVu/ELRt9L9GoSgks
	 OavWw5Drr60cl3JEJPwC7xlRoV1B/9XrtLCyyj4cWhucsvf4a9LmXCnpgGfK0+5316EAT
	 VlNYONXChLa8l5ruOONKmIdyXDzRHWFbn/TwloX2ElzNvhNAzHQGZ3tLfuOH7lZeQZt1o
	 Ug6SCTVq8X+V2C2QEVcxori8JjS+zYqRBBCjMC6cwpvQXFw+V3Agpgzp5xqqy9KL8CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8260A2612
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D8260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb2893531bso630101a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001884; x=1795606684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=v+7og4LCpbgt8zqV0qGj5L5k9LpgFcD0H0EJlsFDgNHGtKS0F9k3naOHe+9i/2bWeK
         fPnCiGrJ1oREJ2+h9P6ZKwmoSXSZwgkiENGzo78/EZxbAgOUuY7qaBdPUhqxxdZAdfMn
         PINW7m5SL8HOai4MWvu+6qrQ3a3gdYcAWvU+dqtYCKFjQTTY/LjyJEp9BT2ogV+kY6jV
         wQwSCQwUH1MCU09yI/qoVnTqk+MsQEBxxK++4yao1W4KqJSdklyQ1POSzEjEu3h4QkPN
         R0NvlLmgEt57FkDf2isa3IkqaEuFkxQCgoorgkuw6Irqm5R4d5NvSZmko/MjOATcgF/l
         X1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001884; x=1795606684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=p1cHdXw/wHCOggk+3pwMv46w4TB7FQBF32S6r1J2oYz0K9GnRMo3QXEaWurLERF4Nx
         fvmWfrlqp/UuWsEte+8ww6oK1yr6yqKxbnnDW4AAEwyYNsjFtXy5YxV7HfdcBodOKltQ
         KCDaPZbWFr45Z3wQ+BXz4lVzKnORLlI8XDBHVDuvtPo4sfhsbkbBoYqyt9/fGC+FY+oy
         YM++Tpe5iL0ZC0lOaDbdF66FIBcSYkP1w6QErReSpDIglekRWOTBiR9Iw8iLyzOGIvha
         KoMDTN5o4WoT1avqidMkMLh/mvKXtKVI70gTxwCVbfccHpTJpeQ7Btbg+gpZgqv0mhPS
         K2tA==
X-Forwarded-Encrypted: i=1; AL+hErG093Ze4y7iFz0Iha7Am/S3+4z0838yDOzhUD9HHoEMCsGvOdtocOCIISC8ECp1CBKb04BvJqEaRNZSDaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qL7kPtqwifvbrgEQFOMmM4hkzCDFfzDOez9AhU2zNsZWZmxPh
	C+I2mSv9SpB7J5OuDo+a4tCYEfJPhGBVHYNVXBCzaNu+y6URDoA8eGMB
X-Gm-Gg: AZFdTZc078a+Le21U83hOpENPEu4i276e1rpyCbs/sw3GiOmhWw92vy+ptZeoRCBYHg
	MG1BqQllDZap/zJXK8wijaHd+MVyePIsq8aeaPXE6ILsq7v7hyVL23GbPeCk27NcFJEk88mekMC
	lnkmg8bwDjDgMDtqitwXRKLOPWwH7Nh/E1BnKcfvjrS2UITNDNeQEq0LxW8CnB6AIRPw/xM+fPO
	T+jvqLBReEByILiTBZfHlV0gbn7BKGdqDLnu35TwlTnHhVdJ70J0+R+GYtxvsvM7GKjSenUVKu0
	qCUJEwjeaFduTTDkgGevktdyu+2Q6cDT5dhIKvkNN+23F+QirweujgdRj0VklRHq7ebLYAMLFtO
	LKzYQET342WgVJ6n9gOYRTEybcAoUrcDmJ5Mglpg8LmLWXphwblKQK4NQFMVozXH+WTmFspGmP2
	+bL3yeQFs05lDDG4DcJ16UGbdWWjt+9GzZE0F7bp9LbKQruiogQp7ny1OJ6XfVRELyxHNoXBvpD
	uKSl/1V39X5BnlLdGNz6QaBxeDDJdlaGb9r+buhbQZYfPgJu+FG/1YMW93IWq+n5ta6UQALjmup
	qiHhYMfxeF6n3KHsjUnKP5i4OIXSECs7GN+IO9e51NjZxqzLqpbaGNyuXxYMCMJFaNn4wOMMAWH
	IUo20pciBFCM=
X-Received: by 2002:a17:90b:5407:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b3d074d841mr2303560a91.15.1795001884103;
        Wed, 18 Nov 2026 03:38:04 -0800 (PST)
Received: from 1.tailnet.ftu ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8950084a91.4.2026.11.18.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:38:03 -0800 (PST)
From: =?UTF-8?q?Tr=E1=BA=A7n=20Trung=20Nh=C3=A2n?= <nhan.094.vn@gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
Date: Wed, 18 Nov 2026 18:37:19 +0700
Message-ID: <20261118113756.304373-1-nhan.094.vn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com> <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
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

Hi Peter,

On Wed, 18 Nov 2026 at 10:51, Peter Griffin <peter.griffin@linaro.org> wrote:
> Does the Samsung bootloader not pass a correctly populated memory node
> for the device? Or is this required because UniLoader doesn't pass
> along the memory node it received from the previous stage bootloader?

From what I can check here, it's a bit of both. S-Boot doesn't build
the memory node itself. It loads the DTB from the boot image it boots
(BOOT, or RECOVERY as in my test); it checks that a /memory node
exists, and only fills in the bank at 0x900000000
(reg = <0x9 0x0 0x80000000>) when it detects 6GB of DRAM. The other
three banks have to be in the DTB already. Samsung's own device tree
for this phone lists them and leaves the size of the fourth bank as 0
for S-Boot to fill in. From
arch/arm64/boot/dts/exynos/exynos8895-greatlte_common.dtsi in
Samsung's kernel source release for the Note8 (SM-N950F_PP_Opensource,
N950FXXSGDUG6, on opensource.samsung.com):

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x3C800000>;
	};

	memory@C0000000 {
		device_type = "memory";
		reg = <0x0 0xC0000000 0x40000000>;
	};

	memory@880000000 {
		device_type = "memory";
		reg = <0x00000008 0x80000000 0x80000000>;
	};

	memory@900000000 {
		device_type = "memory";
		reg = <0x00000009 0x00000000 0x0>;
	};

The DTB in the stock SM-N950N BOOT image (N950NKSU5DZE2) has the same
four nodes.

S-Boot does the same on SM-N950F: the device tree fixups in its
N950FXXSGDUG6 bootloader are the same code as in the SM-N950N
N950NKSU5DZE2 one. Every Exynos Note8 ships with 6GB of RAM, so the
fourth bank is always filled in and the DTS doesn't need to differ
between them.

uniLoader then doesn't pass that DTB on. It boots the kernel with the
DTB linked into it and only adds the initrd properties to /chosen, so
nothing S-Boot wrote reaches the kernel and the memory node has to be in
the DTS. dreamlte and starlte do the same for the same reason.

btw, the name's Nhân; Trần is the family name, and if the convention is
to write first name first, I'd be pleased to adjust!

Thanks,
Nhân
