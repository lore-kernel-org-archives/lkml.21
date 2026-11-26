Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708235;
	b=ugsSoirLR0gAVIWdIWXXGv8myRfaixJH5yDTWHEYzaKyuvU0QT4YN4XgayAcFUpOf7US
	 sLGRH4pCZpMmMIgo7V5jO78bb5MoNTEy9KejKdoo2ab17MSKivdQSHQ3zP+wtwlQ6evp1
	 f6mbgXWsNqheTdYmKI5Li2FKcgE0WlvHsddzCWhA85TqVBg2AfFEEHqGIRZaaeT3RiYLW
	 VKwdUTElKffbJ5toq7WYNojQcNV89GZlTZhMGNWckbnEgKRV+pAo92R1g9rOCe1vMuAq8
	 mX0527ggBE8H68k/2k3wNailt9GKztwRwlOJU/0N4MqwuynuoBVwUVrSLLAK9WvJRsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=L9tdjEIQaLeIKemcpORMMBN56iw/fTBfPHbyjb2Sajo=;
	b=fwGTDSUQxiKM2mKuI7SWMwikNR1CkgJoX9EMBiH3Z0JQCV8EXXF+qY9PmkAalOM5P7WX
	 R2Vh8ZrvOwH0ZOBiF+VYDzWOocrtDhnZEsHveLOnQbR7QVz1rWzYrX/1r557LMo1KKq4V
	 iH8zJg7TRZf75ZMiB8U9NCtIKokkUu74V9Io+9mxpnTpoDsSjWbxut2v6OBLeNOzd9f6X
	 JqBGrxIuBBahRuzY5AWPo++je9xDPOyQwRwjTt78MHtaAvyaWVwRIVggMsdW+nab4sHzT
	 hrRykxO1nXjSY484QzCN6e4UGMWTE6w23peH2pdwFR0CD95m8SlEsmFJMK+uwa5mjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YGp/mk38";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354F606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E354F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YGp/mk38
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so3904855a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708234; x=1796313034; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L9tdjEIQaLeIKemcpORMMBN56iw/fTBfPHbyjb2Sajo=;
        b=YGp/mk38qAPaw0SvL6FqL7xSdNElF1Ibfb17AIROOW2BsIW9/leutwQZ15R9BgVTCl
         XIKt/xIj9OTTPyICRp5rO8ZhHIzAskdEV0CnslvD9GF0R6ebGVn+jr/R+ig9qOQ5MmSw
         nUpHS7jS/XG/5p2dmH2xSGjyYcjtl12xdmaAtJvOyXRlfEe0WCeNqC9utXXBR3dGeC5C
         HeBJLZG16dWpSdDG1SMD8rwRIXq2TjPnZuScagbx+INm6iMJDB7NAqw4y2kSqtbB/lxY
         0WFq3R8wnOyV5OypLwSEB9tXDz9oF7uj18XDuSg6/I3B2VVoF6n9aVJ9II5DA0SknFtT
         0C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708234; x=1796313034;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9tdjEIQaLeIKemcpORMMBN56iw/fTBfPHbyjb2Sajo=;
        b=munFJc4yzDtFxKUlI7I2+as1SFTkzuB9RvFAqjrqy5yAQRzIw+qWd/xmXArgHBOpr3
         dVwFrNoGxzhF073JFC/DQACNK3nLACkYZKLGwFUvTiFm9wMb3bIMGEzppW+pF4a4UXFw
         x6MoOsw1+Kfh0qO9YH2P8oB/F45XcLGg2hkdY6Ca/E8zcQDUrgXNcr5IGkypxQ31JPBG
         FmFAh1FNmpNiKGlkX485fwcJcu0ZGj7d98nFJOA9A/GeaLiJHkgie7kPn0zd04+kvrNc
         jpYX4PqQGtjFm6yiUPLWhi+QSikm7g9Aw1ypFXeyAyNRCTjR0IUtlpEg+MeFRt117LkB
         wtOQ==
X-Forwarded-Encrypted: i=1; AL+hErGyBLaT6DLYDV2Q78x0tHeK0u5tZWyKTp2OquYL1qKPWNMw7d9rfVUtZwGQAY7b//wim/vfEAhY1OGutvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4dhv/duFXJ4chzqDVeiUg2H5NgUENTkcfViD+YGrTJIlEwaBR
	pcKtRw4umaI0xWmbVrkriBzlIqx//RUT52dOFhXJULBFZLGGljE59Bw=
X-Gm-Gg: AZFdTZfBbgSdv+l0O5eBg8CGCkAN8+Gk9JC7056qmb2Tdt3lWYGTM571mtCrcP6223P
	AyN+29FA96TpmgYPBfryyCMHrDs075U8cSWFrY9uhX75vyCZpubBj5f+qzjEXci5hdjj3nrc3nQ
	/ua6Bh4v3E8Mqv9CHj8MHwTfD08GY2MssxnqGT7iz2syncd2YdAQipcDzO42cN88ZXwLA3u7tP5
	F0oiWK2SvzsmcpAc0vUxOS2KCjfkd2ALe/rmyjIeEU/sast0diRQ4rh2eKLug1WDVGPNtwXh1fv
	T4Z3KlVsvk1sm9/wqhpPYhDwHgIR64ZFCRcevGYDkt65QVGNGe7aGLtPwQt+jf/R/TfnUVTx6ap
	Wn/428GxZKFTnAxWkllCD5Jm8Ae2ALqC+RA9CQAXT5xemMswr0sy3kHDxG4Q3DEOHK/gUPB6CZk
	kXOOMbCJhF2mitEQNLutZOPYdLyq+0c1sVLw6PY8vWxFSDpvlZCLYhR9YC7ZAbG+4LxY0BM16GC
	u11T7ty+Fq29bdThMNxxF7zMSm6jJTv4XEOji/FFLBOLwFnnTajX6WmASbaICGDuEClGzmIanP1
	vKZuRfqz40DEeQyA1aBIisKuRTnjlRkkZewxyuGJwc/uabPQLu8iyJTLTgyA
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b41c95aec8mr19342674a91.46.1795708234058;
        Thu, 26 Nov 2026 07:50:34 -0800 (PST)
