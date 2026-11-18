Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004877;
	b=lvRpg3e8PBNXTXJgkRTDAcNxk3fOr5Wg7/nkO2fwJzk77L4c5HaJWEDOWJ2t7Afb2hDE
	 WOMgl2fwHh60gOkdfCoSrGQiQOBQtCHhAFZH0ZbRxrMk90tQR9bgcAuWhNDgGUWUYaDWY
	 bJDLnoEBTh+EbijE+ey6qdiVy3pG9qk9dbUrNDK/+nr1exncMZrz6ExLYsCVwhfO4OqAf
	 l1HheofzFeCyix1oAs8w6yAVsg1SO99Letnm6DraXlz6BIZAMUeWWklft7L7OR7PiyhIf
	 yDNcBRNStoBt/jza07bQcuYs4mcVHOLlNtMQiCL5fUjizQBubt3aHSfyC7RLYShheYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
	b=BSQZRlzVcpKDrjr0dv22wTsm7Wh9m2JI3C3qQvEXbULRzWhLDJKl/qt0d5pYpr5d+Oze
	 wcF3STgRMwH93LPQhOVADozYpwV1h64VaftLTWInPKOcSD0khyMgpVB4OTdeJfi0WSyaX
	 ShVLH0+0f1y4cqTwWmMUo7MpbW5/C4XAfd5QDLzs2JeQKy8HwsDtVGHOYO9nHCARjVeZE
	 esixY1+no8AKtks2+U/ezGZ/Et7PE1gUqnsHOq9UmLfG7oSw7OWbXzkgZIRJSVqgKR2wD
	 r/AwAglW28zOp9Mc8E1lgfpRaHPHfWp3WRiZEhipm7r6Bxp7A5G1m/znQJVXl8d/mlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gnUqbuf3;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14582606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14582606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gnUqbuf3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a42b34e930so661682f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004875; x=1795609675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
        b=gnUqbuf3d57Xuwjq9mArqq7froWGp0MlQS9x6IlNT2NGP3q3w0Sjo/kyiHGRTKiB4q
         P92nJhojgEV0yC+rIzGu8L1gqaBLRdfnpQ/GixH8reLCB3FQyZOp2jEL3KxKSJL/Pg2W
         XpgDghUzVyPVrApQ+sPpAAFyZ2Aeo2PF2N0w0Qz1WukGOaa3CSp8SpYNcCRJi0JqSTpw
         kdxcDlbsA4BPzGLa8nc5dSe85aI+2nGCi9owQInYgrxQBbn+gXTI7eUgLzyrhhFjbeZQ
         KfZ4jYflBxgYv4XHeP37RUp+6rVc7fKTxM3p/9uHjaYt3O2RxDTnNOeL2E2HxSOjIEc4
         XCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004875; x=1795609675;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWhnfvWenZjOfquzYUSnlcmZobUEBcHEFf7Qs3x3jIo=;
        b=O/mb0gWbECfEEGcYGBcG9loKPlHPO3I6vrfgJ5mvas6lbX9qWVOS/6QAA3+SUu4ykK
         xscpJcqLuwHZ/VwtqTJaEPgTamZZCnJHZHyPVB73FIF4wGGN83KrKhUhR7+ow4+8+GGn
         ybxJYZiOGKEABF6U7CWqJqT6aTF2OPioFl1fRdzht+YMnNYqHnA39vSpxh1XylV1SWDc
         Ca4mHPKG3fn9Rpao7km+u5+j3eb9FRioE3+M43D88alKl9EModqGVRfnQICcIGhfgv+3
         iMLaVx+bkDcDwFHmKRqZfjHuF17X2Pwvw19r52Td8sketuQLJYcCjJ0ipwX/dKLCnbgB
         AWeQ==
