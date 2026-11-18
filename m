Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995662;
	b=gBHAmYciQvC9GD/qLyiU56Bdt1CkaOMFWB2qLsLxLeofY89MOKcfEX22tzrfncFs2DqE
	 0gS/esDNBbxNeQnbcYcauGknG6z7nyeov1SMcd5RgLXytOoF2PEfzcoj2j6XptTJ6V4xt
	 1ACiv2t20fJxg2Maa8+GDT/mjnQ76DfRjcjK5uFGmZraMT6gnaKp1mS2au98fKqZIflEc
	 IfdwuOY9fdE4OiLoKi5e8RAQ8MEBqD3k5YBXTT1NQoAz5C/IjcltxkX6pCmHZfe9ouyTe
	 Ln/+sj7TAQUpT3HAGjRSNYU8At+LN9aw2JaYl6CEhEFOsE6Olo5AkRWbVgAsGPGmojA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
	b=qVdOwiihPRItsV+gizAk149Fli62pCzxuz1wwZoGHt8gIjuCeFshHZvSLw9X7Uc0QXYR
	 fSqr3RmJASHlZTARo8fIAyq47Pa1Yn1D0QEvd1IP5em7jvnuoPqT+B7WXxY1//AJrNEnL
	 kmK8xvC2B35XquxA+fqPI1jCMrqoMEG8btA8FAaIXEOoAfoamvbCGGRpvy+b5AEqG1KSx
	 mB+5ulev7ZNq/8YwjCjG/8A6opI+7djO5EK1kqzCC1mN0kIDqdd4B7GwsHwFYs34t+lqx
	 RTzR8yqGJ/bFIbjb6veCyR1Jqabzb7bhJ/Q3R4P9s1u3GSypgVaLqd2rEuFkycavlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5eaYciq;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380C606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C380C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5eaYciq
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7153415e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995660; x=1795600460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
        b=Z5eaYciqucY9tPvMWgtwpa6lHfPYOF2Xzo8ZpymIHEeYaM7ceXUy4cwkRDQH1/WaFo
         fKdLexn2Uo3Dq4t5efXPTUnGy/bRRy2QwmHyxG5iH/vKXImjNoqooAjOOPP7L34/nZqJ
         0SlDYecanghmzXaqkIKNSHvk9bG+A96Cqr9B5DJQ5NeHjJ3ehlKt5v7IIqVtl1Hy8f7f
         4ey+5qQT4d+CVRauLztzDPPOwNR5Z7d3LU4h2Y73wKsvSkAdYlN6fJA9P6e1XYnq6oQD
         SqeB3QBksir95uLM3TPA0ItzV/6IR/+55FRnZktc3DB/sa/vikwo+v54XfpkHBNUrYry
         KvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995660; x=1795600460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
        b=ouF64PdEc5WNAUCQWld3rkyOG3oIS8Rx9m4Jc5fujaX9rJYeeK4i+mz4Ah/zGYkTEe
         oBR9OGd/iHLIkGTQtOiSLQIW+qG32zpamvKjc/aoK180HcB49bVGHQ2r1NZbNQ4HujHl
         Zef5FwayDrO/LT7HwlWJBbqVAyz+WlJAB1iVd+NcAl8V9wa7G3XdUq57eKpfG6wgAOV3
         pU4wJDjGsO1yq8BuFkh46bjSUqm5kxvMtJfIYR3tidu7veZMvcIyWBJIBVZ9qHvcxGbE
         S5YhydW5kAgx/SNNYI7pY58B/FrTNfom1Au1nKe19ZlIB0VqeAscyKt5amtYXTu8czPx
         rNRA==
X-Forwarded-Encrypted: i=1; AL+hErHlujkuswZoFrYPb3YG6JI38k4o/+/ZYcmH/XVssG5d12uYk00PTtQFFkMreHjvM1q5YnJAsSVVl5hzzkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z82F0lclPNlilteetLtKClVAGTacHImFcNIVWT3iIztYlKeJe8j
	7lrj9FfMNwyGRAQCimBpCmqpQOx3XCEaa3G7SGm4Qt8d+jNZ0zthsKeg
