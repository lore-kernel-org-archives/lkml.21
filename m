Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696115;
	b=YSkxOQAx+1BWn6qefYe282yl0RVcn+g1Mzmo+W0ASqR7NgrkKZMHQZnr+IDv5tH8kGPM
	 vQ4shyh2neyW7GJ3npbC4915/dCudd91eDGeWKRToxpM92YcKZ2ohAVhcUvMkJ4fi4xjB
	 ds0Q3Zge5/gt0Vj4QZTHAwUf8zdgWy+tLtXIZBGINab34Lz6xdzwvyvzPm/jKkXnM8Te0
	 eyma1+rRVuQHnsUaLS7Da9xryHiFn1zEBKOTO41uhXPRvCcC0qV0pfbdiCWwHDL8gQ1gQ
	 jy4rLQp1mESGxYPmofMOshnQsVKBCGPj6SWyd/1RqyObsvizZT9Bm5OkcGaK6Aps2Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
	b=SWsBI3DMMnMRTpmtwymYD0ECPXjKZY/+8pUAPeDtQ54IQqpCLl5/Sbp9iPldS6ztpp8l
	 fZEn8u+OcAnToO/sEuhHOnj2afcSW1ACyyU8kuaN2ZBPq5i9mK2Kvze82spwlPoQAdCHG
	 GDoexD+Wc3hWuuzjY+RxyXD0zPsab2McAHycjPhOH+EQMAlZl0761eNfuiQXTa3H6L4/Y
	 aTKRGiZ1ZIZOUDPfI40+SJ15L3I0wjVkIWoakqlp24i1S4QuywzA9H6rqzviEJCU+CFjk
	 vaX2vxkTqaexzXYgoDPAuPuaoCr356uqPUsr9OC8YMqIYAqdrj12Xkv23BueTfCAGhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAhFjL30;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABEE606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ABEE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAhFjL30
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b315dd057bso43940307b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696114; cv=none;
        d=google.com; s=arc-20260327;
        b=YhEg4vBWFOhR3dkkjEx3Hyeh52RvVvpy6HRONQoJfLbTkQRnBcWG8W5exC64/Ien0J
         3AW5TO74VbBPnAMIQ1hwni8PvFgVkqAovInLCAyXMRcZRrSG2MQRPmdZcrrXnv+z8LNs
         E8U7z6kSPR57ROfYHO93JekCbWZxNbN/fdWSBMhqsIiitSDHhICnQBvRbeepwFvWy0O3
         xNL7CN1F4hNZK8HbBhXreFsINxFibzHpbWRmc8jgNMJjjjrRniWPV+CPa/NzNleTEohS
         D+p4lmM5hLA4qCKvWyTYTCuFzZIH7ud0RYbDNGtl3q6FFeznEtpwfNHw7ee01JCiWTDO
         khrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
        fh=NAKDsKtgSFDcem7elWbdeKnikmliSdL9Nf1g/8W7b3Y=;
        b=NvjtQk8Lqj8a3+ONIYvZ0l+Odz2xmwDur9MUsWisEs3W1RY0vVqdJluWDiXhuiwFjw
         tc+kKd755Xk3PTZiIMzu7sb2GBsSQhJsQUi80SnEtBr+2AG4gVcadYmxu4MPRiDMo9IT
         Mpvhi8jQ71RnXzDrR7StKpz8lR0+4HIg799bSCnH3tD/9W//vzfXI3CrqvPiNEelO89S
         ZYO5Y7XXWSxr8uc+8ibJtr3WhUUgf9D9048di1twXjhiPzKSUJJuoINuj8LWzsoo54X3
         sMwcS+43kLPPDECiH4+8PhSKmEU6tyVk+W7xc3x/AD2xAfBwpr8WL8dkSOFsOniB2RHF
         SOIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696114; x=1796300914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
        b=tAhFjL30GDJIDzIHHmNiU645YBrP8AqWztEhqhPKnl2VjAxq3nEo9lVWhKlitchCXe
         xznSytZsXszLNCygekSEiTAoCyORxijYAK6lKhl29oeaqrdXlkYfECa8/O9u4opjKx9O
         A94cSfSH6I/Fy1esmuGrC7LDW73+5wQcq6p0cNogEIpnIIlD7S4RF9yzhPzxdw1LcD5+
         aepG/StcDsxGZilFUwm3a+v7WT9VMO8NyE8fFeyMAS6iPeSq9pUGdZzgF9IY4JRLA1kM
         KwmE9ZS6QalqoNxFS9LPkKFqw/kgwn/ErauwPXR8Dn4M+xkaMvAGvVylF8m74l+Zh5sc
         D5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696114; x=1796300914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
        b=nNVvgpbCYmg4m1L2Sh7zmlWx84ZFvZe+G5AtY7oyTEOcSAx8HHBxKIhNk6Ph2BH9hj
         89IMXwa5x5rjCX9JdxosbwuXlK1ZrIjSGrE+7mCgcqHZgtmDMMzsshrVRMlTk2DxNMOs
         vJKxgzKDfFyO1V1c0jIv2N4qHtoE03XCU3fxMYsPq+C0zCs6Q/gM0QRvlVMnXC0rr2tB
         DqcJQ+ARNgMLlueAkyicIO9lKFjWOkForp2EcSPzWYYVYo0MT5HYArOotaMcCw+g9yIV
         hRjKYEuT0pH6UBVpDsZdkCTD5gCfw0OocpCMnCMeyiDhBSrjjcoLKIOyHWDRPHzAWyH7
         EpmQ==
