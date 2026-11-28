Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872686;
	b=JGPDO93nb+RIwFGa54k7cEnVyyidlHbYqbIVCw5xHQa/3nq6FlQWR1rCj/StuP1WiuXm
	 Jy+3CHR2BopEfTyt1tH8TshOjsP3unAD8mmXxHuE8hyWLwL+w6+QV1MIgqLkHJI3BVgpJ
	 TiLGAyzJ+b4/EBQ/GYUyRxtgFVfoxGe4bgKM/KZLp7u4b51CEpfde14Qr4ZdihQYtZDDo
	 xQwrMUYbKpol6liRVsodZrboh4wmX3ugcPjYm42PpFMTMSeValAM2SY/yQ0AtJGiUNCJ5
	 spIgizS10CgSjRYICEZoabGVubfIlxwZNkim5rPO1VAWBJQB11sMGjffOjbwCmvbM2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6+D7ojb2oXDOZEL51IaokC8wnBnQPJ6hQBVyXoL6hYw=;
	b=05Wr0KdarqN83/d4KFMd2QBzW8G54oO8ZA0nDbVzSwl5wE3gpJb/xcsTjXF/lZlMtPBO
	 tVyVgDlZBX8tnCjYBu0jbItgsU0ORTD2kRqZSbWKcKMQH5wU0o7MHCFAXUXa/irjIBjf5
	 Twni9px+VvjXINbQVOmB9XcNaj50VD6EfuhFgZ9jSUwfQaB7p8Ek2LcOQrtg+nds53DbC
	 7+YKY+iJ9zI4wgc0Usrin/VEjmXZlGBhfPMfiRyZYVyGica6iiEnIoT4/KTSxaQqgRrV1
	 DD6Rr5hIagQ58IHWZaJthk1ZGP2uzGocuDHZ3UVgQEiSZ5No1/uTGfwHI5FE/w9X7FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+HT08Em;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12639606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12639606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+HT08Em
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38431138772so11835589eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795872685; x=1796477485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+D7ojb2oXDOZEL51IaokC8wnBnQPJ6hQBVyXoL6hYw=;
        b=T+HT08Em46PTn4En7T4YmTdV7dzjABlXfj4ekayVyaUHe2ONy57PHpD8cjuFQSsC+0
         sI9ynWUImMFr9WMFJl2FS2mJoH50G51Ul9Q+vXxL49PLg+OlmNaietTeI1S3iG4j8oFn
         xALSNeDlGF/b1C6cSxf6h+JoW+MYFGiTzAHwnz9iWmJTn1L9FJ2z+ybVNvN+4ixfmC5N
         qr0kar80xjZHFnujzCVowey2eHTOhlMVUx4z4BO9/Bl4H1MSaFXstnRNgGEGIW5Cboy+
         o1oNVqKRb80UzG8Vq8ZUdvbz0YHux3sc4yDKJMbaVjFQZni8hDnHftaMgNZnnhtLtKfO
         9Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795872685; x=1796477485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+D7ojb2oXDOZEL51IaokC8wnBnQPJ6hQBVyXoL6hYw=;
        b=RAsAlsnNcyebL5m6LpIUpsk53XqikQsGuf8Xmo/9DFTzsP/IwwoKV5kpB2F+mpZx6Y
         /lPHfxl6wcWI0Dlx6u9iYjFoJxOOASrOtQtwJddSUZsJmUaGwB3XIfcwGJEpu2aY9agU
         2G2i2hBOjAbPHkX3KqkuIwrlkguvMYsT6fdZYQf46C1ohuakc3x0UwzfMYZ989+RAwsl
         9sDRJ8CCnobJU34dS/0ORtx0NDlyWC98pU1JhN71AG3UFlK9moxTPAsuks4NVZ6SVSrX
         MXTzSKYEPi+2oM+AYRze3P/oWoZfNMG5Z7BlumuAv7HvbOSuglKMWwiBrHiZsmTW24M3
         VuQg==
X-Forwarded-Encrypted: i=1; AL+hErFEYzW7YK9QRU2A3aUgf3+edxSCqQRxEx6n7h+IKn4TfwiHUDH+1RQclz0RYkXMLJ2n72XH7CyjUM2GoLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/no67m8dxYpeEnUlmyKrrKRq8iL+YQnnjQOpogQkUwwVFqBGAV
	46heSKEzZaRXnUf6Mdvpt9FC2I4ohs+TCb1WKz4e2bNM77j6a2irR1Dj
X-Gm-Gg: AZFdTZfFXs2gamkY8msPP6smtfA0F0Sw26vlSYgBRSc7p1SqQDhgHBGlsawxcYPcPjg
	q735n/Vr/W7+/etQKTTkISxeArbkOa03mOltooRi3BDZg/iro8/EaCFl4zrHXFuwO0Ocec1d3zF
	I9sj6hdCVhYAtT0t1AwxHGZ+fcsBCjqCjvC33yg5RhRAax43XpHrvtsCLm6y4AI+Kz3yje2lJy2
	LYE43yBbRrL3m8UV7lvOPpoXuDTXfXg1Q4Vi0f9OJf5dVp/kyblAb5f9fo7m7ty+j3WVut+tG7+
	atBT1yX1wsWwsnsBNeCvGeKPFZwTSExqEafuQbc3OrNbMDLKFU45P/qXTlvIckjz5LDXx2uuDqZ
	d23MIApzMfdkpZFwqDZY0nC/rIZDQRx+EecvzErHRzYY1mJQcOr2XedpyW3G1D6Oecef3m151bZ
	qpJeyI57ijkgmWLx5fWlnTJFcQ2h2CUzB79C9pG6nZD9/Ipk/cybJN9D/1gAqZLqTBsnpVaH9mc
	F2UEHkjy9MCH/pEx/81XfAPH4/DhRpiVDR8tzIVFXsJgq+c4KEWtj0ZnwCCaP3bIN6svE+S6iIU
	aPTAV2nNVfzDFHlmQAcOWlBTAaVXyPJ9jhSc0kgloLE=