X-Gm-Gg: AYBFou0OA5TxeKOiSwOcQAeXxankQC+Y8QDa+QSg0zuNqX7d9Fi3xOVuG7ek/gtzhfe
	Sibx0MXNOWKF8gyliQ1OQACxZcYHIOLuVj6llvHeQmz6IZh4+RbFsVAxo6x/P2mCVrvrGS9oPXI
	w87NwuZCB+R4vZ2easDFs3incd4Rj9ZWB4XIDfcqjRMY+oqzXVwM5kuiO4JMdsaHPP3edMFX4sy
	7xpAGoOI5cfwjTQziodJViNQbYqwmH+0fhjadCQJhofqPSVLs5KxM4DQMefKWc/mTz33nS+4cdP
	nDogXMkJP8WL/G3B53YWA74LnnJa0hGpXbFB8MYQHwGNP5pGSDFzLwwWW18WcYH0hZ/x7aiBwRN
	1jJQWZ7wojnY/hNUuHiHBtay2vOIfl+W6B/ENfuHpNp8nJIRNYSacBzSSbZ1CAllddbn+KAUJVZ
	2+BDNeFN3Vv0jitx0eQvjbYla/+kTGoidnaimgQR+dTSMEUjuANeAE6InKp5KnZysJq4VlFa38A
	ogmgR0+p8kkfoBbJ+2IkewhUUos+d69OLcLdS5EbnliusoJnmvPhfv4FGjDoshLcn1JhROJMgHP
	WcTUBuA2qwMYNs624I7D33QtiIpo9ihNhNylAI5AXGoJjyorL8A7I3kDCYqqpsismA==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb7da23baemr38830375e9.15.1794995660149;
        Wed, 18 Nov 2026 01:54:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e50e992sm24034685e9.0.2026.11.18.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:54:19 -0800 (PST)
Date: Wed, 18 Nov 2026 09:54:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Saravana Kannan <saravanak@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Simon Glass <sjg@chromium.org>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>, Julius Werner
 <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <20261118095418.51d30ee8@pumpkin>
In-Reply-To: <20261116205320.1621386-9-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
	<20261116205320.1621386-9-dianders@chromium.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 12:53:05 -0800
Douglas Anderson <dianders@chromium.org> wrote:

> `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> across the string table (`for (p = strtab; p <= last; p++)`). When
> building or modifying trees with large string tables (such as DTBs and
> overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> byte dominates serialization time.

Are those symbols just in a linear list with embedded '\0' ?
That doesn't scale well at all :-)

> 
> Advance `p` between candidate first-byte matches using `memchr()` (with
> an explicit `slen == 0` check for empty property names and a `tabsize <
> slen + 1` bounds check before computing `last`), preserving identical
> suffix-sharing behavior.

Might it be better to scan for the '\0' that terminated/separates the strings?
Then you do one memcmp() for each string/symbol rather than for each time
the first character appears in any string.

Even with the code below you want to do the !p[slen] check before the memcmp().

David

> 
> On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> DTBs) this reduced `fdt_property()` time by ~5.6x.
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Found this speedup while benchmarking fdtfactor. It's not critical to
> functionality, but seems like a nice win.
> 
> Changes in v4:
> - New patch speeding up fdt_find_string_len_() with memchr()
> 
>  libfdt/fdt.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index d9ccb70345d0..c7cedfba7815 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -348,12 +348,20 @@ int fdt_next_subnode(const void *fdt, int offset)
>  const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
>  				 int slen)
>  {
> -	const char *last = strtab + tabsize - (slen + 1);
> -	const char *p;
> +	const char *last;
> +	const char *p = strtab;
>  
> -	for (p = strtab; p <= last; p++)
> +	if (tabsize < slen + 1)
> +		return NULL;
> +	if (slen == 0)
> +		return memchr(strtab, '\0', tabsize);
> +
> +	last = strtab + tabsize - (slen + 1);
> +	while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
>  		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
>  			return p;
> +		p++;
> +	}
>  	return NULL;
>  }
>  

