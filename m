Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512889;
	b=3uozOQWDJsFSvLR3XNjX9NwcvtSt63YxxNEHHcNv13GZSXJ54D6BQoxVugNvnEHKf9xV
	 ga0YKoPs8XFB4tfBS7rwLzVtpDqqcT6WAfb9IrAIjP9VPt/59BPrTpPl6KPfust3ULqnO
	 nlvxGUHFxKUvc7rPvO+s/8G3Zd+MGzSbVCP7sJSZWvwgtx6rgTwav61nBVM7Bo+915e3m
	 oCtkzZcejvPBL0ZFQkqXAf5/61260D35NsKG7DDaUHiXpU78LqZv11hKLU6qIqSJMVDFK
	 a+ZoxKsAn6vlVNVHfbor98Uwtq03fckoKQ1xJIQY96dnI7BHRKULJj5fy8WTHLFkm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
	b=z6dvVYaNbGP3g+aAINzTCXCbo4Cv5kXbeJ0L8dtN6X4x1gVp6Rdpk36sn8cJtDlx1f7p
	 jnS+t7kzzS8uFuf9E7uIuwB/CPGu+j7nEesbPHyup6jf1C7i+5lnPDUNr8DsqGIHbAtlY
	 GSmy6uCuQSuqPBqBwdiNZRVT8beZgx37NIRu11wrAXX4IZ9L+VBBi0H6/nYNYd93+7yib
	 7AxmokIkhNBrmMjCguJXE9zjCctJ5UDXoju+F8XX2MiDGFHPHMoTjRgJgvcuvY+zwR2qZ
	 owBb7N/t65c+FqNdKZozc3BIkcDcbiW00+2nKXaetefmJlDJtbiD4GWekifxYVj62Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VKJuV1Q7;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F54C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VKJuV1Q7
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso41413835e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795512887; x=1796117687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
        b=VKJuV1Q7KiG/NwjyZGk6cDku3ZQZ8pLxNIFWTycp4mS+Flrvh1frRwcrBkKmANhMId
         osZ9wi/GtFjbonSQhQygz7P+9fYtTn+I7W3Fc8sVZqnSdF4/FXB9/keQi8bil4wy+5Xe
         cM0lANGMUvPoV82g4bcZkEeXIQyVe+0ade9/yXxZC2B/elTI6v6accCROCGQt8caz6Dq
         NQ3AXl0JC6gRBYKxiJ0tL+NC5EWMwd5NtRsm/4TyOOWxSNTQX/h1/rbA/jg0rFtoSmej
         Vgx4EvuGeaxQ1Hl1owVxy9+1TMuPZHV33p7hP5QVEAEs3Z4MljVXkAGbAJ44gy3xZ30g
         heKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512887; x=1796117687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
        b=fAHoldsBJKV8ovcM0JldVBmBn6RH54DrUaqM2iikQj1uzuULhmkBYbeZ0GPwM6hrbo
         cvErIxJR/aYi37etiIhyL3jr5Enqo037TR6O62jO8bFoNLJyGR47oUTXjk0AQuUoYtB+
         hyDnZyPgjnyhstgHUKdINRyGvnjycPGLhCMDYhWG/RqSOGTIJ65zvJJ1e0kCFVY0IEog
         zHE/bQ7Y8CNwRTMGtrN25H7CxvPy/0m94fRn1n4NSq3w3j4yboJC1YVhFukM0baXLU5G
         qTlQB4QrfDg9taw4ltDTON7kh8vUfe0An8uP/e74MfZO2Z2NuvwUC2jIj0/4lf9rhhBe
         4dTQ==
X-Forwarded-Encrypted: i=1; AL+hErGO7ZGc+AR5/H68ngIpVzMcqvuPuXYX6Njk+VlwsAWH6y1QiBDYCLEJVxz16JgV6lXvvKUt2ciiaIeWfKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kH1vrTT8bQ7W1St3GN6Uy7VP/yWCmJo++JvonqTjyXeZmDOkP
	LDAyUL60r2XEp/Avs7/bdvzlDMEGaUF8RpwbPGSL60/KeLWcDS1rfZOH5gwQPjV5g3I=
X-Gm-Gg: AZFdTZcWSVk/oAI7fMiWJFxsTqeHkcRoZhaB+igAFvQvrztblJHoZoLiA/j8kbQk+0F
	hkYuAJ7LKs4JmXuhuhygglFLiawiZjLsNltS95lsNxS7iJdeJwwk2Pa6Wq5tvirgqORLNEHQ6uM
	UxemGY8gOjrVV2MftsoAvuQP1+eyyNrnUBdDkBtI72JcFV7szL1ZNHyDEITSU3LUtiQ3XaGGqrV
	Fm3R2X38CRPqQQ1mwyQpvfyMoG8d8gVMZtOfVfL/aDGqCZ5Cjsy5OapJF732jBzZBmQ6cEgKsHD
	y7pcSYisxhTgI+0M49VDxuiasZlc6FQc0OnQoTP0dRHU7rAGHlwGzX8qQvIBEkfOBtSoHxsXhb4
	quRA90iWcOhP1W/U8m+ldd/OEy/Sc05ig8gKJW1YbSqlOTQhEEqlEjtym0JdNWe+mDbR/82aWCk
	iTtl5dCS9+7V8f3l1YThiA1ayCIDS3ih6jwuk7EIy7Z1wjua3UMoq4CzYGqHV2i4aO1aOM6TyaL
	1c1zK05+H9nBbgY+tKX+QvZ0KjSwcYEMxt1WDHchkvskJlGdokeih/X+DaptR3uLfGMkTuuz/qw
	dnZzhB2Q7YokvDRQpy+tod0YUElMTgAVkMYtzBr9+8w8PSNyxn8AgrFwvBkcPoB287Viz1EDy65
	Aww==
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr267264845e9.24.1795512886893;
        Tue, 24 Nov 2026 01:34:46 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm26488815f8f.37.2026.11.24.01.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:34:46 -0800 (PST)
Message-ID: <57582334-45ef-421c-a460-314f5b5ece74@baylibre.com>
Date: Tue, 24 Nov 2026 09:34:44 +0000
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
Subject: Re: [PATCH v18 4/8] accel/rocket: take the core clocks and resets
 from the devicetree
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <82329b6681958350294846c830598ebde29b874a.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <82329b6681958350294846c830598ebde29b874a.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> The RK3576 NPU core has six clocks and one reset, the RK3588 core four
> clocks and two resets. Take all clocks and resets the core node lists
> instead of naming and counting them per SoC; the binding defines them
> and dtbs_check enforces it. The driver only uses them all together.
> 
> On the RK3588 the resets are now deasserted in devicetree order, srst_a
> then srst_h; before it was the reverse.
> 
> Suggested-by: Daniel Drake <ddrake@baylibre.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Daniel Drake <ddrake@baylibre.com>

