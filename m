Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212987;
	b=TLYxBrZoI31g4xv35U5F/34GCBmxE1OyS2KkF9XuOwSTYbBH2/8iYV7vJ4QSomX4PvEW
	 YBZGKu54hQQ/KW9wl5e+7n9NK6761bW0gN6cTn5p8HPHwGvSAoVdM6s7Okwav3rFtwHP3
	 8LVrGDUfXP/DYi2mhMFNsbUammuzRjaZVumArMJjIBv4KvBYVPscCq3ETSH8Qgqp5n4aT
	 FzFoDlunklepvIgltS3whkkzw+9nXH44JnR+I3N3O7x5NtJNT97ZJGqn0YaZzFiV5zx02
	 0Ghxqr38JROWnKdMRPZTcSQ4SrWMs1tHGi/bbsLo5IkRj6/JdEnKiC+gX6/7St+v3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OmmQLb1KRWWR3nD/qKb9WgJQmetkxtKbiRKOhfslFTI=;
	b=Bw0ao+rhkKx+KwvOoMU2/Ky/sqLMM0NwdYG7qXibuVIuFtGEJLnW/df0WxrmX/Mw7z/F
	 jgsPY6NOdOiek5/naYlvgB9KjEQDYk16UazRNYXtPZbdjAhVNBQksGxgmwq15kbR8l+nJ
	 IM9REgQGbVNN4oG/DMhh7rwasrSZO7O1cQXYal/L5O/OL4c2cedYkkraFROpT5ha1CAuI
	 iHJkzMEpx2gguGTkd4V+Cc7YDGPxn3HwoUglJApwI8Z4RI7TexMJDSemM+FNDZuToIk/z
	 saXfhvpGD9lTejMcX9dMpNidJet6fNdZd+Ev/6EZEdI1jxpX+5FW8ccAyo3NhW0WuQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwbWXu4G;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327E606A6BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E327E606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwbWXu4G
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so2074040eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212985; x=1795817785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OmmQLb1KRWWR3nD/qKb9WgJQmetkxtKbiRKOhfslFTI=;
        b=CwbWXu4Gf67XgRQAKW83cKuO1Tx7sE4RkWJwMBpwgx1bN94kAgrbAq0z24RU/nxf+N
         r89b9CwxyQrRXre5mk27unPLZEFEmxfR4d25UpRNK4VbTjRzGlRlul0SLmH2eeXBh0IM
         R52jhZbmX9rsTNqqfWeXVsv74sC9jDPseXP9nMaUeUlUPWn6A+EroFQP4MoGbl+iiQv3
         73AdQQtnBebyldtmb0kpmdwnzrWwrKaTzHqWziOcMtbnKpwsVwq4QS/62g1LhHqAzfi2
         E548CbBRuAMcp7BrPq3IUIu29xFjFcxgNgh2krPHLKpkJaEbMYDFJoEUcktbYO/59PQp
         3fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212985; x=1795817785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmmQLb1KRWWR3nD/qKb9WgJQmetkxtKbiRKOhfslFTI=;
        b=rk/EFcCm7Exi/nKFCQkvpMejuduIJXy/Om9Bnno7kKshCvcfzpIb9raVQGFiAHhdYA
         LQt19FZzVQRBtayDbRBObVrArPf0bUODC5RChlizZcUoB1uZ477KuN9NDlZNug9ixCBz
         Xm72MsY8cZwTksFjZeEojrc4hM+E0il/UecC4GbkzXy57cPwLozVabp9WREZdxdFUewY
         7ywmknAwdmudhHPDMc6t0zWX8HcDcQDn0eO/CQ8Xu6X+qeeYb2cUdGtgXFPklLq19pKT
         jHiB3v0s+agpaAfOY7cT1iuc6XK5gVsq0d/FrJT0N/TBDOUQ2gBPH6IQ7TlRKtsXZKBg
         1zGA==
X-Forwarded-Encrypted: i=1; AL+hErFi35ngTNC+xaBQi/JcsV0sS1Rxsc3eaEm8FZ0qqXpOkX6pl4q416U9IT3862Jl9+clgg+JGK61H8md3Lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jlzQ9ZJ+S+CXz8Tjy8uAILP2xRjaUzMXWbTAvp9UmKYVGW7O5
	URPicwACVgWRr+OwojWli0guUXd9eN9wC36ZICRFxFO5KOQjgk/2WbQbOTbHNQ==
