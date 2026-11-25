Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598192;
	b=3RiFPn5AdF0fXRBkbFzHmsyNe4CoY/GIK+u20p0ePMVsnqFwCfNs9UkyKtgp4FPEe/xg
	 L/QYQwbMKkmj7CtmIRtKwmnWndYxd/wBCPXqSt5bBlH0Y+fQiPujV3Y5Lkuuv/FO7QDMs
	 KHStoUOHaLeeB7VBKZANtDxGwnN5j5CrBZehyIfpITu2sZJwAYjjt27zirIzMejXrk+41
	 SQgOFQm8jCFqve5UJSGz3F/g2jylVphvGe4jknYnFujk8lRhmhwBu4SVmoCJrJBgo9hKY
	 WNq7wVm3BkTLYObNlrp4mGr1Dh48+5/Ks/PtE869ON/CYGtxA+dQTcVBB3rYNtRoY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dtSXApRzNRZOAIEEk0PFvzNQj92bqLpekrXOKMNLB6U=;
	b=YgF3ARojeVRHIOLh5lXQNmFdQEohC6MRgG1eeydLX5Ni8++P4EW8to3POD8FDQh/SjtC
	 lp2qFauGqOVnYp9FBw59R6PEuZL8ice3+FKovfu9R8xUQrUL/S4N2wNjwWITDxwYm1P1b
	 1bsD7eovKDp+9UXtQu8x8/kugqNoObgQVd+nOgOl140+KFh+yn8jc6XCybatP2slVIPsY
	 xtx/d15aq3+GSycHQE68rMoWp8t2YaR7dQhDCeRiC2g1C/I2cMsGiE9Fw6GeFk50sNTfX
	 VWpGKajOvYvWPmFuwWMqlgUig8wpYyCU/knyHXTonycE/3iP2PbtWWR6CkMjIyEcTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7mdlKEc;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FC606A68E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292FC606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7mdlKEc
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso49586881fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598190; x=1796202990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtSXApRzNRZOAIEEk0PFvzNQj92bqLpekrXOKMNLB6U=;
        b=O7mdlKEcxUoSuWx0Bx0zYAuwKq1/6Dba4zzP6J1Q4OrO22h/vNkmSvCbcByMeR3eG2
         vHcYl1rPNSIe9Hzz+/xaLEUj++SPl5TWt/8vQrT5JEendwFMwU0uktOF4pDUM0s/033W
         b9Hlyu1xivQnbS967W1aBbar7zJ5O1gfP+XCtd3ulTkYuYhXXqklzyVl+7DOGcHdIu2a
         WQO8K7ihUlkHTYZzJ/QlF+3HZFLOqEPk7qVUalT0NWcS+XXm2yDV/IVN9WfXNtnD45iC
         6nI4lZbwLe04O8oy7K25Y7bkpO813hKh5axeBSCUxVO//5bp/Vglf5Z9AjpbpIll7k36
         qk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598190; x=1796202990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtSXApRzNRZOAIEEk0PFvzNQj92bqLpekrXOKMNLB6U=;
        b=kCXHhwywBS3zGA4DG7CbkZpSVJ5428CsHJdhVCSUbFtf6ur1sFLhGmQUkuavS/vQlu
         p1baDl45GTl+5U3Ji/2CNDts/jHAiheeg+1SLqnf6w+54DXueylxhBpnfsWYU+RtjS/i
         gYkbdkG3cMKMvS7Q1efVxt8nYGar531hyySK7hZmJXK8j6dwYciykNeRRLHHFhiDyjVm
         qmhasCIbechQU+OsnbRdVXsLdF3k9XGgtSysvAqkkuLYBAT5HKhczAGSoMymzKrI9W1w
         F4foC9Rtx1OgK+CBTgsds+n6F0nS95HPpwSPh8a6khyrm0/7wo542l2nJ5/wZeKbboGo
         sekw==
X-Forwarded-Encrypted: i=1; AL+hErEkj0IVDb28YOPpInmq5nZNrEPMxpTrCAL/13kOhux11FslgShyyNFKAmjyithhffV8SBy2SF4qLcy1uvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bYtjJ5R2PdRGivPwkf1KiIyzzMS9eGzwOVORP7mse+S4zXqZY
	5Q1tag/ll+WzNhy8hWIJoN67vqlwquHHDLGHw7oKhyGKgaqjjC93AvnA
X-Gm-Gg: AZFdTZcSq+x+pOAnXLvWTOG+BQGCLHM6jrzi+6jgcdC1VVNDIUaL9F3S4Gd34nDsqt4
	4IfzNKJDPGbYnK1cVKLnAqUWmcOv2QM4h5XnYzO+XqJ4b2PuQXHZECiMMVdXKOgGQfi7MJMBBoY
	VHCWk7VvOrUE98FAB+HG8g9XHH7k2EFmUDWAG8e6bPPIVfRrOB9e1zkayR0c+CF4W0Vzn2hOvx6
	cSh1Qo5DNxmQbX9PGIGcP9e6U2wn/hHjriOUKKQJWA1yOWd+gVhjsMQ7YIFQO45371F/UGq5i1x
	DKnszgTbwwu1xDx8fkWl/JUT5NGRvVkZ8gultHSozhxXWysLfaM4bjH4EeDJlypXYFAWBBznr8N
	P6jr1zB6woJvodJtTe5iS9r5ZeMLu+KJQKJaGsrDUK8U5C7fKOwa8mw4TJa/PgCrgE8jB1HZWbB
	Mt3YCGpVeQRXSTJ2YwEjmgjP2s8tvTAluT6FXLWkt24lwA0+iS1vM1nvAuXH55N2JdLqrYgjgWl
	kucAO+vdDKfiE2ENU9tzDCb/OjfprmARRmSSBTKPUAUhWRiV9Jn+FZPDwXgh8SU9KnVPf/dlhUF
	0nptX73e0CHIq6aCZlVdOSeSVxp/sIP9AKkcGG4ZwXno5GtM5u4aLkCAxziEdwSIFjNTqGyTxxM
	Hq2AuU4uSOpYpvP0vyFMCQk3FOLI6+U8drin56PRD953X6px8/CHNba3M+es=
X-Received: by 2002:ac2:4c4d:0:b0:5c1:4cb1:f5b with SMTP id 2adb3069b0e04-5c1bc66329emr5991855e87.1.1795598190134;
        Wed, 25 Nov 2026 01:16:30 -0800 (PST)
Received: from yantra.. (nekmmqvppk9cj8danf8-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:f131:5b16:1fac:1214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0195a6sm4528963e87.40.2026.11.25.01.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:16:29 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: crofts@kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] iio: pressure: dps310: include what the driver uses
Date: Wed, 25 Nov 2026 11:16:26 +0200
Message-ID: <20261125091626.55286-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f71cfc2e-9e74-482c-a56b-8b0507eb9a69@kernel.org>
References: <20261123220649.36887-1-zoone.rupert@gmail.com> <20261123220649.36887-8-zoone.rupert@gmail.com> <awU0bh5ChdbAsArK@monoceros> <20261125075043.37440-1-zoone.rupert@gmail.com> <f71cfc2e-9e74-482c-a56b-8b0507eb9a69@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 09:01:14AM +0100, Joshua Crofts wrote:
> > It was for the of_device_id and acpi_device_id tables. v2 will include
> > linux/device-id/of.h and linux/device-id/acpi.h for those instead.
> You don't need to include these (unless you're going for full IWYU).
> They will be pulled by the respective bus headers.

ok, will drop both in v2, so no mod_devicetable.h and nothing in its
place.

Thanks,
Rupesh
