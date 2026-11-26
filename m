Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710403;
	b=Ukl8Hm3vF/ZQ4a4IyMKcMqsknCHZBcpHYvrtMARM218+ufA+eqOum2bYv1vd5GzF3JQy
	 J/bYZJ5xiDRDh0BSz/SGOFlhNW5cUzckkK1LtYKSqFQsrqdxLh0gic6wGZwNzgGbw7k76
	 qXIR6ZhwAl/BClu3tDvaCvSxCzcUUl+Nj5lRBOHvLy5ayFTtV5Uj4gds5O9C++/+qsy+5
	 WVYweP0K+9Hp0zG1p9UN44tgH4nhps8YuczVYvLDraBwx0cbdP0AjP9k3H3QcTLlLn5iW
	 9+nWBRKX+d1sK1hEd2OJE5qBP03pSF7eE1usJps6/y7+dODIWqcNRumA2t6bM6uckkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b5z0ThmhKJxf+xijCxTwHDNcpYA1yXMLZrxPppTehao=;
	b=WA2yweWGEKz2feHp6wCUw2k0G/nEYKhQHuSmOUh4YlPzv7NIuBpCaSpMN+573VY5ZSqq
	 FqDUTyujmpCy2XwgHWl5YNzvnMX5oVN/aI7Lh3Hi4vUwMF4YD+QUR+RrvN4jgjtOduseY
	 aKAaRDf6bB2HaM0R7Z4qJEHRaBNx6IKnGh4TT2nnq+nx8lqtLcWQJ54Axs0q9u6eYPCrl
	 PZ41hnDCuey1I8pvkgYHzmD18C5yjyJRMfdjDt8MnqQQtj5AF8bWrsRMlQCpM0fJwBj7U
	 gwzd/KCso4DU4kpJQbQItrBN2rg7gx9T9xSnc4/uPEOYWlOrhsECYO9Q4uDDxQxsS7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWqOYqNw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE90606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE90606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWqOYqNw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so77037665e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710401; x=1796315201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5z0ThmhKJxf+xijCxTwHDNcpYA1yXMLZrxPppTehao=;
        b=OWqOYqNwfRknSLG3Ui2p0CUMzmdffJ+xpc+fI/s2lv1UICyhWkc3eLDOBEJSzgZMed
         nKtBmDRBiVQC9MZJO84AP2i3xMlqHNlE3gbIFsr8q1yHaPFP7NaJfe0rn9Dev5F69Yj6
         p8T8x7I/4eD7VYDem3U1pZNyknc0W/H0VT3whFayHTw5d49Z0E1sx0l0D91/VC++UfiT
         EwNG3NVm6B7w4t4QzEMklUQ+1SfKrm39ZguERfr9VStotI47k60AnOsLpuMtfG36fRla
         mkyFIqiFYyRKFnicRBSrmEO7hAmYVsPtvVwOyuD4XQC+cWT6022skyvMewx2xRmdeh1O
         Z/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710401; x=1796315201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5z0ThmhKJxf+xijCxTwHDNcpYA1yXMLZrxPppTehao=;
        b=EvqAJVxY4ZGQK4OcECkW5oMazNVzJoRs49f0XaGMLgh0TvSx3/GDg44NYfhbQdzPsD
         2azF7ejwGbopqjnlMrJF5wLHDheVs8yPE9GVNb8cY98bCbM7FGGYkhk7Sjd23as9oFZC
         lWWoBgmNI45UZE3dG83Prke28izn0T0SS9yG51AO1iG/ZrUEQYR459I7kZx7iqgJJyJm
         ZzJ5v/46+0EMigkJPLO/DS1LIfDX2l0QzAF092YwWjvidwxi7UtmrYZBiWewikqnzOoD
         +TYw+z8UT/dkZhtYTYDCzDFYBvwSUGkP3qTTYtLBmSFMH+qGHEgKWokmrOIQH9SML7bh
         sxJA==
