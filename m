Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108140;
	b=XwYERKiYjfNYTOtl7dpSgAVtAsBkTe76WLlrrmCtnkYYTPOZ6NN18lzQQ9jbMQMv1BgZ
	 rX1UM2/jpKQP2UvogWEcijKmyOOJsMmEu8XIetMYY5fWeTwEz5qvKBC7szxiXbpPLaT8q
	 EoZQjQRx/iZABrTSm+u6tc+xf44dcOckG6gA1AwPyI/bF/PVrTxpbtN3I597wLWv1pinT
	 c+L/YPyK1H0Y5VYoLTaUf2PfA/kqYG118sr+5xphHeCoqL9a734usTREjS28iCzadaqjP
	 XD/p/f+9FRI1a3ZZvl2QtHg9QJ3xtEoi2Oxk8r5f2zzNDQ8tahGvhxVovrPVu9jyOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108140;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=sSp9BDWg5ZWFhbGy2avp73yaoxaLBJeVqHeVZVAC8aY=;
	b=djg9q29A+jPbmOlG74aaHO4b6nLcw6+nlzMDvewwW0fV4D5A10whiY+TsUKa4IFCcRW1
	 49pLwMtZlyq5ZatX8kIHxt7HTxl1DPBR5ETide3/79JHSSKa8ArTGHVffWivMQvxLwEIS
	 HISdPGo6q8a5+K23DbkNB+LE6NGFbLJrPGnrvKyQiBt5J0kUht1FdFfsU8lWT/+TeYSSs
	 060SgxYH0xDHplpqgDBd84TJQBIrIj3XoH5ei4q6YPHOiUDwoJGfkDmYemysmkTV3e8VN
	 37/9nqQjZDNIfniFWgu5smIYRdMk/jE6xq33RamDgoiiIlNdss/9dep6CirjUbQsKEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=srs.galae.net;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fHGme+Fe;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837D606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4837D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.galae.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fHGme+Fe
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AA322C2F4C7;
	Thu, 19 Nov 2026 17:09:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 331455FF9A;
	Thu, 19 Nov 2026 17:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36FBD11BC0CE4;
	Thu, 19 Nov 2026 18:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795108136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sSp9BDWg5ZWFhbGy2avp73yaoxaLBJeVqHeVZVAC8aY=;
	b=fHGme+FeT4WFj4gL/EBFNAceg+tovjWRrktsMkMdUypxK7Y5Q7hWo94Gbp/y7F378ps56J
	ueaxPgw4CQl+CyVEdpn/jzVPVGrQDD0Sfj5UgkA1K+bRMGhqlkeqNCSrxYTi857zRooHuP
	XyiA/Xw5HQqLUOEUnBMJ+ejOdJ4PYnG9VO+wwj1sAGNIN+VG4imd5KOOKevT4weNepw3ql
	a0aDhOPA1s5cs+S60sZJfEjglMMoKFAHgFuGsTRzf2u22mAAmUSsBAkOzY7Ahb3mr8l3AL
	3yatl9n6UFeUv1dVFv2YythyMCmYdxO0Uk5b7UZW8DWZ+sgSjJDjLuXJZToebA==
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
Date: Thu, 19 Nov 2026 18:08:49 +0100
Message-Id: <DMZCQ276BVDA.2K9ZE12X5VF97@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Hermes Wu"
 <hermes.wu@ite.com.tw>, "Allen Chen" <allen.chen@ite.com.tw>, "Pin-yen Lin"
 <treapking@chromium.org>, "Chen-Yu Tsai" <wenst@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
To: "Daniel Golle" <daniel@makrotopia.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 06/14] drm/bridge: it6505: bail out of the IRQ
 handler when status reads fail
X-Mailer: aerc 0.22.0
References: <cover.1790552614.git.daniel@makrotopia.org>
 <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org> <179251509977.78870.3399297204284524303.b4-review@b4> <179481904177.211952.7029866729856302771@makrotopia.org>
In-Reply-To: <179481904177.211952.7029866729856302771@makrotopia.org>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 16, 2026 at 9:55 AM CET, Daniel Golle wrote:
> Hi Luca,
>
> On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
>> One first question it whether a read failure is realistic or not, and
>> whether you have experienced it on real hardware.
>
> I have not hit it on hardware. It takes a failing i2c transfer, e.g.
> the chip NACKing while held in reset, which can be provoked through
> the force_power_on_off debugfs knob: it6505_poweroff() only calls
> disable_irq_nosync(), so a running handler keeps reading from a chip
> that is being put into reset.
>
> And hostesly, my interest here is basically getting audio going on
> that Lenovo Ideapad, and for that
>
> https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/
>
> is sufficient. The 12 other patches are what Sahsiko has been chasing
> me into, and all the complains it had looked valid and legitimate, so
> I took on writing the fixes for that as well.

Ah, well, I understand.

I had missed the initial history of this series, thanks for the recap!

>> I would consider replacing all the 3 it6505_read() calls with a single
>> regmap_bulk_read(), making error management cleaner.
>>
>> What do you think about this option?
>>
>> Perhaps the three it6505_write() below could also become a bulk write.
>
> Makes sense, INT_STATUS_01..03 are contiguous and the driver already
> uses multi-byte transfers elsewhere. I'll switch to a bulk read and
> write in v9.

Good, thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
