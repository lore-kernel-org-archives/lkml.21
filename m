Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480301;
	b=fhSWNIj0uDndUzUbYQixFx2/e3NAKBqZsfclyMoq/2gYe5j6YYs/3AA0Y/W+RLbwG51c
	 K0eKq3XZmT+FQTXKHPG6e9dKq79POxxHneC4lV4AE+mC7FoqIwj2HRMtUFDYC5mww6OIu
	 RdsWn5pqVvUPjnetsZCVpoa2Mx38XOMsijyhHneLRckIrHXA59pImBBUBiDAE/x1ENwad
	 +wsbdxCd1RyByS/Mr4DujHewRd5vHyeCKa9qWYJ5NmJQb7v3dJT3gFU2Ftd74z5P/+Lor
	 HdiAO33SgUBskaVk0TqoQnMk8njMrObXpGnCbju2V08JmX567PgPcBLvpuj8BPkttFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x6zdHjHGVwvVlbnZegdR/xLT/lgEN20BGxlK4KRKp5E=;
	b=EqGARYZWblAi3D0IgRPiVp9zOv+IoZ6chb0qU6kP1l9SPsmItztXLtuakPY4syNOXkTd
	 08qdr5J4uS3R2S/NTnh5RoH3Gu5w7M6HWY5MHYHA1+cBgQKjFC2/C40203UCqETembduk
	 SKp3ASk8wFWpVa3jF1aKxDOQVrjvi7V6A39qgZ+7qN8JnQXdPuxOuliXE59gRn5KWfEkk
	 hrOJZUHi7GgMesTk9JMOiUo5aY3canMwsAFXwmjiRgaAbu1eVEekwhm30g7XcfC2IH6ae
	 GzFZl/t2/Pi/2ERGSuP2+2UGNMTp4+e3JxDuBzWW5QNCm51y74ODR1x6OR99EWZ8reg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ra97+Tlp;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE0606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ra97+Tlp
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-849c2965b9eso650292a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480300; x=1796085100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6zdHjHGVwvVlbnZegdR/xLT/lgEN20BGxlK4KRKp5E=;
        b=ra97+TlpEzH+dMwbfNuqc0aACejpYPDV8MMefy6XF2Cx2WCUKzR/GFiXYTQkfkKAjT
         ASD19n0hg5nR5sWYIFRuOAXb8u/hNSEtgzGIF8TDuv1dqT7Py0zSr3PS5ZV6BbVRgrYb
         4x/j+rnBKJMaelhN3F9qBF1kENOtKy2OrTJII/q9dBlDVs9kltxRcmtZAL+D2/VCKsNp
         alCYs2oDvoV05LJBmzG2kiHRs3aR3EaMfjtVKiMk4wgGq6jkHwUfhIKt5fxATayWV6Kr
         V56D2Svi6/TpsbY5v1sRsxOnyaHNw+E45NxfRo4g5xZebRgCr24p9BvamLBkaSNC8f0k
         Pt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480300; x=1796085100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6zdHjHGVwvVlbnZegdR/xLT/lgEN20BGxlK4KRKp5E=;
        b=vZc7CibOqDXb1Qp4PU7g7C8/waGPN2gsL61yu+Ml5U9qB8Us7fekRy73FmGD5VvFrY
         7jf7kQcd4mOTG4P87B6Hcpabva672urIUT527RMHNUq41HBAuLtArGgKO0aIiNEJ6MKr
         Esy8JNjIi5LBZWrpyeLqB4e4wLHyvx6D9w7mh7we2s2WbACKhTR05Np0Gb65KgKqyzmQ
         ua/twreEzlPfrZ02lRiwXnD/phykSu5Bi06/DPa4eWe3y5KjcWn4+DL5ApFyQa49D60B
         g7EWzuY9edtdupPBpNc33tb33BZ8M7sdC9Nj3aKy9APVavTNil75AqHb7FKQRK5uT1Aq
         A+Sg==
X-Forwarded-Encrypted: i=1; AL+hErFA5lZBndtF/qDQL0xjBS4wXIUMvFnefqcaA4g06m5KEQRcpacUyl3KwXFB/tEmXbD6OEea05tZLCHWw4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5e4bStRvekQ4HiOXYhrUkrlQm51zVocYlXWQsor3kAdQVsFLP
	9qPn4Kj/Qaox9QY8PjyEqoNafNwI279s2kKKZG7r/oVHQyMolZUzcnQ4
