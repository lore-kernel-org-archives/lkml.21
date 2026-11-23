Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474301;
	b=W55Vopq/Xbd34jP0mAdubOE12y4LYsDJwa0IU1vHOfnNZTCGKLjxeDYOvubEYZRnl9XQ
	 GE9mvATUloa+1+AygpUbPzwZvg8G+KojM3DoIb6JtqSwqEFW0vQI+d/6J0k6jXNPYz9dQ
	 rb+OsJuo3tuDOSSg/rKubd4+GIvmOGyurKwFY+DinmBNh8SMfaK2FyB+rtsuop4CDRKnd
	 qa80rhjDTHA9b+a2bhGUzffCKq/wP/ynGBUdlpRqoys/VAXp65OTUiF+P+HKe+bs67xHk
	 +vRMhBaimGrxXyPi9rJGPBgIX9q1zBDVuSBQFfVbQTRfvAxI+CM7wSvlHbu7xeq5AwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
	b=N2tM2I67ueIdqDBtprJiQyKyaJRFKBQxmxuqXffNIcXq1TCx/chtxPPx+ONZdAQKhken
	 Q6cTQSrVOeQwc6lBkN6JYAUwZfq8aySUNvSPEnmqHDKT7e+nc0PJ0KGmPddIT8yVrk3OQ
	 YkCFG0xuviYxF4XHn6zYShoxWmsVB1ECC1naz265z0rLjn2lvLAlrlmM2yC4URAzjk08d
	 p3yK0q17iDwgtJoR32ZnWL81Kysxch4GRvlwF55La5GaN0KHxAj7TVkmaRPzlcHetQtYN
	 cw9PuZxhjHuVy2gVLn3d+n0u6SDbE4M94E2GwvOL4xFmC6gbO2eidizqFFL2lFK3CHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRbfmsEb;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA892606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA892606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRbfmsEb
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so35358001fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474299; x=1796079099; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
        b=YRbfmsEb/hQOGAmXBF7R643OZKuSR1qRrsgm7LHHfGRqxf8k8EwaQUaNDaegKDxgeM
         ZV4ML0hnBAjir8ppobqGrNENghuxdG8FjKejkD1JluhPwmDT7R3RXaKFkCA0e8UTYWTI
         3WVz8N7nUWxpT2By0hCJRR1sqLwKyVwcVWIgkPPZQOlsxP3/jjJYyzwJkdqlSUdxntAN
         92TJEQcfjbpud8ss9bN7pb9K6Ht01WVHRuu+++I8niqFgIqrma2h+vwPQyjBe+gpsBcO
         S4UolxbVHleBsrryCLTiSxVwBcDYdUtVAG6WotTc0lvQUVnfQ9NSB2NmOoM5Qf/eM2Cu
         GJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474299; x=1796079099;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
        b=OocPpY/vzGoo30lnRDligkEPWAogjVioQXIMlE06zdihaONIj3NPJp75OXHUYUQY3h
         dm8Upoy6KCNE5AS3sLp0wsQystHds2RqV5ZsaDyDfwlqd90o0T1gbLL5XleNCe6yhiZR
         X6RDT/dkMPUMNiBHlDoWoh087TM9CNwaznv0gMdMHBvskPD4+AUZpQc6T1wgEf2YFVXD
         oByqbcfY/o0QoiJPFs8NCj3EprN9uJoP0GzJVnsJ54kfBa7D7OFz56EikFxJC7Nc1XTE
         t6hPKf5wqdtrzaXvgAZOpWiZ8bSnHPvHxvVYPpjOfmdZEa9L+3CP3IvezBZgDXqneUl/
         mpLw==
X-Forwarded-Encrypted: i=1; AL+hErHZqDVfCs5mTUaLscNVyc9yDcJvXTJgOrqywmVN93bwNIC7NigS9zQzSc15CAW9eaUrGfWtx9i4AaPR0G8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OZF4Ke1PRq0PTyOlgrE2j+GXsRt8Nf3pRpVgtDVe3Lw450ZY0
	WdLPzXFYRgdz3Gznd1zkY9FoeqT0hd7YJCf1i66xmFfWkR/4a3gpFCTo
