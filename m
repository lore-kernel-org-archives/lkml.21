Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088468;
	b=adYYtPyaNtF2uwnnxbLf5kkcCSqBKjLyuLvhqvdiPZfyY+SNjqkQmKJNiTFUcQr4e5gQ
	 sCT40dameQS8a5InUGgNaHnQ+PeQO3dn2On0TWDoTtJuwqoWUQy48g0zUFojxwvmJ60Ny
	 Kto1QsA8UEynOzZdf7IFaA4ea1kNJVAyHAt6CNzYnwHIrIHuCEmUfO046HbnaIC/qcRsZ
	 EubP60dY7ZpqtAloKNA2fZxEkfOdXKVAm83QkbI1Wv0ulg4B6R/TuS+P44eRYnuTpMu8X
	 GLRKA5+23iP4pwnv2YtSgbbjVx0Lnrjy7ZZgfacPFqgN3z/fHfVN4kXqcnqYR/qYoAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
	b=gpZ+uWGfZ4Jf2Zngd4Bn5K2UMurSkhxR+yUJkHMruVpZFIhnUvccFIDi11yJU05IWvyq
	 lZAcQWs0CMBrRXrT3CMrJ19UrB60atTNLAOk/PNXNFsr7iyykib5vNQNarqFd0wua41uU
	 WwZZETjMgvmKBdLamA8sVCEF7JiqB1qCEywQKHckeUkshvoX29JW2GPjo7TCMZnAvwrVv
	 KPk3F0EnjzEOst1xsFbQLd4B9u6G4h2F41nn/b/NOdnrLZNjwthoVBEzSVt1uBTksp+K/
	 k3NA2YslRJuEdka/S2MsSaGjVzDbQyla5SI/VULmZbrcDU6rpB/NhMjVMgRLmrQt3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hLfVGe/6";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622ED606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hLfVGe/6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10847055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795088467; x=1795693267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
        b=hLfVGe/6VVOPTA8v7FKdWRuQuRmWxsjr6S6y5jTg5if7Lzf0tQNN4TaXAQody43hTg
         wJQ4s9BffXGconioSgn0+0huHsdHw8oEFKYEr/6f+Ca5F6S8ix1HbHWCvhH8T/P0iLq8
         vxFIxLEdW2ZUIMsIfdbOSJhTy9GLmCs6UIxIOJliplJ7PWpk7Da2VbChe+7+h6OOEFQ9
         L7xKm89Mr4c6+lEJ5x6wmHxyKbxBM7vI0oiNqm9oqIZ8dBdUg30TDvoDDxhq3ekk1H4A
         mPDKNMP5bo9+Jz3OHygXjk1wRO43yxyCiu6xP0dUdeN6SmfkpGoAdTYd8f77OLQl3mYb
         CgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088467; x=1795693267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zn05LQ3W1lpoYmiGEPENrsqSnlYIcvQviJvLZUlNcNs=;
        b=YFN15OyPsLHKC6Ghv+QrWAoCQ5/6vm0+EgzlySCBelHOO9Xxkxj8BYDIwOWQaBKbpq
         ++BD2/idjdC8RQzW28pZUYUg+obDOZnIt0EehUUmobgfXFAyveMwu1T07YrDBP0OMlWI
         n2ng7mV10p7hfBJocN2BM0t7eTcuGXtbskTWgCVsUgZ5q4yOAoTSqxA2DRKKyps78tB4
         sKoH72lJqCniaG3MECy7bmgkDrc/RWVyIrloUaB5IZSU1Z4ceTiXDrl0nVQWKzmCecwO
         A9JZe0ZM29XLdJS3PfOiDDmQEWH+PuB916WJLttkq2U6+8SrKlrsghjtioUAC9JwUQvi
         OdrA==