X-Forwarded-Encrypted: i=1; AL+hErEG/9IVddTsH+kKEEAQDUZfpBrtIylK0eIB9sF8HT8Ci2q3/ddKtE+No5aKeNHHfROTxtBvzmLMUIjnqJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m42oRuP+mQAbzOY+gGS3Gpr1CB0H3Njv9qUQE76dDOfWt3JYH
	Uci11OY9MbCU0vZfrOW3FIVjd3h8VS9eeOXXfntjaUIicPTotBy8b5rS8901XVaKgNk=
X-Gm-Gg: AZFdTZdHpkrTyRT4kXr0DVHGanbhWRDr07AXd7/s65dJGJ6i1Os6T12K5IIHIxJ9ccE
	fbOV1dQBcUQgWQeT6QKz/NmHsLI9RPHbQZB05CuestxL6FuCLRDjzr+du29O3QLZ+o7UQHZ4DIW
	zlJ1GQGAm/QswwTOGBCr4h2AotFpWYVl2KQ2EmKsAmhhC2QNRB94buUCjNWe/0blHuQVOXD7R0F
	8loSlDXRJnVicRm90JfBs6CHIJvBEnGTqWEvBl1ZnNf/jNw4coCtWIL8wyPYtIS2LT+UNAK5759
	tc36K3Pl0dG2S5kgp7N2DUcImE5aYKHmjcZeusW4A5lAj/EhaHvegcR0j4YXxYG9xEvjomVvQJ7
	BjTVxndfAcTcaf/bOZ0zBFCKog0a4b4O+Pjo/CsHtOGEIOlN1rM6ID14nTp/As5Fb99J9GNJjRP
	k9/ABkxH4O/VVpaqeAHGlBZqlWD623sZkHjg3U+Y+D/VbgPWi6TTPckko/4Xy+T34CNpJ8xeny5
	vPhWt3BeGJV9VZefsjOGxynN2VXd9p+LAsGn6apDuI67QJ++zKm/ryVF5sUdlGFiXemOO5d1zXc
	q4b9qIDvmCP829/wLTxYlvRIQ/SHEZAlBnMwMCiGBBTdnQZlfkq35Edc1mbAbqwc/VSDYlgz5rq
	xVdxax/g+pydKLk4zCdQVOQ8=
X-Received: by 2002:a5d:5d0f:0:b0:4a7:9630:7b32 with SMTP id ffacd0b85a97d-4a7963080d9mr2359433f8f.46.1795004875475;
        Wed, 18 Nov 2026 04:27:55 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm4675322f8f.34.2026.11.18.04.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:27:55 -0800 (PST)
Message-ID: <0bcd84bb-6a87-453f-9b68-04dfa95f34a4@baylibre.com>
Date: Wed, 18 Nov 2026 12:27:53 +0000
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
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 08/12] accel/rocket: select the per-core clock and
 reset counts from match data
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <fcdd7117d3d7fe99ea1658c39b6d1a05428823f4.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <fcdd7117d3d7fe99ea1658c39b6d1a05428823f4.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2026 03:05, Jiaxing Hu wrote:
> The RK3576 and the RK3588 use the same NPU block, but with different
> numbers of clocks and resets.
> 
> Take the number of clocks and resets for each core from soc_data in the
> match data, so the driver uses the right count on each SoC.


Rather than these clock and reset count rules via soc_data here, can we
just rely on the DT validation that is almost equivalent?

Then we can use devm_clk_bulk_get_all() and
devm_reset_control_array_get_exclusive() and not worry about checking
counts and names within the driver.

dtbs_check will already catch cases where the wrong number of clocks or
resets is provided, or where the names don't match the ones expected in
the bindings.

>   static int rocket_probe(struct platform_device *pdev)
>   {
> +	const struct rocket_soc_data *soc = of_device_get_match_data(&pdev->dev);
>   	int ret;
>   
> +	if (!soc) {
> +		dev_err(&pdev->dev, "no match data for this device\n");
> +		return -ENODEV;
> +	}


Since this would only be caused by a programming error, no print is
necessary.

