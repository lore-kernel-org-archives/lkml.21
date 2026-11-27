Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771015;
	b=PMU1WhBjaRd5pnwdrtGWdEG0aFbdlS+ScU3aR19Gun/J5CB7mpRuXJu84pX58+pygIrr
	 e/n3nBqVHBLf/uPFqSYW53LVa/d9zQadqVNpkkcFv3Ix5vYIrURUhaezjE0N9VmetHhOT
	 hi1lc5+KRgUrgaHojRdYBK9NxyJv8haEQ5okXubr7z8tFkc+4jTPHhUqLLRg4mryHSSNg
	 AAkKtOxynf23Gfmfh4IPYHoTfJ3h9sbmep2hJ54lTYuLy4J0YC3/3Y87MZ0z8f4mWQpBc
	 wiQWS9GStyriHxEzVY5+lulvziCYWitgapghiPQFO2+Evqxt4U4IUarhWjXtDYs3rXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
	b=MsfRTEmwxsBpWpIK9VPA1OICCmFDhim5W6mM2SUazsKIbb9Aa6Mj36Ha/HZzdGs7oVY2
	 XCo2c3wwe6RMFhHEcXhDmdG+P4+siMX8uJKC5Hj5t6ZfCC3RMTZuamur+0sWz1gqmvoLU
	 oB7nF8GJs81EjOitQL0TXKTaCjOOUCFP/XgQr/64sg6Wp1wJ4R5wco37V47NYawI2y0TT
	 jPChc/WW6dBHl5Pi7S3rxeQsQEFfQpKpmf57kuvp6RcDdYXmktwZqZ4ztzrGeLrfgve93
	 OKolsZpbMKgQnNIWpkLBaRm9HOvSH0HQlcHo/EjppAZMspYCcSMMlVhjRbHqagyymLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b="VZl/IlJW";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF34B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=VZl/IlJW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so68554335e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771013; x=1796375813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=VZl/IlJWSTPQEx3kzZixxBHdoo7HxTaWIlhn7M84mCtSRGyLmzMnOwbhKMFpYJVCId
         emKq5axdQzhT02uh1q9SxLotymBikjKdtjKqWXm/qh8EimPtNhmowWfDThbdF/nr9nqu
         WIZthNzQfusgbHf8Xg2y13RainI+sV0raFlp4r1PKwA9JDPTpAnoSjXjvL5HMTc3mU66
         iTsvbv7qpYAkmD5OFlxkBEygevhq63D2NC7Avc2pgYvG4nLLGoDl0kpqhnt9rCaWPAWG
         9MHXNRCwu9vbkGeyoKOrBUM0zuKqj3f465SBdlaVdOEr51hHCnBeDIGT9Dk6v8ZHSGEf
         AXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771013; x=1796375813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=lDwjoFya7Ejf6MRGjtaBLIPcUnvzU1Z4r/mCIgTsQMFPxcXStLk+F2xgfFmvZa7mH4
         7wPvmvNh4cpxgT8DYbzwjjELCrAFC6uY2E0lbeiTTvN+52WaH3FQKlfEVvgXV9Sg6pGV
         8C2XGe1JhD2o/NjqwS8iUk2f4bWCzhSllEuWtImXc+TTXTsOug9b/Ldzy+MI+6UW26B8
         ycjAabShuvXubhpmkvtn1oHW2EHafYgnmszdKGzEQhlypGwPvyFJU/2RDpyzwynACKEN
         RoKACy9owlxpfDNqPSzojzXHJsImTKK+34Z2+F8C2nQP4VIktq/RglKJwZOB3RkHj6In
         55ew==
X-Forwarded-Encrypted: i=1; AL+hErEceHBfdf7mpcsL4lq9QljYa1pOS7w2qCp6dqMtOA/WpwqFc1sjyqI7icMoLSGa87g+PqRZlzpyP8o53C4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0rsssQ89IGqNg+3OwxkUCFtZLnRN6P7wt372Dd11TxiLTKFbS
	uJVhnMFY+CNSPOd0xxiiJ/sktJUT3H2ek+z/MHuNcG0mTBQgpTu1hr/5jdBTaSU9rpI=
