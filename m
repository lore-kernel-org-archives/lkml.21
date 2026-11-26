Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680775;
	b=4UihDxbirfMa993AgZGK2fMzOO9x5g9txW1BfAuimKiZ9vXDS1GQb5uWJCNZeMC6lMDc
	 ZO7QJn9Spi5cNNoFIg8sUb/mj7jBa5aFqlUfBOdBJIlx4I/T0lvVQdLq6f5/MC3XCiU40
	 ViS+iMMZ0u9k3btW4Mk+gW2GF8t9W+wBKHOzpn9RUTOrZ3bma/5RzNuL+Z/1Qxm1qVlTF
	 X2eKQ/LzwziuO4vB8V7q9YpjYYNdoEiaKAxS8b9DsHp/fk2T5m6sUw3GNW1VcZ6Dl77zL
	 sl/RBeIklOyhuDtnQpIg4QMvwdzIBNbbN8WbLfUDcvl3aAxnHkWLqPa5OK7VPqpVrRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HF1NIA9YcotgBX4Xrtg69ziwH7IW313XtsQmHrwnOgM=;
	b=F1//U1U/LskUZPFkDZq+BQ9voNgwHO7DlJSd6aITgaKqNOQJNgZJz3bLRJUPQPS8ieRU
	 1XAL4jqcE0J5QBwmJ3KvlIbab+pD+cna5zZrb3a5IjMXN5Reo+JXCLNJa8c6/b3iLYUnr
	 zIx7w53ceUauhTLKl9AtNFRqg9SnPCgBY29hyuy3qXlIZVTDp++n/6BtD2CmM3rqEewFg
	 hBAh3sEIFJpoMM41p3U8QXWpS9MmxYmT0I7o/drW4MWYYwrO6qO1XjPcvjYWRDKC8u9Uw
	 FCInWpsm2g8gjfVmkCbBmMELlKQn/J5nDDrb0bf0/ZqoAFS48myUJ7t/24bMnYdmI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aZ1IqDN0;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F24B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aZ1IqDN0
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5163969f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795680774; x=1796285574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF1NIA9YcotgBX4Xrtg69ziwH7IW313XtsQmHrwnOgM=;
        b=aZ1IqDN0uIoiNuSSBMl0X5B84fRbreqaiDS9uA4+WP+o0Xcd3JThKU1wp836YnIoJR
         01rv3lMRMX6EHqkPhVfOzzPBXDZ2YS2Rrr8ORRGAHYNmWnhwS85mvyNr7uufeWswoEVz
         AKxIcSni0Y9XVcqixFP8C1vwcJXmqspKGWzCrzI8uJsYLNl2ppYy/MNrbD903GepnKrm
         cph6sclytv9c3mh0/NZzD98MviAQbuRFVcqgPQmqQWVhMoKwrKErrhXK17rk39Ajwlgp
         0Sf2iS4IpC5LB+/GcjoiMc+Pn+Mq0RHAAaeO69u4t3oJVuFd6VtkKOUPCD+Mf+pHxzJG
         LzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680774; x=1796285574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HF1NIA9YcotgBX4Xrtg69ziwH7IW313XtsQmHrwnOgM=;
        b=IPz18Gn4pJtd1orWgjlSi2cngz3muIBUWbnBsx2D+I3LEwkpnmwdCGDKttlPjXr01H
         Y8l36ohK30SUWG+YLaS3NDpW+S0uuo0NiCgweZsGTYq8lWB+AjOydZOp2ZkjTSindFu2
         3ezWHZstIVAJKJATcRZ/TD73WA6MjUbn6dd6Q2NfxT4n5wgfnvWjG2KWNX6Df+KtPV8O
         GW5DStr02eZe1V0g5aDk/6wwX568YHVcyRDk+wQXMROraS2tPKuwhq0c4+68TdlNWQmb
         qFebIn9xPZoJFDmc0w6sGAfGuR6+rcAhkqhUqRzACKjtQx9sYEnvsUmI8he7E9BAJ6Nz
         DBhw==
X-Forwarded-Encrypted: i=1; AL+hErHzd5jlvPWb1ehoYw5DcY6pg2yTDaZxnhGT0IKfBWfU+r//tORfgrW23vuTHZPPbBWl3gMh0ZUyjji46ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yyq1I0PF2iW+fCV1mc2IWFyyw3eXPTxYtt4NSQb1Gkm3kQzXa
	AUtThJdigoDaDmoIv1xBxsLbvngQQ7FrKxgtbVKC3rNneDxbZGSEFcM=
X-Gm-Gg: AZFdTZdCrJOJk9pN93pZNkolL14Asfy2EjydlQ+5vi3peMU2ZtpITalym6iECXlQDqo
	+pKLh7YNxftyE9AsjDrpV2RS7YMltBVdplGclT8a803glS4b7/jKG9eky/OO37YihsMSvhq+ne5
	Z4Xq4k1RVHtKgdjPbms0/KrqZJLyp5U8k2O2yUjrivX0NZM96Mxe47PkVq6qWswXXg12zvi9kjq
	COnqgcu9PB2nx/t+FCYUk44VT9iAZ9umXlZNx1k/WVRp4cSfl9M68HnrlJqeDqP5TUoahJncX/F
	CmsLb3QOxuRm9hdejELhqlJrKEWzcyngHX1958LNxHNtIqgDYCDObF5miAigGrfAJxKknzODCg0
	7s6Mz3tig3HmYPy/sVul3sdsm3AsIfbyhK9ar7wDVojzbcYloBOQXrtAwpDsfHPVUhc0ryLQDkf
	No4EAUgOJ7x1+OzxiW0/9wdwIjNMWA2wmICPx5ISplMIuNiQFDD+RylBoV1FC08R2Piuj8z6bPT
	u/MJJtE7dgduLoStVb7lAkHgB9ixUNdtwyDi49ow129OIWyiKLRbU0fAHHkMw8VIQgKjp3I/y1J
	H2eGRuMEX04eXKMEGrWhF3x1E3qyaUsgWQbmGRTIEBkr8xps+GPkod6BKeUZopQ0xT5cr2fRxM9
	p+6Ij
X-Received: by 2002:a05:6000:420b:b0:4a7:518f:bec2 with SMTP id ffacd0b85a97d-4abb2ce47d7mr40551231f8f.28.1795680773406;
        Thu, 26 Nov 2026 00:12:53 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac210.dip0.t-ipconnect.de. [91.42.194.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm36790497f8f.22.2026.11.26.00.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:12:53 -0800 (PST)
Message-ID: <db3d4f41-d0c3-44f7-b601-770031fcda5c@googlemail.com>
Date: Thu, 26 Nov 2026 09:12:52 +0100
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
Subject: Re: [PATCH 6.12 000/816] 6.12.120-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261125143849.205329330@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261125143849.205329330@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.11.2026 um 15:25 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.120 release.
> There are 816 patches in this series, all will be posted as a response
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
