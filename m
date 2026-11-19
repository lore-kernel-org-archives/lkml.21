Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795074028;
	b=AiNah/qf4H6z7NmqAdR6d1gt8ZByA9VlsALwTJWj57PMI8wZGc11ywU6cPzskhRQkIba
	 88vFbBuU4j/VKSBb/Em+0h6xrirxK8/4VZRFLqoaDa+5KFt6nL3TM//IX6wwTEvnKz+5I
	 akxIWA/FyjZHi8+Z3vE/YTaYcI9uPna3jelsUIuMnSaxHQ9HrQ/flFKLCrosZpKASx6Ww
	 HNtxu/CGfAt8m8UIJtiD55hrDVz09Gpw26S+nUMXII+bkJij0BpQn4G1iHlYJJ47XBAZl
	 X/wbB0/d27MauPShtQLK6wUFfrWWHHWTsmA9Gb5z4T9g7s1RIjlWSJ7N7E7Xxgg4ogw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
	b=hUI1YnejRSyN9S/fC6fPbBks4++PTPKTQfEPcU9IqVyEZx92pC6QQVOXyXf3C/baeVmO
	 vtz75e5WTVHOICJ/AJUwEWKPXEksd1PO9bItqSx7eddka6ksSbnWG3dZDyKf1/YcBtDCW
	 7WEZTBzlb2aaIbrWInyMxu2jDu2jMVHLPoXDp6lG5y4SC9BKWLj02uLsN9xAYFrZwIHDz
	 1C4VAGi+IJ6YAWapQhqEtgeYtSIEVZ0luCJv0wQ+541AJAna5V++7vMCHVG2GHfRqMxRw
	 mC3VNTrsHusXK83U+3qKIDN5tWFL733b9biRKF/bzbdmBmXelFqTDXRy3eVhJTzP79w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K75r+Wgr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD0606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CD0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K75r+Wgr
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5126505cb3so96514566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:40:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795074026; cv=none;
        d=google.com; s=arc-20260327;
        b=JwD4TSL33oN1IdeCFpMfC9mudpjOp+DkTbmrFgN0kXcharsWX0Ejm/NAA1nsCgHBaI
         V69vgkxW9Uk7QCevpIbYs0SZwakLDAyoeqaQhjTbgkTr/1lDpmv4Gb5wLaMv0sgzdZXG
         pXIKOP7IIZRUsFig0CSCqT1d/YKbhI+AvpNOpkjN7JhfkHfF5FqIQzcmouEqbK8m25kk
         iFOduRxRI1v3Lra321CVGGPBrpe47L12m7WBIwCsDro3POMEe44DDao0VN8lCcj9nyi2
         lSi248yXePGBz1RL18/HV/totA70cJ0Dvp/B8RzqvSlel/0G5pbOtq+U93EiIDLzGant
         DWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        fh=UDzeQji2sj2fZoG9iwitPS683XGse7+F0bo75v3M/Ts=;
        b=VtSPt7FZquBpkctWCwV0lhUfEbqedWxpEOY3WD2BHxtdqKAebetgCz9r/gXRiUb+LU
         9vxfrHLDaP3kZZOm58VGmk9KeXGdeo/7HJtifg9kV1RaHAH/yEUZHM8z1zSNO7T3nkrp
         /hRSXeNLz6bJSrky8329I4EY9bfaV8iSst+jGkvaCXcnkcd6naIZsdHMTLAnMKnKg+2Q
         TIXPRp5UN5AaFXXiqTX4HbVDBMrzTYA237dLXp1r0on4R8aoaqj49JD6/glApwNJNXU2
         MPhzYLmoE+0TW54INfjIT1oGWnKE8RQpzTTGe5Y4s/yO7w1UyNIMasvJanGTWBTlAIgh
         kUqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074026; x=1795678826; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        b=K75r+WgrFRi9FKJa5DFoKKOB+ps5b/uOFQNkdPhgkbGRCFeYaA9JGGFwjHL62WyZJe
         D74D8zfGH0AMCg/IhfzqNEoliOhQZXrIcAP1Uj6W4drdMxM9t48qGwseMsQDuVvPynAp
         CCH9THwXSMUS7bEdOZeKa2E3XoU465vcr3R6IxaI9hGlTW6TjUiO+hfOT7w1RyLw28Hi
         Z0GbYQptwa9mENNXDWHttEbmvTaKdI89u0GDF0+ms4Ou/gerqX+4GYeIxy+RVS3IScfa
         91F4cLNX8+3visvDAXCw8yefKEqXcCCjWfih0BMfvhTFwQrDPXM0CW1jW1kZb9IeXvPE
         BQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074026; x=1795678826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        b=AcqVxLeN0xf5alBA7Nv65Vmr3D7WUWA+563UODx18wIOg1XZid08p88p723pkevxA7
         yvLDQHzBEGIE7spvaaFpqJ5RkXj1PRqbMqdGgTxiCAhGLB+S7WW47/hYc6fx85ROxg8m
         gWkv0BAXL9pZtiwU/wx9rwjWVz3p4VSsjSzJpGBwRBehvvBRaQjKMmA6V3V/jFb00hIX
         milnqaU8dGu29qPVOgVZvPd9txESKx2vI1Rg7RhiNGNUbB2Ci4GfuVx63lCL/aGIsmge
         nbXyYMqzAqrroOxIykVpi1zD8YNmLRoS5to6jiQN1dIQ0A67Y9FC+ImkUi72Vn4ltC+W
         KRcw==
