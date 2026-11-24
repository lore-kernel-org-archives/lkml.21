Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795522541;
	b=DB+lh0X4ymyLYQbLzC0VIln9Txe7EWj0RX3Pmw+c/A6WVIA453Uo7NMLoMXqT45vKBQV
	 NU/FfSNH4C4gT/2Rh9Bnkv5h5RMVikVQNOxTQpSLwDtycWVU31MYIqe+JB6uiZcxnyEXc
	 aFw8m30g6OlFygPjE8j9NhU4ixOUsB3DLe0OfpED8EjrjMzdix+NidovAP7SbROQPTerK
	 PFz4Xy3s8ltRYtd0sXtBhHsIF6tPGRtqiImPDdKvm9dXhyrAkGopF035AZBRwFKIdNf5b
	 OynR08zm68HvzrQcwvBsx9iaZtS9RBqcOlicp8aTj9+AX7lLRRs/2Ubfptk9EJ5PyHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
	b=GrZKWfeyIcdUV9KZzo+o8jlP/Tgdo6lS+BtlQMgZJZwHqHottpOH/R9BmMTx+XXYdmo0
	 /SvE2Pxtotdt6ykParuBTp+TyFMB7AT/TkZwpgMVKC8I5Y0JYn/SIJUd3kmN36atgGZ5x
	 m19X6C5WRlMyHOJeXieXnKKR4T19PZV/czvboFHG1chDDs8hCl/EPtHHuZjuvV2MfIXAt
	 TVOG5esXGoRXSbWDFoFtwn7ut2tRmblHWPeucL+4Ify3gPz36ixthX8tqiBl7Udg9AkKJ
	 m0bwH3m04hzyd4PFs6GbMDaWig55r7PCpFtXribhkp4DVtDqFJYvb5ZMmvL8ZtRRA9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV9hfC1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24574606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24574606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV9hfC1A
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-483d290f398so2439511fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795522540; cv=none;
        d=google.com; s=arc-20260327;
        b=RsFNVCNomQR5rGjCg4c1hYTGdUKPV4s+HatviOueWMgoO3j5KVwO4Y/iwJ6wETgZPd
         wRiCLtDYXgQ0Fd4qTEzEzxltllFPpHsrDCc4fYbbkaJb5HvBVEYtfPbyhAQdxYB5pGQ9
         eLgl3CrrgZpvkBr1Ap/pKToOyVCqEk3xaWoW05UdwXC/MG+euw6qo0Gu7mHVdpBFv7EA
         n+wQmfNtHOJT2numWz2Ic4qU5s751QxzgAV9iv1tAANC9p1KXKdlbcRGX+pLzlIbECWV
         lkbBm4NTDyqup3ZvSAeK6D9+5K98kHoD2tvY/OTuTfB/vnk7dVzkjpAoocAjCiH7HwRe
         TocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
        fh=HgeS4QktTJzFz87gSwPlkPiluBKBzY4RbE+KiOdVq8c=;
        b=Xxoi83X9QLWQN7j4L5N0WLHJt24JtEv3TkTliJbI/RTITaQPS+K3o1KeLlrysxx3eK
         jc2pbCpSR3Y/Wx87B83+upDWqLKUTkTbyfoNRnZW3wJ1zXhYyvyOOgenyXjgmH20goRH
         ifWDePYcAC4sJJa+UOfi5f29kp/sB24ZOzFeyPZLch+Hf+wsaQ698deWys+Ut3gmcrZw
         U0sQ8W/rcwTJppqq5IrgFTAKCoUnVlUEeS4S5rkuphQoAgbqBaOgQJqmoreqn/RYM4Iq
         CRn/C/vmuuRdQezKayWu2nFoDR5CfrV2hswdLHPsAEyMf4kcd1GLPEEj6pZpwkpBCIvV
         h6Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795522540; x=1796127340; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
        b=GV9hfC1ATehJeDyuy1y/EFzduija5SmT4Uqp96QhyNOyhPHgaGQx1VSVxNVSVLN6DY
         yrK878YgC5QWDRKZBIEyLETPrWmBxYFlwaIpHbZUmO8f42fqN2lMqmpzMp7ezbvgqEty
         sAxgEgcUqTMeJ6MgY+zvk9KyhN3HlBdakJjHarafmJSO6uYnqt/GnXWKft1nhXKI5auL
         jUnuwQlbp4dJu99/q4hUyECs8X28+2heHkXW/wSb8VBqDGdoCa7I0iV6iHL9PoWDDUJt
         arZqZnLvNzl1/lSFuWpQSWDpPC+HbYyQISeckNzQJmnD13Mee3nvRXuBnWGl/Xqzv+qE
         7NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522540; x=1796127340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
        b=jlTrh9LblcNlXL9JDjA7AIPzlcfuBHY8qQFkvPScrxmEbARcdp8OD1FTK2UAAEoTEQ
         nFOqLWlghD9RX1earO4oIuKBKIYRxJE8600LFOrxfxVseP2aU+1BCscKpMKC6Nb8Lo0y
         oH3fIM7NYXBY+CJ2k8b9jw1t/M9oDYla12vsPocYj2ee63e3mrCJGcXfzT08L2y+vUgC
         fFiXPmjjVMabPsyuD7Mso6w5oQhfHnPiZWdMMOKt8/2zU/e4GNudHYebQVwYP7DlRjQW
         zevJiogIKFtvDay66sxM8yCNsu7PJFK0j7UCF0b9HQ94A0b4jZ4YnkgLjzwRkSDZ8IbF
         86yQ==
