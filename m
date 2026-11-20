Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201477;
	b=iD9k0cdGzVXfpCfXLV4O8xPQ5MOSfcyyYdBMaOf7hy8kfCNtBeAydfOX3Hi1Mqu4cI3H
	 q7oOALFRdRB2X4GRyb4joP9zF/Lu18r7VDRt/78UEGg7GLmsrXG55vayEgx3V9/3q+2yD
	 H5zt/aEddmeSgTo6QMVStqeQVhmt6x2ummDAJe6skwwHppGvI+kDGX87FvAbnPuRl1Ui2
	 avDH8Sa92rEV7JJnT4HdhO0i1NN8mNNvy9bbEX+OZ9Lg0ztSnxuPaj2CW/RnBsQEk5mB7
	 FdVCh9S8T4urr98PUPEpDPol2pkr/snTgJl+MtshDtP2SQ/izZ9GxnI7eW8em0hZy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
	b=Vhr430NnMsuaxQpJBSNOi3Qmrv7zRbH///3PSCpJx0SNIkdCgvcGIE/1QTO/bAqwPNgC
	 LaGxhe5nK0n4OmjnfPQOpVbisGxwQ7Zy2aIM31kTr3zfc/W1qu73HQvh5COShzLz99pc4
	 0T9EjKazw4t5OvvGyR1EzyQSMq5K6GAxPsUpEig4wJ0DeBwKyEHjix6IhgaPWOAm8uk0v
	 VDh7dztaT+lmZNcJ3ZBePUoFd5PoMEZWpoUY0VOkGf+gTJpQ2CVDXk8o85FMz/+pEgOE6
	 RUhy+Wuz8UMf3+8Tlmw1xEHALEUEPkYSazsr44Z0blc8DawMSfXEGVZEUVzCDFR64Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JLrvzWrj;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C260A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4C260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JLrvzWrj
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a451915d8aso887754b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795201470; x=1795806270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
        b=JLrvzWrjv1Foo6HYSfTDQVhyxDufy62fACyY4TUuvVaXgUa8lSg6ccU7ISvUaCI27H
         XwtX20FM0lAco9h28TTdGDJhvnP9d5NX+97YXXXWpfbFUFWZDBvFgg0CG7FJ6fqC6xii
         L0UBMr7K6SzVuWyOSuC+n3EjKbo93TyJbcZGK6sRvqWpJEBbQYZwztZIOHeCYvQ/fsrb
         7JC1ZqV0uo6I0urwInXjmsBf3Wbk3RFBF5WWgi3xER0qNs+Rn9fLAbWzqDHFsWJt7BcC
         kNuMepTIGP5jkW7TM25coWgEjy4zyRZOe5lWrtuJf5pOEYx3Ep22hoon3Z4TQnVX7O2U
         N8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201470; x=1795806270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
        b=lm1mhblAupLEhemwHsUtApd4wTMfBkjveHJaX59Al4WlYO0XYpUueoanJ+4QRunfu1
         eB8NCBZqgBFBaXCVgC5OVw94S/DL9r7vA+BjOLgeaOA8OECFCmuYngLsXjx3fMdwghwD
         PBTVKh5yHKixf92DtgbyWS0XbOpL+nZKX7e/JivWpbYxjM1ys9KNk66bOlqfmzN4msNR
         RYaHG/tXsoJadgcbnyH8ErjCr+dUheu5+f0YO2JHq0VZU7kFG/k1AgV06jB4lUY+IRuc
         wAHXno1IwCmZQc6JCQqKPIn5pHwoEP9If+BFnf1NzgNzvxtAbATd3LkW5900O/LtnT/1
         i48Q==
X-Forwarded-Encrypted: i=1; AL+hErHJ9wdYwNa1ErMbuUHDJdOmbSBzYiHJHSL2sWD6LDER4Y5txHRU5PN04qb5HJSxqJQDWNLmv3PR4dCRqAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8l4mkI2mgTg5qNk6A7pyz+d+3cVw2pwKjPjGt/4fnWGusRX3k
	Ln3xgLKcLdr801zyW/Ygak9IzQJTG8OhwhC85WK2fqbYGcnuC0fNyGApHysX/kqFLDs=
