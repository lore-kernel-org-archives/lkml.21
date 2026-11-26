Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707104;
	b=MP10QJo2ZJ5frrEGbvgi+3xPlJmQBtFh4NoWt8Za7MFJUex6FG4YMzFNTVtHI0G+VoL3
	 boAN+ZXKDy+pPR0/WPJ2Nsca79bHHXP57fVe0Z5swK9Byw/Q3lbmJrEiHnhqZuK0YUZDX
	 BaB/2GxAp36ev57Kb+kK6B+Tam2OUVkT+gQx368TXpz9UiPz/MdyoIr488Y1h3M9Wy22W
	 EL+hsrm5r3f62Pt72nrqCHAmas0seXDCCyT7U4Jpw3BrRYK+M4rhYEwAiGYRH2ScjVnQD
	 hUqYXZZjDcR97IX9m61dGpUJF7j/6hW8WUP69VMKWhSCYi/cUrny7s3Q0XG/6E6hVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=CNCCU62jDJl9wNoG3rW1B0EyVBtl7xnr4/sj56FZ3Ck=;
	b=lNdfm6SRqRMj2NymfRvkKD0+VLYbxrmEx4ZBqpY7MQNqv7IEn74P7CbFHGaxGLFwPLBG
	 4uqBsgPTre5P6m9RQrpxUj9g97hIPVa71JcMcxVASm/todexuqpm89IDt3zZnncpFsKPO
	 6wwOhzyhKxn/ptUzlktly4gMzarpqCkoaMOivlCO5RQqTK1ajafWSbCTac69dxofP5aBa
	 YCh2jivjCn/o/yZUEKbfRhj55dIg6eZqO1NX7rMBXxCgYIqg7aE/qdq1i0EdC0GrcrK2t
	 yMy6d6us1iVjjVcpopC4l/aXGKED+zFC61JctDYuNK9hfN5qbp6yv/OU+DcAtJZR8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mG3JMuiu;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CF606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mG3JMuiu
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so42772575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795707103; x=1796311903; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CNCCU62jDJl9wNoG3rW1B0EyVBtl7xnr4/sj56FZ3Ck=;
        b=mG3JMuiuTh0qJHEgtqlWO1QzHe5cXadqiY6ZbiCRf+9Y8OuZWFJTbOjRFCdDV0FHiF
         yo0/VV2mjXJounpOzQuaQcP0fXNpVw+6YBwUaLe2xUfdvyGWUvICyeR59pkYmRVfcA6+
         kgkjGNxQTU3tC6HVXAulQUDLlerh4h/dQEl+qmJ/CJcHfWqcNJ4UzNOqdrqy7UyKy0QY
         FsZmLJSYWdagR2ZBAcO18fcAR84OutmANWh4TbzudwM3ILZwz8UMw31C9GKoSq278m2C
         48fpAArBX7F7UrlFa8Y5fM9pkq82TnCqjs6LqjApE60izruG0XhF9XZKgVA1peF9ozW3
         NpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707103; x=1796311903;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNCCU62jDJl9wNoG3rW1B0EyVBtl7xnr4/sj56FZ3Ck=;
        b=R7HoYZSyoIfoaWbjfADMg0FYSUJsB8f0JyX2eY5jAAuZJZvZfoAHrJbZhQ3U8gc6ZG
         WMymm9oD1/o5lKMgua4XZG8qhkVCtSv0pQsnoW8DRHQIHe8eTpxhbFS1e5XVavuV9ki3
         QLfu/3Q0fTZQx3YgOZQVeUflbKk0besFIF01VFn0nxvpmPJMkqyU0K/UZnUppwQM/5be
         PzawSMalCGPlGrUa87dNkessLUPsXUoHamYjodnoRC6LXRDwoaevTIsl5dhjGm5mXcUb
         pY+FiXmQUxS9tcp5MaGcJqtUb+JiOEYTXQp7U92SQuGEhyv9KzDoz8ICVrARyfJoBGLQ
         EMAw==
X-Forwarded-Encrypted: i=1; AL+hErEda9d/wsDYSjfhchF616o6LYjidnz++9qNaeuPlmCddObS3dDAEYrLw7MIAjsQXxL9C7NLMZL1bmdq+pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g4FRAk0/FEwk4eg9To193DUlgkMmDBmcuaWcl3lkkcLE84YCI
	mm09bXLlkRqdJxJWXyI9cGxo+NcC0aksTo8vuKQAcY4oOf5nHUNfbx5+1Oe2HMFsmPA=
