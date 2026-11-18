Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004866;
	b=adeK/JNbj/qL7gXibKJuVPmoGbpihGfixfW+zEtMtVBVQbJARvcDBy6Eni2uc/ekzb+5
	 XXQ7kmjn/MfylaP5R0rkXbCOGnywL7/DssJ6/T0HmV5K7LzJNygqIMS2GyxrnkTP7TMPl
	 SleKWZVGAIA9gSpPjzBjb4O2+3IVh+gkNsOQ1xwrcos293jjCd0UHYEs+E5Tm0Zua+G0v
	 P4naFLxXGkkTl2iDklICdaySaHKXqWvDgLfl0b+qFPs+Xw0l0X0y3TiZt3MWYchs55HQv
	 d3C9Eb8GCEmHa9K0nJ0iL+nbv8UgqH0F5cqUKiVn2GbWiOCVYy0GzV0PA5A605U2OBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
	b=EeDmaNC7uz3/xjxb3zyQ3zpuCMZOfsqmvWf2C2OEcRHlt6g5m9VqTK1uK+VKh0FDvZKL
	 94HrEniqUN8sa0iVYbOJnq7L8xn83lY/jPquXbs19wfUyODPa77N7Lri0hHGv/qtTHp2a
	 NDN2ASz4aQn3UjeAYvLYZr1YaahYtXFRyloYnjAycvtFb8oiePUJZGQG67ruEMm8pz0yJ
	 kqWrB5n+6oJXRad+bG5QWsHhPwGlLRgN67OYuO9hyh0Imw4HiKlcnlIXe3MtC9A2k+Fj7
	 AuLdP1bouLLJOtMv1DkFhQ8QUm1HGEDjbbyn0zFH/Z6fU4NVdyxOxFyoXKXqJCfpPvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBHVTF4b;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5BC606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D5BC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBHVTF4b
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so545606f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004864; x=1795609664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
        b=HBHVTF4bbapmpKhd2cG4j0/WIyzz76YZgospn+F8ZhfA019r5hF0mzXdmMgw5XmcYi
         iIghQouW8+9DpAGnD28wwSHCEKCHmumJJ7Dgj3B29p7C59GHHID0JVDwPfGCPxdkiFMw
         YroY1fXJNUGl6lAlBbhycxfusl/wd7NXBDxeSaunfJO5+rcQGS6BB3cqEZn/3l5o+E6D
         rs29dvDD5gIl/YdTcATmYbuqEgFqcNo3Xqhu0RjjI2WQNk9vOWEiTAlolM23mU6hSdv1
         l5zVpegNpwBb1P89cuSv/AElopPaytHKcNANPzV8kFMVI0bd9Zs0i2ItsxPfwpOxX+d3
         uS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004864; x=1795609664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
        b=m6N8qcJMmb23VkZU1XGm6UlTMM3gkQtIIlB10r7nso04lP4Sou2/Kyp9KIkmc2w7+m
         byr+mgH9c+M+yqUMxozJSfhIlHu8BCflKdhvl0KWCZZ/Feq/Wynm0/LGrLPEt+W9wXnR
         puAawFUJ7vnbHaLjdM6GyGuY/w67TYeJQ8JWdgel2M/PPCOItbU2RXIngqyrgdVMzjm1
         NbQ0AoCg5P4VxBSZjtv1hj3VoDprmgDijlwd8HrKAFH2GgiZxuMvfqmGGAbTxMuatKJy
         zCkuHnPEYyMLyrHhWZRKAd6PaVav4bTbsGaY/inNrS1dUW+kG7JSEK3dQmlpAThjQEOO
         hpgw==
X-Forwarded-Encrypted: i=1; AL+hErG96MAGK0+fWY3KdBbZ7UJ1z4JqwIQWX86pd6azQRVrZn/M9tRW5uPv5fZ99i78fG0Pw/i/9jx0gJ2M0x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/crOJ9mFybiUcygguc5mN5JtNdOE6kvzMI7kIQhQDT0Tr2o70W
	fA5+K+ARP2UCbKg0+PysVpUxprquUmBEp0DuhioM+tIQ/GMej8rjZPhsmsUpwY7gyYI=
X-Gm-Gg: AZFdTZc1UOLoCJ2WtlXPQrj8GWQd3q9GYKjrszt8LUniO96qT8fqxI8K8XPLlSlt3Re
	7G0xdNvkWHpNBHxULl6SILIrd5njJH1QWKvoqqyeE2f2fCMC4QunRSG2zJFlY2oZ/Nukj1PuG36
	a3p1ciAmaROcxV63OX58Dk0nyMfF6VhpArCRrUbrjwSJP3REugwT7527AdMsPtyS0ULHkMP1bE2
	FCalVUr6pyKyuuWjrfjV80fBwbo39JaUbTk96/ycxxYaGj4TGBPi7t+jVKJ1hgEuBWpszPBl8Et
	yIAUC9DUdQr6qRdr8DG4xdHpp21Mdlxs0lCUXek7XCDayZgqB2tcEjMvPojnU4rxZWPbiaiGZ/K
	ij9m1AvAuU0N0XIxjZWchtx6dGSGHR68Nlwh2UdwkriKQmYRL2ISs3pATQxgUwxi2JbEUTzkkR9
	V1tM4I6J341mtKV+U1zQQeJCcYmPjKtTxyCrdu4Hq1Q/hG7AOSHfTgiufQCeTuysUuz0ekI3OQY
	bw0Sqi3UkIeT0mRUQKpgC4oVt1Cz2HFLqlYkW+2t2sMgMO1egkoHCSP9O429y3M79ecS94/jxTZ
	jolwXoyGa6uwlMEYJ82oJaUBLly/eu8Vz7b2Ig/22771CLK17MgIYQeQa2hLd7W1mzwz0wr4sx7
	vMA==
X-Received: by 2002:a5d:4f10:0:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4a63bbc41c8mr4416511f8f.54.1795004864445;
        Wed, 18 Nov 2026 04:27:44 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3a7sm4875705f8f.9.2026.11.18.04.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:27:43 -0800 (PST)
Message-ID: <f91804a6-39bc-4a86-b24e-9588327e092e@baylibre.com>
Date: Wed, 18 Nov 2026 12:27:41 +0000
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
Subject: Re: [PATCH v17 04/12] accel/rocket: let the core suspend after a
 reset
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
 <2afd051e37b8dd4f10e347a3537b0086973d554c.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <2afd051e37b8dd4f10e347a3537b0086973d554c.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> The earlier test on the ROCK 4D was done on the v15 code: the job after a
> timeout went from all 128 channels wrong to all 128 correct.
> 
> Repeated resets were triggered with a 2 ms job timeout.
> 
> v15 (put, then reset): tested twice; both times the board hung within the
> same second as the first batch of job timeouts, with nothing printed.
> 
> v16 (reset, then put): tested four times; the board never hung.
> 
> So moving pm_runtime_put_autosuspend() after rocket_core_reset() avoids
> the board hanging during a reset.

These sentences (history of the patch series) are commentary rather than
commit message material, they should go after the ---.
See Commentary section in submitting-patches.rst



