Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090872;
	b=nzrOE4sYZV54zCbdpK9Z2pSKJ4z8K000ew7DKfTjlH6Xtf/VoVcGehLb00sQ7dhVrWVX
	 l0XyoCt84rBJErQYcV7o9CiIjke+X+OV0MFfSeMkiCSWUiUBAXY2e3skRR4EHN6xDp4Qg
	 fUfLGeR2HSIDE/ULm1JbV6TJn+ES3y49jA3H7RCtaGg3oWyT3jhM4JdYkeYs4Z10kytbA
	 FXMQru1aoFMKQHoIAIhRq1xH6C71jRzSR0H7a/ZRBHHlOF1bSzVinym+cmKPFOrPX/eW8
	 bp8uENBcHiWWfpd7oTBTgfRJS8Fyg7fAy7wH8qn2g8PjrWIagPYdwczhkGc58tcPZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
	b=vmLsndJ1bFjM+vw6nZw2mf9AhptdmYT+ACbnICM6KJQELgohFbf0OM9Cw8q5P0lsNX+X
	 cZzGWOBS6VVh7Jq4fzTrLAjDa52uMjt7E0dBXEE836+jyiZot2RirJTFEtfEqOiagHtLy
	 K1IQemLggOyDMNmoU9vuPA6ZYImhO4pRVsB6orEBtrTAQhINmEGtX22jaPc5yfqhM9Huk
	 j9fQ2w2+SvukMmb37EX/6NZLz+r7+K8mN8Zrni967rVSbxXBFtTXvMycZJlS0bdOSBrwe
	 NG6x6MmvUZtW0KvvLqPY2aaaWDzqz3YJPdrLeCgCAM943Xm2mZHt2FeBsmEYeNeUFBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GIV4PbqH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E02606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GIV4PbqH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20860125e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795090870; x=1795695670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
        b=GIV4PbqHeGq4Gk/jo/EQNtTLPSTM4Fp7k84fqaHnbhCmEIzbs7mOqsfNB37GnNmQ62
         wn0+WlNIGQX5dUs/FapjFwGJ4grnw+WpaT9y8IBQQRuKT4LV+g1Y9xGisErJlNKtkftc
         tOJT9skopUObYECZQwswNuvQMSwgh3OQ1+SYEr98CS8/j+ST2RtOOKSm7WIgFZG1Bb/a
         W7LnplNGH3Cm+sW+u5uw5RSzvER+pbE9UDAEquN/wCe9s6AOz5YKGOEsDfHM1owkTiZE
         mB2n/VmUYqGbkuaKKkHAIpyvz1m5WRNti0LYA60sTZxRMg2cRjFuAgxgP+K6rBnLy8EI
         ObzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090870; x=1795695670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
        b=GmRh1NeJ6Q8TzrRKmC0l6augZvGCNeehVFmG2/Cq0GqiM9i6qtXFSNveWUNtd38ICP
         sRqdSko2C86SY7dWp3F5ZnQWNyJr1OK8fgPi5msGICvEQzsdu2ngVC1o41qV/VcWFvYs
         F+7KwBr9qyqfEj6L8SGOrcQSen5QiZ6YxKH2gGrh7mEMqxbM2PpWCSZE0GJELw3Nid6A
         wt6bVZWuGygGi+OedXhjRzHte7ILL4GImtMVf54CX2Zvw3RH/tSpjdc762tVmwAiLsob
         zy6O7MJpj0bfNojkgS33bwKlqxVi+8nsrjYqZLYbfIIhhjMyOjo2iZLZFwzYykSL3AAW
         vATg==
X-Forwarded-Encrypted: i=1; AL+hErHXsZ/B1cEz9aB+bjCEaHh8T4d0Vac9CeamOCVr0N72psjt3ooMgGoUQnfIrgZJKOaBAo5+ecWeDpiYeWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q041vfWZTqEMuY7KhZwKgz1G8elPiLf9ZRGiyj+XI7iSORJuc
	+uWkq+CeZdCwiy9trBATDGRWcovbjBISOt9I/K5VqLNPLGNjVq0fsk/5xg6fe2L4MVg=
X-Gm-Gg: AYBFou3eydCAVnsvnhIw6Clmf6EcyyprJXah0tslHZ9yh+Qb4dVKjAOr4QYSM+AnoFr
	gWiSIV8r00Vi4ZJSsZWwykjHdusm5eFalUkRqfA2b0ZH7hQigD4rdu0KqY7KnWKTkjJNVUt5VOs
	3KNuie7tHIOUTSSinO0MlIU8Ei5h/h7Lj0eg9r4HId+2j9Wcp4he1jtZCrFWk0LVK9aUVZ99tIW
	gYseJ5Cy+ZHd/0v3cBz1d5d1VcKqdBYo0m+o6u3vkjUWpnNZPdbUKM584M++fbI9QwWi2tvuYtn
	jR4IDLpWwQ91cX0XeSSrqmir4j0SyYfJZepHhYTeabQOtxsbCcfbtOH3ZbTAuW/IymKq2ox89Yu
	2J6b0tdrHdyOwFU/BOiB31cGYZYf3m8rm+X0ecZcTL2kAsmcMHFgbChmzZwbPl2DVZHewWFyhH0
	p5m3Rh3iyWXmhI1MrlCWnVVdO3KbEzmrt9Bp8+JuO32DRi+RCRliAMx7cZ2hrQhADhK333KOzKr
	RRErin6DDwpmQA547FCsZzRkvvMUolMMwWacGhi6bg4KQV8v0DzvZmQNiIxPrGDSjX1HGenUDs/
	DiL68Dx6LRWQsNG388GUc+WvG8ZQA4UYm6nNxJnr
X-Received: by 2002:a05:600c:4e45:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb7da267bamr102371215e9.22.1795090870232;
        Thu, 19 Nov 2026 04:21:10 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm31124375e9.3.2026.11.19.04.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:21:09 -0800 (PST)
Message-ID: <274849ed-4090-407b-bc3c-57caa029ef0b@linaro.org>
Date: Thu, 19 Nov 2026 14:21:08 +0200
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
Subject: Re: [PATCH v2 3/3] thermal: samsung: acpm-tmu: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:51 PM, Alexey Klimov wrote:

I'll review this after you address sashiko's feedback,
don't wait for me.

Cheers,
ta
