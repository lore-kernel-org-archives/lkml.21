Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059136;
	b=3C8x2C9SB7/Rca6w59IufuitgEE8zaOFH1IUCLNkVRsg8KSIK7hMumTQEATjuEdwLebW
	 I5zksiUe9f+WO1geSUNduj+Ok9tsgsOba6sUc72UhnTxSSrQQPhYPv7IMyx7wdXJiEnny
	 nvaYKqUN2Sn9Pw0yGiyhsz+FZf/LekWdcT0F0O6sUL00uz6jE4YAsQcOEigePYHB07m8S
	 7wGwe1yMoJt153m3a/JxZZRylyoHnCyew8BRGNOnqk7vJU3Ozm8d4OKBYvc2soBCfHMGz
	 X9MPVwRtN8xrttBzDTm6m4sIpWF/6+8GTjIojSKwvsK1R+vFL5LHiz0alhtBEdjFNyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pAo0sgsxAqoikRuu4Qee0vGiWqDOqsoV6WEE8Ptn/HY=;
	b=hDq09LataSnl20LMSOLYdEb6EHPbV/qxTTGctTyG6tPWsmh/WBXeNNA2H6/UC5okw+y1
	 tVjgJ4gREGdPpZY21ANNAHYGIPBp45HabF8Fl81BhGSjy4W/rtCK4CDFVMyZhxyX50KR4
	 15N1FQ+ozkebIG5+EG+T/XyNBdsb+uoqaVx7qUyessuR4u4PaYnKG+sQK2SVqOGfZvHqj
	 NOHD6W0RyiHf19yDqK1ajLLUTx7tNqt3a10nfV19jNkNIc1HZxVX0CABcIWuHRJePxxQK
	 9XUi6v86ZXirEiuhQQRtpCZgp0EbsrqFBp8JNuI2ZLVwAZmPsstZgJb9wfr2laB+zEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9MkuLyr;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BD606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF6BD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9MkuLyr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13210735e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795059134; x=1795663934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAo0sgsxAqoikRuu4Qee0vGiWqDOqsoV6WEE8Ptn/HY=;
        b=Q9MkuLyr8HivpFVSdMlNZYOd03HcWkG+kRciZd7BSKv4rXm33N0LwNHdW95vCHxDI0
         ijcdWeJjc3Hm9QwGpzDTC+irApkfIQo6c30FdU2kp1FgmDLVKAncjPLWAJttEY0b/y+T
         ZkoGJqV8Z8fujvaj7ioPbBN9Q1QzHQTr+X7C5mb4oomlCNSZQyjJ7k7OrYRkMUQljyyL
         b6GMUQJwL+TBI8yLBJ9xdSna/LMmSB//ob/9H0jAoc1z3wMtslziGl9PkKtCtw0RaqEG
         dlMM4LnP9bPDPuV4MbG8GaLeYyeQtdpGyd3ErCTk0r805ayvuI7YI9I5Uh6aW+D3c7i1
         lGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059134; x=1795663934;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAo0sgsxAqoikRuu4Qee0vGiWqDOqsoV6WEE8Ptn/HY=;
        b=OCTrkPtmIptHmI+5Ab0YsdjANFl6cT87vypTEqpK+UNGmAwhtFgM3RP2lIqPA1g/lF
         umOi++4P3UK0NozADeETIktPqfvtNol6DxVPK1tOGGJuMkDECtGL3FpLcL01moY00wgJ
         GPWcMzbisSopPzkisDJdpRgapbkQAMLWzmJ2+vasdgdrv+BXGkLqzhu7bTJFuAGM0re5
         L7bMCHRDyOwgYndcM1CmPUn2pRF+xKYNB6JrJd58i51gRqEPBnXgNho/yHIB55Vv32G6
         gRjNeQUSOUPCSrXomoz7pmW7ecF1eTHWSaNFEWXqZNZTV7zQjd5YqQLesyS7Skfm6Hf3
         eeXQ==
X-Forwarded-Encrypted: i=1; AL+hErF/NeB3gwejDMPwiYERKYxxzSoZgtnvB6wFbX25QTjT1x7L/WiSSi4TK5whx/6OnY2see/xU/+Z6hqa2NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TJ62FGELYAiGsr4f3ou6euTcSNzJ/TPnHuDNYY3xc7E1z3yX5
	6xYBKmPpXxFuugRvo3941AgSGvgJw0pXmSKHyrCsSjSeYCzNZ66Aegk=
X-Gm-Gg: AYBFou0Ldga+rPclF4ZMZEiRNIGu207DM0R3YZsweJ1GoXaGLk6x6WspVCDyLhvIgfJ
	GLQX2wcKMe8etl3lmR9O3t0uJEtFnWzCuKwkdSWOSqVXA7yXSYuwfgokUAqU32V0P4Ug04u3Mgj
	yAcUOqDpfjGpbQrvYK478QsFtjjWqmXew+WGcgoXgpBBjZ7jJfsgZSJEuJhMw/zj+wsU2s3tUGn
	Lb6Yz0p8WUHyH+/QOwOmUixt0pxcH+OwVyRFfzIjI+PzHzA5AUjcOjkz8nMdszUrtEu28gNDl/4
	QM7qFKfO9cHMmOQcDrUE1PGyn6weSzGAOE5B6ooEg0Nk2w7m+7kUndjYUXB3sgZvUqhnmNNoDkL
	FV2MwR1gv86g231LCbP89FbU+5+5lCUFCkbrp9p5WizhTjRXan/tdBoSz16aaSZZvaClq3mhULs
	by517qP/LfBVdDJnWkAjZFsQN3Gkh6IMAAhVN7LW/AZTppZCX9r8Isnc+2uFxMoO+EwVQecFoOw
	4SGyyPoWWlBMFvyHBX7gqjp0TbkTaWW8WLYkXZfgNYUkVRHDIfTREJ7/6sLsbkzxOMH2Fn0hqhk
	REojrzsmJIzS1fiOtMek+GWmSZp61eSBUSEB5bs+aZeEHupfYu8Ts1dJL0wLcis+lbxxfw3Ead8
	FTu9R
X-Received: by 2002:a05:600c:3e0c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb7da458eemr92432145e9.28.1795059134175;
        Wed, 18 Nov 2026 19:32:14 -0800 (PST)
Received: from [192.168.1.3] (p5b057d66.dip0.t-ipconnect.de. [91.5.125.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8532f1a9sm3566085e9.3.2026.11.18.19.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:32:13 -0800 (PST)
Message-ID: <8a4f9aed-be54-41a3-acd9-d25458885ea7@googlemail.com>
Date: Thu, 19 Nov 2026 04:32:13 +0100
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
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261118150247.972732815@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261118150247.972732815@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.11.2026 um 15:20 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2651 patches in this series, all will be posted as a response
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
