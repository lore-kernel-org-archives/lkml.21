Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795819823;
	b=I6uGd3i90zvCw2580GzvCkXDpBDNUQfqBt49MV8T3Xus9TiLItt/Xqma6ghRl6A43Ib8
	 ae9xzr29rDn7hQQnPHeqTLdIFSI4aQCh/TVO6lNW+ADj00iQeHKLSXA8VRf6CAO8UIMf6
	 f3SGH6B0vD4FEORlerCPAm5d/evpIxI82O4JW7eIZTbCDnBztihxzWGhH3ZXrfY7OjqFc
	 lYdweYI6etwavhsDcdH5ootrsou82rT/ZRAJgWLveYkt46slFDa4/QpR/j8SN1pSZID5g
	 DePYKwfqW3TLRUFGnJfqJAn3rcjfnEjhQDj+ylsdTzfdkBoySyPuOfVSX3tjpnEI6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0l8qqjtOziyJwit4swyMU9bfxtwcM4a/ovbhjB6NANU=;
	b=UpDG9e5OlsatwECv1FuiybvP1WKrQxBtzXorp0BB73NXkjg2gHZtMY6b3M63RxP/62Je
	 doer0+b4L1YMgTBVZjqMpIuAprFwTuyBS8w3avR53sKJKXfndhilm3QWUnjvKjE9SCZUC
	 tlr2FpfcygS88OOrimWaz+5ZjpUjTXj/DTqK1R8xI6iwXri6QUCtgTb4KJYFWknWQlPvi
	 vhEfAHiQLF8YEDdC5UQ3IIzLz1QOnqRhira+gvMEsaRCIkF1N6cHtQn4fTc0sksuXV4HG
	 th+4M/almqd+4YJ670Syw9f3/08S6MHygD/PAiNEghffHqJ+cQIu1goSgf1aNDZeWfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtauI3Ij;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F21606A6A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F21606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtauI3Ij
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso7319284a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795819822; x=1796424622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l8qqjtOziyJwit4swyMU9bfxtwcM4a/ovbhjB6NANU=;
        b=LtauI3Ij99Gvp8E7Nq31Tqln3MaMO0s0fnog5HzAqdU8gH/ObM9udpjiXHvDvdTg4M
         4WQilnT06KX+vvznWkdnszLFIAMUuEtS/r5ZZbQ8rfBd8gBI280DsIOjxUY+06oXSuy/
         itjwEgKXU69GvJe5m58OqRv5Q191D7VVR86q3vmx3kQ6vyq9sjOk3qf4cpgQy4sDAgI3
         fZhrgEU5zMBIOkt94PFOEwW33FaFTin/2GomVjFRMK00dy2T4pR7Z4lp1/7EsW9vcRDb
         heluF/IfGPxa0FMX+nY/pfdZmQacA78Z+8Xh+5cCHpujchH/+AhqT+B0WKSgvMoy5xMa
         Pk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819822; x=1796424622;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0l8qqjtOziyJwit4swyMU9bfxtwcM4a/ovbhjB6NANU=;
        b=MpinXLI8nwTej8c+4hRSIee57Seqx6AkDvK37PK7V4bPx7tCn9y8mZp0ToN/yUcRTw
         G6JH8/kedKk69vuz9VkqtEDFT1iBxuTwrWKRV+cLrCWTaYpZWe2yj1lEKWb10oL4NUqu
         PPyODzyny2H7zduBHq7HAUHuV16LYGWREYzB45VeuQ0XkbajRW46U0sJU5fteULda+Lm
         0LFowQbzvnZbqiFq5ZZd4Lgi+4wX0671EV887GTehS09NEkgqKgC/hXcqhghbC966FH2
         utDKBZinot+gApKMcAOzGaJ1tSpa2xPy5efbVloe2F1WZoh5bxQDnNnGj9hBUAyANTem
         6WZQ==
X-Gm-Message-State: APuU4Z921nLSl2uSGVMIRHayWP1u2IyOldQNScRkfU+z1bbW76xS0Me9
	PYMlFf9knosZDWfghXZomy/XlBuvZActc2X/cKC/J94Q9q7w1x5MJ+7Q