X-Gm-Gg: AYBFou1q1W224qKYwOj0RUu+fC9gSO8S4PF4EKIaqt5Nqkm4mYlHOUlrAMwJCmfJCN1
	LBr2Plo1Tfzssg43vhDzklny6QpSuSV2e5X+8L60cjzV41oqG8Pygi+61lxO/16McrEvxPwnCsu
	6pbmylTly83eP/h25uZbi6Lm3f0yNlYzl10YCob7esGDflHZQkMotl1MtjFmX3WJeeb7/BFLEs4
	JnpVvmigRpEKpqQ9vQjhraRi+Vl3XKGuTbgzfxv147amZ9azpBevCUYAOxLZMPglyZYKWYCV5gp
	NoBdvgTz7oQUpIqObPg09ttCjS3E8ajOtPXic5NTPewFQsASv0+tiqRPlms92W4n3phe0PQxSD6
	Le+VfROeKzd/UgCiNLw6+l1up23bKoXrjc4CZE3QGv2yqmDtVSBmGRXzfAvkIEKSK6Qo6MOumV7
	maF2kJ4I3Vz/kch/JIGYbN/5sUk5EP13JQki9WZZT1/tXqk9bReVC6vC5jdmurSPJYVbRe8arcG
	UNgpkgrnLP7eX1dY9f21NH8UhbfyJpulfykYa7YEXAi2OAz/i5qxm1GKRCjmfEKJ7r6iRghowb1
	bjZHotXFcdtH4QonTnGIBKrmHIgqm9QHtQ==
X-Received: by 2002:a05:6808:1528:b0:4f9:a153:8446 with SMTP id 5614622812f47-57a0980a5eemr4879032b6e.38.1795201470007;
        Fri, 20 Nov 2026 11:04:30 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm2814524b6e.13.2026.11.20.11.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:29 -0800 (PST)
Message-ID: <295d75b9-b346-4669-8c1c-397df433b699@riscstar.com>
Date: Fri, 20 Nov 2026 13:04:28 -0600
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
Subject: Re: [PATCH v2 0/2] clk: tc9564: introduce a clock and reset driver
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120183212.1264522-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261120183212.1264522-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 12:32 PM, Alex Elder wrote:
> This code has gone around and around in various forms, having been
> included most recently in a series that also added a system controller
> driver.  That system controller has now been removed.
> 
> This series introduces a devicetree binding and single driver to support
> the clock and reset components present within the Toshiba TC9564 chip.
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC, including the clock and
> resets controllers supported by this series.
> 
> To avoid any confusion I'm only going to refer back to the "syscon"
> series", which provides some additional information including links
> to earlier versions of this code.
> 
> 					-Alex

If anyone would like to see the DTS file that uses this clock
and reset functionality, it's available here:

  
https://github.com/riscstar/linux/commit/de0515ee2967d8ff7753cc179a8e05283ee62829

					-Alex
> 
> The previous version of this code was included in this series:
>    https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/
> 
> Between that series (v1) and this one (v2):
>    - There is no more syscon, so its devicetree binding and driver have
>      been dropped
>    - The clock and reset components now have a single devicetree binding
>    - We no longer use a syscon-generated regmap for accessing the common
>      range of memory used by multiple drivers; specific sub-ranges are
>      instead mapped
>    - The clock and reset drivers have been combined into a single driver
>      located under drivers/clk
>    - The config option for the driver includes COMPILE_TEST, as requested
>      (last month) by Jerome Brunet
>    - The help text for the config option is simplified, first suggested
>      by Philipp Zabel
>    - The driver now names clocks using dev_name() rather than trying to
>      hand-code a unique name into a fixed-size name array (also suggested
>      by Jerome)
>    - Certain functions now always return 0, which simplifies callers
>      so they can simply return what the called function returns
>    - As suggested by sashiko, a counted-by field in a flex array is now
>      assigned explicitly
> 
> Alex Elder (2):
>    dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
>    clk: toshiba: introduce a TC9564 clock/reset driver
> 
>   .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
>   MAINTAINERS                                   |   9 +
>   drivers/clk/Kconfig                           |   8 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 501 ++++++++++++++++++
>   include/dt-bindings/clock/toshiba,tc9564.h    |  50 ++
>   6 files changed, 642 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
> 
> 
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

