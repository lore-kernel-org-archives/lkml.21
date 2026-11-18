Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013020;
	b=2+FW9i7qEP6NNsLK2CIE3aHB0kRMWTYNFkF33KjY/rtAgB6GTIlNhEfGIp+eIlG+NQ8a
	 6sk2Ozgjo8Pe1oojIFq57bqif/dd8YgHrG2GbyZvWddDRtwE+HBdMETdm69GLkNLmJzGf
	 5AdsGViMwSrYJdwQ77cDsegcsN/aCb+1LwekHs1ydnoBpxPbZu+Kq4aDky4yNUJ3BqekK
	 BToxTk2zIX60myUXqLSsgrbdPAMKSXE1g9dQveFMp00mCptirMpXzy+AHz0JyYgk07gca
	 cujaBK7Zxq9Z8uLJc8ZEb76cob8NTuD3b0VVj881zHnSjq27jkynKXlAi/xpmSoK/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
	b=RM+5R5hpJZikRIpwkC644MEK5snWvAFUNzysUeXCPXVwdeKBfUSjSo5kdVhPpFCOWWoC
	 W7bt8EHT07sghqZOY60/5WVoP7w/adQIjV7epczP4Td4G87AuNfbYyau78yFF07SKvlIY
	 zm6yF+NOUMdQ4CphkKAJnRSv+3ob86EsNT36HTD6jqBmy2lTRlkxaf46qAnXe+b+L74De
	 2znmy+Gwfbpe3p74W0ebX79YqAWmM4ifgeloQNPLSzibujUiUCfc+2YaHKrxVEW2D/0bJ
	 IyAcmKWos1h0KJ+hFZsRO/O1uDl9rqIn5VyyGC4O7bsztqC8ywSSX0O8TpOoAVA7mrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dwmBcbth;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD14606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD14606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dwmBcbth
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so10015795e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013017; x=1795617817; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=dwmBcbthvsOhg0BMX/WUPjZxJfLOtywE+LnL/i36T6xenrhO4k/DBOfdcAzV42w5Hw
         g6WrY964j8f8iJU3SPok0C/1aq2y9kAYI23N0YBDuRF74H/2nt5R43dk4KAGNkYJs1jE
         fdFL4jE8D/LMoJYVFcrtDI3gfMtZDRviRFxD4mGfWCQQUFWG1cHSjRa3YY4gKpCuhCbN
         axHcHFGJCac3wLUTg+Rj6x5Qp5Xel5RKPALHaO7dHDTa5J31LOYnwSRnlZbZMMyCEZID
         TvFUUO5DCJMLUjmwi43B58XiEMJYdkmTGuqy1unsmbByIT3TWGMAgDwFJxhnZGjZ9GLo
         ivgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013017; x=1795617817;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=S/8WtL/T+hNvYWytTUtqm+yEnRjqJv28+BOf1k0eJiO5h0lMNbnaePFWYm/n9fGjRB
         cwftPPAP4xC3F3uRRn6ai5zz1WItcXWkSkqgaldb1qbl0oyVsjHjlXgPxsYrCU/xef8s
         lnW0OLHU+kXZfE31zGtfGRGGfwuCBH7eQP//xqwc3BBpx2hvtxpanuqE1kMzuShStA+p
         XhtCSCuSda37wSt+sUTF/uBo4OR2Kew2Y2OntO39KEiRsU3Fng9ppiQI90FQyw5gutGA
         7uAtR0JJtEt/+U9emxajnS/FNbNU7H022XlCAGeqshNIXn3285sY2XQSndNfd3QFIFnC
         xSBA==
X-Forwarded-Encrypted: i=1; AL+hErGroxzInYFUcuna77jM9Gh+oZ/1iw/fmzLtcLKiDd2sRmn/zPHSwpRzS2aJ7m98VhKkfy8VGmhpyUH3XyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EZMy3IBxSPB58C4iOAsXiS8iyknz3w9jv0HXgJyqvn41chBFp
	WSSKIKUo9OEKV3GbI+lapNyALELTQOGYSOYsHN8QcWodsYeAMhLUhJWblO+sHpbvJcE=
X-Gm-Gg: AYBFou3mO35BFoVpmvepN4C6XvbVFLABqBTZdMayHjoQ+DVsQBT6qekQde67K1Vb0MP
	eONEy2Xpxz7wUXWy6CIaixrYXtu0/lYHlO5cyUvrxlvDSiGXdZ/QEirlDhmq1njHHeu/PXjeUns
	tOFl8eGVWiLBsy5mmju76X+IevbJk/1wIiqfQSji3dT4XBSvFM+VnBw4nihZb4fKVaq+drIkdic
	I3353vpylBAFejwILU+5xsWIZeJcLXe8trj2DMhhMOSr/liHITjKrhi0Rn04PTKqdkUqhklr3kP
	r+MvZ8nZQHALGgYg8vlva5p13h4BpVr614K5T1LXuQHYp+nY8iCwIHYjRhJ50nqf+nGI4errmv1
	ZALxBVoDa5i8LD0ONiKmV7ric23+ESXKDH3rJf7gIP+N4T3PImx+33eKI9PxMB8Jmuuh/eGjmwG
	4JkdwfguYyEMDAobLoJb3uaou0wgPuPvScQLtKZjuwBFCfg3I723t5hcVUxHgE7PQL2StYD3d1v
	GuqiLq8Iivv6JC6RcIzldDR06qLNN7UshtXnrvC8ADlLUYMlvXMw9dy1WeGTN1VySg0G1VfVbpD
	HYi25FYybJ+mQ+dp4SOCCW3C1QLB/lEFFa2AQzL/auOvsgU4FkoXgMDfqtGGhBGOSvwpNg==
