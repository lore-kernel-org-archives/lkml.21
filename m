Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122794;
	b=GC/Pso4/Y77wm7labyvzJK2Du0+y2GB1IyXRVu9e8sV3xpELoEHEI3x6QHunIdb+zczN
	 SK5RTTPzjoR619DWE2KHph0X5ZWOcxwStXxnxZYcmHtyJeBuq2sAvhjqFntb2xWw3LPDo
	 yyv2/AqQM24hTjTqVCdsjdCJLiDQMVD+yyLfBWeRWq6YN00N0kqieQdGkMlPKkTWrdvZG
	 QUNoMMpowvMhrMTvc8PgXtTSqSdAJqI0I4a5EIpP1n42T7jtEndeypscQ8woLE3rAOXLT
	 tXSH/0oNufws6BwcKnx+IbVzARvFai6TWXMQ0DxGIGelDRgeMrVRSYrosNPsjVIzN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1QolvcktJGBlYryC5TA1stRkYXSEm1zI0kjb3H9ZNhI=;
	b=iIgxCT0WFvWNaR+Tsgq+o8bZaeEQJyw6vsqq9vZxpphyZ88v5VsD+Ta12NgGctIrF2nr
	 JOn6trNa90h7UCxBGWOLDnYmZPArlM0VqdUTEcM5OV7Hc4t8+R1kd1u9z0YXaBL+yABne
	 GZgta59aWVWxh1hqbouEgsdkUG6xua1DQkXUEODDJQBPsNEdew/iakN02P1Jdv3B6GxPK
	 jSkZOPYOX68uDeuBo9rVYTofnR4/Q2wXhhGTKB324KY+LRXCPBEnzK5ND1b9VUcWmt5lP
	 zsGL6HU5yKVxdBXtnY9XiCsMxTEuatgtvU3jjG7ntg82YpVuiHxDaakVtdiBd5IvjOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dl5GeA+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B482606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B482606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dl5GeA+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso220852eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122794; x=1795727594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1QolvcktJGBlYryC5TA1stRkYXSEm1zI0kjb3H9ZNhI=;
        b=0dl5GeA+cuu98eSuEIfdB5v3gs+RER4Sz0Ip2hbbediS8SRXexbHcSDI+c7udg/BiN
         PkvXk2q1Xe6/Blxx0anGyQ7Vy+QA50JzBwM279PPaciCEmS7p1pqpVpJIl+GgPi6jtkP
         K7/tFf9ITvg4gpMgW/tMXw6+TRyDFZE2eavjWGya1JTEU9+wAQwRWVoNtw36VTgtk3Fn
         PR5uXmjYo/MrrnEXFlch0KoAnv7ozu5OxPVWVBK5Zc97A6Pp59otBuv27siSN3IGAYNj
         Dv74+sAK4mbHLHsEjk+wA3ACpL3HBJx6P9dfa+/NmXPel5duaXGaOmr5BvOrI3F7eoui
         Xr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122794; x=1795727594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QolvcktJGBlYryC5TA1stRkYXSEm1zI0kjb3H9ZNhI=;
        b=dcHWWLkjjgrmH2DDVgsT5y32/CBtq6Ss/PVZoySl4WiontEz13Q4V2NsAb6uwPWSTE
         37jGeZeBndwQUeER4kkCIjTavtYMopJZ3uYIgh1LV/vkjH4to4lfAEL+2P4AcDDwwkc8
         4lr+g3TY3VsfQHIPw73Wi8jD531vuRgXkuZ88mh/eR7XHxD4E5yOzUZm+AkKfgIwoyOS
         sC3l3o0CSeI87/xhOJvARgmFyPfnlhu1pzCucoBwNaYYFQ8yHVesQ1bBPTYaBBF/UKEY
         6bOGgWmGz+r+L3BFOxuM539cMn80V3SACNh/D2O1nm02bsrLlkYFxN+KijtOVktNyyNP
         hsnQ==