X-Forwarded-Encrypted: i=1; AL+hErH3VHtqkzM0F6qLYyVd9HpVAyVlCovuQIORJuE+kU+VCVXB6iLJfrrY22pZexgxhr8De4he5H1tluT6/C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P+pNSp02WOJYdGeVCCOyKzXvSR0yA81z+0dHFPEd2P6rzQJuV
	L2QFsDgB7LnZEOyET95ORM6zNol8VwS8P2nHbrkxlM9xUCXTN8GHm5ld4PZIy91QuZofjfagqUo
	uKslEg6c+kXqnB0PNdC1Yn72OwbDrXg4=
X-Gm-Gg: AYBFou1np/cGodbH8wx6V6AuxCcsmxLtsWGlhu95Iped7MD5rx/+VM1WAeXJDT7+5N/
	JGWN3BIFTzatUL865A0wBic/amnrDb/Te4c8ZFCfcC3vklzJYjbTbXo+8gSlnDJdDCi5tK5yltd
	CZbeEW3HZ0Q7ANEBM5aVSm8g/z/hs4wC3oaMzZ4u0h9vZiuyFUiCRShB6sKWvxWUHd7dvofIN04
	iP/B/kNepGvHaw7O57RahpsEhF9OVMIlOvF2DSqa0Gbc81+ViYBckQKzQTstNt5rVoGABw9Y/K1
	NP3y7gMQYCYacET5GSnHjwqrXj4p/Wat27y0v0fzONyuBmryrrsNTxYlbz5xMeLOagJC9t8eS/D
	zNE6OEe226A947XjPseOrkTE7NzMafpWPYcMNAA==
X-Received: by 2002:a17:906:9c95:b0:c49:c76f:dad4 with SMTP id
 a640c23a62f3a-c510e31c90bmr479980066b.31.1795074026314; Wed, 18 Nov 2026
 23:40:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com> <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
In-Reply-To: <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 08:40:14 +0100
X-Gm-Features: AclHuK8v7dApGOktlI0-huzqV5dz05Lcptx7NLQKfF_k22DUFv5_-2WqsvDZTRU
Message-ID: <CAAOJLPFw1f2v14wtJYt9yqJsTiqJNmkm=dOaAHQ+qeH70NgsiA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add Raspberry Pi DA9091 PMIC driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >   drivers/hwmon/Kconfig                      |  11 +
> >   drivers/hwmon/Makefile                     |   1 +
> >   drivers/hwmon/raspberrypi-da9091.c         | 339 +++++++++++++++++++++++++++++
>
> This needs to be documented.

Please clarify?

> > +     data->hwmon_dev =
> > +             devm_hwmon_device_register_with_info(dev,
> > +                                                  "da9091", data, &rpi_pmic_chip_info, NULL);
> > +     if (IS_ERR(data->hwmon_dev))
> > +             return PTR_ERR(data->hwmon_dev);
> > +
> > +     platform_set_drvdata(pdev, data);
>
> I do not see where this is used.
It is retrieved in rpi_pmic_read and given to rpi_pmic_update to write
the values to and to put the last_updated variable in

Kind regards
Sander Speetjens
