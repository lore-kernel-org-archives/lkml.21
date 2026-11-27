Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795820110;
	b=kqgCks8HWzYVwy32bSASZ5PqwmI4MV2mcoFOTiI/ItvZlUfOfe5pVo/diRYTkmxw/c3a
	 h2JLKwQxuNjpVtqSOhshDjthr+PIb4ney1ME/LI4F3ox7PUIwOaDdMbyGYkvR6lzzCS1V
	 vTuX9/dac8VQT63iIv1g2hG1PiOzPW8MxnVIvbEYoPIukAzguyeBq2KG/iL14OBUAoUu/
	 MhyjCAXksIg7Gm+42ZxQW/fCZuvNKuVEEejlJh2UPyGX4e/IaqhUFb8ZpJQfWj3XWU5IP
	 iZlZYoqxzEG00yjcG+16DxItsFGbal1DfPm/ty2glFJV8nuIWYyJ0rH5yy8iW78Oa/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795820110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pkV2SWrt/n1aG0LY/ZRrYziwuJH8xZbbbgiRPPxtEqg=;
	b=p7U+JbQRODSLESqdss1uybZdHEccucIIMFchgjNOID6U7p63n6aKUoIBbQSJjqSma9jX
	 VFAI80aaoBjd7Sk2n6OOcqDUfFr7wyAaUHvCRmwwii34WOzV5Ow0GOmEGK5RyKXRFLC+j
	 5rKVpHY3jVY02N+JPHciymgD+mwLX4o7O4Y2xxGi8+J0V4i+DMMia6VCQOac/iuQP67tG
	 hcw90oV5bvtYpHpx8XyE1V7iBeAsagUGniQoB+xiJnbhsro6Y0lvY97Oehe65Ubtv8pRR
	 rzg194yKoPC2KJTJLsO8WwIiZjo3GZwvGNasZXInLk9akxZzvfMcMhiRlqWDlmpdoGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=doGf4plG;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCCB606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCCB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=doGf4plG
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so13035708c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795820108; x=1796424908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkV2SWrt/n1aG0LY/ZRrYziwuJH8xZbbbgiRPPxtEqg=;
        b=doGf4plGhSpSTAIjh9D9WlU7FO19PPosrB7arPkzZYTcsmGU99MW2lkduZ9PjDDuvh
         V2SbtT7/YjV2YWZgN0Nnk/6wtFKuUyr529bBDe6YvZoe7TDS9zsOvX7SVCoVAaLLnQ6w
         j8bMu6NX7pTQ3fNJN42hLLvAu0sVOjVYOdjSTIPiVG8TE6UQNke++8h7AxY1DP1Ctr4h
         jbWCBobrpUYs7wH0/tlKZdJ/tCUnF8+6SVG/xP33uQpl74qh9oG65fyFt79LCJBZfQ50
         x5zNvYDgGJfVvfKLbfz9nPiSvRVQl5qsk1uWzRAzI+LPB8FUI420GvUXflAUPmVe8g1L
         LcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795820108; x=1796424908;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkV2SWrt/n1aG0LY/ZRrYziwuJH8xZbbbgiRPPxtEqg=;
        b=OAd/eKeN23sYNcIOC/aA/4yXdI0Xil5oKO9+d31K3V9H4Gof0wv4JJTHTKb0EBNNte
         jVKukpLY58/Jina9DpsHDFrqivsL2xxFYJHjHWoa1uVtTgtaYLthTS2CKOEf9orV0bmc
         0Oy5A9UW7zO+oy8xZ6ipuKkX4QGyBnxjsXSRUxVg2UCnCbkL8GKvF2lYoajA+Xh597d4
         WazeZSEXGrYs/VXGWvDBO/ZQovF7tv6UqOl7i27eVtpbIhWQPoLrPhccC1FBacwvm7BF
         k2d41rXT0S3Ir4H2FwoLrqsWKBGHxn31W2dxM7q5Wv2ZqNiFkfD31INg+Au8mnIgFy/C
         qkLQ==