X-Gm-Gg: AZFdTZd2/aDcgHzWyT7792wyJvppyMPjLN9OCGtoDGzMsZ21LJyPNzwXSdmfXChL7go
	iIEXY24HTjRy9CNKUN+G+1m1239dqPTv06zmh8bQDtVmREg04DM2l+I7LzuWI8pleCWYCx2USSL
	aWZNNCE+7KY0T1WJPzuIiPp4O79jykyhinLr2W401xZEkvRR78IgJ+MRgfmiK3Z+5W7vgMTq4as
	wb1UibQ5a/ABdU8FjgtCa30A590Kp7pE0KnE1iolxxfqSRutaDCRjH1s0kV2uKu/22ctBGb31Rk
	Ynr5B/h4JEWL5SpF7DTTHkfaFWSs2FxHmq9icIzuLu55p+qZ5AlCt1iQLH1VNHgavGHrqH3V95V
	YvH6TgbV1OPdRM/WKTt1wfEUlPXWa+DHBmwxSsMws/Nek92fHvPhy2FnexPXuEXZkuQAFPJN3LN
	W21EsEsJYHl+AWnlVyyk7cbGqRxqjJa0dU6iMX5GZ209RsbPU/YxCGR6Ku2iQLjCNnL/QZpGHqA
	daO2nmkUoeCSiKUsmoUk7CY025bBUryQ2fZBRGHmKr+ypDzghaVCxA2/Ce5O2GVyl5J74nVKoBM
	bk+FI24pRQFKQJPLLnrwThpLUGn/8EJ6g1qbgizCe3SeC4nGRZhQitk=
X-Received: by 2002:a05:651c:a149:b0:3ac:e4fe:49c with SMTP id 38308e7fff4ca-3ae7fa65ademr37338301fa.21.1795474298759;
        Mon, 23 Nov 2026 14:51:38 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm36143811fa.20.2026.11.23.14.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:51:38 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Date: Tue, 24 Nov 2026 01:51:35 +0300
Message-ID: <179547429575.493865.18130205107556064582@gmail.com>
In-Reply-To: <20261123220804bcab0f99@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
 <179547125963.75567.6386430167092445665@gmail.com>
 <20261123220804bcab0f99@mail.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

You are right: I used the core's calendar-validation boundary for the
minimum, but range_min should describe the physical hardware calendar
and its offset handling.

I checked the lower range on Almond+ with a separate Linux 7.4-rc4 RAM
fixture calling the driver's set_time/read_time callbacks under ops_lock.
The normal RTC core rejects pre-1970 dates, so the bypass was confined to
that test module. These six cases passed:

- 0000-01-01, 00:00:00 to 00:00:01, with raw BCDYEAR=3D0
- 0000-02-28 to February 29
- 0099-12-31 to 0100-01-01
- 0100-02-28 to March 1
- 0400-02-28 to February 29
- 1969-12-31 to 1970-01-01

The direct callbacks succeeded for the low years while the unchanged
core validator returned EINVAL; the 1970 transition became core-valid.
The module recorded 219 checks with no failures and restored current UTC.
The RAM supervisor independently restored UTC before watchdog return,
and fresh host UTC was verified again in installed OpenWrt. No firmware
was flashed.

V4 uses RTC_TIMESTAMP_BEGIN_0000 through RTC_TIMESTAMP_END_9999. Its
Kconfig help explicitly describes the hardware's four-digit calendar;
ordinary core calendar validation is unchanged. The source tests cover
all 10000 BCD-year round trips, and the ARM built-in/module builds passed.
The hardware evidence consists of the boundary cases above plus the
previous upper-century/9999 tests, not a hardware sweep of every year.

V4 is posted here:
https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v4-0-bceefd844074@gmail.co=
m/

Thanks,
Fil
