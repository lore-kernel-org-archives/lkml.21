Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444332;
	b=2UXJp/W4j/5T5ZtvwBTjFRpBw7gGgqQlAaOIMSDGM2ZKr5ml0IjxtnEb+eWi1+WhEVJ8
	 3byHQwphCMXZUKxEfc+4Ic+r4w4gterikZIwYT/XywJvBhz9O8sc2wlbZ5bde9zxwIrYB
	 7CfrKBeGQPWa+bwsVCnguw0f42Ao1j0mZ6d172wtDnk0QEfvs5mf85Gs5AoKakhhvEgX6
	 0AVJI9h2bxsvvW43zHgnHisKdWDa6EGUQ8r1nawCeeLuJyX3Vm062K6YmaH1TEGEJlcMf
	 D0Q2VxoajGGhL7n649galGsLSS54JhiePcuUnLEEhQ5pOblCJQe0Mul5H0dqG7/9iGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444332;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
	b=TqGPgRoNlXcUvuEY71zSDtKPmHmoOEt0lwWpZOEXhQmHj0xe5be6cqUcggNDyxfsFKRG
	 75nhnmKfocaoEcjuoCYiePz/EoF8xve3aMun8O9SxO8Z/4dip8XzTuFmtBVaSdeimwpDO
	 TTQ+eryqC0yJvoPBYYHJ5wlgWmY9OdaBcUjKhw+wpMZ/b7+c7su5F3Puaem6vZWReRUjU
	 XIYEu5bI9pNi4nv4ZsudGD3HYY4z8LAc5y7maOmzwKeFOmAFJqgnInFCSDPGfv51mGI+M
	 i8a1GrAzmly2rlErltCII8lNc0qCDwj6HRiF5riGYLsKtZEDEUtmxjeilqyD9G42GZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEVGNvwY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hdmzuS5m;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B177606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B177606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEVGNvwY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hdmzuS5m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795444331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
	b=LEVGNvwYYHmJseGa9Mi0L+zZHX7eStyyk8pJtIOZmx01ui1rCwhb6LcxRuZ4KHr8/YfOgH
	eGIr3sBkUkIb2up7Nhp4gxCF4z7sNOZiJhQccsmrtqzf5ByYC13NncNCZQcOREJbAuW3Iq
	Attp9stiF+l5+bG8W0sGT81QSGqP7uw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-LCgaO11qNEW3NZ-FN6f4vg-1; Mon, 23 Nov 2026 14:32:06 +0000
X-MC-Unique: LCgaO11qNEW3NZ-FN6f4vg-1
X-Mimecast-MFC-AGG-ID: LCgaO11qNEW3NZ-FN6f4vg_1795444326
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4901562b819so2452492f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795444325; x=1796049125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
        b=hdmzuS5m5zvAuAe7UrPm7CEjK88HUjKO9M3bpisGc6kQjz7LY8ITZC8Ml5wPGwbiBo
         9s0JFfKU3/6I5YhEoRoYBU9UcUMuYSH/E2XjlCDqYt4Nz0ObPpxwUzuwAFAW/0eRVRFz
         IZLAAWYfTHev0vLZzXz7PRORJPEk0F9E/VYOoVuPCwg54af9T0wk83w2WpivEMVjVmqG
         blIBkRAjJRlJAewH0eEx7tGrmQOOYzZIubVmrWBr4JCyyKQbBxaGxuMcCy3nOKrzVdCz
         5+9ASiemtaZgSgGChmZjTepsX/tx6Er6H+u3mJRMr7Rpr39ksMMxafbpHJ7oVgOMfLRY
         tasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444325; x=1796049125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
        b=K+4I10iV8+B0yGXRl/khFTTV/TLMZ7YWEZnoNTVOremDxOx91jJKAk5q4MLAeUJp4E
         YOagcMhYknqW1jdBc8dtc5behFDxie22v1om28sL+ESdXkMVq4eMUOVa/hir+ylPJ4/d
         VVpikR9MSiTCLEnL3ifLm33F5tqLLjVjulADmmLo8z4OdfAspv5qDo0JFS2zECkDG+MF
         2skxikWZQ0UecHbZYlVtj4WmaovWL9cLeSPhVIN+aQnFoSaGFjz6uW1CncJueEyW47/z
         u2bGvFaN4A/hn578z6RVuottEGl3oI43FCpyir+5GZsgmvI0tOKOqTJgisPvtbuYTCJx
         G1Ow==
X-Forwarded-Encrypted: i=1; AL+hErGfMPQyMv2G764vTD8+JJDUp+SALaBikhdGOAoWf4LJ93F9DcOH4Fk8zaIYzL0K2ykZhphB/E9nVbeDoCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KLMlIhMpRGKqQtyetdFRlj+Co2FClecE100MObRCn5zGYQHoI
	7QeYEOoAy22jqDPu9eoDTsmyIzIFQaGEoThO/6woiCAwNM2kIPa2WDNWMGtqJTUG+aiJA02SKjv
	kwOiA8G/EdZg9JNX7rdu8ebIOiRHu8DvGYTdEosH3OgmiwSnhushqT5AEgr8nqy1UDA==
X-Gm-Gg: AZFdTZcjosf7ItO6FPImEbVamksrODx4P5d3Fhk1lZZVFhP7xL5rhe4CCSmwvNChnmj
	mtzz5AxwIOImWttWMwq7/z/o1lRtLX1IvbBtb/WmHRzA7ys/noGvpqPtnltN8JRNsOR/FzMflmQ
	1QFWc21uB0GTHgH37W5nzmZRf7c6hRRx8cLYAUJXnL6j++B1dx5pXl4IEjhj70OhNpZD0wtFBh/
	Du3/BwzINReJFBk85QcHW42v6hIr86CFClEVmHub9Zj5q6lEacYgYp1KbJMLRCIk8p+Ti9S507G
	uL4DAiGswZc0/P8f8QV4mybAWj+kN+zqgae9Hn4YqxClI99qJABAMTsT0yFHRq/cUdLyF32KNl6
	PJBVy9wHc0dJncfOLi0ols0OZyhKYL6twWP4aB7IszM2QEXoRRWkoh8jwnD+qBd3VCmv83OITY9
	FOkkIIrhLLQyueyZWUEoZemgAmtXmCWSqOrvjGXiHifwD2
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr23940935f8f.23.1795444325657;
        Mon, 23 Nov 2026 06:32:05 -0800 (PST)
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr23940880f8f.23.1795444325262;
        Mon, 23 Nov 2026 06:32:05 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm23554628f8f.8.2026.11.23.06.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:32:04 -0800 (PST)
Message-ID: <b745d596-97ec-409e-9673-176dce73f6fd@redhat.com>
Date: Mon, 23 Nov 2026 15:32:03 +0100
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
Subject: Re: [PATCH net-next v2 2/3] net: pse-pd: realtek-pse-mcu: ensure MCU
 does dynamic power management
To: netdev-bot+sashiko@kernel.org, jonas@jonasjelonek.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, sander@svanheule.net, russell@personaltelco.net
References: <20261116115224.1454885-3-jonas@jonasjelonek.de>
 <179506764349.3136.14504567519359431973@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179506764349.3136.14504567519359431973@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 06:54, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] rtpse_mcu_register() (drivers/net/pse-pd/realtek-pse-mcu-
>    core.c:854-857) now fails probe on any error from the new…
> 
The above looks like worth to be addressed.

/P