X-Gm-Gg: AZFdTZeE41XHP0pa5tZ/gxtDO5yor9fjWlC+NVkqyxEA9d+HueminZ3tkuDxuYMtl6l
	Ip6Q9ed1o/c3DPeiLc8B4j0q0BZ2Y4ypviEYS7Kq/W3BaX9MqA739JMLZv9xVabtD7t2ODNEBUi
	6P9ehK6hUEN8xrU9JuMIGjjUVQr1Rmz4bruWhRF2eL1pb0qlTpExRQ0dVnIOe8GumadVGUY+ziv
	xJR7SUf4NmSSMoeV+/JyRnm12bTzgU9SplGiEyMLuIkoeRKAxGzW3rs7oIaJWCIWB434ZKK/sbM
	bRJ9WlAcxiObfSD7IM3fOltlLQWxhKcNA6rkSexhZCY0OdtVpGKWth61F5xb683luPlWYLbMF35
	EZ80B8XKQzInBtDih7QcLI8YUOFpfl0XxQTtsj9rt0KHQFgtbh1VXQG/4wvR3yglpF4Q4BMMmUd
	f4zGqcohH9ROhovvZWFn7165Fa1iDwYcT51h+zAK79Euw7VzZQb1P/H5q4xvnJsBp4xCZq3PtEY
	WRmgd/fdE7z7ry0vcEhmWS1/ezcZvDqPHSOIW/Tf7irHhOW9KLjIqjh6hapATTeub/V/vrYSWbZ
	HlfxH9+Afk9mCiVX6f4bt8raXoa3UlGMJMK7mjOhhtOG5IgllZ8pMxIC+1/LJqmLCIw2NuU=
X-Received: by 2002:a05:7300:f483:b0:384:e31e:3c58 with SMTP id 5a478bee46e88-385714160f6mr4024577eec.33.1795212984850;
        Fri, 20 Nov 2026 14:16:24 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm10787009eec.23.2026.11.20.14.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:16:24 -0800 (PST)
Date: Fri, 20 Nov 2026 14:16:21 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	Gideon Heinz <gideonheinz02@gmail.com>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
	Edwin Velds <e.velds@gmail.com>, Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 04/14] HID: logitech-hidpp: disable works before
 stopping transport
Message-ID: <awDGXhaRpNcNirgq@google.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
 <20261120-hid-logitech-hidpp-v3-4-cfe2caa1d0eb@gmail.com>
 <r078ror3-9q6q-s581-35r4-63pnp1p93s85@xreary.bet>
 <awCMOvYf64DZfuWF@google.com>
 <73r1s387-pn80-s74n-o50s-056r1pn8512n@xreary.bet>
 <2F4EEC0F-5662-4FE4-B9A3-9FCB83B587B1@gmail.com>
 <op182q3s-q21q-2r18-9p5n-60p7003o64o1@xreary.bet>
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
In-Reply-To: <op182q3s-q21q-2r18-9p5n-60p7003o64o1@xreary.bet>

On Fri, Nov 20, 2026 at 10:45:21PM +0100, Jiri Kosina wrote:
> On Fri, 20 Nov 2026, Dmitry Torokhov wrote:
> 
> > >> Ah, yes, I un-exported it in my hidraw cleanup patch series that you
> > >> just applied.
> > >
> > >Hmm, but that cleanup is sitting in hid.git#for-7.5/hidraw, while this 
> > >build breakage occured in for-7.4/upstream-fixes, which is based on Linus' 
> > >tree and doesn't include that hidraw cleanup ...
> > 
> > Doesn't next mix it all together? 
> 
> Right, the build fails on for-next, which is a super-merge of all the 
> topic branches. Sorry for the noise,

So how do you want to handle this? Keep this series as is, and apply,
and drop either entire hidraw rework or just the offending patch and I
will resubmit it once Logitech rework settles in?

Thanks.

-- 
Dmitry