X-Received: by 2002:a05:7301:fc18:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38570f27031mr26530218eec.28.1795872685065;
        Sat, 28 Nov 2026 05:31:25 -0800 (PST)
Received: from [0.0.0.0] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm74962402eec.20.2026.11.28.05.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:31:24 -0800 (PST)
Message-ID: <935e17b4-6053-43f5-b384-c5c9952ecd14@gmail.com>
Date: Sat, 28 Nov 2026 21:31:21 +0800
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
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Redmi Book Pro
 14 2024
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 ilya.gladyshev@linux.dev, uselessfire@gmail.com
References: <20261128074912.20008-1-vlku.milos.fun@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261128074912.20008-1-vlku.milos.fun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/26 15:49, Miloš Vlku wrote:
> The Redmi Book Pro 14 2024 (board TM2307) uses the same WMAA method
> (SSDT with OEM Table ID XMCC1806) as the Redmi Book Pro 16 2024 (TM2309)
> and stores the WMI_FN_SYSTEM_PER_MODE value directly in the EC register
> QFAN. NTDP in the DSDT maps it onto the DPTF variable ODV1:
>
>    QFAN  mode        ODV1
>    1     balanced    0
>    2     quiet       2
>    3     Turbo       1
>    4     full speed  4
>
> Map these as low-power 2, balanced 1, performance 3 and max-power 4.
> Fn+K only cycles 1 -> 3 -> 2 and never offers full speed, and
> power-profiles-daemon maps its "performance" profile to platform_profile
> "performance", so full speed is exposed as max-power and is only used
> when chosen explicitly.
>
> GET returns QFAN for 1..4 and 0 for anything else, for example a 0 left
> by the default mapping, so read 0 back as balanced. Writing 0 is not
> useful: from the same 80 C start at the same power, the package cooled
> by 15.2 C in 150 s at QFAN 0 against 29.5 C at QFAN 1 (n=4 each, no
> overlap).
>
> The firmware also accepts Turbo on battery (QFAN 3 sticks with no
> charger connected), so add a battery entry for it. WMI_FN_SYSTEM_AC_TYPE
> is not implemented on this firmware, so skip the AC type check as for
> the other Xiaomi models.
>
> Values measured on BIOS RMAMT4B0P0B0B (bios_release and
> ec_firmware_release 1.11).
>
> This change was prepared with an AI coding assistant (Claude, by
> Anthropic), which read the ACPI tables and driver code and drafted the
> patch. The values and behaviour were measured on the hardware by the
> submitter.
>
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

Hi, please make sure the commits are signed by humans.

https://docs.kernel.org/process/coding-assistants.html

Replace with Assisted-by tag instead.

> Signed-off-by: Miloš Vlku <vlku.milos.fun@gmail.com>
> ---
>
> Notes:
>      Tested on the TM2307 on top of pdx86 for-next (61c0dac952b9), built for
>      7.3.6 for the hardware test: all four profiles apply and read back as
>      expected on AC and on battery, a stale QFAN of 0 reads back as balanced,
>      and power-profiles-daemon's power-saver/balanced/performance map to
>      QFAN 2/1/3. Builds cleanly in-tree with W=1.
>      
>      Anton: when we compared tables in October, the TM2309 matched these on
>      every point, so the same entry should fit with a second DMI match on
>      board_name TM2309. Happy to add it here if you can test it, or for you
>      to send it on top.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index f71c93aff..9bf705d4e 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -139,6 +139,22 @@ static const struct bitland_mifs_quirks tm2135_quirks = {
>   	.skip_ac_type_check = true,
>   };
>   
> +/* GET reports 0 for an out-of-range QFAN value; treat it as balanced. */
Please remove the AI slop comment.
> +static const struct bitland_profile_entry tm2307_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,	0x02 },
> +	{ PLATFORM_PROFILE_BALANCED,	0x01 },
> +	{ PLATFORM_PROFILE_BALANCED,	0x00, .no_set = true },
> +	{ PLATFORM_PROFILE_PERFORMANCE,	0x03 },
> +	{ PLATFORM_PROFILE_PERFORMANCE,	0x03, .battery = true },
> +	{ PLATFORM_PROFILE_MAX_POWER,	0x04 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2307_quirks = {
> +	.profile_entries = tm2307_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2307_profile_entries),
> +	.skip_ac_type_check = true,
> +};
> +
>   static const struct bitland_profile_entry tm2424_profile_entries[] = {
>   	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
>   	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
> @@ -169,6 +185,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
>   		},
>   		.driver_data = (void *)&tm2135_quirks,
>   	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2307"),
> +		},
> +		.driver_data = (void *)&tm2307_quirks,
> +	},
>   	{
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
