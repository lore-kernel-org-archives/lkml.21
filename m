Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952431;
	b=aZWZNs3Q2uFsani3I77Sh3e7C/Rp0dXLjg0ak8KxXA9Co9PO9Rex2VigRPt2S5R6icOg
	 8dfEaw2dv6ZEJFH7lXGgwxOxjhhhLYTrMaN3Qwtyo5ZZoDVptA5M9TwdFObY+YmhhWuge
	 ea9Tp8M89DPMD6FHTab146kqq7RG0uvzkNfLhvIq8Acl4VFtNWEbEiEu1qFs3V9Id2d6m
	 aGz35jOIttKAim8S4XUYYmZsmC6U+l+cXIjSEFIP8EKothC+OZsCwKwmYHlRjxdAQE+I+
	 GoTeOxCoTrM0kTnBiX9nthDHb2YndGypT5QOFNRTxjmyN8seZBQnEnmBgXEX//EtRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LTgzw7Qx4yJlL2BwvJu8LETB7gbbjhmnMAMVPEMPtDQ=;
	b=hx7V+ZzjEfVT9/eOI9/dsIUnepclAVSQVgwffJ3jqd1rqeNJDHt3LP804/Ovfe/mEoZn
	 RLhseC0dkj4+KYuNtCBaO6yvxYIbIhCXVSNGXP/d4Lf+9jwh/mKdgSV/qfLYwLrsEvKN/
	 4ah6RM2ozjux67FUIssEaW/pItaPIBXDo+iR0GJtAW4Mn8lzetZtRYmw4VPAuKRtTNLC9
	 Xk+9+44vaSz0Ys6oRIBm4rTIOqMEtKDrZHkCV9wiZTtU+KyMkMZRtU4H9ifL9SA2SYWD/
	 dgfk7DnAg3/bPBu0qvdENzjsWzZocstQTba9ZnATfMEttB+YLetDLfdpxkvW3ppCKgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJfc3Dws;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EF7606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EF7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BJfc3Dws
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so2901905e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794952429; x=1795557229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTgzw7Qx4yJlL2BwvJu8LETB7gbbjhmnMAMVPEMPtDQ=;
        b=BJfc3DwsdZwG99aiqcAPYt7f515GqGsWEXZ/hfgb95lAHrkscAdSY/lFDO5TI8e56q
         36bTKynRPfV3e07Jaeirp6ofwKbOS5/9V2cOcuvZ/caqFVny/cfeQW6VGPd3/LtgEKeq
         wh4RXqVXuzw379xGEZny2DinU+uyT1mpfu0TUuKu09NqHGpJ3RSRG4hR6CMO7i/MsMpQ
         BvIAWjFvRzXPJRABLpHFoelciFElICi3c2LrgTIvWG0fn7xbs38TfWswVyLTwlI2JH2/
         grZfXfkLY1WSX1LT43dE2gV5CNPyYBmjpkc/2w3WYrgaQhojNIKQtFH6NKNiBVUXZtQF
         vt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952429; x=1795557229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTgzw7Qx4yJlL2BwvJu8LETB7gbbjhmnMAMVPEMPtDQ=;
        b=LHFMFKk7LWU7LZ1oZPX/PiH5/OcWzVe0apRB6KDyiuEwlqhGS/L2SiKV5FRbkONG/7
         7uSST2XX9n87mAcrKJH+P7yx6DkMgvroNfxRw01uqQS+iTAj9eZL85x6NXyjF3djd1am
         lBYak3K1JgBwvu3jVfoAFrP+1/UcyiM8DMky9llvelZObjKnqo7WxhpLUv9H+e28GsPG
         1Uhm7z1K+JH2zrRgni2+Rm8i6VSKpNniwa4thRMQPUYbrvET5SCndQ5avYOmWgKxJ7Ir
         vjAE2agd/9vuWs0gwPzMVtk8c6sgPvl2ymh8p1zDDlGMzvb1Ra5O3Qwq2Zk0maLrXg9P
         amTg==
X-Gm-Message-State: APuU4Z9wduQGLIQsHGyTYHuZsms34VnbLVouyUWJsUsb4kjFPvAdOMbb
	JzvAUvWaUvNf6bV1J2n8ByNO2tK7EW9+X+J3e1PARmi1nxgyR0hRUbpgP6dtHUpYkBw=
X-Gm-Gg: AYBFou3Ol3W4vm8WzxE+0YBVRY71PjVacb29gKaW5EyV5Tg8KvAU3rU9JjmC1Wqcs+G
	GuYsOEdKIhDqbXBfedUqmNis7OASZ3CrSsOa+KTv2LBNIZSbexqf46EbOxT/tgOez0WRyAMvoq5
	aY0iFVhHDEktRG/5M0UWXKekHSMj8rg51sv63Nhg630FswYxi4IkiRZFGAWYSAbStYq3PUu7zEA
	Flq2m5wr93L32/yCOCe/AVhnytI3YA7CiM3OrJyBb/GvyLT+54xJLcZEdR2M8YaoKf8+rCgzz+b
	sSnIPTeJH9QHnQVEIU5M9dDi/qRH2u0OMfO29A/CacD88mMCyVF4bNOuuQWJttfJGHs8rxLZEus
	7qx6JHV7R7FaMuqOSMbO/5kL7b9V5NK23DFwRUV2MUZ3GPSJMOP82YN8xkgTWTvbYlrljQjeAkS
	QKTblH340VYZ2CtdylNFSMb2lnZvcYj1UyDUQNbNUltEDHlabanC+KX1ramAUKEgD2DFHZM2VTf
	YVgWyGIl6K+KCjeEMVnLDukfF9qqGoTprDlQYETeTKXjsINyj+Om0PrwZCxg0tC6vVq0jx5hee+
	Sdge/MBOVXS2lm5SLf2oJ3xhjnERYs58j017el3UgQujli8gk5FYXt+5LGxK0FZFniA/NqUM0lz
	ssw==
X-Received: by 2002:a05:600c:6995:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4bb7da03a42mr9384865e9.5.1794952429178;
        Tue, 17 Nov 2026 13:53:49 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm136099085e9.4.2026.11.17.13.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:53:48 -0800 (PST)
Message-ID: <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
Date: Tue, 17 Nov 2026 21:53:47 +0000
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
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in
 rocket_job_handle_irq
To: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-4-kernel@airkyi.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260814022453.437-4-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2026 03:24, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The rocket attaches the IOMMU group in rocket_job_run() and detaches it
> in rocket_job_handle_irq(). Calling  iommu_group_get() in
> rocket_job_handle_irq() causes the reference count to increase
> unexpectedly. And this causes rocket_core_fini() to fail to release the
> IOMMU group, leading to a resource leak.


While there is a leak here, I think sashiko correct in saying this 
change would introduce a crash because core->iommu_group can be set to 
NULL before this codepath is reached.  That might be a simple fix.

> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")


Wrong commit mentioned here.