X-Forwarded-Encrypted: i=1; AL+hErHSrD2nTWrhzE1e7fkzbFmC0Kd8MVrrbu3rsL1XSEjz67r+KxQtmTUv1URGmiJAvaJJ3sE2eVENbUoQAaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PS+uTIHlNFGDScMHTMzuJ+aexmnmRUXm5u/E/m1KB/Yelyaml
	e9s9AytsIblwXdVEAp1CMsKOHwwBc3qp9bmihdJBnekQwVQfStGWPHOj
X-Gm-Gg: AZFdTZeyDCdgTHdMjBbFTOQ+aGO7LKcNpqJemvN98+58GMN3eRs3ZIXA1KxS2XKyEFt
	W4FDTI0o/Pez4Ad/Z0YIopWBUjQlzykFDXJ1T5i6hHVW3JmT+x6Blqu3xAgxNsBH1yjHvtfppQo
	tk+7Nvj+MRbjinc3k017JmJILLZ88EDiT0r8QaldCzrKp5oszNbfSCpcyAUz323BCJHl2uUX52B
	38a/KnZUJYmKpS8nxM6eEnmN6ATiSjV5HGzlMxbCpOxN2jB1hGrzSBEG+oN3AYTSg0yOHixuDq7
	0tBVMR81PMCjCvirUwNNWexbYjOK0DFG2i4NbJQ4UHHoQRAWVzCR7BBan5eCQkRX00ewghMWq0D
	SJFXiYyoMhOUu5ZbIo4zrO0r/boRAc/X9U+359Hgw7h4qIMGsCiTeS9t7/vVyBxyu8TJEfDbHje
	4ikHx2d30TW8XSE7XuLzDt2WJGQwIR7R6aa26P0tkpNIiyPhs8urMXJp+ZeQnMtgmpOGwHqUDJi
	p4sJ8aXfoGjmaFgkwNIPFgPjxRl9forU3rvfltW0j2vmytI2JGP/HsZTj6RI7ATURSJOMwYo9Q/
	qCVSYTtuh7m8VNmhVQD5hh2SBqADKVSAWHTUaPtwq2/vnwo1ydKbEF/Fd3zDfZmQEM1iYnEgLeG
	8OHcKfw==
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr442079825e9.5.1795710401231;
        Thu, 26 Nov 2026 08:26:41 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:3818:6731:d35e:a255? ([2a02:e98:40:8091:3818:6731:d35e:a255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm574510785e9.2.2026.11.26.08.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:26:40 -0800 (PST)
Message-ID: <ef3ccabd-5093-4ee6-ac21-20e08b97b510@gmail.com>
Date: Thu, 26 Nov 2026 17:26:40 +0100
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
Subject: Re: [PATCH] dt-bindings: serial: pl011: Reference rs485.yaml
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 Matous Hybl <hyblmatous@gmail.com>, Miroslav Ondra <ondra@faster.cz>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261121-pl011-rs485-v1-1-0d18008f4a12@gmail.com>
 <20261124195705.GA3075022-robh@kernel.org>
Content-Language: cs, en-US
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20261124195705.GA3075022-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Rob,
thank you for the answer.
> On Sat, Nov 21, 2026 at 04:10:33PM +0100, Kryštof Černý wrote:
>> The amba-pl011 driver supports RS-485 and parses the generic RS-485
>> properties with uart_get_rs485_mode(), but the binding does not allow
>> them. Reference rs485.yaml.
> 
> Is supporting RS-485 really specific to the UART? Can't pretty much any
> UART support it? Whether a driver does or doesn't doesn't matter. If so,
> then serial.yaml should probably just reference rs485.yaml.

You are right. Some hardware might not be able to support it properly, 
as it could lack essential registers (you need to know when the 
transmission is done to switch the direction pin), but I do not know of 
any. As I understand it, these properties describe the attached 
transceiver and its wiring rather than the UART itself, so they belong 
in serial.yaml.

In the next version, should I then reference rs485.yaml in serial.yaml 
and remove it from all of the other bindings?

> 
>>
>> Fixes: 8d479237727c ("serial: amba-pl011: add RS485 support")
>>
> 
> Drop blank line.

Since the change would then move to serial.yaml, there is no single 
commit it fixes, so I would drop the Fixes tag as well. Is that OK?

> 
>> Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>

Best regards,
Kryštof