X-Forwarded-Encrypted: i=1; AL+hErFXlmqpWbWjXNG8KQ96PRgE60kDEV7B29ZfBNy+B7daUKsnNPk+m3M44TeAzXPbKTsjav/YDp7i1LYA/VA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+83gCVQs2/A+3aKRZZ27rxDXAy9fOuCW1620tRmEJKneYIbnZ7
	Eku6lDr0wdGgsMSuEgz7c46IouJ/h+B/M036zSu+vMf3csrDHgPg3iHf
X-Gm-Gg: AZFdTZe8nYB1a5cu97v5uGMXK4NsRlZIL/BP1873aFpEVt8ky2oMuoZ2MNCGBabzoWu
	KFqqaPTPk3m5gsoaI0yprQ6cjPe49bZd6ZD6t9EDpzkJ2SF9y6mA2CMJfV+1qRXmxHUJDWIkmy+
	oEhEFA2KdA0ptwNHPSYfvS2w3RlovSOIX7rgof2QPozu+EwaZDPDEauBxh2mEDCIG8G5xFEs2Rw
	xaMkve8VpPIDa3E5OLw/DXEvmN7BaLu+JktBr0bLiOVnFanvhxr67sLGCRluKQVlL/L4FheA/tl
	KuJH9iIbLXL+sUzgg+9cyT6HjoV5p165J87PJkNp7GDsaZZHEL77Dsdxmv7EGTLFwxM497QRgKB
	IIJgTVZ1GyM9f7VhxExQfxKAU9ZtcMjdYvNKEq8FHo0yYsbSOIaAr01YPrw3v9aikI43huX7W1m
	CQDWD7mwe8x5uRsVfBpl3OyLS3Yq5yqtofQ/gewXJmSSSQS3w2nB2mP3UvYwnVsLbqQAzOXDWyf
	RnrW8jjJu6ufrlpMx12aZOAPp3zr/Hl+i+Cy/LWh66PoEdbfefK36ChIW4LaH7XNHDNRr81cz0Y
	sWvRPnKXIu6kPMxPNAGE8ZXwvjf4nFcameN07oSY5r37RYX0DqYf77hmBp4bo9mFPM9gWFY=
X-Received: by 2002:a05:7300:d218:b0:378:1191:43ca with SMTP id 5a478bee46e88-3856fe552abmr460254eec.18.1795122793583;
        Thu, 19 Nov 2026 13:13:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:861a:3517:4ba8:8641])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm1288871eec.14.2026.11.19.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:13:12 -0800 (PST)
Date: Thu, 19 Nov 2026 13:13:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	Gideon Heinz <gideonheinz02@gmail.com>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
	Edwin Velds <e.velds@gmail.com>, Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
Message-ID: <av9mLqY8TMOhJK2-@google.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
 <p6p98p0s-5p97-q584-14sn-ns404p6s3orn@xreary.bet>
 <49nqon1r-32pr-19r1-0r65-50494sq350n5@xreary.bet>
 <sr340r82-n378-035n-78ns-nrq4p808r3pp@xreary.bet>
 <av9lbJa8VlQTeatR@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av9lbJa8VlQTeatR@google.com>

On Thu, Nov 19, 2026 at 01:10:45PM -0800, Dmitry Torokhov wrote:
> On Thu, Nov 19, 2026 at 09:36:07PM +0100, Jiri Kosina wrote:
> > On Thu, 19 Nov 2026, Jiri Kosina wrote:
> > 
> > > > Wow, what an endeavor. Thanks for looking into all this.
> > > > 
> > > > I've finally got to processing it. I've applied 1-14 to 
> > > > for-7.4/upstream-fixes and the rest on top of it to for-7.5/logitech.
> > > 
> > > Ok, now I see that you will be respinning. So I am dropping it for now and 
> > > will wait for respin.
> > 
> > Are you planning the respin to contain differences only around the 22/23 
> > patches?
> > If so, I'd prefer to still take the first 14 through upstream-fixes, so 
> > split the series.
> 
> I do not have any outstanding code changes for this series unless you
> have some comments.
> 
> I think if you simply drop #22 and pick up Gideon's tested-by you will
> be good. But let me know if you want me to apply the tags. 

Oops, sorry, I forgot there were couple of Sashiko comments. Let's me
send out the updated series (I already made changes earlier).

Thanks.

-- 
Dmitry
