Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118010;
	b=P15cQW6otwHv07Nr9eR+BtEOAkPM0qd0NwqmUkY38VyttmSYjnMW9Ljlclv/mpov1C9G
	 4A66vTPpEfN2CteNPoWm8Hi4+IWb4B8h+MX4FWfAtNLUtUyMGKb5oRRSrwWVZOK0tyWi5
	 RPjNbNtvWNrhapyMAs1uC0U7Y6auT6GpERNP4fekNrOw1U0LH8hk13BSn4HdF5y6L558N
	 EyAJ0MlKrKc7a8lOV68Fnbt9NqnevUpIVj42uEcBRwk2O8+fnmUU8VpewSkevdVnuxitS
	 cbck5eGcQoTEbxYKxz1gAG2D5mXJxDkV8CNpdP/2kMgQENZLDmEdeDYJx2fUE4+YTvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118010;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=pQDnLm0FK9Jvhj7aq4owvaesn+IKHrmfTxnaUHYSxz0=;
	b=SyNSocf++TUvgDEwi0FhT2UW+M1dj2UJjufWqnKbQ8aolBs4Z+zGWMFY+YKbUMT4lI1h
	 nufMp+jeoldGPfwEk64P+a626TQJmerCRgFV71Kf+7+jYnHBIB1MvaoVJ+brtJ8VLSThB
	 2uga6hlLQQcPvmotZBXOShAh4jVqlGiN8TgFDXlrgKLGZ8aW3UCiPx/5ygBAEn0PT9Lqp
	 qDICZIeLKrniR7P3AhHs1nNdztfyhB+IvsfG0PF5nkyC2kafT36tpPRZTC88GctEgCHRd
	 y4fG2SvUS4Cj4GSRyyDxvgIZlkOKtexQ9zExILYohZ69ZdInlAQC2msdVUl2sg1RndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPna7ikH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E7606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPna7ikH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20711F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118009;
	bh=pQDnLm0FK9Jvhj7aq4owvaesn+IKHrmfTxnaUHYSxz0=;
	h=From:Date:Subject:To:Cc;
	b=lPna7ikHz8R9uH/ITlieIGBW8nsK/6/2s4pl3WUEWq8FE0ZQZ2C3+vimc3xUCd4SU
	 fR7FDoPMN8BFb+lBt2R+eKiFBzULfiJ2nWuKTqu/esuOnH0WgC/8DaJwoKv6exVQzS
	 PBcaEv6qPq3PYGnJvW4FHSOliYZoCYAk4cyrAMwBwkNyhV9LvkSX+yMXs/jjSlSb4g
	 HQFJ1HAgeYmXsHB0KkshBG7Mcp5GPTtg8QNJt0CndkcY3Q+IWrMBXqa/iqrR5f/WnR
	 EQCco/y1nDSGKYL0R5d4+MsI8JB51MD8B70q+Y91pAh+s2MXgTNY6ysB9p7h0DZ6Xo
	 t327Uoqmy5DQg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso28835e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:53:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcv7IMFxweDYdXCX68OSpcHKGWruVCVSR+BYnXDmdbXtgbzbyW8OEm0YoUpHlmrgSmdKJMPuUxrKiv4tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VVQfO89eLtJiyJWtjjpHA7dkZQ3007xsbzJrEQ9+xJcWvXgmK
	rBNlyGerFE1Cev7/rABMcXnFnf4PMxjBVFdpGw0yXj3bYhOcF9mboxzVAUlDFs37u1XQWceU+/9
	5bqN6UfOpbZuE9YTYmqCnipGtCgWYynw=
X-Received: by 2002:a05:6512:3d29:b0:5c1:47d6:8258 with SMTP id
 2adb3069b0e04-5c1bc80120bmr201929e87.41.1795118008368; Thu, 19 Nov 2026
 11:53:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 19 Nov 2026 20:53:16 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iug8To5GYw_S_1=t+LAO6+tqYG0To7f1RtuONLiv9ehQ@mail.gmail.com>
X-Gm-Features: AclHuK9yuJhXQvYWr9sAG943Uq1MBovF9U6BwVzMr-CX2J2FeddBtM4pWlZJSH0
Message-ID: <CAJZ5v0iug8To5GYw_S_1=t+LAO6+tqYG0To7f1RtuONLiv9ehQ@mail.gmail.com>
Subject: [GIT PULL] Thermal control fix for 7.4-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 thermal-7.4-rc4

with top-most commit 22139b5a46353184f43d120b569b01447843d363

 thermal: int340x: processor_thermal: Fix Nova Lake-S PCI device ID

on top of commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

 Linux 7.4-rc2

to receive a thermal control fix for 7.4-rc4.

This fixes the Nova Lake-S PCI device ID in the int340x thermal
driver (Sankara Tankala).

Thanks!


---------------

Sankara Tankala (1):
      thermal: int340x: processor_thermal: Fix Nova Lake-S PCI device ID

---------------

 drivers/thermal/intel/int340x_thermal/processor_thermal_device.h   | 3 +--
 .../thermal/intel/int340x_thermal/processor_thermal_device_pci.c   | 7 +------
 drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c     | 3 +--
 3 files changed, 3 insertions(+), 10 deletions(-)
