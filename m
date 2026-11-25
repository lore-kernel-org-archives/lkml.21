Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596437;
	b=Cy17yrVhvZ5Gn1L6Wqm166PDmGBkJ0c+PYWKvR0aJcTB/b8u71iiQ7EuG9+kcaXCsfUq
	 fvHnBRoYd6ESuBgLpDT+Zxo/d/C7ll5ysbnhOM1qzyf4mf+cTS9cx/YC2zuNZ2//309iV
	 +lY6oZe9mjsbuKjtaH9E3E0o4rOREb4o70AuQBXg05hl0gTtRCk0omZEeYedLswzIaAse
	 tJX/8KtlU5tIDSChX2AhO/huJ7WDRsqIRxiTRBH6XXc6bMgUeUl3f/1Uctedrmfz134/D
	 CHQd3aTGFXoq53Shv1Gz0CLCWDrcV4KPw4JABU63eyNFO34sU3MxDY4PNMjB8Ui3Ssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9JczosLg+2tleGLZ5rgCSANI1AUwxWfmCJsgr8HB+Wc=;
	b=eVuapo49bYdNlpCXPyvC88GA72ojRHLJ9nsLmmp49Y4BHZ7Y+qwx93X+khXWT+dkrAFT
	 wvvERP3KgPp35eOT8NPjjG3YyyXTugxBT9W27uPz1NjecTtQ92uIecak9CCqeawRqWr41
	 GwLg6e3rWgAgTE8jOUItoEEs+I42cAkzSs34xAtkcpbhESNO5VCpsmVr6PeeUSuR5eqwq
	 D9ZhygxJxvds+kwMB1HxmzOMpGWg6XonXR5+mdX2+Hr4tdfP1+tWOmQU6sNVsMSz6i1jv
	 QQfEY3lvJU+pPot++azwR2yP5FJ33B3blQorAOIAaEk0gVAquoLLqumeiD8C+4PvgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0NlGyfj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35014606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35014606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0NlGyfj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so52862875e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596435; x=1796201235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JczosLg+2tleGLZ5rgCSANI1AUwxWfmCJsgr8HB+Wc=;
        b=K0NlGyfjGbdsgVftf6yhorm4vLUo1t9RKlAFZqCeGpWY95ifrSNlBMEvJt8g36o3zA
         mOSI+K5NZHGiZWPJI82G3yXKlGWnXFHUZsZO8KkXkOKPzsVAHH2KvvX/RKs+THnjzXIf
         xLj3aDZ88CsVZsaay+0xHYa64btplUhlmmnnjpcV8K4JfHlhCVgWlCbMIwLF7PDQB0N4
         FwGxsELcIVT0GAKexwXwroYw6u4NItk9jqDiAuKZvpFdMbsAezHIapq7KDvSJp4FCQYp
         mbkjkTtyVn41YtrPpToJR65tZUNW0Nfp18yN9rqjMq1NVZ5pjCg0ndrsaBmB4oH3hpAn
         AHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596435; x=1796201235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JczosLg+2tleGLZ5rgCSANI1AUwxWfmCJsgr8HB+Wc=;
        b=iJPQnADw3oEqKrxCPav6324OnkrOzBi5cQ9AyZeeNlVzPEnWaviD+IsiehZvtt/PcH
         ma3tADP6K8g5OfbA9g82yVHbgbg5/rogiyRilnkGYSKIIHOOpwyHq0s20RbIgiEjzlL/
         gGzMLFB5h8Nb3CoRf34U7KWRFv6u4iecKOid9xuG2d/RObLaVLQnGmUMAZ2DzKFih9bv
         qfPFf1e4rr3S0BaErxvT0kAqQQrYXwDro2YZsW7asRFh9YIWAHVvmZ2Z8S/guPHbJq0/
         HHVYo7nMr/JSP9/jHO6ENwna8aMUomo+6WL8GA2iRjktLDsoI9d5fIkTjVp8d/3KjrPp
         jMtA==
