Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520960;
	b=rrAZYBXrg2uU2yYPR91pns4t7LhMeocj6vlmVOomtSdSD5HapNyrgNwDflu63iFK82xP
	 qfcL+53Xw7cTN0ny6nSsaZCDLVKLYUBgkazadZ/ODSUdfbF/RztfjdQbrkI4uvRCpLQdu
	 mYA3WxolZALHfvs76S7Jh5yoF4sgoM0hvsldsLqYFnKi5223avWl4/LjOXtvFsq1JYpRm
	 5hUhLYqpbCdBUVg3TJgX6N+jOKkTDQjgku6fLiydhhhWl/H7VfMrl4sQ3nTgYiVPXotwg
	 fx8Exxy962cKW3x05SRomEKWTcoyYt5Wu5ZsfDN5l6DqUQP3dJ4pmNi6n1NV2YjUOOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
	b=5DDSsvsKNBQ82OAHjCx8KdcJ5SfUSrGElmiRilZ3ytA0Uvy+OJhB+oJ9yWnTSKxgetjh
	 ocCIplSEMc8MwKS0H8TgJ8cP1KEH3hxhTb8vjjCHNSNhxG6q6II7rrYONo5MMyIAyCan8
	 YUsr4hIzD28xpfEBLcFVpKVKRUHH4VzCSHVznrKmwVLxKAe1D0WWjU0E5kkMhuRNvPiMq
	 TB9lQS3qAWs1L8exCd7/wI3YqFAorqSQXcJB2cuAU/keaCTARAQhhuma2/VHXAeIgS0bP
	 IMSkomxGsUyHJpRJ3FOau9ijOCI3zu3GHcFlHdNyhBKXyXhMZGHnrMtH7mTrPLwguKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ka4Ljsuk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936EF606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ka4Ljsuk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so40121935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795520958; x=1796125758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
        b=Ka4LjsukkiiGtoUMimX5MeuAtQ4VDcf9Uy2Men64dsSuoCJ6KflQMJ+8//f1c4kzqf
         +ftiWLIY1c8LW00sDgpJRLd2CSWyvM7t0Wi7tqbi700yYnhWOjwCDDdtmkY4aj7dKAPT
         cglkALw7ZgC7uXUiYGM+om0c9yKIKtfJ1K02mEtdS4aczhGKwVpIoR/GGnymT5cejBtL
         itAZpyD9oJyFIHGySQKkqmWzDvtMrp/olxLqQ2cLC6tbEkD0rbvK4k/1E/V7mJDLfOIc
         TJ/nxOFVG7wfQa1coPvmzIyf4BY/h4AvL45LHEc6k/7jpvhbsKrtkBlDMchWwETXwj41
         7cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520958; x=1796125758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
        b=iL6kXW1OZLw2avsHEByZePyoqU+0/vTfuPvFJCd44rKKh18dNId1FcuvEKtT1V8/Am
         gEXoD/1q9Qg1wmnhoeBOKoEcZ9kxjfWeYRmDKSjLTNHuNdh1bK3PpS8wsZu+xrXqWUHD
         FvPIoxuXjDse80kltGzKjpoHNhkzM1wSdJU602ZAMVPp/emm6xzc5WFBsx/yzXCeSZ7i
         cJh83b3eMtcrGMzwpm8ExHsKsz6k5W27qr3yS2yxC06P1pF9bu7Ioe2EqSYEMPQLgcRH
         d/UrMNmkLmgHz8loRYbHDyLaaSlXlJWvDOn1KzM1mHzbr1qnXyGD0qwe2N9vY7gBPZZX
         NsmQ==
X-Forwarded-Encrypted: i=1; AL+hErGtzpQ4gaxL97xuwc4Gcvwi6+t23ocKHlhrS9qiqKZwQVMvJmVqHW2RBoK6t9D15gKMbbKRwlxiHkvwxlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RThGpFIW6YTIctoEEKWlxBnDTaXymWW4ADgwtpi4sdB//v8YT
	XzQJ3pdtpJTIpfmWES6bs84Qfs+2vE59AW3GeBl/wE8QjHwpMHM7t+Nh2wzQZ9nNjxU=
X-Gm-Gg: AZFdTZcObWn0iWlbZ6yUAYG758iXn1a7GfEUT3/wf8FAgEQMN+lM/aD+zEa2lAzLWpq
	bjpJ6XJrGLWka9U6xVn4fxIOKXWyo4oNeOQ0LL+v8IIyHbfYLOrSYXnbxq4cPmClci/FAHQ82Fz
	/I0Te97Li3Mk8qWkg84xYXuPnMQKNkuRQPWPmklGhfVzLyqwJuhoy8FjI9x8NHqSdBpJfQ6+6Je
	ySZfgEFokf8V1XcZl5T7sxcT5FZVOhBSGTHhfYyBh5n8WUipQZertQVvXcxxAXVbhhvpTpzNDo6
	j9Vtr1YPWYQsP/0yGO1CTAdDVUrnSHSkx0S/ka/57o52xs8jJjnxyoRa4IGQYQDtrdcYC/Gv9fJ
	/yr2KkYmVwFiAk2x0SeKx/MpyccUY6cR6WmLVi7JqswCdiFmwiH2h3yjRn0z08BohiK05WR7EQs
	+nOecLJH6oSUMH2h9Trn0JYW8w2j/xVjXBlJoZnp8IogU62QbuuiCkpYAafAYOYvOnmz7EWPkG2
	D3vcPkhOSI2hYNS4QE+Vdsk/3iCGZDmvLz8Rst1KtaBpEdJRJtqgIOpj7a7MCJ900fF4x06HA84
	RjqHXgwT+VfD4eiNQkZvj9Y1BT6NRWFy751x03tC5PCpXtczBgLtW98BPhoi9XZqsN+KAvFVbx2
	v7OdqmF+uYkOJFmRa1Jsv0eQ=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr290637705e9.16.1795520957605;
        Tue, 24 Nov 2026 03:49:17 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm416542295e9.10.2026.11.24.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:49:17 -0800 (PST)
Message-ID: <99f6fa65-33f1-4865-9745-c092fff2e032@baylibre.com>
Date: Tue, 24 Nov 2026 11:49:14 +0000
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
Subject: Re: [PATCH v18 7/8] arm64: dts: rockchip: add NPU (RKNN) nodes to
 rk3576
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add the two NPU cores and their IOMMUs, disabled by default. Core 0 is
> in PD_NPU0, core 1 in PD_NPU1. Label PD_NPU so that boards can give it
> the NPU supply.
> 
> Set CLK_RKNN_DSU0 to 594 MHz. Nothing scales the NPU clock or voltage in
> mainline, and the boot rate of 786 MHz at the boot voltage of 750 mV is
> outside the vendor OPP table and gives wrong results; that table runs
> up to 600 MHz at 725 mV.

I still struggled to understand this (particularly the choice of 594
MHz) even with your notes, but I think I got it now. Suggested rewrite
that will hopefully make it easier for others:

---
Set the DSU0 clock to 594 MHz for now. Radxa ROCK 4D boots with the DSU0
clock at 786 MHz with a voltage of 750 mV, however this gives wrong
results and the vendor OPP table suggests this voltage is only workable
up to 700 MHz. The rocket driver does not control the voltage yet, so
594 MHz (GPLL/2) is selected as the highest rate that we can select for
this operating point. Voltage and frequency scaling could be implemented
in future to more closely match the vendor driver behaviour.
---

Please tweak something along those lines, you can add my reviewed-by.