Received: from smtpclient.apple ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm32889076a91.3.2026.11.26.07.50.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:50:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] coresight: tpdm: Fix fwnode reference leak on probe
 failure
From: Yige Jiang <yigejiang86@gmail.com>
In-Reply-To: <e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org>
Date: Thu, 26 Nov 2026 23:50:19 +0800
Cc: Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C23139C6-D52F-4A67-A7BE-4CE55250B9E8@gmail.com>
References: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
 <e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org>
To: James Clark <james.clark@linaro.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi,
Thanks for pointing these out. I checked all the callers of =
coresight_get_platform_data() and found the same issue in _tnoc_probe() =
and tpda_probe(). I'll send a v2 with one patch each for TPDM, TNOC and =
TPDA.

I agree that relying on the order of operations in each probe function =
is fragile. We're developing a static analysis tool that tracks refcount =
across driver callbacks to help catch imbalances like this one. And I'm =
glad to hear Leo is reworking the locking and connection handling in =
CoreSight.

Thanks,
Yige

> On Nov 26, 2026, at 10:18=E2=80=AFPM, James Clark =
<james.clark@linaro.org> wrote:
>=20
>=20
>=20
> On 26/11/2026 13:29, Yige Jiang wrote:
>> coresight_get_platform_data() takes a reference on the fwnode of each
>> output connection's destination. These references are not devres
>> managed; the core drops them in coresight_release_platform_data(),
>=20
>=20
> Don't _tnoc_probe(), tpda_probe() and smb_register_sink() have the =
same problem? We should fix all of these at the same time if you'd like =
to send a V2 with a patch for each driver.
>=20
> It's quite fragile to have to call this in a certain order in every =
probe function though. Doesn't seem like it will survive further changes =
or refactoring for very long. Longer term, Leo is working on refactoring =
the locking and connections. Maybe can do something like make =
coresight_fixup_orphan_conns() re-read the firmware for unconnected =
ports and re-connect them, rather keeping these long lived references to =
fwnodes.
>=20
>> called by coresight_register() on failure and by =
coresight_unregister().
>> tpdm_probe() gets the platform data first and then returns directly
>> when the drvdata allocation, the MMIO mapping, the dataset setup or =
the
>> device name allocation fails, so these references are leaked. The =
nodes
>> come from the base DT, so this only leaves their refcounts unbalanced
>> unless they are dynamically allocated.
>> Get the platform data just before coresight_register(), after the =
other
>> steps that can fail, as the funnel, replicator and TMC drivers =
already
>> do. Nothing before that point uses it.
>> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
>> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
>> ---
>> Based on linux-next next-20261109 (630059a5a632).
>> Compile-tested: arm64, GCC 14.2.0, W=3D1, CONFIG_CORESIGHT=3Dm, =
CONFIG_CORESIGHT_TPDM=3Dm, CONFIG_COMPILE_TEST=3Dy; baseline and patched =
coresight-tpdm.o, no new warnings.
>> No hardware or runtime test was performed.
>> The paths need an allocation failure, an MMIO region already claimed, =
or a dataset setup failure in tpdm_probe() after the output connections =
were parsed.
>>  drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c =
b/drivers/hwtracing/coresight/coresight-tpdm.c
>> index 102b8b7edf87..07e19c1a94b6 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -1404,11 +1404,6 @@ static int tpdm_probe(struct device *dev, =
struct resource *res)
>>   struct coresight_desc desc =3D { 0 };
>>   int ret;
>>  - pdata =3D coresight_get_platform_data(dev);
>> - if (IS_ERR(pdata))
>> - return PTR_ERR(pdata);
>> - dev->platform_data =3D pdata;
>> -
>>   /* driver data*/
>>   drvdata =3D devm_kzalloc_obj(dev, *drvdata);
>>   if (!drvdata)
>> @@ -1444,6 +1439,12 @@ static int tpdm_probe(struct device *dev, =
struct resource *res)
>>   desc.name =3D coresight_alloc_device_name("tpdm", dev);
>>   if (!desc.name)
>>   return -ENOMEM;
>> +
>> + pdata =3D coresight_get_platform_data(dev);
>> + if (IS_ERR(pdata))
>> + return PTR_ERR(pdata);
>> + dev->platform_data =3D pdata;
>> +
>>   desc.type =3D CORESIGHT_DEV_TYPE_SOURCE;
>>   desc.subtype.source_subtype =3D CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>>   desc.ops =3D &tpdm_cs_ops;
>> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

