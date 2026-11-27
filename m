Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748672;
	b=rdY1tU1th096BD3E91879lB3Fnij90ID1cwd44l1pzlA87xSIAL61lcRMksk1fCi5GGq
	 ZRXARc715hqWRru6qMaoqesm9VDVUkDWPA2+T+zORknTTZTbE+JNGTuREJ6q1D7C1ISLM
	 XIFsr63tWHqp8VVcczcnWhCLfX5Zu9bVMsxMuPSrKz1t5xfo84TOqqGWiv1wWwLV/qI4r
	 8TEh2FobXYUBbBrv6Se8ycr81RW/oADga5ycrh+PevPO1uLOCWCZSF/h2MH7hLiWkmHwJ
	 QtVDPaqGHUIcEBQDByypr4eUQ9mWlWL7aluZHdINGXL2KaNCLwqr1Pn/fmVXzTy6/zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=He0FxAz0Sxy6zOcpGM0GdzaAstOzkTmrMCJae4Q03Aw=;
	b=sibGX/Nxe0m120XY4z8R3AJ75nWf41LE5+dOjnP1WbRu2Gt+QlAU54CCEpFu8cGYZPYn
	 cf8vygE1YfOKFbPXTZWpi8hhokK/2B0gFZ/btftmb6uaf+4fmdSgR8obeHKoJwp7xED/I
	 7b+5PNe+MQpCbHUKwU+XvyrbCowcex3RPDwMdua+Yq7MPTTZv8xcxMEW2G0+qtPbcsB0H
	 djGP0DKMfD/vfX5FiM6cIfTbUbNB9N/2IdO42acRXv75pi9UZuqLl/SEU7SqQLpmw+ZDF
	 9rdJ3+BWFCnrHD8TkywtlFGwlSb2Ub9t0Z7G4i9F3JF5iNu6r63QDjIWUvUW8B4AnSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=idE7CbRw;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A90D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=idE7CbRw
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso54560895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795748670; x=1796353470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He0FxAz0Sxy6zOcpGM0GdzaAstOzkTmrMCJae4Q03Aw=;
        b=idE7CbRwL7l7uh1ptKEbnUg/QKOSpSSOgzRysYOuy+Hyo71dsxdLx1gRpEO0nLUz+y
         XlTOAhBI/SO6/fOduuTiSfmCR1KIK69SB5uKcXhb1IOJzJbAJPHBPO7Wn9SNnoSva4y8
         x5jWDvx99GckSaHalgWCmB6PuccwN4Beo/2H/v3OtTjCIFuLjyrcoomqedZKRvZyulev
         QyjNDeJQpdURnVedExBJQxjznlRtO7Yk+VwGTxZfg6vChjAp/WtNkskba98AuTDn6uUT
         JbTY5oWOgH88AcxLpxzfzEuhyAaSSOiLDtG4fVUK+V86MvPf4pDBYaT3Aj29rlkWMe8G
         3k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748670; x=1796353470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=He0FxAz0Sxy6zOcpGM0GdzaAstOzkTmrMCJae4Q03Aw=;
        b=qRyTb6GXsms0CziXEc5ateu6wmWi6uLSXp1TT9OBIkRFVqDpmG3oIPHtLpfb5s7WH1
         Hgpjuz0MvMcpBrPWvtrCfRNOoNsN/dGW34NyTwWaarQtd5lVQQjrSh/ZuYI9TMSNakOm
         DPMEprFp8nD8LAgbMra7tlw8352lkdWP+Job16PL6gDv0hggTzj61FS0V/N8GqvdZyf8
         bZwRGF+rAMTrC7BZE03bva7b0KQO/hsnyj2nLzspM5656xNOvgm2O4KR29WaLU4UmVHC
         WRxOCRI/A2DiFKNLwhEbtzYsqrcAfAvltVYPGZjFukHoRxX9ZXvL1i5Ea7feWRxcnB/i
         j8UA==
