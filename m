Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219043;
	b=qnohuKKBtZJp+FxDn8jRhGmt0O5mDo4RjkKDcOyadDBi/3HwmVz1nKK4mMM0BCaZhQQG
	 6Tc6IyrkGmxRK1uPED1U7jrIR86OaUXcvDbt0UXxutlIim9iIZPGn0yt12EaL/5WJxn9k
	 PQZ82T0UjEmyxocbXNLAKUziKURz0iN6R8JlPd1D9qHgvWay/4fQqKxlyfgomP4a1ZRJI
	 0QQooJDZfIvaieKxPlb+YOWSsZbVb3aFHTfx+aoHE/kNr1exicOhR+mjdRQm0E1ZBV3xb
	 DH0gJcJ3bZo5haSTR03o8kb+NDuRkpDs230L1os08SUFKXoeAAWm70HdyAUbr7pTd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X3mXOkI3k7kIPSGugcamISGGNj/Giv2jwZLbdDbAlpU=;
	b=CCz2JrofICpL/aMlffnlDfZtG4syarssy/Ai/G07sz79myZeyzEJxDXySgRaohdYU2Pf
	 wpVOXnyhCrXtRvuLKn0oaoAmPLxfPlPpG4+JIF7BRwmeEYLkKZc5ARcW9+3vMqGu0QvZF
	 5Rb78C0t1Jvo3jGiy65YEv/LSN5JhVf2OiWqQPwr5wvAj/XVmm5n043Gj8OqkpZ3R+tst
	 lNQKvEPzt2F+ap+9GkgiG9cjbWhdXiIp+1mjuxQw5Off+/TjORNpOB4WtAd5bh1kAOBEV
	 LOPnAAaADzfAjOoOI7yymAESB2o66l9IOaGAsJPqCC8kejkC/a1sN4U2j7GVXJxDLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPXSKvd3;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E7606A696
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D80E7606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPXSKvd3
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso1738436a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219035; x=1795823835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3mXOkI3k7kIPSGugcamISGGNj/Giv2jwZLbdDbAlpU=;
        b=nPXSKvd32puPmNXHYT8aQQ7Blbg0fhFbgg5i8Ksv0Oa6bBoAjlzOB3ZlwmRyOrmLyV
         XW0x/JKX68ubIULq35M2dLL0N+hsz51DO2XBd/4SL6HEDULkDJBGQKfawDS+dZ64CDgY
         +yd36+SytCOcajVrEae35Dqrlyt2MU8RVP6YppEYrL5W81v9MxMiD79xfoSITT+J2qWJ
         LqxZlumwUp2bJEXI+OD5judK39yrQ4lChkuwY6P0R/mOwpCrhS1gLPzK91dkoWuOB4gE
         YRd/DCcU1UU33db6BVW6S4/VktrDj/cyxMa6opdUOf3POojidtgCF8JBbFRTXgjS7aB5
         h6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219035; x=1795823835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3mXOkI3k7kIPSGugcamISGGNj/Giv2jwZLbdDbAlpU=;
        b=PEMtx8X2eDfyZLjgfFsPlsKgs52KAL3/TKfqucj+EeZRu7VYY8OrHwkQ14Y7Nhl2KD
         2PfKdS8UA7HYwLj1LwyWK2hsm1uoU0v1VXLg2vEovIhB6YOJaTWmn+yP11ofOa5ohvUY
         KPpMGitSJmc/3e8XEU3+l7ckWvzogrkxxnlUjSkqQXLGKqk663EXQfhygUbgiPWKJXWZ
         JvNk2O5vwHGJLOUi4/9tmmHiYc1jRGTTm0h1rLAkMtIImDUmmwKzHvhBW0DTTz1IqOJ8
         F8/hHLP+R7kK4I9PBNrdo//Y0kFGuWRA4q9C1uXTuzQjSuSzI+9qT3UmwjppvgOx/6zh
         EPAg==