X-Forwarded-Encrypted: i=1; AL+hErH6IgBYT8/yNAzS5Q+pRsVVXB/8kfohW1onY9LAamrW2V0AGEkaBkl1meJBCzBenO+pCx94np3E0oWVgNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bFhmwkPRHoqIjBot6Z6zKU+RIxvwW+w9qDzZdAi+4yNfRogxa
	K4xgLhL+wRRFoCLJ7SZSNiVDR5gK15rj6CTI0kC9q+GGV4KntAypPGGY+eUXfsjlHXzS9QlDEis
	PVAnY2tRdU/chNViXY/0dyUiSRqQDOef0zKsdcLhbsw==
X-Gm-Gg: AZFdTZfgeRjDOTBQV40OwHl+e83qXiFG2Arbwmjiq2MtlIUP43ZOg3yPAJy2FrrA+Zd
	RuXyyWH/ymOImD4LjwkBd1htNE9OJ8qlqUGg8XlTpj8yzD0fep/mnHC2ADi1dobvElPn1j01OEu
	Tl2+528f/sJzlBjaSfaeJ/vTfJq6pBcld6LLql1AUb9jAbNg5BIz1WF1oOyh62si5VEGvRgtmt5
	eeLU6VFd/AcLA+0baKowjvNHqumiEY6JdWTIcH2hQ4JROHFAwAm0phwjl+IIzMoqxXEu0pxlokO
	I+zCMUhyUm+P+D0OY+RCr0X64bEKRG8/q1q5TkQ+MiOFRuuddH+8uVnlynaFqDegW1FyaPIaNa7
	DH5pVQuAC157B1dWr3nat5ZB5wd4CZgPW2CFBwW0+L5997uGV0Bfw+cZ4nCH78v2g3Pg/J1PLUf
	3oRkkm5Jve7z4d5vHIfRtXu+7v4VSPVoo=
X-Received: by 2002:a05:6870:1685:b0:4ad:5651:c0b4 with SMTP id
 586e51a60fabf-4bc84f1b6bemr12609810fac.48.1795522540016; Tue, 24 Nov 2026
 04:15:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120113116.153232-1-hjf3108@gmail.com> <20261120113116.153232-2-hjf3108@gmail.com>
 <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com> <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
 <ecad59dfc02941058452cad1889523ce@realtek.com>
In-Reply-To: <ecad59dfc02941058452cad1889523ce@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 24 Nov 2026 20:15:03 +0800
X-Gm-Features: Aa3M54rumIugBHapPMkYtKNTcW3pXPGQaBW-5e4HlxHknoEWfQ-UL4AU1PcySf8
Message-ID: <CABOQOSVEG0+WvX04swuVAbUFG=Ga0HTcBJjzpaXB_eKZRwE35g@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 08:59, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Jie Feng <hjf3108@gmail.com> wrote:
> > On Sun, 22 Nov 2026 at 11:28, Ping-Ke Shih <pkshih@realtek.com> wrote:
> > >
> > >
> > > Ho Jie Feng <hjf3108@gmail.com> wrote:
> > > > rtl_tx_status() starts a TX BA session for any QoS null data frames,
> > > > so these polls start a session even though they do not carry data.
> > > > That costs an ADDBA exchange.
> > >
> > > Will ieee80211_is_data_qos() be more suitable?
> >
> > ieee80211_is_data_qos() only tests the QoS bit (0x80), which is also set
> > for QoS null (0xC0), so the BA session would still be started.
>
> How about ieee80211_is_data_qos() && ieee80211_is_data_present() ?

ieee80211_is_data_qos() is already checked in rtl_tx_status():
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/wireless/realtek/rtlwifi/rc.c#L234

> >
> > > >
> > > > Check ieee80211_is_data_present() instead, so only frames that carry
> > > > data start a BA session.
> > >
> > >
