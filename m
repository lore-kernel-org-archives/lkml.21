Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684585;
	b=SCcnS7fXOHIuJLAkB13l5iLPPLVFhN8YfsiFG/slDwIte3W7IvkJGFQZFuCE8HP7wyyh
	 V6KorBmvSgoDr6XlVfJvPTqd7Qogb2QTyn1ypDBgUH+iGN5DARf6ZURp2PHcqxp/i1++G
	 1GkIO/JzVoR0rc87Pqa9pLzfC0552o/aKl970dQvpyc3EtkPBdKm8HxFsmW8z3ASLmTbO
	 k4xSj4gZLDe43P00LU9Tks0RDMS5b7uOMJTgK5hok6utXpA1ccEjPy8y5RxUGhPKd94+M
	 hUI2ZwDnn47b245g584/Qy9Hi8HhUCc3UxVGmjd2cJNIhpHHIKjgTraUkHZPqTAggkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
	b=2+h/u+bDs25ATk6IOZFrW2tNSo6+c4gbrUZtgj24TnxskzlIUUp/pA3jqPOFFXUn47UF
	 qmU57E4j3p+d/uyY13Izmfayq+2jwebWNdWOW3HRAiYGnUvfyFNVBu8hqk2hoJCZ1E1qP
	 RyRFIdsMbXSCenhDNcBsZ4QnkjKirZyCHWI9uMEpueQPigdnvfyieasYvHw2XrTgE9aSZ
	 aKIrWzoech7VdatnqUKfHlo/2f/VkgIwiNNWOviV+k8Stb9MSGQPnvs7rRVKpL6X8CqkW
	 t8gCw3ac2NN3dgGecT57uSFJFNq0F4QxYsT0CjJhMKs5fnpwjI/g2qHkG4q3F+bj+fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hFYONj0x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA2606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hFYONj0x
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67da564d9f2so9010513d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795684584; cv=none;
        d=google.com; s=arc-20260327;
        b=ZF9j+0sXcBF0v8FrO3vyw0GH4SXw7CaSnhVF9i8xrO6jrP1dqCU2wZhoOpXXqeev7R
         Sz4EAmcQ9x/JeugyA27pcUpSBEiL/B4x6PcAHz8sNdAfTUzRxMhhTIx8uja4JyJD++U8
         MfjSDJPIowXDQkRYRMG9HCShb7qPaxNQe4aDSxkUeyYOxpVmton9CgxMA0OXITLbjpuw
         2JmTj3cxyyawUQp0y7Ip37z6N/LKxe/wSJ0F+zDU6kyxKaSFgC78ns6bZm19ppq3rNYw
         7is92s5NUFErkjGyPu0qgOZfx8yLvIOQ2sEQ2zB5TRUJmZRycSgUDT4IFK/mSVZu3Mpu
         COJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
        fh=rlvSLhcUmHn7MR8AIPHzYX8XZC4AskZGwwE0R40CkwQ=;
        b=Sn+rTkRpeWPEmabhd8SPrOnXHwalozWSAsXPx2di1y7Y1Y2ncdafNF9qezMtZPVjzj
         kfxh4B3U2yqPrdvY5nvAzWWa+dKKsL3Oigv/FEKWqyZAXZ7a5BzuLAXbHyHRV1VU9lqW
         TapRmcU72/8yhfwfHn7BumZdoj8eKrk7t3ockc/FCwvV6U+St7bb1loaQGo3SPUL+hNx
         BDRoIM+ZSLOcmNCNwQeFiBUjJjKaM32BMCErkeOAEGQdbjqWhM7r37Y7w40+c12p8PVh
         zcXAfqKB0gAjEgySsiFhoCGa4DQTfbFzqVbIMD2KWUMZ+tA58Ev0fY5NV1Ei+hT7JkZo
         A2bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795684584; x=1796289384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
        b=hFYONj0xYexZaamq2sunUDm/UTfjTNiZjKCQorNUNgZRJwnLLZXapTsaBeO2GAFnZb
         zPPdY4XC/OMLH8rNbiIlTQtekNHzydHT4/PlZufQOP7TNWDLHwtkL0sBiFyK2iTHuGMp
         sOrxHx15DRwLzxSTTZM9JUE+gFIcgJjveupwiZOfZ4q6i5r4/OKqApNSBe8gKBME9a06
         Bg+nGVThkcrSoY2lqQS5kEllRnEac1hsdkg241exiIJgMH0tBpIx37NmFEaXgyc7PUoy
         xLnnr1wu7FCYI2+k5bSS1fbHYZg22zeLye1FfbFea0e4j3bgH6Q/x42Cr1gHy0NQp+wW
         coSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684584; x=1796289384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
        b=hlAcG+ComLa1c8IpM5j424Lp7SYiIoIX/MHzLf/DMcWYJnMhDhDGsKUEsy+WPu6RwA
         btalCMxBKZeGSdH+gAoMjSBU4h95wvTMAVruFC+QIy3t3FPyZoiPcFhkKoDXddQIHSsp
         PKOotbPGBTO0AO5FmkWb2UMojA5bqJ0soApnyA760M4XBRp/6pea9x+wQ6HKtsvDlYoY
         K5k2vYKkgsVHYueLvQLs3fOFS5GVr/7IJtGOw57hxuNlF4w0ZhwuDETaprXABeSzKp3X
         KuDa/e2FzMxi7ikDV7VcpvZQrduigh2FO37uKFsALgD90ftDSb6WFvGZKeSG95xJ1UGI
         Brcg==