X-Forwarded-Encrypted: i=1; AL+hErHf+bB5q89iISnBLYksJyJFMG8timQJmH4bZP7P2HLvIqQ6hcIfZOvuS5ZmuZpueX6mNDZMqF086w1AGxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cOcqJRU9bYc5Rt3uBqemIgaCnSlVAhpgy/2ooETTyhDjIrU0t
	5UJSzdA0qS4qhe7YsUoRrLeLC9x3SdJFxAKcDFeODqZpbAjjTZPIfX5u5vWh0eCNrRg79mp3qTU
	wI2iPvC5UI26QaATp5RN3LwVzlH6+Nb4=
X-Gm-Gg: AZFdTZfHnemoW1/qOXHaRlaOQbyI1IJfhhWMfvaXdiG7xOdJ5i4pi7hdBUjYpPnSSOv
	3imVZ7pUXiB+JVp02kIA9wYacaG4evls19SZkv7Np7oA7VXbrUpKJRZoKV/0Srlsz1IkeeQ2VWJ
	pKYDnPYL/eqvHPFsuc264Viljj5vJIYZf0RWrTmV7aj1O3SkGUVt16J0LSqE3kwdu+7QJFJaELy
	Y78gTAiwbNef6XV0DU3RQ94+g7mJp8GkzdWBTa7v4wDQwvftcoB1jcuU3Gxf8Ys9hnL2ofnwOB8
	1ZaSOEKB2VohA1F78L6oYCTFEFwTcnRJ/uIProvDGI0OBfCzlaTy0N9qeqI9D79bXOFmdNfgZKA
	BLwqolSNH0boN/9LL5t8DjJ6zN+1gskLdpxnSlrF5De2MgXzZCmSw7/JQGvJMUR9c3+f9hw==
X-Received: by 2002:a05:690c:63c6:b0:8b4:cc9d:967d with SMTP id
 00721157ae682-8b520513e7fmr87097987b3.59.1795696113717; Thu, 26 Nov 2026
 04:28:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125134013.2692510-1-congnt264@gmail.com> <366470ae-41ae-4e3f-9170-8b2f67cfe7fe@web.de>
In-Reply-To: <366470ae-41ae-4e3f-9170-8b2f67cfe7fe@web.de>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 26 Nov 2026 19:28:22 +0700
X-Gm-Features: Aa3M54pSZyA2SwxCMS98XKa8ac1EnDdRti9OZ4BvwqNoh_Gw5p_qcstm_-_CdkE
Message-ID: <CAJpJ=GsNZnyqg0FBVB9jhNDY=2H=DMt5g+4pYJ1WYvFjp30spA@mail.gmail.com>
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Luca Weiss <luca@lucaweiss.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:15=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> =E2=80=A6
> > Put the reference before returning success.
>
> Please avoid a bit of duplicate source.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?h=3Dv7.4-rc4#n526
>
Hi Markus,

Agreed on the duplicate, v2 drops it and uses the common exit:
https://lore.kernel.org/r/20261126122516.1198461-1-congnt264@gmail.com

>
> How do you think about to apply the attribute =E2=80=9C__free(fwnode_hand=
le_put)=E2=80=9D
> also in the implementation of the function =E2=80=9Csgm3140_probe=E2=80=
=9D?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/property.h=
#L229
> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/leds/flash/leds-=
sgm3140.c#L185-L281

I kept fwnode_handle_put() rather than __free(fwnode_handle) because
this has a Fixes tag and may be backported, and the __free() helper
only exists since v6.10.

Thanks,
Cong

>
> Regards,
> Markus
