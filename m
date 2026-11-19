Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049506;
	b=oheFFnQ4OgK7tJMAte4H1hpVQJVU2tFJavNuf5yyecxNTZfa0dT6qVrxDKUH5HTRsDbD
	 OpbdnINGMx8qNrPrTJ1iuKlDpnp0gNlLLeEIEhtkN48b80dOfoXDjHh9sG5VP9SqpMw+m
	 tw8sSghjCI444Mvl7usfEmp/tXlhc2y8WvKcMT9V4v9du8z6wFEIsyGevdSSB5rgT63xQ
	 JdbAUtpTakuiO2nR70+58k2XitnV6hybyDygEM5yMCLgyYtABHkMbRdCAR4jkosY56v9p
	 VtfaTzQUm7l/q/PVE53EFIQP/ImgPCRH1f4pncXygswI7YysJzbqvN+e820q+zEUw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ya32YBMmsW8Ze+/UEBRzxYHvc+64tNFlziG219hEuQ0=;
	b=PtrSdj4vQOGBCO6kP03tfBwA7gGOOkqZQmDtSDowtYMMMhWxxqyMZwu4+eI/L26Y3QQD
	 ea35E8F86VN7N+bobKZK7IUiqEd5OPufOH70QsSHSWtrGcwXXOcDpUS+FDO6LsGF5XZaB
	 zMjRL/sN+UttVNEnDTLBlrFXaZoT+k3gYpk28nZXQz2YipapHMvWlLmpIYrGpztGfVwVH
	 xTsQVt7guSOO80CThLeS0LDoc7CTPu514Ofo8u1SXTHCLUjqYPuye9Yi0uuKi7KL4ysAD
	 SS43PaYLhrwhbXdmUUAtVjgZBZ8sRP5Lm2cBCHh64OPluDuZQWtT6yNS3TDG+7GZcUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=dqFekl+8;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9A606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B9A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=dqFekl+8
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so15487085e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795049505; x=1795654305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ya32YBMmsW8Ze+/UEBRzxYHvc+64tNFlziG219hEuQ0=;
        b=dqFekl+8A1vtYbwxBLsBIuT8BHV3yJy0PAqLGYIrHkaOqRyivGS8Ysi+WuInLupOzn
         3WAy7RONq2rlsJMsR8n1j45AIfxJQI3nht1LJ4C5A8VSUiq/QXuonHJT5w99T+fMLfie
         DhyKXey85k4ZclPMB0+9jftg6tsUsOcffHMv/ijC9q8GF5GsV/uIKESbKtZ+HkUZWy7a
         oKQsKBQI3BZlEKd8FdbW0rk+VFvKkIB/gXS6v1wCrzF+xS9YLPGC45KOdJxjNFerJiZ8
         I5TefHL3JvBSsSYxX/QdEuWawkmitrPyAGH7WDt+n9JO0zL/7l3tU8PiX4xK0d78dOkT
         YeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049505; x=1795654305;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ya32YBMmsW8Ze+/UEBRzxYHvc+64tNFlziG219hEuQ0=;
        b=lAFlyo4UfUO0vBuJCo2b/s9QRJ1EnL0R4rIj6164jstb9UBx4JpmoXdJOGiCBUmbCF
         O4ZAamwiOd/xCypnyJEf2a11790YYTGK4cqYbCtoSbxvL3oiFtTkyYTBUy+eEV4Vsl7N
         07WClEfuUkGJ7qpt6rC3od0VDNgkD+BCNULiSLq0MHCFvlZFs7f5BWyWJZHVULpyhTgv
         iT9HxPjQl0MpBFMt8/uOC3Kh3yXcGaF39AOjqEPyuUR5jDOOcrEI8dZ438o9y8QHn0sJ
         w9a/ykpLbim7bgL0ur+b5n6b0vDLJUJ4Y+ofsvhJYNxqjtqnpqOFeepWvyglgHdCVFOk
         7dVQ==
X-Forwarded-Encrypted: i=1; AL+hErGPl2DSzrf8Fg4wMpicWd6yNakGg44hcVoChpGME/wm8DHm1EE90PrCjc/uu0z0HT7JsPWSmUSdLCmEouI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aBaGTLHObgVkRuxABBWvG7RxMAwKx7NtQSMK6otR3zNs+Ue+Q
	4D6IKY9nSwGz3OgOUp0aOofnwER8yCCIVlHApr2PdphOrQxy3Z/EAEg=
X-Gm-Gg: AYBFou3JIorjJH+T5uqmbX5e9ZTivKAtM+lF8RtlwhgvSNmd6pVkza12Evsx2Bzaj2T
	X95OOMYy79QNJ78FOizAqqwV0B+dHOM/7M8l0zcI2GCfzipZloGsmijR4AwmTW0EA37CmjCkGuC
	SNS894u60uacGbIVJJU4gA7VUYYU9zyt8+EmFR4nWhu+5mr7SaxMIay3xwOCeXVLkTiqY5SNSUV
	7XE5NTZZ0vEqrvFhI8T7rpyaNgKw0pwMs4567YJVy9b0tskgru5XfV8YvpyFWMekzg/wk+wjxvV
	uzyGEIUKqItRrsxB9XhW7hTD9R2JYgVc7oVQ1Hb2PXWuOCq/7J9vefSoWhS/Dt6fs9rBc3Z+h6b
	c8tUYsvHul5u0KSLsjH4CBdVtSF3c1df/fsoLBGCb2/TI2H3fGJmqD9IGBJazSJlsrx0Fo1c1pM
	o9NFZ54epkH4NjZMmYvSwjjebdUMvfQ+ho+ANgBleKnx57i/5CXu6irG//7P/n/mtzZRy4czSC0
	Ip3+XvKK/frGhnuMUm4Cghp60nBITMYNFws0s6zTW3ArwBoPoojD0IFV5AgBSsVGBKrOQmTqgrP
	PCsPSVZFKlZXAums0l8Y06VAWboKe5McS2RfPilPrO9GFYsB4hIhCUw1IXNHODg5bE8Y+f0PpzQ
	Lp8im4g==
X-Received: by 2002:a05:600c:4504:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb7da52ad6mr78902545e9.33.1795049504793;
        Wed, 18 Nov 2026 16:51:44 -0800 (PST)
Received: from [192.168.1.3] (p5b2acb64.dip0.t-ipconnect.de. [91.42.203.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842f9348sm10626015e9.8.2026.11.18.16.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:51:44 -0800 (PST)
Message-ID: <a67ab2fd-505a-47d2-9689-fb4086377da2@googlemail.com>
Date: Thu, 19 Nov 2026 01:51:43 +0100
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
Subject: Re: [PATCH 6.12 0000/1756] 6.12.119-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150007.957976754@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261118150007.957976754@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.11.2026 um 15:35 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.119 release.
> There are 1756 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.


Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


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