X-Gm-Gg: AZFdTZcLhY52vH7xzf1hHHtKWbCUxRdpxm6UPeIZNDGnxEYHifT465ad39ToK90vBvl
	sGd9raodsgWJMAqOv48+zkzZm2ZknrPYQq6YLaRaVa9VlXSylzwQs66+ktB9kkB9MHC1aTxAqBG
	h4irUjqp8/o4E4mt05Ly/r1MPrsQYOg0WH9Wal9zCLk/KGXD/xAv/WRkiM4LuM8vXG8gQc2z3ke
	mnwBVHLerhpSoF4Jp//ozie6stXDEjCtlknxogaNq09NmC+Whw3X129Fr51EJwnColx3hEz5mPL
	dpo0CA8j/hdX5I7rVcEwtZZXKTrY7rTJjkFIdGrb+q3h8HBe0emvbzYYrxjDZwZUqtHwsU3rWEF
	HMifHD1reFlEh37PAPyHF4O1X6jIvP7MA6lRYRnx+rSlKc9zs34FHhWhQDoQn2msQZ8eGLk8Zo1
	5L7JGSsz+eDHiP8b6Lhyd180F/0ASZdNW8rIiDT8NpHhcxhAMixuG5jxXeKhYYvV4dtLQ7kCCbE
	mh21CsNyo/X/+pWiMoi4O0Y0OX3kTptl3wV6DdzIhT3IZozgYd/RS7XmJA+cLUnSHdjw922axo0
	mO8cGy8wG5l4Bv2TtLK7ipNRNLORywEpyH7X
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr506682605e9.34.1795771013014;
        Fri, 27 Nov 2026 01:16:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1231003765e9.4.2026.11.27.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:16:52 -0800 (PST)
Message-ID: <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:16:50 +0200
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
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Diogo,

On 10/26/26 13:35, Diogo Ivo wrote:
> struct rzg2l_register_masks declares the masks of the OTHER_POC register
> of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
> anonymous union. As both branches share the same storage, initializing both
> other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
> designated initializers override each other, ending up with the I3C_SET_POC
> value in the PVDD1833_OTH_AWO_POC mask.
> 
> Split the union into a common area, for masks shared by multiple SoCs, and
> per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
> area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. This
> way every mask gets its own member,

 > and new SoCs can be described by> adding their own struct
> (possibly inside a union).

That may be missed by the next person adding it...

> 
> The existing RZ/G3S data only initializes i3c_set_poc, so it is not
> affected by this change.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - No changes
> ---
>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 9bf3743dc1ce..f73d273df362 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
>    * @i3c_set_poc: I3C_SET_POC mask
>    */
>   struct rzg2l_register_masks {
> -	union {
> -		/* RZ/G3L masks */
> -		struct {
> -			u8 other_poc_pvdd1833_oth_awo_poc;
> -			u8 other_poc_pvdd1833_oth_iso_poc;
> -			u8 other_poc_wdtovf_n_poc;
> -		};
> -
> -		/* RZ/G3S masks */
> -		struct {
> -			u8 i3c_set_poc;
> -		};
> +	/* Masks common to multiple SoCs */
> +	u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */

I would drop the names of the SoCs close to the i3c_set_poc. That have the 
opportunity to grow over time. As Geert considers better.

> +
> +	/* RZ/G3L masks */
> +	struct {
> +		u8 other_poc_pvdd1833_oth_awo_poc;
> +		u8 other_poc_pvdd1833_oth_iso_poc;
> +		u8 other_poc_wdtovf_n_poc;
>   	};

OK, we can drop the union but the next SoC addition may be:

/* New SoC masks */
struct {
	u8 x;
	u8 y;
};

If we want to keep the initial form we may need to pay attention.

Patch is OK for me, just with the mention that we need to pay attention if we 
want to keep, for the future, the approach before this patch.


Thank you,
Claudiu