X-Received: by 2002:a05:600c:81c5:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb7da38bd0mr52621935e9.24.1795013017611;
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e5919c5sm29710375e9.3.2026.11.18.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
In-Reply-To: <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
 <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
 <20261014104801.GI199624@google.com>
 <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 18 Nov 2026 15:43:36 +0100
Message-ID: <1jh5he2o9z.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 14 oct. 2026 at 14:21, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On mer. 14 oct. 2026 at 11:48, Lee Jones <lee@kernel.org> wrote:
>
>> Note:
>>
>> --- checkpatch.pl (3 issues) ---
>> Line 2: WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>> Line 3: ERROR: Invalid commit separator - some tools may have problems applying this
>> ----------------------------------
>
> I've checked before sending and checked again now, I don't have those
> warning. I don't see anything long on line 2 or a separator near line 3.
>
> Any specific way I should run the tool reproduce the problem if there is
> one ?
>
>>
>> On Thu, 24 Sep 2026, Jerome Brunet wrote:
>>
>>> On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:
>>> 
>>> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
>>> >
>>> >> Apparently this device never really supported i2c instantiation via
>>> >> sysfs, because the driver does not even look at the i2c device data,
>>> >> which are not set. It would only probe if the device matched through DT.
>>> >> 
>>> >> Fix that for correctness, even-though it is probably useless.
>>> >> Add the missing AXP323 while at it.
>>> >> 
>>> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> >> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>>> >> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>>> >> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> >> ---
>>> >>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>>> >>  drivers/mfd/axp20x-rsb.c   |  1 +
>>> >>  drivers/mfd/axp20x.c       |  1 -
>>> >>  include/linux/mfd/axp20x.h |  3 +--
>>> >>  4 files changed, 15 insertions(+), 14 deletions(-)
>>> >> 
>>> >> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>>> >> index 5c93136f977e..a76bec5604c4 100644
>>> >> --- a/drivers/mfd/axp20x-i2c.c
>>> >> +++ b/drivers/mfd/axp20x-i2c.c
>>> >> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>>> >>  	axp20x->irq = i2c->irq;
>>> >>  	dev_set_drvdata(axp20x->dev, axp20x);
>>> >>  
>>> >> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>>> >
>]>> > device_get_match_data() is bus agnostic and should still work from the
>>> > core driver.  What's the purpose of splitting it out and adding
>>> > additional call-sites?
>>> 
>>> device_get_match_data() works when the data comes through that path,
>>> which is generally the case.
>>> 
>>> i2c_get_match_data() calls device_get_match_data() then fallback to the
>>> i2c_device_ids. It covers the instanciation from sysfs mainly, not
>>> something usual.
>>> 
>>> As explained in the description, this changes plugs a hole identified by
>>> sashiko that technically exists but I highly doubt anyone will
>>> instanciate the PMIC through that interface. Those things do not really
>>> come as breakout boards ... That being said, it is cheap to fix.
>>
>> I'm confused.
>>
>> We already call device_get_match_data() in axp20x_match_device().
>
> Not anymore with this change. It is the point.
>
>>
>> So if you populate .driver_data in axp20x_i2c_id[], you should be
>> able to drop these changes altogether, no?
>
> device_get_match_data() only goes through the DT tables.
> Not the i2c_driver.id_table which is purpose here.
>
> My understanding is that if you instanciate the device
> through sysfs (which nobody does for these devices) and you only call
> device_get_match_data(), you will get NULL because there is no fwnode
> associated with the device, which in this case silently translate to
> AXP152_ID.
>
> device_get_match_data() does not go through the i2c_driver.id_table.
> Only the i2c code does, with i2c_get_match_data() and after trying with
> device_get_match_data() internally, which is exactly what we want.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v7.3-rc7#n121
>
> As noted earlier, this a problem reported by sashiko that is real but
> extremely unlikely to show up in real world. I'd happy to drop
> the change if you don't want it. It is not need to support the axp318.
>

Hi Lee,

How could progress on this ? I genuinely do not understand the problem.
This change is fixing a sashiko reported issue, in the appropriate
manner I think. device_get_match_data() just does not care for i2c
.id_table so i2c_get_match_data() is needed.

At the same time, what we really care for to progress on the Allwinner
a733 HW support is the rest of the series. So if this bothers you,
I'm happy to re-submit without this fix. Please let me know.

Cheers
Jerome
