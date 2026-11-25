Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575805;
	b=jc5aaiJ/Mqne2aMpueYLJQqdRrKuZ9LxllGraUjLQ3rMCN/HeJdRBLZ/v5AVtLXFPsPh
	 1fNwJ96h4/TWPn8KYewWlHaPH55mPpeVJKx6V5H4K07/pBqmwid1ZavgDNg6ikoh2FTj/
	 vh53SFIVMSDRizqw9EVvtKvn/OpYmCOsHEYt0XJfMKM9BHzBdhwzP1s8a0i0I7sSVn4Vr
	 fR0ynUj/1sEqAh2A9/jt8MTnlMIg/rzeqs9Y9ngX0Wn+OzN2A4NXyP8wT1oqT1GisolcN
	 cBxsEVMNkuMbmunrmc+R+lNZVjmi1QfMNhiG1Ec1TWtDFxUMyksThr1mKOIHRbGReOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YqK2M/Yynv5vzFLqMgSa7NJZjQIGQnS1ueWuqR6kXUY=;
	b=pIDQh6aMySBxQd4RaqwYonSF8G58s0cdAEPQ6GR9eYGEP6By8R5pvEIpdbFvMst0zsnB
	 efZuxZluT2BgpRwypzlkhLcBGQigqVNnozpUC7kzuRIAu8XEY2rkhQ2xPPeG7rk1BRTOw
	 khArEF1likVF68klHKo3egIWPXbLfqMvP3j6e64LpBde4XjnHiBsrcHyxbW2OWFSd6fYs
	 THoHZGtoq3AW7ZeD8Q8+HQ9rEWPVnYY2pFr2rbo+pIge8krPOEGSc5mkHjDTdIqN4qN2B
	 Li+3itB2Q9WXhllJko23w6nx80Y9K8GnY/yoD6w8ITPYM/5N50xol73V5o/tFIkbivQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufNniQ5X;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2025C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufNniQ5X
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c336eab8so1594799eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575804; x=1796180604; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqK2M/Yynv5vzFLqMgSa7NJZjQIGQnS1ueWuqR6kXUY=;
        b=ufNniQ5X9qByJ3a6jXn4U/XqEKMbII8PIg5Y2/CQlesuBwYx4husTAd+Vb3j9RQD2V
         K3VsfOPA8L93SwWTwRhD3IDJXCUdlK18qecUSlnOoNfGy80TpuWlDlYr+vADnXcAbO0n
         SlPBCTdoOUISCi/ZFW/KTmFLr039lWTEeTK7rPQkCDgQjlL8cdMvU6q/oJPnTKn48u2l
         T2Q94Dwdb8q+LPnjwzbAdH1wxJv+HDrKTRYUlYN77GpbgSZfAe3BhXwvX1nqRW+IbPT5
         nm31xPEUvr1lOm+K93PNB/2YXe5M3Nm54uctf+yiNZ0m97agP6DX302dJNxjXCoQ7XQP
         0POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575804; x=1796180604;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqK2M/Yynv5vzFLqMgSa7NJZjQIGQnS1ueWuqR6kXUY=;
        b=SrU1kjyA6HdqVAQlnsu2n/K/k39BRldkPJIqM+PfRJJQ+iSzle6yJdYdm9F2hZVSD+
         BGPQzOW3BlsgYkcSuEwRTs2gKmFqMDdiZZFtUWMtZJ/SZV1kcFbRV6Ta04HhVEBEV/SK
         4yjgJvHziaznbQjvqht9OC7Vh4sT4A57qrRhQmdiPdC7n4rlz5YugT3671JH1Vk8nOi4
         rJaMWiXUOIsEe/+mB0OSaa7bZ0P2OJCKVilAxAKt5B+cUHhtVTfVv2c+tn31xlM/cK4i
         RXkWLZW+OsUNB17ApQSd77Utf/I6i5OUEJLYOkBu4/ZCPP/VCHxCRiFL8W7oQ+MbqGlG
         DwFw==
X-Forwarded-Encrypted: i=1; AL+hErFJsdu9T+Bwhca71K1SQgNdXyAdAJVllMj5YbSi5dv+0TWf6MGOrHPwp0HHVIihRgpHl0wmdO1LsYlQJFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iwZw2sdj2sbw9mbujvl0YIY9BxWQgefxJJNT/yALU5EsefHSQ
	8EUckmD2655XrisUVEQCUZsS7XoA1lCUSRMXYeDyoTdY4rqdUbGGmI9M
X-Gm-Gg: AZFdTZdjRdhYKg2h/d5y1jt3fIWW8baBzbkeu4o9c7ZC7axyJsd1CNZgk7dpIYFIlq+
	buq4P6AxJXFVS0XETaak5Wqiw5W0H12UsSeqfHkk/Bw63PSRs1CozPCUy7RarGi/XTnslI+by4b
	c/1Zy5a4TQmMdNwc+I42KcSG/eCpCifkZsYx3QaDezoTa/u3tLTUez3rzxcJK9KNE+Q2iziooG+
	y6aBwPJtG3Hvtd6VuPWhLv4DpcCTPJ5/Kp368Viv8cHX3UAB1iFVMXS2fvwTru4StvHJ36WfGzK
	VOdVYQLzFdXbnjccstN9WeGM8oOzAC8SHQdbrGoyXuFmhTZy99SAitbjs7dOtQBFzzaHNMrZrSV
	UqpmgIGXA3Ennx/+oH4S8QffePUoNtJDXYjJSAanolmdVm7OdHmljnyi3Nxkf/FERYvwScHerTu
	7ZuKa8mlnReyvi+g04ULTIr6zLeqEIQ7gJbXa+qTaF3mkHbKjesenD9OjsrEvi0moVKQP1moiiS
	xI8XyJH9AqxgAaXX34KLwKpHpp7voaNwwXxYznU3gSEz3tsddKr+sOINI07S5EWcE07rwg8FuZm
	e3BQ7ED9q7kyy51WZRfpqR8TySDjtUJ8hIOVRwkl0ghrBsYxFabK0Nu1sSmTyn4YVFPGz2oLEkf
	Vb6HxW/sxBIV5883KM70XlUxJ
X-Received: by 2002:a05:7301:8616:b0:385:9424:5c08 with SMTP id 5a478bee46e88-38594245c66mr18684521eec.4.1795575803736;
        Tue, 24 Nov 2026 19:03:23 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm55751171eec.26.2026.11.24.19.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:23 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v3] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Wed, 25 Nov 2026 11:03:17 +0800
Message-ID: <179557579759.953320.4240333903133893045@gmail.com>
In-Reply-To: <20261124132521.GJ3898744@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261124022219.1834499-1-shunsheng1218@gmail.com>
 <20261124132521.GJ3898744@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

Thanks for reviewing this.

The devm_free_irq() calls are intended to protect the lifetime of the
sensor objects, rather than only to wait for an in-flight handler.

The driver requests its shared IRQs before allocating the individual
sensor priv objects.  Because devres releases resources in reverse
order, those objects can be freed before the managed IRQ handlers are
released.

Even after the thermal interrupt sources are masked, another device
sharing the IRQ line can trigger rcar_thermal_irq().  The handler still
walks common->head and calls rcar_thermal_had_changed() for each sensor,
even when the masked status is zero.

Therefore, synchronize_irq() would wait for the current handler, but
would not prevent a later invocation from accessing the freed sensor
objects.

devm_free_irq() removes this driver's handler before the sensor objects
can be freed, while leaving other users of the shared IRQ intact.

I agree that the commit message should distinguish this lifetime issue
from the delayed-work race more clearly.

Thanks,
Yaohan
