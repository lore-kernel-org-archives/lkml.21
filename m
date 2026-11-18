Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013811;
	b=nfYc92HNtjN9cTePxT47ELE+hCcGImvgliMRX7tK2ckYAe0ms9erA/0uuBQKRST5mnNL
	 wktgK4hztzKXat1NDVLQ/UNzMpvU3rQ8Es0/8v1lP6OxTpkdutojcjCsiRI98/eT0PVDv
	 UWcesbW6VR7+mswgUvailvNO2On8BSGcsHO5i1SSoRMsrmt/xZLdUtuuTFwVo8O0aWQc5
	 RqgVeyGqi1hS+x11D4XfOXFMGwwopaIYBsuVyAXL7whqRvq7JVp/6+B947xDqaydGPlWp
	 T3fV7DWw9nBRUyQKkBUKgPqtJ1qwJgPyq/P3r6C1Tv3v/rl0JKXDysK16N27pY+4isA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
	b=pKsNu0XArQ+f+MZpE2WcOoNDoOztKUGRg2N9lzql2eTD2TWbeDwbcYnHy1Bfm4tSjOPz
	 PwnxiOaUgGJYKzzTODQpHQFT8iHnZUiFf7TSLV/Ua6fro4ul0kKE7tOqsV5NBqKgWgkec
	 KSWVnDrXjblh7xXfE48ixyKww+AnkqP+D9qKCirPbDn71YrqZlVu6bM6vy5V3ko+0GXE2
	 kM8iIBt/HHWZ2pf6RQiC2wXP/55srL5fmtgMIB54xQDXM8QpT89fxsBLwSKc00UDWYKSO
	 dKYIaWXc9fWPM2ZruEYPOIj+hucy4WNG88fYwFkZb0F8RbAg+lnFjDebnMoty5nxkkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IAUI4RVZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8AC606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8AC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IAUI4RVZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10477055e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013809; x=1795618609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
        b=IAUI4RVZtMpQLwPVKu7ZGS2ExjXvf7EWqWnG9HfQeLTRTAjhlxMVvi2PN3aXdhBe2W
         BBQo53aj+g+JI1u1xEEqhd2cseLlM0dRxVi+4OzMeMmDw0bwcQj1pRUDAGT3hjuHL4PW
         y3cKzHSkB1QiBkBF8xXnSdXxtXwsDnbvuUdj21FfPh/+AJX0XOV7XBynqN9dPS2KW7ko
         8u1NEDRwW0KGolVzv4eQVvXdZtRtt0pX0Ms2xU96FRyMGTHZRwImLZxedbl9cH5Mjtqg
         xJ6Z2MO1lrtZnALyauLnDn49ps2Un66F6uP1eq1C+ySeKQ+kdjX8sxZ6wtjmO0DmVP4s
         +XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013809; x=1795618609;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
        b=vhCP63V2Ei4BP5MdVqkx7oHNPPqLbtVT4P+YPLi338QzdfBe5j2PjDNbY0gzX9Ni9Q
         /gnbGltNa99Ht5BykPqqTJf1+Cw6C9OfsqaZN8Ikdr+9ouPTY5a6ryDZvhaiyMBF++YX
         PXVDhnoPhyF33q/aijCkYqx8oHJobuvL7EW4sZSd+ucvsRxR2yyuY6iFYCNs7pKzVU57
         84I/2nctW4sfckuhjcIdZP1uNsTOj7yaiPC+oH44pNLRivg6+JXwfbu5gVnyQAZ7RGOK
         /EvCq5FkKVeSye1jK+XJoV/u34OGstk01/dI+N/I4KwGnXyYFK+9sQIgCgVZomcSZ0R3
         It3A==
X-Forwarded-Encrypted: i=1; AL+hErEXjX5a+ixsQyucjqmO1PtfTyukjIwKhNUKBl4UY6w5FNUQpCTFy/ZFdD6LvqsKdFdostnZ6XY9Ta0D60E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lrst29KAdpvu0Q9hPcBH6XtF9b6U2csuuG6y1Qs60WlItHt14
	XvrAiOTbohV3VCZ9pttt3JE1a33CvTLfDQCnJIzjXel6L9ehux95fx9Diu0/HVoxaxQ=