X-Forwarded-Encrypted: i=1; AL+hErFR9OHHynsd54UpGpcQs2ZLHTmYFK6+wkYW8DqIsXXQjh5qbcq1qUl7b3KD+kANtmT+KXBZxutF4eo6a1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UNuDOkvjuqV4TkCZnLcDYMiwZzalbMYaFkNxQj2Y+xOqMXFUl
	oKGNYi0MyNcVexAdsEBqELms/reG06wYBdG0nMRIwYx5mWPs6Y2HSxvDg1mgcDmYZM0Hz+pDFmS
	vOGA/F92RZouitnuABn8BfLMWGffMzFAxWIiFlYrhPQ==
X-Gm-Gg: AZFdTZeMSWjMwEbDhQjTzyxbgvvb/TsfmSm3vjQf5DoBSETbF2J/K+dUX+8FcSA9kQ1
	mw9s+rHxOZzIBNCHA0+Bjg1b3bm45gdbzSuSp7p+E/RxEJstOO1nleaT3EXulvtSfBc4hTwinIB
	HvdDTaw+nnm7rY8ktxbvlb771gjfrbuE7DGmv/WJkk07boqYG13JPph6ykVOWomwWzZZrvs/0Uk
	38/nLxvcdPv+RkTJrwELaJANFVd5AqaxuCL3Or4V/weHTKj3om3NfqMTCAJTF4flfwfKXLEEoQ4
	DQvBIbFvExjr7D7QJHVCYtvxwD7SGON6tlpYUL8/6wBy5eFONTDPzzIqb0Utq95+5azcL0biAO6
	osdRCj9EO6gZkAY8wFYGB/Zxg4QBC2V05ijGB+T11xRPZiiJVHGgN7szwI2DcWF5olwKl4lc1At
	MQCCYUYlM722ziGhC6zXalTE0XommYTsg7jpIncj3dIdpxDuMET5eAIA==
X-Received: by 2002:a05:690e:488f:20b0:67b:9a55:3382 with SMTP id
 956f58d0204a3-67df44234cdmr5458079d50.56.1795684584430; Thu, 26 Nov 2026
 01:16:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
In-Reply-To: <20261125173959.2198116-1-christian.loehle@arm.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Nov 2026 09:16:13 +0000
X-Gm-Features: Aa3M54off6JG0Kmgay-bdN_pEa9OIyVQc31_D2hlclQNH4bipvJaCJ6xGjh3oRQ
Message-ID: <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, tudor.ambarus@linaro.org
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org, 
	daniel.lezcano@kernel.org, lukasz.luba@arm.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian, Tudor,

On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com> w=
rote:
>
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clock=
s
> independently of its interrupt mask. Setting it to 0 C limits all three
> clusters to about 200 MHz while cpufreq reports the requested frequencies=
.
> This was found through trial and error while tracking EAS regressions.

Cpufreq reports the requested frequencies =E2=80=94 are these cached values
being reported?
Or is this what the kernel gets via the ACPM call?

> Program slot 7 from the lowest active hot trip so hardware throttling can
> precede the critical trip's system shutdown. Cache the low/high window an=
d
> update the hot limit from set_trip_temp(), because the thermal core skips
> set_trips() when that window is unchanged.

FWIW, Exynos850 control register for TMU has bits to enabled/disable
such behaviour (and it probably works).
Maybe gs101 also has it.
But it seems that cpufreq scaling feature itself is explicitly enabled.

[...]

Best regards,
Alexey