X-Forwarded-Encrypted: i=1; AL+hErGykiaxAmLvvC1rSJ+ga+FC3LOMVqoNMvlPsmPl6FesWB43yNo4cBIogxBygksiUE2RONqF6aCtuPs4uI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JPWohdgw/QXpOekJMMcvRUzA6N6O9uOtdwJ72myidUrQJzGtL
	B22IfbQzyXxaDBfsHdj4VBpR2pEKWnowLFMVNSfi2V380OlS3Ew4xbc=
X-Gm-Gg: AZFdTZfsL+f++F3Jt8Eq3djNbQg835H8EqS4jgPNMtzJDO03deCeXZ0Cx3ZvXuw3rpN
	PH/OXx5FngHk8U0D9jnmZRUcvgA7indAKZCXPQsTV3NmR5e6HnIhQYLXRdMjWsaS1vQdilj681O
	Kr+SbOQ60B4G7cWQa8sOb01LTQULUzDbwDh0ca5n/v5KP3aECkZ2/VYG3ddBtxf0Vy18mtrK9p2
	hxy0DP+V5BFANWk9yqaAnS88q5BXTxzxiLaHFgx73/lWlA2oI7SPjKWufYlS2/RcDa9hNnA96So
	pRY63flNxDv+Lm+Yzh8rJhcsdBTlcRyFC/6ZfE/Gk6hDxfi007sOUGbQ+i/MOYfOch2Qf5oT3rp
	v2PjRlOtwjreebSw994Mf/MNjh/Zpki6Mbm4aB1pIlgxSK582VyBL5CcR6idVdSKMTHOcjYq0yE
	+yh3Xdf4LstnrKLWLOnJXuQ/kr9KM6yisEtyCM/zz+JVOWmiv7DBBmCeerVFjJWPKi863Kdpmeb
	XS3q38IEwG30lJYR0769YP8StTT2AeB7VRU9R9okbrJxp8OE56+fhrqoo+T3/BujeprE85dewBv
	U6XBaQiY0Oo37VMoDk0ZzOe7ZuZZf6oZ9OuEaRu0Gwsgzc+SHLIcnI8XQJ0bVVHwCYAT8KpqA/F
	ReM2vsVssGaIeyxDmdtFV8oeZ
X-Received: by 2002:a05:6402:1d4b:b0:6b5:646b:2c39 with SMTP id 4fb4d7f45d1cf-6ba37e8e238mr3343517a12.30.1795219035131;
        Fri, 20 Nov 2026 15:57:15 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm1665428a12.16.2026.11.20.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:57:14 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Frieder Hannenheim <git@fhannenheim.net>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: synaptics_tcm_i2c - add Synaptics TouchComm I2C touchscreen driver
Date: Sat, 21 Nov 2026 00:57:12 +0100
Message-ID: <20261120235713.4038162-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260910091405.354058-3-sevanevorotov29@gmail.com>
References: <20260910091405.354058-3-sevanevorotov29@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vsevolod,

On Thu, 10 Sep 2026 16:14:05 +0700, Vsevolod Nevorotov wrote:
> Add input touchscreen driver for Synaptics TouchComm (TCM) generation-1
> controllers connected over I2C that boot into application mode out of
> their own flash (such as the Synaptics S3908 fitted to the OnePlus 9RT).

I tested v2 on a OnePlus 11 (SM8550), which has the same S3908, on top of
next-20261120 with an out-of-tree device tree.

  synaptics-tcm-i2c 1-004b: TouchComm v1, mode 0x01, part s3908-15.0.0
  synaptics-tcm-i2c 1-004b: 5760x12864, 10 touch objects

Touch works under Phosh, including multi-touch. With wakeup-source set,
the double-tap gesture is reported (KEY_WAKEUP) while the device is
suspended, and touch works again after resume. I could only exercise this
with /sys/power/pm_test = devices, because a full system suspend does not
work on this platform yet.

One question on patch 1/2: the binding describes vdd as the core/digital
supply and avdd as the analog one, but its example connects vdd to a 3.0 V
and avdd to a 1.8 V regulator. Which is intended?

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # OnePlus 11

Thanks,
Majid
