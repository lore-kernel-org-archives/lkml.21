Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821031;
	b=d0jtszlOstxM9xrr0N5GLYgu/K/THzxn4vcPLxf9oWQj6PCklI4e83LueY4jT3zjcQDC
	 OFn5TF0n6Cg4UdRmdhCLR44mTAs8vLVkh37YaS5WDB9xHLb/hwczrrIY1KZ+1sH2gkhSs
	 hmAb/vViF7ddw+187GpXz1XfjrxqZgGmBG4dV7dXdBW5bel/6IHKskWlsCDqWXW3pXhYN
	 Soqt3KZGgwI5ztiNzenC1mpZ493XWF9ffAwAxJdfUY3i9N4I3oERGdpPXQlfhWGYEtWko
	 Sb1UHNW8HTCNv6jaLUnA7BPSsEoU6e2paIlKF3yLpgXLGGG6AjMMaVFSr1VTzP88v9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Npnml9QjZCRfW4O0nCOfULU4UHnXEPFvx98UTggm7eY=;
	b=gYui8FRlACjm0khSEguRx4SVuClZ6dsxorX5QxtjyO+Gde+SglmsjTnNmQhSqgxCuMS8
	 TAnb9MgepCxr5pqY8sHLnwaq4hhswJxV/dBuN+/Tbb6YR7kflnP41lZ0FeOqxBcu/c8b3
	 ZrUrOfT3qikKrIoVbzAT0CCNih34akIU7/qXGzIStg8sgUhz2nZnNeu/s369UYo2g7EMb
	 aOpnqhVO6lBCPnPnrTPRthsiNgLqwxGeoB0yZ2ppMRlG+RHWaPsOw5CaKJD1F9ENx+DdY
	 WZkZ3bHtt3p1FUScpkNy6QHiIrsjVtJrvC+uL4UvK6oDV0uvdGDz2kRioEJ5k0+Z/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdMLsdtM;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE06606A334
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE06606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdMLsdtM
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so12770657c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821029; x=1796425829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Npnml9QjZCRfW4O0nCOfULU4UHnXEPFvx98UTggm7eY=;
        b=wdMLsdtM1kKvSZ9N4l5HDWzkx7bv475oyue/HJqsujz43yapjHIUMIumdvYiATnMky
         BtrorKgqQ1x7X6kvBD1sTASXyZOG71lKktkNgv1MB8ZUaJQ/iUBS+ZREqV7fUm5u8PmK
         AUB8d8gjamUQyCoWjvcCkwefsymE4g+SLMa7xR5XK2JxXmDrdyVkqtqC4278gDCaM2dy
         xIe2Ltmzr/loh5OHUUJPsIBJQwQG0MqNY46rDtO/dYbh+xrmJRks8O/AGH21/3yKBVlJ
         S29Or3EbyBpXHk+jw0H8umDQl8JG/e73In7Dp4qdvj4jXYAxJNm5+JUJaYnCdKQFy6pk
         A4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821029; x=1796425829;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Npnml9QjZCRfW4O0nCOfULU4UHnXEPFvx98UTggm7eY=;
        b=fETonzWbeQ6AZqLojHt92YPCO7Bswqn5iBhW1mIpKmEsUVca2MzHCx8pQmbSJI4Xlu
         6+gb2GOGMKZgiEgsPEyxQxctJR/w6YAXovcHEHd/77V3+ZIjp5fpNfVPoip1MDgq1LEh
         UrM8KuONGrxZZJSA/C0+sd4PKONL9CvEFZWAnLt3yAzO2dAth8Qu9WxBYLiqHmuGylN2
         YPSNWiUT4SMoGCkECJCZephPjoESfhNVwPn3t6VtmW6RGmJS8ReHJGm3ZEX6AlDPkz6x
         C+WiwywZml64drwWvayCARE7Bce4LhriLSWAIWFFLxK0XZkXQtfSn3YkVZCbw26uSGAS
         2MDg==
X-Gm-Message-State: APuU4Z+I9qcFmbWErGfAJ4b0abcxDJogAteCv6/4zBDwGWanJMzBVuuh
	XtfV4aawsjnstz1thBuj66Z2fQ+1ylxNMs4XnfrzrUWhzfYYF6fB2lOy
X-Gm-Gg: AZFdTZdS/vBEr3aBYePuPCvHmNYDIzp334zh8mY8CnYQdrnM+5wsKrnvzNsk+beunZp
	8eBOF7JYBTD/O30IcYwfBWKcNEGZFy3M7tvjmfkZPMKMU38ryMetunNyZZ6IWLp/d/WfL0Nlc5r
	P8ojzNQHeHBonPZpaNfP2oMc+yWbPv7pu7ID519mOhVqDGquvB4OrM1MN7z16UpXZd9F8AmO6hg
	43SOSEOqLxoTBVgmrjJz9jwO/nbjYOgxnp0E4QdxL+e7ZlVFtRIk8XKuXPKa//nmRSTpsa2oF6h
	ISj1GKnbHVCOUA3fGynFoWSryEgQRIf4NlX+UTe1JbbKj1siqEUkOrZ1VMQYIXkOAH0GJ+c1QBs
	qQxVFawj5qEICNPIbSHX2ikswocYZIxvk1q53NvIF9U+vcIXvv8IrJD4XNJLRKwYXwzOzwLCmXm
	jYlbIWjOKQaOxZoQRP3KnIh2jMH3mrcasUlVzssDMOLK9lQtF+G/dcvIfSQdVXUWFTnvRQEiHvS
	U577NN/aZd01K29gtK/HbU+XOEdKm3VsMbrnMdG5ZZtGvDwmKbCg9PWokYJE3wmc442vpujCvyy
	eg1VGRBR6NMZu2AlHFLwcYbUAKjKGQzIIM8GgJr8tcgd+/gUxh9qOBQwgJ1z+XFU6UC5OhdUM1v
	yQG9EuPdxDZ1c
X-Received: by 2002:a05:701a:cccb:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b55686ffd7mr22573107c88.7.1795821029109;
        Fri, 27 Nov 2026 15:10:29 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm58344032c88.2.2026.11.27.15.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:10:28 -0800 (PST)
Message-ID: <4ec06942-ad13-4f5b-aade-d6ad3314ec98@gmail.com>
Date: Sat, 28 Nov 2026 08:10:23 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH] dt-bindings: extcon: tusb320: add SGM7220 fallback
 compatible
Content-Language: ko
To: Jun Yan <jerrysteve1101@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Auchter <michael.auchter@ni.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261010081907.479226-1-jerrysteve1101@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261010081907.479226-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2026 5:19 PM, Jun Yan wrote:
> The SGM7220 is register-compatible with the TI TUSB320, even reporting
> the same device ID, so it can be described in a device tree using
> ti,tusb320 as the fallback compatible string.
> 
> Link: https://www.sg-micro.com/rect/assets/bec47c84-84b4-4015-8d61-9433e0d76583/SGM7220.pdf
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/extcon/extcon-usbc-tusb320.yaml           | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
> index 126107dd57b1..f88486c2fb09 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
> @@ -11,9 +11,13 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - ti,tusb320
> -      - ti,tusb320l
> +    oneOf:
> +      - enum:
> +          - ti,tusb320
> +          - ti,tusb320l
> +      - items:
> +          - const: sgmicro,sgm7220
> +          - const: ti,tusb320
>  
>    reg:
>      maxItems: 1

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
