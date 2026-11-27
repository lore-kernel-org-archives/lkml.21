Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757294;
	b=qJ6maYXIrPKHFVXJiX3Mpc6ueNzh0ZqrHVxQWTNTg63lbb9PCZjqQwqNMyaYMcX8KBzx
	 7Lmq7QgZ4l6leOirS7fn+Pk0t323uI0V2tP2o58KvPiyTD3jZVrjS1oQqjnQNOi/VpPme
	 pa2EeqWgqVlWkUkNTjlxO6MRiTajQdmqQQBsr4Nohc3D/PYZz+6vwWNQOREnV0lM93jHz
	 9LKVDe1PlXyB+amUOuG0lK/e0ImpkqT8+ncf9Za6dLKLkXPskBf5JOfsQwrdTqnVkXGfR
	 BByHpHGqfbaWIKTM7zmpTPBA9XJ/eEwCzmXBN3XLxXH79QLUsCfKgdlnGGtS+hNREcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
	b=5XCGfAV5kq36NUD1VioWk0AcbBgLpJOk5sqocAjWB/jsR0813G+RfuxhbFBgOhZ8AVHn
	 G+XtyCZcWIovuF5sIak6dy5Va3HofuPX1zoLhWKIwLsUUz9dKojREdaWcovJOcYWhsOMk
	 mllITVBqOSsS9zs0bKuMIwxQ8xWGVS2JsO/i7GhGgdjP2uejrRJNDGOLhF0z3pIaitrT4
	 Y8d3nE0OmNFaIgrBqVOPKHN6t7WHo33pat7XS1FlPTg1W3yvi7GZL9Oe2859R+EZ0oW1+
	 nCtarHPxp8CCxKvbCdaW/e/4YUnvHEVlGFZROuPf3rwCKoYEArJBymg3xECboVaHpUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Y8tUjz61;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0E4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Y8tUjz61
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67db5e13b0cso6881352d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795757293; x=1796362093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
        b=Y8tUjz61NtA4sx85w1w5WdFO9U3qKQ5pf7I44awrwEgGTG/yTpfKVWDCkwqW2ByJ29
         YzfzBn3FXcJpxILij1V8VvLCfr2Ddml4kzdGHLaUdxZMN7bLfP6NPM89/SKl13C8Q6qM
         HHuBDOyV4UOaEoyZmOmk/AZgdwaRSPjz4kZk8wyd1PoknCo73+Hckob+WL+jDKNPM0+t
         GgCP8XVSbwvq+kZuj2hFcPfxdFXbVuH4UyVv2saTQTTcljkyGSOPzr/CzNL4hZJRn7IQ
         f5wh9jSAt4kDN0kM7SojsykF3sb4lQgQlTz3wPOzBj4OJVMdPJi3QHKSOsnN01h9tQEQ
         FrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757293; x=1796362093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
        b=S3U6DVVcrfQf41rKFsar4BTiegREVkW1Xwdc4JObO6vBbdswRuBZgQ+A7RmR/u6H6r
         xgK/jzAMzhr414oqy2GV0tuKkIpbkvJZk95YnF5DI2XbkS+QezrOJY8lv5CT0ic+pE1j
         G5Hxyz9Mu3M0YTbmijq/a740/C5rOysCVDYk1/JADPJVfYMK438ofoLiSL6BhCE0gJth
         29iwfNd04iIUsND69lPygneCL5FaX+WfpTqMFZbTyhWr75YeQltvRAHcqF2Z1z8pwpm/
         u+Ygm/ihR14yBOt22f9YG1PiXQn3EQpVZ1Af/SYudnwNh7UMYo9A7A8MPkOjg91waLky
         iDTQ==
X-Forwarded-Encrypted: i=1; AL+hErHYc6Jttl1Nx/aDGOPxV7FYOzj70wF24QZ3HgsJkI0BCPj3odB3P+a1fO4V0Vp3ECfbi/bLPU67Iov+7d0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OKrsGCcOHD+h9Fe6dxAoKdylCSKXQY8GBqgN7lEF4+NLej2JP
	4t5E8ReqZhTpEjwTp5pSpCkeNLuh0rlTUs+niM0xIYBVFJ4LysgkgrurVOJFWvHcOdg=