X-Gm-Gg: AZFdTZcypt+V8KUu9xRcwfpSzPwfaNFChjZfSeoOImHmtR1mvmDP/4ywGSaUPH9cwND
	ICx61WnbrCRLwTnwY448UXJUyrek2Ho9vMcsfZXvDXVlxUptBNsCI+xpv21TYcUdcbNRjWWR6si
	J2Dc29t48F4CDbfrjh2kDr6t3uk/h+yOfZgFpL9VJSdKsgkaM3pOt7g+pH/VjQHmcKDp2jgL3Mk
	iHpunx56pixxQOMwSTo1q4Mu9qsb+UnPClxSjSp+qStFLJgZnnp7nrc5JS3/sTiSIR/TWo3KXiQ
	/SFZa4tRkSrIvJj11PaI+AX5FGKy1PL3R4x11CXOlffLxQj8H5a3hhrb8Urmdi2idgajKOjb8cL
	G/ODvSFaLYAp/C9zvTPha6/KShg9JBBOOah2vrTpx//Ke1HOypL+A43BF256goQ6efPx1uSKWzb
	WhRXL5TyAO/D8aqY7nDxPRXKvbq9o1xP++pK4cq+3n6/I/rxcP11+9TECs0IqIK4hfkJS8vArJP
	azgcsNBKGnl1BiE3EBUAqxb0t2R3IoKAPPGYljwz6u1Lqp1VYzolBqzdbC1XjAfP6WpR6s+Adyu
	IUYf4BoW0XELEOp6IOgES690UA45wmUEEmTffBhcJXptdcfP/zUF4FXk1KRtDPFzDo8=
X-Received: by 2002:a17:90b:3d4d:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b41c9082famr17405884a91.16.1795819822516;
        Fri, 27 Nov 2026 14:50:22 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm40282104a91.8.2026.11.27.14.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 14:50:19 -0800 (PST)
Message-ID: <95dba453-1ff4-4801-b800-337dac67704f@gmail.com>
Date: Sat, 28 Nov 2026 07:50:17 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v1 0/2] extcon: Rework initialization of i2c_device_id
Content-Language: ko
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <cover.1779100597.git.u.kleine-koenig@baylibre.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <cover.1779100597.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/18/2026 7:41 PM, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> I plan to do the following to the definition of i2c_device_id:
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 
> 	 struct i2c_device_id {
> 		char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
> 	+	union {
> 	+		/* Data private to the driver */
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 
> 	 /* pci_epf */
> 
> . This requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
> 
> The union added to struct i2c_device_id enables further cleanups like:
> 
> 	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
> 	index 0123ca8157a8..dfb0b07500a7 100644
> 	--- a/drivers/regulator/ad5398.c
> 	+++ b/drivers/regulator/ad5398.c
> 	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
> 	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
> 
> 	 static const struct i2c_device_id ad5398_id[] = {
> 	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
> 	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
> 	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
> 	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
> 	 	{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
> 	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
> 	 	struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
> 	 	struct regulator_config config = { };
> 	 	struct ad5398_chip_info *chip;
> 	-	const struct ad5398_current_data_format *df =
> 	-	                (struct ad5398_current_data_format *)id->driver_data;
> 	+	const struct ad5398_current_data_format *df = id->driver_data;
> 
> 	 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> 	 	if (!chip)
> 
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that. (I didn't find a extcon driver that benefits, so
> this is "only" a regulator driver example.)
> 
> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.
> 
> The first patch simplifies one extcon driver to not use .driver_data,
> the second converts all extcon drivers to initialize i2c_device_ids
> using named initializers.
> 
> Best regards
> Uwe
> 
> [1] https://cheri-alliance.org/discover-cheri/
>     https://lwn.net/Articles/1037974/
> 
> Uwe Kleine-König (The Capable Hub) (2):
>   extcon: rt8973: Drop unused driver data
>   extcon: Use named initializers for arrays of i2c_device_data
> 
>  drivers/extcon/extcon-fsa9480.c    | 4 ++--
>  drivers/extcon/extcon-lc824206xa.c | 2 +-
>  drivers/extcon/extcon-max14526.c   | 2 +-
>  drivers/extcon/extcon-ptn5150.c    | 2 +-
>  drivers/extcon/extcon-rt8973a.c    | 2 +-
>  drivers/extcon/extcon-rt8973a.h    | 4 ----
>  drivers/extcon/extcon-sm5502.c     | 6 +++---
>  7 files changed, 9 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

Applied them. Thanks. 

Sorry for long late review.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
