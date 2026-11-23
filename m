Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397182;
	b=Jl2OaVBCj/qVW/8cSvudXf6FoUCLeSjAO6wbqbh32dyiSe9WRuOvuj/0z8FBXh1OQqDC
	 I8g+1QRuHT3JHTB70UnqTBXIuHzNn3JSJWaB/ggP0otsBPvhr67JU42BjzmIpLGV8+Yi4
	 RuCaFfrpwwasUhQLiYCd1IqIB6RbwByTargkDHMknD9UFSQyNt9zxn/Pz5QCIxsortQFR
	 uis0ToBe3M0IgZdW8Q39L3y9z4B1/BLkGqPFZokqhAflaZqrT7dW4i8ghY0R5Ps8G58qq
	 UKY68N7PmRuOD23NgrUknLqSkp71p5Pv3LZOBihinyQpbr6FkKZUrm7Dcb4EdHoKh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=xbce5/VFlKnYd3/rEVwtGbBP5JyQRMDjlXIwX2G3An8=;
	b=FwmzqiLlAP7QT3GjGOrLVMmfQMVDLr6dgqpm2RulACv7n8WPmQXtCDI/+yNBMG+eOmnf
	 mjhltzCnZGEGh0RKpdHtRj2KIJZVL9+qEIoUP4ksveytDkWy7av/RAsnWIOMwfoC/ZFXW
	 YRiJw+iiOzaZkjA3tpxquxJtoiC0Um+UzHmsXnN2dzU7OAG42qgQ085q5XzYRR3OEF+d5
	 80cCLaMRGuVBj/fZHvRgJ9aQKiFmwTK3lC+OpLCq5jKDAiOikA7uJpz82g3BTobmSgZ8Y
	 Eyd67Nfg2W4OnIQ26fvSAiuoUsKyu3UwZKCxnFOpwv7h1oV51Xm3aHTld10sktGandw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a8noqMnf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407EB606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407EB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a8noqMnf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38692f62b22so987057eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795397181; x=1796001981; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbce5/VFlKnYd3/rEVwtGbBP5JyQRMDjlXIwX2G3An8=;
        b=a8noqMnfuVuk5b4VdnHc1QI+6OCN3p01COsjTKYAuVm0EDY+Dz27h4ECoBKyOuft5H
         GnOSrUUlSQ0kplkbs54sijeXU+MC3Dl9FBUIDBMxprK/ae1AV8Rw1HFJc3z6NI2SliQ1
         0K4mp6zMA11LG0aS4vLVNeC0HnItkT2WQQGaCoLARzfCJ0cjuIqf4O6HLRaxSMRALROA
         xs0BVo9/ltS27RYFs/Pk2aq/APnRNSry1msz2/RIMQ0OXqb9BJNOB7o0TzuK65gPiOBv
         KYmcWveQuRZ/fbFuS4mzPjXsQ0YOuSORjox57iAA7hMQYowrI0rZpQJXRACGwXvRYm2a
         PAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795397181; x=1796001981;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xbce5/VFlKnYd3/rEVwtGbBP5JyQRMDjlXIwX2G3An8=;
        b=nHeGpcDP8rhJpjSsILF6GsXwZnfvLT5ZDB2tZY0w6tbQm+4F0ZEGoPIAFmuPBNLNhW
         RDBcjbpVGoEqGjfruJSDHGH6kbwQ0ZvmaUAsBa8CuqtDWNiEzgzTz+M0g30LdRoyEdLa
         svyzc4108lnWXSgGDyPUmrRrsupGMnrCkkT+eTZtfSRCnVPMMXBQo81V8cyxqo1xGqAC
         /bRVJfTDUh0nhoiw6qD8yeuxGKJMwxadB5TD3PSbqoe4WrhA2+Z909DOrrbQ1+MdFsH+
         xkNjoGhhB5L2Eyjkj0lizN3SjK4lcBRPXkqplygKEazNVwI9mTqUkkwJEBdKKuE3MS9/
         hahw==
X-Forwarded-Encrypted: i=1; AL+hErEIt1FLmG7l2QWP0h3tsMnG7OdfxccatExFuOSRgM6vHjf7QGlL4GIuWtzJl1/3AQBqDHOsS1rPMwSgv9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sOxJax21oGW9oAFFtuOzGQbaFKC46lgnRbW6zV+hhGD2GOQ+X
	hR3/+1UY2xsoEEvMccpfcewvkZ6slKe9DIxM6WmYNDmXpMzparssdkMJ
X-Gm-Gg: AZFdTZd1/MHiZI8Hksn8gS/kghD8CUWL10uAbxgbJ9OmkDAj83C1YdDBoCsM7zFfH/8
	rbH/TXuq4mCSc6nVLjjh0SLr2Pei9u0EGy9U9Y52+xFc5yCfzn6JC9Xdt8tnYwLxbypZrdM7ukZ
	n1Y8L48pgz6TvQuyvopM1Tyfxhd3ZHMOLwQDAhSTJ7jxkN7EoiVov5FE396yWQ14qXPpWhwgGC/
	DLeEIOaG9VF5QmXdIRxs+f1Kn82Ew7FTYm6I8oa3Wdqa25UcQ0Ibwsl6G+xtKMW0QXyNMyXoaJD
	2w3IcOE76wOz8IrzuzYQPK6LBDQuMK87giJ5BubAXFySTP8JVZYQzHXJYDjwK+IrAwBBm0fqPc6
	HgeBqC1KNvHhBUjgEYRNeGEyf0Iv7GLMsfzfPWnU4vIl4IhId1nnyR2+NmnkyorkoUNQvHxEuOg
	hH2BG74FX56nFqx/wauuAkT4QItXsYiZjLuydtjyaRhtVcU/6L2GwPWobBRPWwImzlQNuaWFMC5
	2F63Bqf8NM9W87q+DtigI/0s/F+zasJf3kGzI+M4c/pH969dWWZPlTm71PDRTag0W71i9AGFKez
	YIQwsffXNdX5Ok0439oyXPLPcDDL1cLewuKBw0pS92W9qtSk4aEwWm7SpJOvaYeztO4tKNlqX6M
	U/UzTIzYKU9h4zsY=
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr1516118eec.40.1795397181291;
        Sun, 22 Nov 2026 17:26:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm32297247eec.6.2026.11.22.17.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:26:20 -0800 (PST)
Date: Sun, 22 Nov 2026 17:26:19 -0800
Message-ID: <56aba0ed09b774b822028d773c03c4c6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
In-Reply-To: <DMMWDTG48CAN.LHRVFXXDY5YV@kernel.org>
References: <as71DkwHeLGNDsPv@google.com> <2026101444-unnoticed-caliber-21d5@gregkh> <as8dAu4R99pP1GHD@google.com> <2026101409-unkind-ablaze-08a3@gregkh> <21f4cbf39c7872893f8f2d3bfde7d829@gmail.com> <DMMWDTG48CAN.LHRVFXXDY5YV@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Danilo,

On Thu, Nov 05, 2026 at 02:48:33AM +0100, Danilo Krummrich wrote:
> On Thu Nov 5, 2026 at 2:21 AM CET, Dmitry Torokhov wrote:
> > Just a gentle ping on this patch. Could it be picked up, or would you
> > prefer a plain spin_lock()/spin_unlock() pair instead of the empty
> > scoped_guard() block?
>
> Personally I like the scoped_guard(), but to me either is fine.
>
> But I'd consider updating the comment above dev_driver_uevent() accordingly,

Sounds good, I sent out v2 with the updated comment.

Thanks.

-- 
Dmitry