X-Gm-Gg: AZFdTZcXvKutpqdOC2BKkiEPfxf6TjCfQSv+snpkNbQeAhC1QA0pQYi0qWu7kHjvvdS
	r06FcTEz/32MAmC50ubO1H2eHI2ApWcs//1+ArL+xXfmF/oGDYJ5Xfz8+6xh8yH5W+qeRsikzDg
	Twdlf2+sLJCjZQLfvYgoCKmZstwmnIh8qlDgRB9XhCvX/AkstJJkwRFXanB+9BdKb6VdsiGweEf
	dLu8PkLwiSPV8gi6clmq9TvhKcBihvO2eQHwpteER3GpvrL1m1a3A/kXQSkbHT4vD3VGAk5EoUL
	RQBOakSRDGAkemvhkVP5oBe1dloTytfmrKB+8TuQAQD2vwlDBWeDPcey+fx5TR7BBxMYjXshTzP
	cdNQSV+ZNyO6MWt4TssRzQyc8pVwqFQhPzFYqzi0uXNNpLrr4jxRvrPMZDucHGFu1kRCw9aayId
	eIem4hwqxHmLu8D40vplGWh4//+lICJzbcSSXQGbt/R9XS18uwNeBlENE/unBZFTQ5hPg6jY4uG
	tMK3gU3S1/UsLgdrA+52br8hP2zx01+RZX2s8ZPXBbcAKrPsPq+uyq9pqhFzSBJgjtOT+Vy4s/7
	1enUAvtA72vJp7n3AwjmljfckyMVYIWXbrhcZ0b/Xyz1uJ0vCm/xFiieg0mluk+ncTfBGgq5C8U
	dqWicrIWOYEgvm/GPE+rP
X-Received: by 2002:a05:690e:4594:20b0:67c:6ce7:c513 with SMTP id 956f58d0204a3-67df44da548mr5273707d50.82.1795757292881;
        Thu, 26 Nov 2026 21:28:12 -0800 (PST)
Received: from toolbox ([2600:1700:220:59e0:e3a5:f585:4070:c566])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm11238363d50.22.2026.11.26.21.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:12 -0800 (PST)
Date: Thu, 26 Nov 2026 23:27:47 -0600
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
Message-ID: <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
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
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>

Hi Junhui,

On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
> register space in the non-secure window as a legacy CLINT.
> 
> The ACLINT register space is mapped at two base addresses: a secure
> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> secure window exposes all three components, while the non-secure
> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> there. Moreover, depending on the eFuse configuration, the non-secure
> window may be entirely inaccessible, whereas the secure window is
> always available.
> 
> Replace the CLINT node with the three ACLINT devices, all using
> secure-window addresses: MSWI and MTIMER for machine-level firmware
> such as OpenSBI, and SSWI for supervisor software interrupts.
> 
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..74831974435e 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
>  			riscv,num-sources = <512>;
>  		};
>  
> -		clint: timer@e081c000 {
> -			compatible = "spacemit,k3-clint", "sifive,clint0";
> -			reg = <0x0 0xe081c000 0x0 0x4000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> -					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> -					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> -					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> -					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> -					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> -					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> -					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> -		};
> -
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
>  		mimsic: interrupt-controller@f1000000 {
> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		aclint_mswi: interrupt-controller@f1810000 {
> +			compatible = "spacemit,k3-aclint-mswi";
> +			reg = <0x0 0xf1810000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
> +		};
> +
> +		aclint_mtimer: timer@f1814000 {
> +			compatible = "spacemit,k3-aclint-mtimer";

I think you'll need to also include the "riscv,aclint-mtimer" compatible
here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
include the spacemit specific compatible. OpenSBI boot prints this
currently.

Platform Timer Device       : --- @ 0Hz

> +			reg = <0x0 0xf1814000 0x0 0x8000>;
> +			reg-names = "mtimecmp";
> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
> +		};


Regards
Anirudh Srinivasan
