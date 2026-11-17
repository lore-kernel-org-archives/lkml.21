Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951962;
	b=HtTXK9hsnOIMqP8/LUnV4akTamDkWiedACsfu9PtSwH/UUYF8yGFLOZqI3W2aLELkQ8J
	 E2AIHCVNHx7ILy/dZoksKjw3SW/GdMMmn5BDNX4L20rhdXbV0PzgACEVe+kgwEm5uAHNu
	 bw7uHir1pQebHSYZGbwlehG/kNA+d4g6zmVoaiDs+0RVroTKAmIfdcu6bxVPTpEhu1not
	 DNjQ5AnbA6WdKnN1AG/H3bcGR08T/LxvSsBLK7ouD4e3mb7fcLyDbsVMIO3Jun1hVmEBh
	 25rJEpq6xe8S9aH2OqpiasMkdoXX1bqF/TL+BiSMY6ZyJPNEJSH1PMHzDqOEcxPuHWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=e/0455aVSKf4ZqTvdu8SIA7Syq8Dck34mc+Lxs2NK9Q=;
	b=0409hGVD9XP/QJkPKhlyyIn0WwThHR78DwszNlIqDJ9J/LExdbFom4w/ATElM/CJfwCy
	 8zrhgQKSYlEWs7IDC1HA5VgDCaqu3sKDWd4knWqILQ1TvQ0Wmy7Mw+K3CqOnKd57I7E7l
	 G2/uugT2auSJ7mKec2Sa4Dktgr7w8CTBmjxuVGur9vMRlzq/IVE/CgiOZlpqygB7tB0ey
	 zF/W/5LXC+qF18+Fi+dK49L3tno/U76w+mEjSw9xEq/cczJ9sb3gYmzmUnaLKRSUdfLn+
	 YLtm+fwxPo2YwNb2fTvRgaFLiamPqRz8T3vcsi02llvV+tZUfn38GNClmkpZFbqXKAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="BlHsY3D/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53ED5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BlHsY3D/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so1052785e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794951959; x=1795556759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/0455aVSKf4ZqTvdu8SIA7Syq8Dck34mc+Lxs2NK9Q=;
        b=BlHsY3D/jlyb0s4hVlakTmciFgw7f77kOCxCNuhA10+d31AjQdnAvhl1BvpgNp/rjI
         4BnxUNKhmx3aSwiCKXd4WRpqWmFAvHXsylJ9xEcfBGOjhlwBdXALLBrEb0miEEomIu5S
         w5JTFpyuOr24QE4jI5IHyH6pzcr7R20XOylB2OyK/gOSkZAOdmO9a9y4K9PJGOCyffc7
         3PrQHtcrqcFwBagnkYJ9XGW0D6VmnbzwlAUvVZKtqKqehWRYfjvVAGOlF73F9pSa5p33
         NBtRF4ygyD9CzwTNrA1Z6+hzu1tzvc2PoqwRts1I+pWuRPSmD+UqiAKGc4pB61q3iesG
         W0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951960; x=1795556760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/0455aVSKf4ZqTvdu8SIA7Syq8Dck34mc+Lxs2NK9Q=;
        b=DE+fb18cGHH8VfsH83lWEluJVtv8GULtSlkAQ5wd5FRxISBrgnTdQuE1B2+3wxp72V
         /VZPVeP6w1gy6iITIIVgjDpZQfCGVTGYaO05wWAuK1CGAHuvidQhFNdvqRkINBhCqUu3
         f+rUIuX5FwlVvmbXkrvZ3R7bevOEMqlxWnWy3rrB7L0uGM30HnJ+r43v183c/y/JkIpJ
         BoG3mNOE7qbRmFCgrjxXa/m4T5fk46KqCq4pxvNy1yhyNiQx0v1Q08pSzbNR2lkSe2nh
         HsRcMDJVcgP8R/KPEBFoqs2OMw2M5+32fElmqui+eKxLPAqsQoAgFiY7prXpbrIL+VL+
         niCw==
X-Gm-Message-State: APuU4Z/j936EaCXIlxHs4R0lec3iQO6NmNMmg/9ho+tu+FBfm5JGeo6x
	JTei0NHArRVzgKJR4AWRQu+sQuAC7zaTDCrgId2dBDwq45GHDcalGOQPynj5kaL6Tkk=
X-Gm-Gg: AYBFou1Ci3qnTcgeSQX3ZJpse58hwqbpxv19sk7L4Mb/fcEPBul3OJVctq68cB1o4CA
	rsHjZyPJtTIjlWvO5g5fnb0DBVmi2qoQq46fxyrpjOALyO5hMsBUINM3wKQ7bUpWrQY4ISa/QXf
	+jGp8Cd7LS7RgmN+iNU6n8Fhvh1elTd+k/Z+dqU3ArtA0fNoXk0wfNauXt3ek8Sj/ohzjUDw61l
	Y01hwDVt3ScMm0PjV4C2rTwIn52qOV9b7eCvqWBXezkmJ4Gwz0aOEXsqR+nZ3F92kf0XQxpH73J
	f1XpmeZ+iRjiUKlUU19XuH4vnWlpocSckviSXaLdZYJdh+m6WqtV9Uyh57b5+jkROT+UNHxRxpO
	PeIbmLMC4LMHIdW8SAQXbFHMkYq3HrfpMJstdNN+pqiJifBkYteJ/Ev9lOAI7+QvRl62gV6Z3i4
	3d+RXJxk61Ra5QpXCEOZRop4ovoBsSKEIUkNgRQqQJ+7h3rHy/cFPnJXkS2zssMUnfhq0Z9FuJm
	EccPDVfJPHTOoQ8WJW0aL1NZbg/pa+vUnPTk/EGSt4V+VLU3DdmPVY19iGPmQ/YuoJiqIf0aolV
	syIDdDHaq+OSbi78gM2MnyX3DSjtT+VC52AyJpfexUv4TP/NM4jBv/1+0DeXZEn3lPXE2lGsx4G
	w5aE=
X-Received: by 2002:a05:600c:a54:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb7da30033mr10977415e9.15.1794951959287;
        Tue, 17 Nov 2026 13:45:59 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm15648465e9.0.2026.11.17.13.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:45:58 -0800 (PST)
Message-ID: <39614a57-c375-4bee-bcea-f0ebd2d0b572@baylibre.com>
Date: Tue, 17 Nov 2026 21:45:57 +0000
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
Subject: Re: [PATCH 1/4] accel/rocket: Fix the IOMMU domain leak in
 rocket_ioctl_create_bo
To: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-2-kernel@airkyi.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260814022453.437-2-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 14/08/2026 03:24, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> When rocket_ioctl_create_bo fails, rocket_iommu_domain_put should be
> called to avoid an IOMMU domain leak.
> 
> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Daniel Drake <ddrake@baylibre.com>

