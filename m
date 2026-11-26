Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672795;
	b=L0srhjgG2kX6q0uocP426QVkUZGDcQQQ6Mjh2081ha0B40dXp0l17d+VdtN3nIRMlTwo
	 UbRPSAFIFHMsbG1661Ej+E+elCZQ8TSVJjuDzn1R04Q4B0wuUeegligIsD12NSeEyz252
	 CCr2okHVlSMOG7TyFZDkLNK2nRUZLbvJgJWPdgs3v6HkkB5Dsx8l3YT8vP8zlkFTEg62x
	 kp5o1AFEVyo6udznd9qDXNHWhWeMuAqph2X/PXAwpDdvv1bk3FcK3yxGQguTv4Mhiaxgn
	 V1TGunZ0DHDqcOW1jVZH6Ek5xHzf/6P0ahIi2fWiAm0RoXk4bQFZTvWOyBBCgEBzDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
	b=TQNsgbAq28Nydu8qwB/kTP+eDo6yQZjMA5etpJxNwDS4TUBG5/dNpgo+WyIaFS8wLF3J
	 xNOiH2tfGzHpMJ4vWiF6n/mqkl7fVyXxws4rjSZGS6/O2iO9TJnszs0aQ2aejvG4hdD4G
	 +IedSW/sn9BcglkvoXK4nFXtjzXk6dpLd3WtaYWCo7/UumXYqmkJFSYl757XgRDZzCUbS
	 uZpfFmfnveNJwwPpN+ZnMY/zRX2BonECmFqL4sOA8FnNkAD8aqlSQpFOB09qqtQCJKOz3
	 PmrmX3xRXf1r3AbgK8bhMeyk+UnzJdkObwKaEvrqwGnReOWVG/u3+eRlLBX0DP8jnAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B84606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B84606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00c727a21so543202e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672793; x=1796277593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=eXnfkOdxJc0Gj7vmJ8rNyjwrixGiB80YcEjr3kfxXXWycGgRixJo8zxbnIzNFq3yNc
         2mMdoAgIIepQ2rgKnIcqF0K8Ll9eeCF+H+HCXTEzWIn2DGA2jL4fMrPxUFQy3HCk3Xho
         YM+CEtXOh/+YQemc6c8XUTfwL7cc73Wxn5BAxKVko7gF0qH8FaoP1GFQFthtGnYhYhj4
         v/6KADYgbLYCA3z2UPDOvPzdlYW2TEnWANnnfLA9bWYQTYBGWmyjVSZkSQtsixl6N+8z
         7fuqCjnuZdhE5DFOtA9to/FYLZvKfJdwZDx64/SawBHM+x+VrPGbavm2BWt0jy8yf4eq
         00cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672793; x=1796277593;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=OB6KceZEdhTT0asps3/zeoqYgwnAh+kzvsDXH6sVm55DufcrIY9+HFr1jpjIlWvz7m
         IOVBrr8O73oe1ZQsnarPdxtKgE3K5+aUEtP8mnVDFchdFCnYvvm16sEbuLbynejj3sTs
         2O52Ye5wUZYpYjAPEs2go8PwfWf8xyanJ9HxW+tqXmSEwCjh7aKCSDcIevZOdw7LFzc/
         /IuWa3rvIgBbB5nzCT36dBDgonenyeIDPLnslaTeT67Mr0obFO2y8rngSCe/UEqybAQc
         f/bqKRHqUXJC8VCWaBOuzc9X9AsHTRaKKZnSOQa7WebiZ8iHK6gLTx1omwauTM10N+f1
         QpkQ==
X-Forwarded-Encrypted: i=1; AL+hErFFakJ5kwKB7TwEp+Jr8VvESd2QLz8Tv/1iZFgGnTaE9S5U6acasEezQx9qUHfl2k9/WcHshQaSKOq0ed0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YQ6XxpghMpQek1XcaZWF4i1OJ9qJ3HG0ZU+Sqh67lLWvfhR9A
	+QH/lPoqZJ/Zip8kzl8jvi36X/CytbDk2hd3yh/h7iZxFRTU2JIREJwjAptFmJ/0QpM=
X-Gm-Gg: AZFdTZeKB1MkPdaedisdWr6wFy82R/hBGZcSkEq+uHjHvwSHXh29WylN2KagPl06vOf
	jSWl2pk99W/0y8m0sJctO4VJeDuVOMCv6M82WiIiQ7i0sJsdVX45aSz0o4yC19oURtojvGCQznf
	ibiFREitF0BWA+Q6/6p9xJft1hUg+5D4y1yiz5am1zMZ4h2ep1JcBAYeVMvzf/Fahwl+/MD9CDW
	xCxSB8o+2oaJ5dpCjJLJzO55z/8Ca2TIue8jKqHq/nl6/nBCnXPWDOI+mCfYg8mj4UK28SHuwk1
	AIhBK5z6obEIRsUq0qXwXZ8fIlZX7tuFq6E8h8H8+sR+BORfIIA1VeP93y7D7kqJZCrPuVHcooi
	pIHofIpiZx9xOgcfZC7HwUgwU7FxdJG98p5Je3Zfsxlyi9xqaGL3QiRtAXb9fKEKgpNq1PJQMth
	e23bDDswixqkPK+YsRJMeDvAUKSTnC3bH188h2fA5u9IDbCMLscimUhgfJn0nB240MaGrw+P1KV
	FyD4Do1qdBD5dXmvFqof94/kO8CsUDCAWla/5zJ1MMvn0l9H0h/Zwxzml0yrqKR+TMjYh3bo80x
	Od5NZ0VHzDJuGWd5X1nm6rTDEj4IBv1zAHFyI6ghex4RNNi9EkE0Dz+bjt2o+1dz62Q62GVN5Po
	P0qsST/w=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6662753e87.2.1795672792982;
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b3eesm5192662e87.42.2026.11.25.21.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Message-ID: <6d7257a7-92dd-4a1a-a598-9a4cd2be6e2e@linaro.org>
Date: Thu, 26 Nov 2026 07:59:51 +0200
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
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
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
 <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:36, Nihal Kumar Gupta wrote:
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
> 
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
> 
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
>   1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_glymur[] = {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy = {
> +			.id = 1,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy = {
> +			.id = 4,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources glymur_resources = {
> +	.version = CAMSS_X1E80100,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_glymur,
> +	.tpg_res = tpg_res_x1e80100,
> +	.csid_res = csid_res_x1e80100,
> +	.vfe_res = vfe_res_x1e80100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_x1e80100,
> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