X-Gm-Gg: AZFdTZcImaswMbr+pyJKrt+uLfXcFEyC9ChfF46+sVwG/UgyI/dwVXVBvG0MSg6TmyV
	yBtIHn9LvhWfTfhye3A9fGdU+l6PEFUkcpcCOQZzk2lKYyDhwMbBiO2KLWklkipn4eECgSL9Sp6
	o/xJkBLjVNZm9uli6kDoPlJiKy+dHHA2XojO+BhTluSJA9oQlpcBHNOaJqnznWANPJfsNbBbmqk
	tCuGkZBrvW71dA8gYtbjqnETpmiaPsKs7s2/c13HSW9c6fQ5gm8vEi4I4HmPLImQnCXVQ2TF+0h
	Xm4HG3sUlXElKlxq7Fl20JlxUjSAVkTIe07x7xM5aTDdouU3eRRMO6UYlUXyehDLvMEU1mTtcZa
	Sex+2xdydTCeJGFjbUimLNST1NRJ3RsK5/MNijtFAx21jKBHNDBQOJRBYDTCLf2BxP+5RqyEKKu
	3ZE8JznnwjShPkvmraOZW6U0k6nFJpHB8RdQt3P5mHn6ZqKx12aWdH3C13PYMpd0vw4We26EUGX
	sthy6sNliJPeeeY6ovUFdCiw6zOdGyODhE6F4R1JrWAucxGDNIrvmeejtZlHnqlHl0lIVlEaiXH
	LMy2yF5vr49n/LLf8WdYz1Kq76ah4a1f8Yr0mAMOMhgGpA==
X-Received: by 2002:a05:6830:43a0:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-8631593740fmr14730091a34.25.1795480300341;
        Mon, 23 Nov 2026 16:31:40 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm9477750a34.0.2026.11.23.16.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:31:39 -0800 (PST)
Message-ID: <fe208c0c-cea4-4e56-8283-e242ac1cd2ae@gmail.com>
Date: Mon, 23 Nov 2026 18:31:36 -0600
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
To: zi-hao.huang@mediatek.com
Cc: airlied@gmail.com, angelogioacchino.delregno@collabora.com,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, shaoming.chen@mediatek.com,
 simona@ffwll.ch
References: <20261119033634.1844084-1-zi-hao.huang@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: Don't let a signal cut the IRQ wait
 short
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261119033634.1844084-1-zi-hao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026 at 11:36:34AM +0800, Zi-Hao Huang wrote:
 > I'm not sure the trigger is specific to our downstream driver.

I hit the same lockup on MT8173 (Amazon Fire HD 10 2017) with the 
upstream driver. v7.4-rc4, whose only DSI change is "drm/mediatek: dsi: 
force command mode in mtk_dsi_poweron()" from the mediatek tree, and the 
mainline NT51021 panel driver, which also sets prepare_prev_first and 
sends display off and enter sleep from .unprepare.

The trigger for me was suspend under Plasma. logind's PrepareForSleep 
makes KWin turn the display off, and the session is frozen while KWin's 
commit is still in the panel's unprepare. The freezer's fake signal ends 
the interruptible wait with -ERESTARTSYS, mtk_dsi_host_send_cmd() takes 
that for success, and the late CMD_DONE lands in mtk_dsi_irq()'s 
DSI_BUSY loop. After the watchdog reset, MT8173's last-PC latch showed 
CPU0 at mtk_dsi_irq+0x84, the DSI_INTSTA read in that loop.

With only mediatek-drm.ko changed, suspending through logind with a GPU 
benchmark running: without the patch 5 of 6 suspends reset the board 
(about one in three without the load); with this v2, 0 of 10, with no 
DSI IRQ or vblank timeouts, and the panel's power-down still takes 270ms.

The wake_up() hunk matters. With only the wait changed, every command 
waited out its 2s timeout and the panel's power-down took 10.4s.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # MT8173, NT51021

I actually had a similar fix ready to go, and found your patch, so thank 
you :)

Best regards,
Ryan Brue
