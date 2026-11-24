Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532889;
	b=RVTB/NdllH8fM68qel8OgiUBDqM2Bbe6QU+RjXUZ/YrjRAZ6ZMIkEUkb6bgJpjWH1S//
	 59kvKaSV7dtDF4Mct3+rNpdVHTbV/tx+4e/Un5klAoz4ji1zM4Nm21Ep7rCvjJ3l3ofKX
	 PMIV8hffdr5LQDG4LiQMlwzu7Y+kQdgdJcm/NM2R4122/JCGI1EfScfdabWbgvDdgZ5g2
	 mJQWViULtK5XGAad4c5J3gIgnMBmeQlCnyyaetmDIWSTf333vgKt0Q0JX61l0obvuv5UN
	 GeU/fhSYOPiaQDbZyKKtcm5kvAPPYygOD7fU38TwdcRpFz4H95RHiBDLYTBuUItgN9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
	b=w5CDoNUl5cLwQmOAUodl3meDmXZrG5Abur/iNo1WjhuF78wE8e31n6QI7uY4gf+gZzMQ
	 Xeo+owU8fCKZn/g+irL53qp5sCoLbkvxh6iRTchKPx4PJwGDDmCTY58PjzqylLDV2JSTE
	 TN+uuGAA9KsR/8TOc2I5WZALocA4WMSw695xT9wdHudmy/JkiQHCa/01y1WJlO6FSOl3Z
	 QMNCSzx3GcQQQwi0kVrllBoUQywEiKgYI9c61RcUFVfwxqTa+4IlMtAVgpsWl/UKtVzDZ
	 GWLj4mM/yn5R3J7UpZbDOfMyice56qE4/zVn9wWYBOLTJL5bSrOMOi1bPFmuUZaw8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=huF2aXSt;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4711606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4711606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=huF2aXSt
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so371214e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532887; x=1796137687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
        b=huF2aXStSJ3iFxCXkTKtIQdWRau9f3KhaHfnoWm4LkxmLu66ckgjoilV4M4Lc2sg/J
         7QEuaTuHprhXTIgZDJSpnbhXdV2MrKITuGdzJC33e8RCX3gVQXSGcsJ49Wc6Qi9y52ry
         EhdFJmEc5Nndcg0ajGWZQFBvSe5ZpVTnb20fIThl7g2NTFytiJ2lvBAHILrIYk0CfNsD
         EsMDhlz3clKlw4YsvjB6m/rWYTvp+KFGcbov/w8BfduICgSy8Njc2EUhItghetpN/fcp
         4C3MmiQO+2QWSXHPKsOctRpKDSM34GUkfKHgSXcCEcIMM/gOAAjHDobcPyUHpFEBp/oq
         h/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532887; x=1796137687;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
        b=ImlvxlVHJVHH6XJRlplmgulmTY/dQEt7JjB836+XTjD7wwyJlpsTx9mE57wMC15Bql
         hsIS+tVaxUqcaosU9uPS3mIMy27lQAjuNnUZFB7lv5bYHg0XrjUdluQweLy24o0d7575
         IsU9Q8Yxp2DbVfY4JfZJ9uxWk89QAXqgKdhQPSJAvDlXr8e+ExQx3uUbLO1Jy8sjyGP6
         wz7Aqdgb4QiH3Bhw6ejX5KVy2tAmLpEQw5zJG3TY3CSBf6cW7n7pk2+mgzMIaYGRELoE
         4Iu8+WJNxsudeTFnpXEt/NvB9Td4DeB6ADN/X60yRylQ00iYhCmW7SkGpcjp0HmsIt+t
         MW+A==
X-Forwarded-Encrypted: i=1; AL+hErG23JSixKPjyiHiWd4xLNvZw5QghIaCgR5v75UqdNUZyDDvIlMWou/8Pp7rY+iAAgg7oUg1OGe7Jv/XCsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S0Q/swto2VbmHHVL200rq2MCgtm5NVEqAM/ZiPJGYxVcRWz+p
	eTkG60ErdEhGsmyyOJOjhPcYQmytytwYkT4yXf6jxmZu1xhfVanPkKlfC7B9ea/dzzs=
X-Gm-Gg: AZFdTZcgr5XCXMdMr8ohQFqAxM27wzUWwMeQnrR4iEVNLsi7KUSv/SGKF75q0cw8K0b
	CS4rbL/rkUpiwTLKyvyCjfj7+I2lP807zOfK1eAjeYHyQpjG8WzAWJAXdZLUR+COnUpqb0QWw68
	inYtfwX42rLSt213biN9vLYuV/iNSy5fOZbn3KsAjdch1yH8FwsiphGVE04Hep2QKjKB1SIZ6Sa
	WSShBHFDVMcVRp8Y2Dbs44bTRrBnyWUTAhJSVVqmv9CLCEZZoXUrn+Ewka7QI/sfOLjRqYyhil4
	wPCDX7FXG7dXYOAj6aujtsipjR1v34w8neAQf5roXt1aL46v3sFtAYDPNv1ztc0BIVVO+IBRymo
	meGpF6/uodcPW/QTJr2AU9KBXoWiA6CqLQmCBdgpOUuj4tI8IQp8DFkU9qNN3vwan/CG+ACIHqR
	gp34nK+qOIVp50LQwhzW3NZdfp6f+OqC4vzQsJyzghZCdkFL3cjDWLIGydLHkMQTaO2Hojwtp4o
	YRntxfAKn44E7Jd/4vloJ6ncgDJPOf2Lxni1igy8byZZDsIrNYpZccDDkBeV6sxgHHp36qQzkBu
	aNHFc0744QT0h8s4Vp09q2UamkdUtEPPpQCSWhzTmPuydvxRDJicIyMktnwQ+BPpdI4uwt9vsRw
	sqV1klFlDL1OdaYssi+pdTdWm6sci
X-Received: by 2002:ac2:4c4d:0:b0:5c1:5703:46ed with SMTP id 2adb3069b0e04-5c308ed81f9mr3280060e87.6.1795532886937;
        Tue, 24 Nov 2026 07:08:06 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm3854033e87.17.2026.11.24.07.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:08:06 -0800 (PST)
Message-ID: <725d024b-ac3b-404e-80e1-5e3d6f43ac65@linaro.org>
Date: Tue, 24 Nov 2026 17:08:03 +0200
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
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Every time we add a SoC the src_pad_code switch statement is expanded. This
> expansion has continued to the point where there are more SoCs listed for
> what used to be the exceptional state, than the reverse.
> 
> Invert the logic. The exception to the rule is the old SoC set there's no
> purpose in expanding this switch continuously.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
