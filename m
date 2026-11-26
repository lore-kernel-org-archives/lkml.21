Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703389;
	b=wSY9wb1aekgEVQTGsMeoFUmQjsNGr03YVxutrJZXS3ynLQUPUKKhscIp+xXM5/uEEuXJ
	 G+nkoAaX7lBVPFYpFAVaGF7NgUihgDxaqS0CM4qCVWYTOSqJa0iXMzvtaoGhNXmKSVsHt
	 Ls8vI9XCIad1RcTbYVWDIY7vZQeFXqBpShQRphyptqtSXyO9kSsjsMNwy/z+pInroq7J/
	 roPY6ttUn3HUI1xj1khrrmXE15e4Zxw07jTAW8aBmhHcr37QtWfwJ7o1OufSiyhFUGAvC
	 v2W53tLanOfLlw6ZHrqaI2fxIEAzCbIAVUJ87MTpGR0pPjRX3ikGDdR9+0BmXg8Lzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703389;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
	b=kan+hdUdBpTuDv/hP1j7fLSdwtKdzV2S/hI2DqNCIg+iR8kO3LAAU5/lfUH6t7JP5ncQ
	 5o39ZktiF7g3JIXlI7bM8XVwda894nMwZe9cqDS50Z9uBZSzy/sn61mFxzXu0XsRJw4Ea
	 n+L5hPqoWZLuGALkBfBSl1ZUxsQi/uEMQJWSuy35Ibt6nZKFwhgdu2G/9TdhzHvk0n3/M
	 fwsiYPYNmNYanmarZ9aNpm7XFoBlIHm+iPlXFTedMVX/nHbnfBVvZP8lReo9/Pm5Pzk/C
	 pqAHYo1NOi4M+BjoAMiWbd8W8Cy2C7G6Ns6k1+T63NP2eG4CRZ/E+vrjArUu+Stz7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c101GbXQ;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A93A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c101GbXQ
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso4131647a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703388; x=1796308188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=INpru50W6DH2AfZLqkwLx67G0TuLxHBJyWlri0IHW1gkTtHpIAjIVlYK9NlduNsnkJ
         3jW7JUuG5CF8FyRB8dNs38p5ah+J+F1sO3N2wds5EJ0pvsE+lEyX8wBJndA+EK2yScP2
         /s7ik18Q1SNIxKKknDsV08im/vXhY6aObcmS+ZhSSeINyg1s8I5U2dX7WLTYnQxkJNN2
         Jf+eIh6kDV0xlwO1xdYREpO6qWjTrCzKxAQoBDbZY4szHdgymAV1cqPSw/gDbuMuyBBr
         VT4nx7CvH4BtVMIr0h9dvdLRj+JmkzVo9x7btuNohLeVfJsExzUjTMO6YC5eXZjKpZd5
         9eLQ==
X-Forwarded-Encrypted: i=1; AL+hErGiemDnnt9CpoiaBMkb6YSVEuTl7INGMCJ7un731BBVLSSM0t1wT8k7+/AS1mTKebihgYxPdz/4HG6xojo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KOI+6Aj/RLLIiOoAnXYVvPwxqT2hse9Uhu19joIDTDrbIUzqZ
	u6lELbhrlLdsg80mPWBDegTvxZHwbis4D1TyRvkpRgTcKh72+XEG2DQOhF/F6ljO2QFcBuxe4e5
	J+wN93AoBC+nEOpwLB0e3t9YTmE3Yt2B+5TFG+iOXmEl47N+x7TSrH8TQcq8hts8xjlIyBAbSBJ
	yGcN1EXux9a1mMlX01jKa7Me0IU1oxEYGjC2XH2U9m+dbtp6ppbM3kqZZRXSftQMRo40XtG48Ug
	XvAi97JXeMKK+COUSZRSLv2Vw==
X-Gm-Gg: AZFdTZeL3L/lTNkkkjy+bXqCWrmzlLn3HCj84A3ltjgQNQ5FxuADh5RAV6fCinqcMKL
	oXk88SWXxlS3I4I52F65G0RSm8xI63wMYjcraxIe2qpuLG8LwV1Fm3SeJ87brhn2tcSPUM+cG7J
	EZysquQYP/blyy4JhEIRWmpfXt+MHiSWdM21q4Hwr+y/0+qDv3L7o+wUshUjkYN08IkAS6ZfG0E
	5nIEQhlsTfqwJ8WrG2r2RsG50XzLRCQO1avdghaTYkZtg/12V92zZjPjQdfxBc6JQX/WxIUbJvr
	zubZ8EPb9l9/IW31BrSuNW6/iRj43aZv21QAvZzRqddGPkY7q5gcEjlR8A+SEh+lLr2kUnVNci4
	vnNQgCY8QeC3UrPnY6Pr0x1SS9206mMAHkaAVZebL3qaJJ+Ph/gN37lYyexu6GaB22A9Jy/RjSb
	As3sHSvHIirvIneTUlhuvIFCvMCM+7lg0nOkbY0SQ=
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr22767518a91.54.1795703388462;
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae532fesm15192344a91.7.2026.11.26.06.29.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d2c5f10ddso144978881cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703387; x=1796308187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=c101GbXQ47KgbICijQTSDbHGAVCZYRPP71i01elyv1A0RA+epRAhE0k9DiR8uDHrGN
         E9aHOqDgibiVpVR7PeSzHVtxoxzdPOS/7+xz6BwrdWLwBe1NpdtwnuokaF0A2DBLG6OE
         YZ9T0V7I5JN/F82ueMcRvOMqcRuzVMzN7/KRE=
X-Forwarded-Encrypted: i=1; AL+hErHF9ZBpNBU/WaLlIbAaF/BEluNn1eKzP2e47FvH0u7vvrFhierV2AYKZw42QJ8h/x5YEYVJJbUeS064Ijw=@vger.kernel.org
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901991cf.24.1795703387406;
        Thu, 26 Nov 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901581cf.24.1795703386998;
        Thu, 26 Nov 2026 06:29:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Thu, 26 Nov 2026 15:29:38 +0100
Message-ID: <20261126142942.881504-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-2-dev@deq.rocks>
References: <20261111120748.23795-2-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 13:07:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With the mailbox on the control ring, D0_INFORM goes through the ring
> write path, which refuses to write while devinfo->state is DOWN.
> brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
> hot resume fails and falls back to remove and re-probe:
>
>   brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)
>
> Set the state before D0_INFORM and back to DOWN when the hot resume
> fails.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Please add a Fixes: tag for the commit that moved the mailbox to the control ring:

Fixes: a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware")

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
