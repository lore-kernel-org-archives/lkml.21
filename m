Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962819;
	b=d0zBScNdOtofZWQHNHi3K518VADc0cMx9TFB6+TEbEK7DWCsWzd1Gipb3O+wwZcK1kOz
	 irY+qqiv0xhR/z+TABxWLVH5rB1Fkkfhrzgn8sF2mWYY0lT+MOR7oFCjuQpTGatrXDevz
	 xtt1+pFp/Jfh22iiIjj19BLFfWc8OX0bK5o3TUI7JcpE6Y/bcvAjmgUOlZwFcY4fElZIg
	 IOHLKHNcgeEX6+RKb1eX5ejpoeMYiNvSNxsd5Gjz2NHhDwphPp1CizhPM7t4EH1oOi7zr
	 zV8LE24wfvuEGTNjlbPjABxCdcfjkHI8L5rllWuvLilTUHqeNA6MUB76y6QKnhS29ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
	b=xTDAjp0WoX5py9/POXtCrajQT8sMk9mX4TW0RZa1tYOAL0rcZlg82gUOQCBj4DwyXbTi
	 LyXA8SnKKRijon8HVAd20ZtM+XgW8ir4ujVQv8oAVhuahwtrbn71vjXF3Ag6H8G4rFm0u
	 /XUbxSsiHhnYFhzt9jH/H7h66+MRHaIarN6sWb1l2S0FEiJbSxqP8hZmokeZprigjBPit
	 wOHDSP+gGNUmuDsljovHxxrDQqxW92DR2I6+/c5w2wL4u2taUYUQvgxpb0g9BrJot6jOU
	 Iy2GQ1xcE2pkkgfbza9hrG1Q9k90I7JPOH20KiEs69MS1Bw/6S3M2YlzcrMCxFXfu0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JW67F3Tt;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01EA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JW67F3Tt
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3ada81853so504267c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962818; x=1795567618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
        b=JW67F3TtYeElTtJVSj5teFMGo+XuLq9otC4iX7E8GBDpg0mGi9yucnrKia7Bi/14Tp
         eSIexKMeK8huhwnBFjk8SG6lsvizMqARIOUWtfYHO9NfflpHvSFk8hq/d9thsm6mWHXP
         7jN/v3sFWnpGGud6a1VP2Aa5S+Nn/kEpx49EYpnsXx/czo+T7rnrcPqfV3eVyCtHH4XG
         EYe3Exr5OcAEFS6iMXQKHSh5E1EMr71bWawtXC+rS91fjBzu0SUUVyzPMIWF7SZB/YvH
         gXwtxwuSy4H0oiXlSWCJHPE8Q1jF/SkvxLj6i4CVDVzh0mEA/fj9Dx1lD0tTZbUmDygY
         +KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962818; x=1795567618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRsbLllD1ga6dKK48ADUW32xm5TyK5xa4odFMr7mVjM=;
        b=nviFGSHwyVTHPW9isW/9MqFZnS3MQ4J1dymJQvYdsvjfzW7X0oN0k2aL2FfhbxTdPg
         ovgLps7WQZNb+A5XVZdRTfTKoTWgYe16HWTqwcHRRBGfOzExRjpF85+zYtT4xBpo+jiv
         dAZhyAF+ywc3PobrRWtHVqpV1OdovZSIZcZFkE28H4XukrLHrSitfT+i2L0K1iicWTGi
         15P1E0wjkjLxtzxLXuyvyZhRoXaoYTNKVAovMB3G1ETRADS1yDKXl5+WRo1Y2HAcSYpJ
         HY+JVn1FRsqrPH7tPzqtBM6HBvnDPB+M1SXoKMjEhzmDccXAID1n7/WmO6bOVQALIjy4
         P49Q==
X-Forwarded-Encrypted: i=1; AL+hErHurc+FTsjd4bJytNNodz4FBbLezgEODk2QymJ4Wvs07zMxUEAwpe0M0DX5k2akyIPnW5O4p5mYS59oL2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iomVapAstID4HnrhxgLmb/5FbzrNfLslVU39xkuacw8nG1q5t
	beuIEjVcoryqPCQd1rpLQN4JNJzmTIyjEhbTNy77VCKkLjZEKYVUnAni
X-Gm-Gg: AYBFou2wUErdgHM+81OQR42Veu/s0N/z1GY6fPmT6nI5ly41cfeqWoL0g5sXVOb8k31
	ETtxcQSnowsnjwcrHpYylLTzKEz/r3Tal2O2K5QGJ/nV+sxmQ9nlcjuxIdxSwzBDB4A8XVNbl9X
	TIyf3GS5EeuOkLWZXR8BbgIrtTPV10pM/ihvaG8q8ueflOGtKBToWAC+C0qVclLzXm2CAzITLkA
	gPCdy48q+rzeRMf9Gh0W/R57cCIsgo3ZaYm6Rln0lV/mK1qwNuBxjy6oJ8fjs12OBKVvQhFRTFS
	LwuKdmRsMK2LYycXcGI5iwqg1K6/p0yNfIl+9CjxBYvuwKnE8/Jnus/LrpxwH8aK4wCl3pd0h7L
	b/8ZfKJUPnpPQbcuhU0tSspubx+RFe9LUB/Cr57k7ZyUe+ugJFpn9pIq6B0S5Xv9/bhsiyrj8gf
	FHgPWMqsobkGkTi/DtBdg4oZsPA25xyNWNq+m/CtXNzAhhLlS68T1WUlqpfsOJbKCBD53LSB5U0
	VhBJavz4iDcm60DPqd3M4ai6M2rfrVMzCnZ/vNS9hZix004yjvA48sptoTJi8BKPQDoRroQx6QI
	DPoD4aONMR7mGNyTVqMSIM2/v1yOgz3hM8AprJQTFaWIe+a3HZpgi080GmVBc7lhQb2mJRViM3U
	H
X-Received: by 2002:a05:701a:cc93:10b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b543cd7146mr1086049c88.18.1794962817804;
        Tue, 17 Nov 2026 16:46:57 -0800 (PST)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2505940c88.11.2026.11.17.16.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:46:57 -0800 (PST)
Message-ID: <aa081f74-a15d-4ef6-86f6-cd81455a57c0@gmail.com>
Date: Wed, 18 Nov 2026 08:46:52 +0800
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
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com> <avxhlPnmjDhZlUmt@monoceros>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <avxhlPnmjDhZlUmt@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Uwe Kleine-König 於 2026/11/17 下午 10:16 寫道:
> On Tue, Nov 17, 2026 at 02:05:00PM +0800, Zi-Yu Chen wrote:
>> +#include <linux/auxiliary_bus.h>
>> [...]
>> +#include <linux/mod_devicetable.h>
> 
> <linux/auxiliary_bus.h> already provides auxiliary_device_id, so please
> drop <linux/mod_devicetable.h>.
> 
> Best regards
> Uwe

Thanks, I'll drop it.


Regards,
Zi-Yu Chen
