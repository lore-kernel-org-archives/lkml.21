Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098199;
	b=Q0Ih+DUpVz9HkOhLUk+NYnvzBO5F747zQSgke7n0Dnp9h1A6kKy4Ke5V5o7MONgt7FLG
	 jjiusWrwX7yBKVdVczEZgtOoOdrNux+plJy3ZUEXb0vmzMUcfctvRdUp9qu82JY3HeMUh
	 J8JS4Bcma5CRcH/Nfd3fGJc/ZnBADkHuY3+cU2Udu/kJVkeCSrtlv8WaJQI0rVM7ukry1
	 pbeMrpPSr148QaknaYSWkHIHzvz94JBzyxSjRXthTTfemsNfQ4FfCKiw47irHag6XQQmQ
	 IgKfHyUdliv956TlpDt6BaHlIHrMqYMRhJq78qPMGqdG3NDNCKafPfhHGUj13wK3FYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
	b=G7nKtwj9ojLRgEEx3OZricmfox58yXv496qiUT7cS4LL0wi4gNkWn7jV91tmL+Bwyh4E
	 Uw0ZRFlRiyYISmdMoS1DZkJZVTSZNxP39wLljLwZPqtUCZi2+0MfmLAPfIKDIXSurMm9G
	 9LoqS0RaqtAI5em9v8zjw+eDbI+WJwOcnqWGfx78F05eXr8nAfzMu2XKqsNW7BG8BK86/
	 NI+APqCzmdQyPkNlRGjrVgCIjYsXdPxHEA3zn+gOpoAciVd2TRuR29hb2orjs7ZgZ0Gef
	 kfSW/3h9H1d53x+NJOZ4nPZDMKhnHvmkHnXtGlmtjNRDEcb5gN5rsGVG5CVA7bzkOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQZx+Caf;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653A606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A653A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQZx+Caf
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3acec6677so3303499c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098198; x=1795702998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
        b=ZQZx+CafJ5sxSFPQQyG/F1QUdmwM+0jyz51i3cLNmRf0AGkpQ+ZnCpBfBA3HXufm/Q
         Ra+N8okJV3kOThm9oQsZNK89WDQDpzgsvgjiZo+09l8NdlFuhaXfs52Mnz9h6frCUFOc
         EGefdz1RZ3j1CGmvo+566APwO8MNo0OS5m+BsgKG+brlLQsmsaBrAte5hyTKQokS8kQP
         MFYu/TP3mPJuYCEW6UsLsmae8BramVwEubGfKQJd/qHW3Nelkru39Wx0r4BoMyUcC1xK
         8IYI6pRineGwyRr8fGLu0tfblqqACuO7In20mbZSwNXZ+KAlkOJ99QdWYHE8x255pSC/
         cX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098198; x=1795702998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
        b=V1MaM7goUjkxs+NWxPCieLvlXWn1dWGBQvLxyJ6NOoJLqoXyo6VkksL2sMxhfIv0QN
         +Y5Nm4Tvu0vLXtN/hpGx0tz13kP11h1BjOaKY/K1iU5xTdhRoL/PSch5g5nS7RlzRvrE
         ydd4mFOIThSOaZFTLG6df9wkJI9tK+Ti25yNW52EcwE7cqI2Aon6FN2mGTy+YLOyc8DF
         +LoIuqBbbbQ3uCXeacd6LjwpReDSXz+nZU4hKHrwf6OS5/GEu7V8TGThWeZvkO8Brgud
         7hVFw4BXNn+G/nT0f5RaSFmxFjuCGQSYKjRZQi+cfIsMu/t9eiva/de0C5akpwAN633U
         t8cQ==
X-Forwarded-Encrypted: i=1; AL+hErGa0eJi5NWpLWJ2th6z0uXScpSHMwisPiYU2gDTHmrz36OfiY7q2iHi8xz4y4sC57MkjyvoQAO564HrDdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KyouNqKyXlUEzsUNC1ijd6gZd3sGPGW95A/WT80SiQv9Xs+Mh
	4HoD2G1sPApdl00V44HYkrJGrEaKXxYJm8Nni+KtujFUGuUzSPOarxjD