X-Gm-Gg: AZFdTZcTQSGZxR+TMrA+sJTkKFY+u4aIvbnBi1vxM8agF0+IJB6j/qW21sG0bvz36iX
	hA6lrJkTrLqH6mgfMkI49Y4HyadUZBRs8zk2s+Xpthh5WDaxPPaDawJrOiHSibPzuNLdAUiuAWq
	u7PkRh5cwbUfvFaBc5Z/awce67u6kcRzNBbE14MxKGE87oZbeTPsi0aH74/8euPGytCrzWBJYn5
	Ja30Eiblz3f+qF0+J5nH6QxItuG6I73FH3UKL7eVPdayhtHlewhWhepaeGvXwRgD8M4KOec8ZhP
	Pgnx2RtDTrySC+alPrOY/boOqjLC6qwqHUL9fYpi/iv98ZTMzbABqAROlnZX3FUHuGeKRqdKuLW
	ZcmSKHt82Xe5B1+N4Ca0sLlySDljZd9swQA4xijGLBT7tAl5BAFzrO5KCNWIAPVPuO0hmnq/3jP
	9fdi3LAbex+y7qCoxxSlG+/J4SttD64h9aHAcutMrc6wOf/+BqhxQOTV+ZxfwNwmayr7EH1kCYN
	oJ8aIKmQZ/0cYNH5rNDxxFn9aXiUe75SM0W+BHmbtYQKS62HX59+mOF25G3NZOiV13XPZenWrYR
	zvs3sqjjn3koHfBKmMInlVJEKvsbldTsA6VOeAW5UzZL0p86jaQ3mkrWfA1S1kLxo3BT63N/RCx
	MPI+NgWEub1CdcQ0xckw=
X-Received: by 2002:a05:600c:4753:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4bb8880c73emr448397385e9.21.1795707102651;
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm678687845e9.14.2026.11.26.07.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 15:31:41 +0000
Message-Id: <DN591I26AVUH.11MO49ZCF9V8U@linaro.org>
Cc: <bzolnier@gmail.com>, <krzk@kernel.org>, <rafael@kernel.org>,
 <daniel.lezcano@kernel.org>, <lukasz.luba@arm.com>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Christian Loehle" <christian.loehle@arm.com>,
 <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
In-Reply-To: <2162b02c-642a-446c-973e-ca80607da294@arm.com>

On Thu Nov 26, 2026 at 10:50 AM GMT, Christian Loehle wrote:
> On 11/26/26 09:16, Alexey Klimov wrote:
>> Hi Christian, Tudor,
>>=20
>> On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com=
> wrote:
>>>
>>> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writ=
es
>>> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clo=
cks
>>> independently of its interrupt mask. Setting it to 0 C limits all three
>>> clusters to about 200 MHz while cpufreq reports the requested frequenci=
es.
>>> This was found through trial and error while tracking EAS regressions.
>>=20
>> Cpufreq reports the requested frequencies =E2=80=94 are these cached val=
ues
>> being reported?
>> Or is this what the kernel gets via the ACPM call?
>
> Requested frequencies are reported. The 200MHz I only deduced from PMU co=
unters.
>
>>=20
>>> Program slot 7 from the lowest active hot trip so hardware throttling c=
an
>>> precede the critical trip's system shutdown. Cache the low/high window =
and
>>> update the hot limit from set_trip_temp(), because the thermal core ski=
ps
>>> set_trips() when that window is unchanged.
>>=20
>> FWIW, Exynos850 control register for TMU has bits to enabled/disable
>> such behaviour (and it probably works).
>> Maybe gs101 also has it.
>> But it seems that cpufreq scaling feature itself is explicitly enabled.
>
> Thanks for the hint Alexey!
> THERM_TRIP_EN is bit12 on Exynos850, clearing that on gs101 still stays o=
n 200MHz
> for me. The downstream driver doesn't define it either.
> Clearing bit16, i.e. 0x09003 instead of 0x19003 does indeed remove the th=
rottling
> even with all zeroes in slot7.
> I would probably still go with $SUBJECT, as I'd say the risk of this havi=
ng unwanted
> side effects is lower IMHO, but I'm also happy with either.

Sure, no objections about the patch here!

I just thought that for exynos850 we might need to initialise it manually
since we rely there less on ACPM and what bootloader leaves for kernel.

Thanks for checking.

Best regards,
Alexey

