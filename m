Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100932;
	b=aa/xzrVoyXwN1jhy63ioTmAnKYwQZvFOX/NS4EFO4WlCwLidzy1XtgiOJ/f8VJn3ug5T
	 aMQUMa9pPmSRSN6A5OeOEu0yUAa2bqJ5qKXXMpwuCnfnjNbplJdM1GCDM114/CPn6y9Ca
	 i06gf1/PA9ejC6Q7XnvHODVgHYm6FMOtj2V9yWYq2+cRqEKFcwcvB27/I9aPgHaK8pe+b
	 64iYUMMqlBQ2gtsFzgU3nZGqPlgVgXZunu5EVtvtFwyQRc+diXzMsMaOqlzVDpPL72J24
	 RvrtXvhwzImxv2zQhvZofPHU8IVbcFg7caYUg+q9sVRzwK2ubLZJRQCTm1MsWedb30Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
	b=yvD9AHDFsWDuxwtN0xhpcn9peh8LfQaz5KnSLmsJT8eSk5VnyImBSotEH5GiVW5md/13
	 WA6JCp1ktoM3miXS0TVwbVqkhsja8UElThgITijl9aVoGKbHJY+HYPKO/FyGoOJKVyf7S
	 DHlUw5TrDrUJsT/yckqzbQq9X9Ivw+0cpu3wFpncf39zOnp+/7Zcg9kOK/dXNifL55SpF
	 oWneObW0BRfncEjbOuxAv41jFhC542m70+MHxl/W1ZYRWHhQCXv5h7ALts8Z1ZNB+wQ0t
	 4FoYh1ZizT0kZi3R7FPyD59GhMVXVZ/i4YaCFFoJEAzIQ/US+ScMfJ6SJZaoG4DuJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Ly+rnE;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CAB606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CAB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Ly+rnE
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso23809941fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100930; x=1795705730; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=P6Ly+rnEbtb3B56g4DtN4Fx71CgoOhCEXnaEgUpHcKAS8z6q+OC9aofCeJlbWWx72+
         2lws9UULc+V1eCneSwRN4OOY4fGNgcjG5NzKfldBMjScI+0fzgEW7m3wmru3i+luxMYU
         UkCQaJ2cNA+h9J6K8+GfHL1NUszyiAqzanMK66aR1kQs1oLx7VMaPzMFD/6IMeWzCs9X
         1NXG/laty78FQvJvWaYERAfgw9fN1LHBaG8CfM/lUuhqS6bbgozHduRlKicmrh+VX4Cm
         F3CKFwNzWc3GSHWCcnDVmiVmNDcy3GoBvqrHvR2UMkSKVnNSyVS1LRI+QAF8q2vjUOFH
         oR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100930; x=1795705730;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=gw8cgloCn10uiRoPGRZBS6vWFAezunYKvqmA28wAv38tSJbUeaBZ1T2liP0/55l0Hy
         1hM7GllqWopwo4IIBYZAKBtUc1hjIhTEvq6cxiVXOkTEjF6Wa1WLzfOLCuLZeJTOW+yU
         phQ70jWim453O8u2FJrazS7tA7IQgVxWgY9tKq50DDmbGMRorwXNUBRL5HVrLAGK7Q/y
         0g2cs0GMz9VUyidWcu72LZSdz8VXRIAJqvBEZyMHAqxH5V8lXUwxcbiCcRlGGNdiRdU4
         gkSs/0tYgoKRXTg+Qn5euzf8E0wIVjWpD1qjfRBtlyLgXBp0XDlaXj2JdgebtV6qscYp
         snYw==
X-Forwarded-Encrypted: i=1; AL+hErHvuEssT+6uVIkzOnazc+LmejHhHZaNGDbcvlSSwzEECVLdZQ3vT9ORKa4I058TY+dYkZ2QkzC9+nGlSU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qnbfWVSwiwJSgyrzn1xHDW66psgEqkWBkNHQZ5jCZMRbqa5b4
	dpGcqHxV+UwznVf2x8xbyl2sKCXkXduLmdJ2jbrUiWuZeXQJO8CE+KfQ
X-Gm-Gg: AYBFou1jCiUneSrUqNM2L4LQFyNn3NxSZ/NLDIVX+Cj8q1/0V0VAEQCvlBy+uSbohhY
	89bG9zWxzLUicofHg0BAuuoy+XYnABTPWvcrEbwuc2J36MtPIUfCLTncbEr/RfvqKz00m3t/fLf
	5zJ6Y4fZOWUBKOVtd1ucaqISdEIgKgbTDTEQXlqeJuwreNPVqYoIFoaF3f5o2LbsgTApJeMBVHw
	+NRftGwpFT/kstT9zLY7W8cKP9UQmhI6w5zklplk015SUbht43nt4uHmifWjsRQjTegMveCwVrB
	X3RvN59jB13uQr1zBVMM8ppwz3bRmaZMRrh3wJVHPxScplvdbKlejYo81MJrrE6YHoVXz7ZVZQT
	Wv59uguV1bl+0ElJeTCwN7L/umHT/p9F2bB4zYoPixdzJz4vgQ8iliAyq6+EXYsTdDP8LNt0xyZ
	zINkkuSnfKOFRjUmQIaIQxfCnF7U37HrXlk9FSN9T3snJqXsMzf3D0u9rYOJwE/xZsoA/XVN24V
	DvEX9kKSB2T9W247oCrpLPVYQgtvHugxblvJaATnMkd8t6Z7OIrYAEJBw8wOHTl9Aq22C9qwN8I
	kmXtV40kBvFpHQVpAMvDi3eVqcXfHl3DwVqhzJU52y48jTLdc2U611A=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id 38308e7fff4ca-3ae7f9da258mr961291fa.11.1795100930127;
        Thu, 19 Nov 2026 07:08:50 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebef2d0sm11809841fa.37.2026.11.19.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
 <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
Date: Thu, 19 Nov 2026 18:08:33 +0300
Message-ID: <179510091368.5.7008617353574583652@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Bart,

On Thu, Nov 19, 2026 at 02:42:27PM +0100, Bartosz Golaszewski wrote:
> The driver looks good but I cannot pick it up while it references a
> Kconfig symbol that's not upstream.

You're right. I have replaced ARCH_CORTINA_ACCESS || COMPILE_TEST with
OF. The driver only uses generic MMIO, GPIO and IRQ APIs; HAS_IOMEM is
already required by the enclosing MMIO GPIO menu. There is no need to
keep an architecture-specific condition here.

I checked built-in and module builds on ARM with GCC and x86-64 with
Clang, with OF=y and COMPILE_TEST=n, using just the GPIO series on
v7.4-rc1 without the CS75xx platform series. All four builds passed,
including vmlinux for the built-in cases and the modules for the modular
cases. The GPIO driver code is unchanged.

I am sending v6 with this Kconfig change and an updated cover letter.

Thanks,
Fil