X-Forwarded-Encrypted: i=1; AL+hErH/BQ4mouKMn2cwHYJc8Po7i0Mso+W+KKTHoHJ5llOokx8TYdt7zNb6YoaYWH5jzciTd708109qv/ijNtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ObJgUnW3Q5BT2hCkLKrls3uIRzVCppck+xLb/XPHaBleZCJKi
	mncGt1qvjpRt7M75W1jDpOXuvxA5iusnGgxhlcEWCmWGs7uOwyHXPzDJWSYYqMv7Zt8=
X-Gm-Gg: AYBFou2Hipn6TDDRqDEB2vi94kL/beEYnXZIxol9v2bg+obtWCAOrfxeaC4iRSsSXLk
	9l4UoaO5HaT7pg0Pz0q3xfZAkfyIaS816icSuer0ERqhilrdFAqeqAtnjTgDvwiEtkEICjC/Zxo
	xb+reiA2eLL9KiJYIBl7kx6dn1u7OHPcTyY4Ip57zKLBuntgl8l7wi8mIX0wuAXtp1npNc7nJvV
	bBeRnTmFN0oDuwbcy/ONP4OChEpgBxw4YZHZoD4OcAZ1XLMUpznr31TjOauwrqv89DJbBwa5NAW
	F+APIPf3cOJNgGzsRkWI69SlQfO2aynsQ757S97jV2VUENyson+oFAGmTjzI8mZPQFdcj4AkWxg
	kldiQCi9+mk9foCrXHDVrtq8q45Yeh3453NlkKcAv9IlrXzmObLcJ0gwGbcEMVJjyN6xGbbJc9h
	3iMRVyTc83CXAHRJcZRjFTnV1Pe4LcAEaTB57G3w4bYI/jESZCpDzdUXNaOBnNFdQp+eEWiU5eR
	MTa+j6/hY3xVxrDGhPrz0Ody/L7dKy+1EifrtmvCFBoarcVrR8JAUL8Ag85PoBD+p0GTIJjJIeQ
	NjGKuU/Jjlf2qHwxR2pbiUj9jG7OC+EI0vYx0b3Z
X-Received: by 2002:a05:600c:12cb:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb861576bemr14665855e9.11.1795088466528;
        Thu, 19 Nov 2026 03:41:06 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm9943663f8f.14.2026.11.19.03.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:41:06 -0800 (PST)
Message-ID: <fa1f0750-ac4e-4bf9-b549-2bb9a17cbb0a@linaro.org>
Date: Thu, 19 Nov 2026 13:41:04 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] thermal: samsung: acpm-tmu: Add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey!

Thanks for the series!

On 11/18/26 3:51 PM, Alexey Klimov wrote:
> This series adds support for the Thermal Management Unit found on
> the Samsung Exynos850 SoC to the existing acpm-tmu driver.

Exynos850 almost doubles acpm-tmu.c, and most of the new code is
register-level handling that has nothing in common with GS101.
I'd like to split the driver now, while we add the second SoC,
rather than later. The layout could be:

  drivers/thermal/samsung/
    acpm-tmu.h            internal header: acpm_tmu_priv, acpm_tmu_sensor,
                          SoC driver data / callbacks
    acpm-tmu.c            probe, PM, thermal zone ops, threaded IRQ, OF match
                          table, locking and sensor disable/enable around
                          threshold updates
    acpm-tmu-gs101.c      ACPM IPC callbacks, sensor groups, regmap config
    acpm-tmu-exynos850.c  MMIO init and trimming, threshold and interrupt
                          registers

  obj-$(CONFIG_EXYNOS_ACPM_THERMAL)  += exynos-acpm-tmu.o
  exynos-acpm-tmu-y                  += acpm-tmu.o acpm-tmu-gs101.o \
                                        acpm-tmu-exynos850.o

See drivers/thermal/qcom/tsens* for a similar layout.

Also, please note Christian's fix for GS101 threshold 7 [1], you'll likely
need to rebase your set on his v2 as it's a fix and shall come first.

[1] https://lore.kernel.org/all/20261117083442.830549-1-christian.loehle@arm.com/

Cheers,
ta