X-Forwarded-Encrypted: i=1; AL+hErF2MqRhGN3lnZQmD5xKZGwwJG/PtVqyqdDvKzvthe/mwdrzG/jGCd7qVhDtGN5DgTPJyD0se/Zntlt9rkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e52qA9nAtrKj4g8e/BCtg0aUPRIP3lqlPUDMs5Nl5LqCUIbbc
	94oLom/7uZNEZ1j/aAAf/PgH1SLCFPCAH9iw8TH2nuMR8wwNJ9Twaz4=
X-Gm-Gg: AZFdTZcPV5idrE0eXByc/PU7DlHDgAG2n54cl5kXXBLa2sI3KYYrQyYP5xCcX1T2bTH
	X8sEX43gk591+urR1HSulgeB8A7uxA9H0MLeOcmc5v1N7l15U1U7QY0h+yezq+on4tHyuDXSJjt
	6/0QWvoW2CriHd48o0Hw/Ka1I+xqqEaF+7kOmbpJlbMq3P9v5KKh2+dK1R7ZSlzeZp5RwDmhPmS
	6oywhqZ0QWnVpvBkSNmaOalurlJ1v3gBaCsb+qp9h+kg99qL433DmEmSxoe3n5h6an/Bv8A1HP7
	pwQQ+KKfpSVS0bqeQ3pW55Ed3qYcBC0e/x4G844pPZE/cHGK91Gb4IFKPjk2dwavw3BgJmEo+qR
	Te8KFLwmyN5wVGTkQ1outAyzWBPJ5/YqgKyffcUG7ENopAADMKFbOdieGxn68KAlZIR8TkPVF6p
	/O+JVTnvAEiYKvOVeBV39iRMKeyXEFQZDA3vJeXS4e+7N6UUtXQlBrMr/vGBRczTAfcpJkT4QUu
	IGyhYDNkauI2Rjt9bgsR4l/FruABlYxOU77wSsMeSYQU3FqsdKh1Z6q+YdV2+rWXAvbp5LioMiv
	gCj8u+RkvFri01FHpG2aa9BAZag0ih4ymqmc0UIU7rjGrp40zSNZgXRA3dFqPZiLg2io
X-Received: by 2002:a05:600c:6092:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb8892bb67mr320913895e9.19.1795596434483;
        Wed, 25 Nov 2026 00:47:14 -0800 (PST)
Received: from book4-arch.fritz.box ([77.39.161.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm465183985e9.4.2026.11.25.00.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:47:14 -0800 (PST)
From: Nicola Nicodemo <nicola084@gmail.com>
To: opensource@grische.xyz,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] thermal/drivers/qcom/tsens: Drop __init from the ->init callbacks
Date: Wed, 25 Nov 2026 09:46:11 +0100
Message-ID: <20261125084611.11437-1-nicola084@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
References: <20261104145740.2623473-1-opensource@grische.xyz>
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

On this boot path, 7.3 with CONFIG_QCOM_TSENS=m and qcom_tsens in the
initramfs, Samsung Galaxy Book4 Edge 14" (X1E80100, NP940XMA):

Without the series, the probe is deferred and the retry from
deferred_probe_work_func jumps into the module's freed .init.text,
on every boot:

  Unable to handle kernel execute from non-executable memory at virtual address ffffc2f2779b4150
  pc : 0xffffc2f2779b4150
  lr : tsens_probe+0x170/0x670 [qcom_tsens]
  Workqueue: events_unbound deferred_probe_work_func

With the series applied (same kernel config, same initramfs), it boots;
all four controllers probe and every thermal zone reads normally. The
compatible is qcom,x1e80100-tsens / qcom,tsens-v2, so this exercises
init_common() via ops_generic_v2, i.e. patch 1; patch 2's callbacks are
not used on this SoC.

Tested-by: Nicola Nicodemo <nicola084@gmail.com> # X1E80100, CONFIG_QCOM_TSENS=m