X-Gm-Message-State: APuU4Z+509W1tA7OyKq4Gp88ODxoual9xTxV9LC642IXhlgpShIJqflC
	YW24sattvCEmjsDa+juSdnpJyItYQi5S5ousw4Vu3oM3mQ9/4fQ17L6r
X-Gm-Gg: AZFdTZc7blJigKe4aqACKLlMsUMOhf3j3u9sRUDj65FLk1AtRAsMRRMqjDjEJ8Ctcsy
	pyK5EIzadnfHB0ghBp8uvkedUVSU02uuAFpl+TUKUBuFdU1/pyPzuwYBztd2uKTIGhVcKIJ7eyH
	IJBBflVA3AvMzmOmi2ODSidZbk8GREF/c+HXjS9Hey8LmfR/o9Nr8iM2ilHQsv3bX4wkPWb/EUX
	t32wG2b0BTUPaQCOLcozp8hbIYDC0K5V+n/IE0bb4Wps8Qg/dSs2RsTAIrKcDLDRkNtgoVbE/KF
	x50776fzNMoyQ9cED5xeqE9vTeKNGz8etH0m/FkmCc5Mcb5oYH7as+OCOtHBmb4eHC5N2VA+6rG
	7ZXu3lcXh0WtaT2CbmI8YuOPQCnt7t8HlBmIMclNQ2Gmx3lMHtrecAfzn7a30JjHKTahWSl2MTv
	7Lqsj+SDO7G4B7Nvk+gFnwhB/fzi4GngvniCp7OQZhLlhVHQj1/0PuyuruiYC6PGjkAZO1U1HEs
	xz1GBzAB20fF9v0+KO9eA5gDQ5gZIMF7+6NYOT6h/6yP68uoaE6Y/od8xUSGhA6QG7I8Kc9ojXN
	BP1i/KKSq7t+OzJwyvPRuo2EAUZCMD1Zb3bPjeBfNiaYRnY6befyIe8ZOjI0wFu3J+o=
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr24719930c88.4.1795820108198;
        Fri, 27 Nov 2026 14:55:08 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm98059026c88.9.2026.11.27.14.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 14:55:07 -0800 (PST)
Message-ID: <403b424e-031a-4488-a80c-73f64232c842@gmail.com>
Date: Sat, 28 Nov 2026 07:55:04 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2] extcon: max77843: convert to module_platform_driver()
Content-Language: ko
To: Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261109-extcon-subsys-v2-1-118a58a851c0@redhat.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261109-extcon-subsys-v2-1-118a58a851c0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2026 2:47 AM, Brian Masney wrote:
> This driver is currently registered at the subsys_initcall level,
> however this driver shouldn't be needed for early boot, and can be
> converted to use the standard module_init().
> 
> This driver already has the standard MODULE_DEVICE_TABLE(), is
> configured in the Kconfig to be a tristate, and the driver doesn't
> have suppress_bind_attrs set, so let's go ahead and reduce boilerplate
> code in this driver and convert it over to use the macro
> module_platform_driver().
> 
> Note that currently there is no __exit function defined and this change
> will add an __exit function that unregisters the platform driver.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Changes in v2:
> - Change from module_platform_driver() to subsys_platform_driver() (Krzk)
> - Link to v1: https://patch.msgid.link/20261106-extcon-subsys-v1-1-6a781b323d6f@redhat.com
> ---
>  drivers/extcon/extcon-max77843.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index 2ae9f7f1a67f..7fa42e3cf848 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -960,11 +960,7 @@ static struct platform_driver max77843_muic_driver = {
>  	.id_table	= max77843_muic_id,
>  };
>  
> -static int __init max77843_muic_init(void)
> -{
> -	return platform_driver_register(&max77843_muic_driver);
> -}
> -subsys_initcall(max77843_muic_init);
> +module_platform_driver(max77843_muic_driver);
>  
>  MODULE_DESCRIPTION("Maxim MAX77843 Extcon driver");
>  MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261106-extcon-subsys-24280aaba499
> 
> Best regards,
> --  
> Brian Masney <bmasney@redhat.com>

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