X-Forwarded-Encrypted: i=1; AL+hErF+9wIIZmBbU4uDf1zJvT8ipfhprWi1weKwDBwJyNvI4+bcv69KQl7GPYwFBlf1ejXlDz18zafs9GH2loM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Ve3oVV0X5C5b8NDlZsFdonKKpHuLePpzjPV4mWyHRJLm6gXS
	jL6T7QOj1Arzsy6Mgjnl9f1yCPzkM1S1ZsPGe9TK0CLYa+16y/68FcY=
X-Gm-Gg: AZFdTZe1ZI/CxJ2Ms2HMKFB2SB4f5mj6+aSywAGXAipN8znttvLBYZqBs3HLcSzIFWD
	msJlgEqvshJDF1H1yY6lTKTxjg6GEu1Y4jV+x9HTVAlmi/+6zOcLGizXbgVdL5dgcSIiuEMzvJo
	PG1Dn4TeyXM4HeEyIgUBaBJS0rXoXNFbObLzGIVvfkMwpQqZ8pl88ASjldxEOJl72T64RsYs8dj
	edEovCEvT8eyaPtjjb8/ohyZjV6ALxqSlKmkYkhguiEaUAD3avNKs5E8/QjIAzSnqvYK0nKzrUS
	PpxUomtkEOA+gfaELK/E8634cKSyiCHjAjIAhYYgUTTYYAkIWjjGVMYitCyF8hfvCkZM7mRAkIM
	yUyFw6WN4vD2zbGAWopXzpxp0lvwlmXOMiVlL9Hk39S1q8bMQfkTd4OWT7Ts5rIK3xvk0qUxzN3
	Wghctc5W8AlCv1QcF39ow4D/8MbKzd+BXoDeZj7/Q0g7PbKBgU6fI1j8c7x9FjrR0X6OVDLDvmd
	3XfygLi76HaZD9GgjTeIm4bSJ6omcdqS6t/RBlxqfaIkNSIxeuv/FEYZXmt38Dmi3PaYSFpw09A
	O6LO/8FbuzZwNul52F3aBImUoaxvVa9AXY+Ds8DopwuLaALSvfaTOf+yuQu6HL7tZPotp10fRCP
	oN4o=
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr448522065e9.16.1795748670262;
        Thu, 26 Nov 2026 19:04:30 -0800 (PST)
Received: from [192.168.1.3] (p5b05722b.dip0.t-ipconnect.de. [91.5.114.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm28601374f8f.19.2026.11.26.19.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:04:30 -0800 (PST)
Message-ID: <dcc7e0c9-0bfd-4143-9b75-b6e751fa76da@googlemail.com>
Date: Fri, 27 Nov 2026 04:04:28 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/990] 6.18.66-rc2 review
To: Miguel Ojeda <ojeda@kernel.org>, gregkh@linuxfoundation.org
Cc: achill@achill.org, akpm@linux-foundation.org, broonie@kernel.org,
 conor@kernel.org, f.fainelli@gmail.com, hargar@microsoft.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux@roeck-us.net,
 lkft-triage@lists.linaro.org, patches@kernelci.org, patches@lists.linux.dev,
 pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, sr@sladewatkins.com,
 stable@vger.kernel.org, sudipm.mukherjee@gmail.com,
 torvalds@linux-foundation.org
References: <20261126105725.767748294@linuxfoundation.org>
 <20261126190437.95251-1-ojeda@kernel.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261126190437.95251-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.11.2026 um 20:04 schrieb Miguel Ojeda:
> On Thu, 26 Nov 2026 11:58:43 +0100 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>>
>> This is the start of the stable review cycle for the 6.18.66 release.
>> There are 990 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
>> Anything received after that time might be too late.
> 
> Boot-tested under QEMU for Rust x86_64, arm64 and riscv64; built-tested
> for loongarch64 and arm32:
> 
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> 
> I don't see Peter's `offset_readdir` warning in my QEMU boots, though
> they use a minimal userspace.
> 
The warning message is still there in -rc2 in my build, because Greg had not dropped the two patches yet in -rc2 that I 
found were causing this. Greg was too quick with rc2, our testing time was not up yet ;-) And I was still busy with it, 
and then I wrote my findings after Greg had released it, which I had not noticed then.
Maybe in -rc3, if there is one?!

Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