X-Gm-Gg: AYBFou3FnhVxHyTgVhAXqB5tC3Gy/w8OMJLds0yTSg9/sLbAymxv6uy4XdmO9LqDgul
	40g/n0Dg48r0ptfq5SRKKWxhTJAHSHG2dzeGgQ9nGq8tjzeefJTXoivxz0buY9Z6phmGRoPyHLK
	0pHP4O73Z5fH07xkwueRKynq9ECDvuY/kSC8Hrm/6RDyhbE9EQ+7fytEH3WZtoE5gdOj2Gk1HOp
	igdOSy3pbXWI5AvkIxPBkxU9+VAvjEug1ya2NYnIWiFFP4TW2mtKDUwYv8K/YmSbZG+xPkJfMtJ
	aiWKgkHftSXqKkm5AJ+Q+M1pNrsNqJJVIs9Ls+6XICB/1xeNkO5Pk7NKONNAgUj+YJfTAyj5Yrv
	HdJ5pdLrQ2O548kHxArnL2mdZZQTspp8sFgM/wxHry3Wf8W+o2I4jRPIic0vWGGlA7vRl4He03l
	VjnErlO/QTNX4PT/D9KcZr2S6uL+3UptGrLWkBDyQ+EMvibixeYTSJ0Z+SACv/nF8SysXycygLr
	GIEG1bH4Bh6A1bqYgStbzgH8Qs9NQhaTbIV9l8tcUgyj3pK0llB2ZmHN1kJcswyG8uA6tbA0id0
	3htIRATaNDrJBBrq4kwci8a/tK8+A3LETDSePWhm8jel0txIKSZB
X-Received: by 2002:a05:701a:c961:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b543d09a83mr5609963c88.10.1795098197560;
        Thu, 19 Nov 2026 06:23:17 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm10306022c88.15.2026.11.19.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:17 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v8] PCI: exynos: Handle PCIe PHY initialization errors 
Date: Thu, 19 Nov 2026 14:22:51 +0000
Message-ID: <20261119142251.2665-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0a3b7886-3800-42ee-8e22-80944114dfcf@kernel.org>
References: <0a3b7886-3800-42ee-8e22-80944114dfcf@kernel.org>
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

Hi Krzysztof,

Thank you for your feedback. I would like to clarify a few things regarding the patches 
and the concerns you raised.

The code is not entirely AI-written, as you claim. The reason I sent multiple patches on 
the same day is that I was working on them over time and submitting them as they were ready. 
They were not all written and sent at once. There was a time gap between the submissions, so 
please don't assume that I was blindly sending random patches just to get past the review process.

Regarding the v2 to v9 revisions, I admit that I blindly trusted your Shashiko reviews. I submitted 
the patches on my holiday, assuming that Shashiko was properly trained on the latest Linux kernel 
source code. I also assumed that, since the PCI subsystem uses Shashiko for patch reviews, its 
feedback would be reliable enough to trust.

If Shashiko repeatedly reports issues that are incorrect or misleading, why is it being used as a 
review tool in the first place? Isn't relying on such feedback equally problematic? I trusted its 
suggestions because I assumed that the review system was reliable and that its feedback had been 
properly validated.

Manivannan Sadhashivam also advised me not to blindly trust automated review tools. However, he 
explained his concerns constructively and helped me understand where I was going wrong. 
He understood that I had trusted Shashiko's feedback in good faith. I appreciate that kind of 
review because it helps contributors learn and improve rather than simply questioning their 
understanding or dismissing their work as AI-generated slop.

I'm not claiming that my patches are perfect, and I'm willing to take responsibility for genuine 
mistakes. But dismissing the work as "100% AI-written slop" simply because I submitted multiple 
revisions is unfair. Humans can also submit multiple patches in a single day. That alone does not 
prove that the code is AI-generated or that the author doesn't understand it.

I understand your concerns about code quality, and I will take greater care to verify every review 
comment instead of blindly trusting automated feedback in the future.

I respect your experience and feedback, and I am willing to learn from genuine technical criticism. 
My intention has always been to contribute quality code to the Linux kernel and improve through the 
review process. I hope you can understand my perspective as well.

Best regards, 
Sreeraj
