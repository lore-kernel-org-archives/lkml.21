Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530246;
	b=uj1wD5Ut9G0FrlnP1iyJfOGLpES06VgIggGktmMAgh/Owluh0dYu4SoMlfwyDV/7EXSQ
	 gbUYqY7oRMeLsIHJpAwkjL12yxtP3YbVcM71JSHPuYCBcz6wllpVnaCCHlTUHRA6wxI+4
	 1mJ8sKhSaNONehsOlmGwiBXnKI5e2jLdff6jcZDpGZkm89gNUANJHUTJj4Iy3zX/A8OQu
	 bKnY+eOKq2U6ZzSGiHwDZAJUvrDalPBjbxQHk3f0EYtaynN1VXKAhuXXeeHioozb4X6QH
	 2h0q270KI4haqSLjzqC2tJ51dlidWIoDWRmA0Z0OotDLndraaTxdk86IL5EXbf4lKyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
	b=AYRYnc+5ztW0yePxN7w8QxV9yJL+3UJEoePrMx2j/lzKyaM2uK5x+NVY8so+8jSgNOZ1
	 KSsS9N48vDNWNZsEtfE+utBw1HgmQBpU+T+XDR5CcCG+Mgooxba8E3PjqfQGyipW8WSo4
	 J/DNbLx8dRuvvrMXTCccFByRyXpQ8bQ3NIUYL08kljhr+r8pmr9L/mWXEW/SBgNUXb/Nj
	 1KMlc46GyVQDM4X+E/1y/+GqTfMinV6aOWZCIepxSIzo/IxH3b30BdwLZuPnm4TxQhJnV
	 SN76/tKj8Zvc4vTMwZc++sIXi5U0smyuXqHTbG9WJlwfQvHwLIi+az+ALVDdlgHk8jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58328606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58328606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so3815107a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530245; x=1796135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=mJXpwd15LM06NObvBG25I4p6y8dwPNFq5cNkKyqHfA8ddIlk1uVMaZcsVBLcfRtCqZ
         Yx+WmXrCx+fx/N4DpX1uWPcHsrX9WVlNyigMDuhn7uAMsJ/CSmqaBilO7c4ANdKhz3SL
         pwx87MGelSHlPrBUv/UTDsdqWt8KEwVP3NHe6HNkqV5HUMIp4aDFM0Rh7e/ZaFvr5bX7
         sjls1tUx/QmTcMxXjq2DCD1gMVDgel03IVZBUII2r0ZXBUkCv0DYhfsoLjmJMTaeiKZg
         DPKlzQg7XgG7Kf6rd9E5DHo8oIJVx6HkM86xdZjzwydyO36mbWJRyIbyvvOum+Oakzqc
         RgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530245; x=1796135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=Jcefp8OTP1YVCKug5eDIq6zaHhbIFWsVr8oZ5DgGvcRzKfPNZhgzBDeoDISGbcBrc3
         A29yYTmCww+6j9ItugAQ63EaO17tcLRXj/OIXJN3159qZZ3cmSzsYTE9XoItk1FPIaXS
         AlZ2w50PMg1X+O2zQpTFX3+ra9W9e0WVdWN4sqydxCcg8MM+i4zQZmE3M9wcxAh69KG8
         QvNUIYZgno2LWKDKZlRAwECufjODSXRwnYwYpZrMBWd3shFzsuRJLhcW5rsXF6C8O7zg
         N7fJf5hLbhoe37m+1GrIVWxR4KclReIz/fJA6TxykmW/b5/ugCQlhXySIzxgiZk9CeTi
         +kQw==
X-Forwarded-Encrypted: i=1; AL+hErHBIN9Q/v4r7tdW2DJJrkGKwYfCt2KF6omWTty0qttic/SJspYn48ee0WEQG+2RrNW7b8G+XkKxg7xuu38=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Qe2a8kw5jkbYth4rlcxObNxf02kQTcLmYeGhwaDLc5+XmfSm
	GB2DASytbynJfkxG/Wy16U5skgfAhX6Qot2oRcJ0T6xJiIgKew15C28b
X-Gm-Gg: AZFdTZfWbZd8aF0uUnKqNJtWJcNYN4SVuAd2daANgaApF4eUTo3CK/FUNwhlJ8Onwm0
	TsSgAOpBMB4kysBnC7HDHFiefHViDF7sWdmKsYa/6CYzp5+RNC6c1FWn3YI5XxHHFT5QoMCH3Xz
	UW3t9C1Orw1GrG6KmuMRYVs7YWlZpRvbb+VggPMAsHrRTR5HLkIav8WvzfpqK5d7Zq0wh3+FUT/
	XZ8kcQoNjjvS1RVS8EtvmB0hVw2MwB1Z6a63d7yZRnk3rR+HddoXY4dghiurVVvVq970BDNkbkT
	tY6SyG8+6WvieIB1oOQ+srjjmOPdIyqdbANzyztMzF5MTsH2wRaKpQPbMFavX1CSxE1Z3+T2aZa
	cRE2Ej/Mn0Faqg+RK54VtD/2DZ3a/gFaWyJxIyqFEc52yVziLzaW9ZPO0r8EkJJM6y06izukCft
	zmDLE6+PZ/bhpvcwWS6VroLvV8UDSzfPvvvzeSpSVbMrUu9TR20azz6JBk2TntSADxT5EHVOLeS
	Pxp8VblKsAhvEn46WvIbrpMknYl0+4Ku7U5rC+5gaxtYKxXxaKOV6wsZ7KNfFBjuMV03i+dI8HH
	cph8z40x6mhCtuV2ge1BAI5O+5s=
X-Received: by 2002:a17:906:c53:b0:c4c:c62a:b9b3 with SMTP id a640c23a62f3a-c513aaacfccmr893924566b.22.1795530244720;
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm525653466b.11.2026.11.24.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Tue, 24 Nov 2026 14:23:51 +0000
Message-ID: <20261124142351.2137556-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws> <20261123195935.1046144-1-lightofmysoul@gmail.com> <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
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

On Tue, Nov 24, 2026 at 11:35:32AM +0100, Bartosz Golaszewski wrote:
> Here, use this:
>
> static const struct msm_gpio_wakeirq_map halliday_pdc_map[] = {
[...]

Thanks for the map! I have added it in v3:
https://lore.kernel.org/r/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Stanislav
