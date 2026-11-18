Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020014;
	b=bs1inamxvivmdZMCkujLr4O1FmuSqyq+lK3xrOnTgscCHlAnDU/cVIyObEBhwk/CMATl
	 Uvhyq5/qz97pFxoo6t3RolIIGP0dlaHiJ2yeSOlbyJVNjet4Lz0DSsx32QhOvKbOjmviC
	 gOFBMrxqnGtVI6JxsT6weP7EytGfn213DJpzT5LnxZ0ey4hZp3w8jDS8qd94OG0ARHi6e
	 b7Y+AT8T40k4DAsFvHsA7mpR/bIHJzaK3nfmPp47WMRe1t3XGfQxodeMcpkloB+WV9bvW
	 PCV1t770ANwZxEcSQhlcjxG3Ff5BfAT9/FwuDS5OziXUcZLfvg/0akWRrtPT9fj3Chg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i+3+UkuuTd3PtMb87HnGpsXm1NEacz3pju9b62z1nDU=;
	b=V+CCzDDY1IaAfI73VHwBDJ4WCMlcWLc75nNSohvq+oBgV6fuG5IRPlOBMvTnS25ktSky
	 6K+JlNT4CRxMJa01uiDKxWcWdBlcq+7NiPZ2xYVcP3EEgh2/Fbu0jpAly+2K7nIkID1k+
	 5TnQ+Jlw7Am1pqbEkMiZSC9keeBwolc0Ybv0OpUrE0X31/qEx0U0Fou0WXh3EuKB7xAD0
	 J4Aq0Y1q4uMBculCARjkjz8owLjeC8bXXcDXxz6sgD0qgzM2BFA4A1q34DydDepfm61Ju
	 cyGq2w0MudFikYmNXUir2pUB+ZrP3xEOROvS0nA1eBSGne45ZlT/yDSC1SASEPGL82Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4U9mTZD;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C0A60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C0A60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4U9mTZD
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so11458315e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020012; x=1795624812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+3+UkuuTd3PtMb87HnGpsXm1NEacz3pju9b62z1nDU=;
        b=E4U9mTZDlIksJjVDWFzuHLbz7qz+H6X/WuZ+ANBvE5aFdUKR8wGJnCGbI38Iz/2/Am
         DcYffqId9bYDRaceSRCjX0vLa8N2I1YNW8Nj1qZQ3GuZ73h9A9UTkhDsV3iQxJvUqloo
         1qMFUUlT9Uexndc0moK7CkwofIBYGR4tJyD+emRsHapyfy2d+KrUNsMeTIWGDmfsN9A8
         n0Sr1ChhOkJCtqcwuL0MKUD9rqm1bq+5vNOmBkoyrmnodDxhRqx2TCVJVvvt7P3+SNGo
         Wu5SygkvVbJnpy7Ekh/QhM6Qt7MKP3IelqkgrWCVRnNLdHHFr4gSD62k/UvxKTiQFyLW
         u3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020012; x=1795624812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+3+UkuuTd3PtMb87HnGpsXm1NEacz3pju9b62z1nDU=;
        b=GLCWpOMBzO1aifFB/s8SCyvCmtGRYrBZOG1nrehouOCH07XaGRudLmZd/pjrzroEri
         L+acfCJQn09w2li7BgKqxPt5ox8zVB3li78TJfDmIlFBPWVv3JBhMqy18Nogelcs73F2
         bk1TQyeBrbpPH4ZA+gY9yqZo2J1YsNQnBGT785LkhBInox1WYGHwa/Rj7s88zzJJZKEY
         Afa7snwjtqBNbJc1KqxCrIqWjCT+2eSM0Fe93gN78k+eX87D35b9FolsQbEKS7hWKvGU
         QrRD9S2poYNL/SBq+zXH58XFAAlbuL0vVZQ4C/b6ZLbsXZoleT7v389LK+C0mYiEXtOU
         6sNQ==
X-Forwarded-Encrypted: i=1; AL+hErEWsD2hyYZfSqNG0f7ESx+uBYBWcK7mRaWxkqO7BkFY08oHTCjNL/qLJiE8zOVCh9cFKl3sMrwMS0p5GC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YVBJCiKAxQCFa7vl8hc4OZf2zvJ04UdRmqtDZqochr32Iw84b
	nT079WoGYM1j3kXabWmjhCOq/ieq779ymVsSZjVBYFEYPyPSedSJ0u5B
X-Gm-Gg: AYBFou1eAtLOzBLIM4JEyt2N7LSP8217P3IQ0gjYZVycCbCIQtLTngM+u74nBNFHPBc
	AKU0CTwYi44cesDK+/4rK231uO43I5TvVSz+QuEj32YVwmyD8AiMxz0zKdLDf52H0ZcafOr8LB7
	ixEjI41jbF/8q0Ocj0C82O827qEMfmnagW1nK2cc3rCvL7ekdLeOB8dRH3EMIs7ZnJbcQWfIxTP
	0/uOG3VVwfygHVpN5kmVDJusOI0+Fuzcz6wEF7Qxj2+Ne8GIf2amwAWxMl+2UB4W/zjVsEuNRWJ
	yeeN87FxAfhnQd6fVuSQNvuo43l1kvVSPev4am5zGaBdn8+0fp6VqErxpuSAhOGRzesKceZIXND
	HZAoWzhYCXFPN0WdvWgZ/H2qHE/WYIk5nBSL91Js/8VHVMiRnjGGgmIuWjlPi8wQtiN3FKPxFSp
	7I0OCYHBx+AzbwKiUUa7MkU74aI7SIfrG99QfENjr/6tBh1bRSOsBHD2tnU17H9BgTR7VXZqdoD
	FjBM39ikuclC1Rw2Pvaws6keJxT1KoUMch0DckTbXQoPl5DT3/2s4Ltv9jrHQ7I7LaYO+fDsPWO
	aZLEBolW3GILs6IJRGmbtbvnzB3a
X-Received: by 2002:a05:600c:4715:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb7da3d288mr60167565e9.34.1795020012419;
        Wed, 18 Nov 2026 08:40:12 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm137986135e9.13.2026.11.18.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:40:12 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Maarten Brock <Maarten.Brock@sttls.nl>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/16] HID: ft260: uart: add modem pins control via ioctl
Date: Wed, 18 Nov 2026 18:40:03 +0200
Message-ID: <20261118164004.28739-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <BR0PR05MB0491322068606AA1720DCE14C0837B2@BR0PR05MB049132.eurprd05.prod.outlook.com>
References: <BR0PR05MB0491322068606AA1720DCE14C0837B2@BR0PR05MB049132.eurprd05.prod.outlook.com>
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

On Tue, Nov 17, 2026 at 11:56:36PM +0000, Maarten Brock wrote:
>> +		if (value)
>> +			gpio->vals |= !!value << offset;
>
> Odd choice of asymmetry: !!value == true, then converted to int and shifted up.
>
>> +		else
>> +			gpio->vals &= ~BIT(offset);
>
> And here you choose to use BIT().

Thank you, you are right. Inside "if (value)" the !!value is always
1, so the set is BIT(offset). In v5 both branches use BIT(), here and
for ex_vals.

ft260_gpio_set() from patch 3 has the same two lines. v5 changes them
too, so the driver sets these bits in one way, as ft260_gpio_pin_set()
already does.

Thanks,
Michael
