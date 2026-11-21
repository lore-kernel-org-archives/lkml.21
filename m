Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266495;
	b=B5l0NkczJUgVJsaS7dDjkjGwK0FKnkrvmrp0zCg1jTd1NdaD6sqjqQ99ucbt1ObQuqIu
	 +YR7jwyF5StuKrEIuXIYEYKis6EPH8bgHAZMx6lf90rW6VPlSecou47nfhWH5lHC8bMij
	 6Q2cXfbpRRT6pCOmHGTccwRpVuCVA7LA+hbD9fch3HR1T6VYQi+dVlHu5qQGoDMY1BODK
	 tTmLJmWQrlEflpzus1s+pk3nIYZkW72zByhnEIzZG5Q76FLOC/1486HZC5gjH+TFOT3EA
	 08GZIce8PuaUTpVa7aoDaCliDnL5KNaKc0VzkJ/PQNs9q+U7nLaoW6pZvDakLWsiCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
	b=1mIaU6ZnUGUN4rxIsNR9tmfE+X3CBOHD2ITqRa1mxJW8X5KHevQnpZdF49fzMq4ABpj/
	 scXxXvf52+QSXrkzRgHQ8yWA/8Z/Notv6qgHEECJMKZh4DNc3U3AX/JU2MokWcY66JYU4
	 vtEEufFnF98mnsrZv438NNrX1I1MC7LI0KB8jRX+jPGHt1tWTCstvV0s419bfsZWQHquY
	 3/FVkB+RxtVCRhIBcTTS3cgV+6WlNBMlwrNGxUqZSoEl/SZSLi+ZW6thseiMoGOIdWlRS
	 r40BFP04ibAxSDePJLWJw845igR3FzpkgM6J74h2aXbYexjwJiQAYSxcISZktFzsjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi9up7Nj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF0606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEF0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi9up7Nj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15660555e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795266493; x=1795871293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
        b=Mi9up7NjvpRyWzOY8s0o7PJ9oq3lkrxuxfoNnumarCgA4nUizFfFXZxPUIRrdNcD82
         4hQjmpK/hA7CXZ09fxX0NHtcnkVMJFgfv8kJGtzoT27SOgmpe3G747ISiSEPZj7c3cqB
         LZXcEcDDWHH8fiKcsQZ5EkOssnF0b1tUhg6Je3k9Kn0WWU7y2nZ3hh7gzcBUbUnAUbIV
         gfuoHPYCRARbWl8xEqLsbFoMIxw9cciZ1oxXtglEIFYGXfohgSML6AhXpr+vh2Gj2vme
         rHKgcwFj9QFrtjmpFI0tqdcFnkeg+uMpd2wjBlPhS3VjLW4e6Y8VUAccKZr0Bc3Au7tj
         7DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266493; x=1795871293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
        b=LMTh0axE5uNT4+HjrQKYBYFinOrMmKP9+AkVNrg5wNG/rDu5/GdMBm1iaER76rGCJo
         3lTSeJc+ooM6xJj6ZCp2IXuoaV/8NgSr5U2N8rfECkQf0HDGSmkLmjMZ3e4ijEf7ec2h
         mbGdpMT/GmraYhS3gyMcvfxvbU7nHXnW8N6VwOZI5zgsFkV0tIe3dfZWWHSSnyCj9isp
         wDBl9bW/7wxJziPiEqajiAB3K1K+yKioyMB+CxjexYCSU4ZOGM6PdPKF0thYq+3F61JS
         sgFMG4BfIPTF7viNMl932nXad1R68LHbvjsvKAnltU5w7BPsYaXzAiUjnvhrzmdjAL/9
         33uw==
X-Forwarded-Encrypted: i=1; AL+hErEoVj3982QTBAzx6X+c4RBog5AL5SQePmnFRvDMPxWcGVp5yPrOqaLOtA3gwkbBRhP0F/D9TidlCAbGy8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dsjf14FHxd6uvCCvtbHRAeB8z4fr7VpXYP+vgzdN7Cp8zXn7x
	B2c/TkAUONFyiHBMGYOC6WZ8NcBVspshRye/EsG32uAuTc2S32772AEOIuo92iIE
X-Gm-Gg: AZFdTZeoeihyMWw+BCPrXwC30TJ0rA1KoNNfyOS4aHZhJGJ9g9URcKRUdoc5YM3y99F
	cTy5La8s4De6JorQGeucyTu0Y44tT7L+p3kXBOCH+fRlfZ0TcLuKgwl9jiCw9aQ2LBqmKgy+dda
	EmzMAt/7uWFQ0G234H6R2JarusSAS5ez42L4R69EZe6jE9r0UNsP51e2Q2c8t0Mp12KnSjhJnay
	p+HYWu5K5WNzE4U7EcU1jXB2BXmWyyYQlixfu54sDg0jhb19M+ENFaizPGiuhqmbLNM1vcCZuVu
	VKtRzi9lLDn7BWoLFCu80n8vCGQqiCSiiLrHhVg1TCpmGDOB32lHTG8tYYrLtuIW3sGgwVxGfJj
	jSMN3JUJRjuskadb7/OZAv+NFQTBexjg3JablLEvypoXrzlm2h0tJar6iXi4kRCJkvr8RiZSeIO
	baILUAeh+63/nm4kT9bmdiB/ylFI+Lk43hVXgFqdUeyAzpOHbEWmdPqVbQpMq41kfGMG1fk4l3M
	mgfed88OWoxULDeeOj/gRfiZidcsjKGbmHK0P+urprT6H7UuyAHyCIZ3bCCXawyBhfzrber8wFx
	DWHbaOJ+Jl+yjj4oQT7XYY4lwmjUqXOENc3ftOcMYm8IU5Y=
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb8881409bmr148513185e9.19.1795266492771;
        Sat, 21 Nov 2026 05:08:12 -0800 (PST)
Received: from [10.50.139.243] ([23.90.153.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm48512235e9.0.2026.11.21.05.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 05:08:12 -0800 (PST)
Message-ID: <84ee070c-f134-4a78-a92e-0d03d0f0fca5@gmail.com>
Date: Sat, 21 Nov 2026 14:08:11 +0100
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
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
 <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 17:07, Jerome Brunet wrote:

>> +builtin_platform_driver(gpio_enabled_clk_driver);
> 
> module_platform_driver

Any explanation on that? All other drivers in this file use 
builtin_platform_driver. If you'd like to change that, perhaps it should 
be changed for other clocks as well?

Slava