X-Gm-Gg: AYBFou0U4R4ZjxQ3/2+OGs6NnaH0kpA7ZYzMbU8sqJnFaAhHOItw7rTlhKd76NnZDTW
	WJFYQ2WRU5gVagUCMXRAHUm6WUY6ozWd5AxqF+ddHsX7zCqI41ANY/PweDezPd7cuodUtrEYXxm
	xLmF2tmxmpi9wZS9CT7t6Ke3gTGIFIqCzzRr6tRIyR+IjAXH082GS2Bv0X2IUSCvNmO31CJy9VT
	0nQw0xbOAvdWV5VG7vc7+BHW8FFedARTFNqZvJUJudFYi+ZIX/3jVskY8BfM+9JrSiVT6XYmCp3
	d0DihbFzx84moUw04VoRnFokGtpRHrlmv+r4OWXgt4c0ZeNhfbGyuluh9vsJx9ZRVyQTC/blsRp
	sWn27kMibGHiQfNbl+nUL5LcRoOmt74qzz4Wp5NtJG/b8JBK0sye7HqBDp0TFAojWWLGpQxz0m9
	S1vPHUQwPIGcQC34uRiNHVSyY1rD7VH8XC3tMMH/MNsmIRvBMkCuxaYolV4wjtkUSz21hI1JKt+
	JDuhe+dEloYPERD0VAlgiOxG+2Ql167AqH2ePQg2nHnG42EdomuEv3XCHl21xXFSLtaYArIDOU7
	yqNnmbXqxbowdunf7oiP0YppJgLnwkZBrGXUMqXd0bUE1cSFG6/n7kTb3EyUiLeu5HeUEE1zWqp
	ceuy/O+bgkEcNdfGrnaaixRn/WrCJ58T5GOwkLw1J/qM1LhMlrVJUAvGJpmU1pr6l23UUCzFwLA
	lJ2Q97qd2/PrOzxQ==
X-Received: by 2002:a05:600c:3e07:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb7da44cbdmr52983185e9.31.1795013808498;
        Wed, 18 Nov 2026 06:56:48 -0800 (PST)
Received: from ?IPV6:2a02:8440:7506:415f:b2ff:e89f:45f0:164b? (2a02-8440-7506-415f-b2ff-e89f-45f0-164b.rev.sfr.net. [2a02:8440:7506:415f:b2ff:e89f:45f0:164b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm5131667f8f.33.2026.11.18.06.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:56:48 -0800 (PST)
Message-ID: <f837a7b5-7fce-4571-96b2-f3d307d203c2@baylibre.com>
Date: Wed, 18 Nov 2026 15:56:45 +0100
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
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
 microamperes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
 <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 11/17/26 3:35 PM, Geert Uytterhoeven wrote:
> Hi Clément,
>
> On Fri, 13 Nov 2026 at 16:02, Clément Le Goffic <clegoffic@baylibre.com> wrote:
>> SCMI gives the drive strength in microamperes, but
>> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
>> Convert it on set and on get. It is the only unit that differs: the
>> debounce is in microseconds and the pull resistances in ohms on both
>> sides, and every other value is a flag or implementation defined.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>
> Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
> scmi: send the drive strength in microamperes") in pinctrl/for-next.

Yes, Linus took it 1h before my v2 and I didn't see it.

[...]

>> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
>> +{
>> +       if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +               return value / MILLI;
>
> Does this need rounding?

Rounding does not help I think: SCMI only talks µA, and 10800 µA has no exact mA form.
I will send a fix that returns -EINVAL on get when the value is not a whole mA.
PIN_CONFIG_DRIVE_STRENGTH_UA still gives the exact value.

> While MILLI = 1000UL is correct from a numerical point of view,
> it is not correct from a semantical point of view.
>
> <linux/units.h> has:
>
>     #define MICROWATT_PER_MILLIWATT 1000UL
>
> In the absence of a generic conversion value, "(MICRO / MILLI)" might
> be better.

Agreed, I will send a follow-up once Linus answers my question on v1 patch 7 about where to base v3 [1].

[...]

>> +               *arg *= MILLI;
>
> What happens if the result differs from the original value in µA,
> due to truncation or rounding?
>
> Likewise about the use of MILLI.

Multiplying a whole mA by 1000 gives an exact µA value, so it never differs, unless it overflows the u32.
The same fix will return -EINVAL for that case.
The platform refuses a value it does not support and the set fails with -EINVAL.

[1] https://lore.kernel.org/all/ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com/

Best regards,
Clément

