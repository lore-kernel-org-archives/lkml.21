Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672723;
	b=o/ZtNKY4gxgELILbnKuyUxvaKl1u5B+rxHVBKbtvQ0fYI+z6SA3A6N5dloIWixUkSqml
	 GcEhzAq0k1CSO3NeNZoL54dCXPKJk57XCMyLCsQRXwEVK62839QDFMFLww8n1zdMazBlP
	 ZUdESz4q6tPnDwHWNeDZCHStB1mVVR2LyyvZK7+MK+BynEXgyOpoLqaXCrWtUiCUBaSBI
	 rWIR/x8ZyGgdPkRusvJ2MCXZzZKgDqKKbUSW/rceEKOzHkwrmfQs0ER+BwMGYii/47Jc9
	 ZbtL3/+k2Wp1By8sEE2Xab+3PY8vGLakinIzxvgNlO8E2Fwg9aUww+VHVpkM7ZqYhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
	b=e7+h3TLzUU0bAhGjDqMoaDvzqNrSUGMOY/5u67j+BBPvnElQfWNfGa+WMUcHVR32gvGh
	 wyItCxmxTAuycyxCjmOPe/DWnaPf3cc3+mu0U8DyaWcxskeKQET3o5S99uPYh/oOjvxIV
	 s1uJiVfm1uasvWxzDfV34PjGkFAH6m5OVdqQh0/LCpgh8UhEAItmY+wzaDhTUxZkZ/6ON
	 ai6D97fZnnkDpLGD5DGlSHzgAA+NQug3zyYHq2PK5VICJGZ/0FErtPtjsiMEcDT92x/lj
	 JGPa5jIJyfKtfxO86tSTPd/5QS69tqF1OnNk5BDg7VWqG0ZT+JCeL/eLrX+fTLGGETg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA922606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA922606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so381936e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672721; x=1796277521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=fgwd7q4x2oo3KRStS1qxJPIf7HEppN3pEKniLX3DvaQ0dz0mnDLUa2B/J80XkRGLOi
         uSj/dv4qEmD1ay9SwXIH7KcaJQuiL7PMmX7c5wHN6RuL6Iy17q8zb/Rj+q95xJ7Z6TcF
         1BADaB3ltf+Lb76igC3VlFAjUcm8+/WK2J8qvBZE+bakF4FOrIofJyCkCxciMA0qDFZ/
         mt1MEueLyRgt341f+wZm0DcDAVFuLDV44Fycw7rkElZgzXIvE6XeK/gJPEY3IS5cYIQN
         gtNxHQEJvjcIdA4k2GIpzChqsayFFFu9FnSGq1EgXCABDVOyZxlbRyV20ZoBYkdGY6zy
         w9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672721; x=1796277521;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=AG2YlAJMa62zXE+JGUwixuS6/MVpOcpAdPhPWpCxZU5CX6L3vaIXQa923+A2hloTyo
         iv2zQ2AZmVj/YQwnLMifGYch+IhrVaG4C48Km4IRB98VLC3cOsHiQqf8cLRPSv/NQazO
         TixMfRdIft+YFeyUq8/xUeEgvwqd7j8QX7t0f7Wf4CdtmpfETpVG48PZ22vY5grOIEce
         lfT2edFg0p+Zjq4Zc9r90cTMrDDicwNW7cApeB39OablkSVdidyww5fpBnsAgvjTI8fW
         UsW9t/n7ygst2CV7vsAB7aaGGSIPY26zrjyotRQdr3OmWo9h0gcV94V104NNvCmmABV7
         /zbQ==
X-Forwarded-Encrypted: i=1; AL+hErHNHCGeuwwdxKrWkEfiqxdU1U5DF3RDOpCwvEypvl5LzWPJNaai8INIht+C5U9qktx+lSMDSrlXAw1E6dI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YJ1EJDHDaFJxb6z8hpnZiJH2WiFsD6uzYA3LCglLEQ3Bavid8
	MAhHoP83BJ2eHZg94jNBF3vkYsgtQxa3twvo+Et8mFIOWT9l7Iw+So5Ucgu89H+EYvg=
X-Gm-Gg: AZFdTZdxqLF3mT/Z/X+rZURyLPUzbOde/JMvS65l3Wb/HIBe/97ImKEjmlGh7V9Gvh9
	Cv56TLv0o0mr7PvpfUrgNm9t/y9NVWbckhz35iBvE8M5n99++oKsEUUm1xs+hV+DxdH7/hgZHVB
	6I/Rl3uCYWi0kDpnv9/4YRwfGK8SzrIGPl1xlZPP6ZI7BTKt5Tvc3Gd3NAyd1QYtXeL0nFVzTuY
	K2Gixg+JV0BW6zMRYtNgv2HWDpnRtQp1yVdfc7n9korxiwDwbRbFdwVO50O8q7UVvHJy0gX3A9Y
	XhPwCuD25h5zKH7rSpEbfnsHHK+0VNZb21xSIgpAHU0+fezfAEpqKWTslQnXegBqlA0uxXNdonA
	iXmElIubQkeXyytFMRptdUHmzyaYfo3SnGFHrYG+G/Gl8GPDwjj+cozapfEjI76qmP8Uv0Tq2LF
	2cUAG1wii1z+2pbNk8d11T+Du/lCGTVqlt3sXbxdTI1YMu0X1zF6G839l8HVvnaujI1m6KgcrU/
	2NXY3B+M54MfcjSZWrRVe4Mjqu6S+hfkYNlx+GGPyBIy1yEgdrkzyqFHRk1R9+gXOqISjHMGc86
	BdMBhsc+yL5B/7TY8v4G/lBJZXPoLmRsFaURWSK7YM8wjXEyBxqmpJ9UAdmPmr1e/vjT3fSUAuR
	GI9tKlAs=
X-Received: by 2002:a05:6512:85c5:20b0:5c3:2506:4c1 with SMTP id 2adb3069b0e04-5c32506083fmr1030505e87.4.1795672721080;
        Wed, 25 Nov 2026 21:58:41 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043420sm4925147e87.57.2026.11.25.21.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:58:40 -0800 (PST)
Message-ID: <69b8d22e-f688-4458-ae2c-0e75f7b23234@linaro.org>
Date: Thu, 26 Nov 2026 07:58:40 +0200
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
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:35, Nihal Kumar Gupta wrote:
> Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
> The binding documented CSIPHY4 as port@3 because the initial driver data
> reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.
> 
> Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
> port@3 with port@2 for the third CSI2 PHY connection. The matching
> Glymur driver data maps port@2 to hardware PHY id 4.
> 
> Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   
> @@ -288,8 +288,8 @@ examples:
>                       };
>                   };
>   
> -                port@3 {
> -                    reg = <3>;
> +                port@2 {
> +                    reg = <2>;
>                       camss_csiphy4_ep: endpoint {
>                           data-lanes = <1 2 3 4>;
>                           remote-endpoint = <&csiphy4_out>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
