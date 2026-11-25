Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616481;
	b=CqMQgWX7iAWxQdXc0wBR3J8dBoHzfP2g1EqwC5KX0yGb1XYoiQMoB4euzQLD023I5Ju5
	 bwS72V7CxPiLkVovHzz2qk7QX84zHvHnwIEErr4+3vUnmg1QrRFoS3mhwX6pZCQEUWATN
	 wT4qgXga3jE7bvhiCtWzayVZnvvBX0sOHHIm0oRp39wLesBtjLEKhvmazFr5k4qaRNr1U
	 CCLCKwePKtVcKalvSCisNTpvn5I0OMcN1FZG8TK0gqQUDc3KatcTCOFnzxaEZjXRXpshx
	 P6dKBcnUCDcNCrEUX/XgCKTVcF3E8C041YuBIhvcgjQyG59jd4AEyMM6RRzUF2LzDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
	b=i059sTHYNtTY7yvrSMTTlFF0MDJEeR/u72ufI+jIVe6R1OcWD8S0muqCdRMXQlwwyu1x
	 H/YOMMc4hurUgKndFOUJ+2l7TevT7LkBQbKNmWjbB2qUMD0uLcZ4JTMDzcjzn6euOhFpB
	 v/mXcuCf4v4nEP+CdR8OXk/cAHh0W2c8WnOC8cRTBLjV+cVKBdkjoH9fVNa0g9mlEiMPt
	 zYiGuX5Wsr3G7v1NmiMgODiiYIyIikghO65REdQIjf7Pl85eHrnMfeGqppcZI/XWdJqLD
	 G1Sv0WKlvzCYkrPMYXTNy5BDzwVW6AWpVEmWlNULUqh6OCLyTwDpnG4EmSdRk32C6/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47154606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47154606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZP4cszJX
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso4802741fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616479; x=1796221279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=ZP4cszJXmUZlMGJtbZ8PlmAsjUZ6rzmMVf8KPM3mYZ3Ns9WTxIMJQFQ7gtv10yYVG4
         0CgaUMFucTfAEE1Z4x4SfeIuKqa+CwB0FrnIcJXHvuoyNam+aUvUnr0KvwPsaVr6jMon
         Vlj2PwIRSIOSXGX8j4rWov2YJUxkCnEz5ccDZGiL5SIXVD0qq8U0mX2CFCaGlMRXYiGn
         FsxDARH41XcEj/7c1tAsIlU4D+CpX0lyDuht4nfDjc+6TDwfa1eAazA+yBsoEIMjPdNg
         bQAZYuKxqdpjQJpGRMg5n/uJIGq3fKGuH5GgqD7KJEyg9c/meRTlLh+beVP0lZQ+8LC8
         fzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616479; x=1796221279;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIFur0b6JQXrtfZ5k2pqTwRixw1NNXm+TnSCUVUWtkg=;
        b=RKPtb64xwqKm4O+2H+sIIy8Rh7lFlI3ZraqztSBwXltQ1qQcn0vC9ls8zaGTD+P4JA
         d7vrnUmoCaW2uYCiz7yZwgJRbmYHpmSrLsKLPPJrdZOMDtSc0ZRGfxoW4AzvMJLF94E5
         XbWERXhG+ovDLVuKem8bUDHYwIUa8j1XwWKhnwU79FIhLWPJh+oYgB44c9ER86BBVFKM
         wFpQx3kuHDtYeFlHggUtZfBD2Fv8grqcT+OGMHJvgTJ0cid9XFpHok9IuUaPq6q8sM8z
         PPzrCdnPhb42h1goTWVtIb0APJdlt52xqZiH/weLrQ/sjL9siAdQCRVcuRo8hPYG380t
         gdPw==
X-Forwarded-Encrypted: i=1; AL+hErGPaqdCih6XvPzErRAtCmn4Xrceis8fKMALE/XpeKmUoCrVPtllUcNTfG2yGGRpOkIjBfuZwucSRL8v/Gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TY1OaLv4ucVb5rGjXy5APqWzoXSQrrgWCMO2/+he/1pRvxxQw
	NPbijeyaPUQDl0rBV8G7tDi4W8OhNNjkFeCOcs9SCBwxtZ6vyF2RV/U7LMgqS7FSxEI=
X-Gm-Gg: AZFdTZcHhDpTQcJrXhzuJt6T3zFBEuTxIO+pibGl97cZLVNcuCQsjRh0uEmPuulpSSl
	oaN39EDhZGpr5qzGKjppFXPFcJlcyAHs6XQeu5/fVBfOlavtOHW7L2hBHgUaBmAMwJVpH58kxcO
	GZyTfiVAsSsJgQinzggGWwVyhu9ivuFMxZ7ELJhardsO2JKiRM6k7iq3KyiMsbZFUJyb7S4ZQTH
	M7VEK6x9vD3pp2C26eY8V0VQF7I9c7orcT99HEF4Nj/xalui6kGIZsKwwXFKkdBQbP0E0Vf1Efm
	5wOuj87BRvCi2U67vYuOvErIWxHInO0jhx9NwKCyaD6/lDj5GjcKx0YAEdWgOd3o3Pfr5gIozx9
	5IIJrksxb2qkzrkhlO4NC+C06dW8VYHgliUMxLpgH/tcUDkGwhZDZUSo1rMN19NslijjQjp9Zcp
	hvTcjnDTwSwBGFLPIVsgwi0WUFecg6xUOyWt7C929InQDsDkcxAOQX6ps4ovKvgm2hgN0CmXZlM
	rzDJcE0L49BoEEfiJvLz+PSHtEFUGE0C1+YnjOhx1kDuvvO3YnOwc1iENt8GkL+ADXkRETkD5sb
	7FB/NUGxJ+m03cKuvD2nIgw4T56eWnoqvo/+OHjIiMVuTcf1sWZ2CSWG9QMWDG4Es6qRmwi/z24
	zbTx5uI2JQRyFlKjTtDy3WFFWv3Xp
X-Received: by 2002:a05:6512:31d5:b0:5bf:f87e:3d25 with SMTP id 2adb3069b0e04-5c1bc6b22b3mr6618657e87.2.1795616479393;
        Wed, 25 Nov 2026 06:21:19 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171c7sm4541303e87.31.2026.11.25.06.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:21:18 -0800 (PST)
Message-ID: <aa0a99e8-1c49-4417-9a1a-8653cfb3585f@linaro.org>
Date: Wed, 25 Nov 2026 16:21:18 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
