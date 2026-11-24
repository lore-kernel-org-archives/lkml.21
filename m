Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500893;
	b=zkAocAW6zDKk72kZ3DUixQOLeLqpyHpIfPj/ENUOc8uLwaVsLaniOqH6WvjeyLB4ApoM
	 lOjc0/bLR1F9iMLFdXBWyXBxd0uXlkawMHel7czcNOlqL+YAfWSoonAH91uF695f7IJS/
	 YRXtSSSSzLEFgE8qRXkzJW1KEhL5T+aCbXiqOnby3wfofdkeg/eLj3wiP9NXyrgVSth+U
	 1sFK5NM3V60+Eb/19Kckgw46EkGF28bdUNzidtOqdynU2oy2uUhTTjb68Bx5jLSSO+EOB
	 8z1y7nZnXLObiBXJllAeVIt42rDqjkYyDvIhP+GSKTw/g++LXe17CZa6GyIbbY71PTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jZ43zXMGQsDQJ/kOcZ+O6TRwG6ELUr556TGyE0uK/yE=;
	b=DmVQ34WeBRMZu2VSLAoR/LFh+iBLe1NQwO3+XGOBhfUa+nGD+Mdn3tej0Oym30QaaVjY
	 Y2m/hlRgphLAaOAfrQKEngXMKlnn+SH8B5Ss37/dZbD17uHhe4oCxqZLsMBVikboFoZzb
	 EYI1/6klr6sBKIMQp6OOEYKldsEVEg+y5hJG9ph+hL6UmEKB8ZaAVhcKMUfIBsqcEnbwz
	 z9yKlFBUEIMNQjhbhye7A0LOMBQr9fub5KJy/cGYxHG2u97at6il81H7fgc3I4Kw/jg+y
	 RQQX4ln96AP+Aa+U0u+PWkGm52ngC2s4MgsaFArck+xgDuvA1khbAsXdO9S8oPjWJSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjGj4Udx;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjGj4Udx
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso273307eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500892; x=1796105692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZ43zXMGQsDQJ/kOcZ+O6TRwG6ELUr556TGyE0uK/yE=;
        b=QjGj4UdxVVJ6Ict/WGa6OCqL5YWVIijBF/PMwateYbBV8/JOSZ1quWCTiiRPwWJzHD
         9AdjJ591T/idte24u040VJ1d9cXhrqOgKDWn13jSUGsWImr/Hqv8B+M0u/Nermw+zrGt
         Q4t+CecrToohOA2bf+0uPhwqJPrpzGeZKh7h9nMesBlGiVmJ6+tRYfyEZ/yfhHDiXDCQ
         k+lXRdfGZSh1RhYaZOsAHoRraT+VQkEIvsOJQ7gyuWfnf4TVfdhL8y/+rIQ8AXL/bRb1
         0MAORgxGoPjtM73Y2lYgpahaaNAOkelXCcyItJrmeuobKbepxJE3LuPfVAt7kQNltsXW
         rung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500892; x=1796105692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZ43zXMGQsDQJ/kOcZ+O6TRwG6ELUr556TGyE0uK/yE=;
        b=NoZ1td70ltnIyeVcWkIKM17Ip1Yfnq7ONeA99eB/TOjV+2/Jk1tTKd1GMH6FChYYqa
         XgYGrDgOypgZYvzeN6wQrhdZ22zHYufQ/Or1zWB4c0/6AVV/bpD4qpemnGFZUHahmH8f
         uPTp1zt/59gm1BI1gJObV4XtinUpJaCDfFidarMSnwEkYLbl1p3p4f5+cn3qtxeoeIuM
         llJeF15bZomo/ow5MGJBV9+TI3N6SUGKhz10/mbmWXyq1aJZy0ilK/yidaxmM7GBEODj
         Ln1kZ9k9NHvlrmsqF2i4oZHJiEvKPY6Iz5+R+gwpwhLQFMmAPeeY67KbiFgc1oyMnZS1
         p7+A==
X-Forwarded-Encrypted: i=1; AL+hErFOqAn9QR8C0Y+UpM+sVg5URAuZcwz8uuNwm4Xbm86DLprXOqT9VNRF5F215IW236yn1Nqck4XKaj6hze4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+bQRcegAA9r3Zjip38Jaq/kkCF9V1uVmwIgsoXNN1rd0rRwDy
	0Mbj1qsOacE1F5oONpyxhFReCfw11slXuGIfz1PUkeM4OuvT7ExPL13D
X-Gm-Gg: AZFdTZf+VlF7ugF97Xo2mv77CnDUQQhAro6PfmHtn0Prd7jz13k1qXmhy196yZuJjkr
	yME3OO0SD/OO+4AgblDq5Kjsc00787vR6IkaEDuDypRtlaIswcSoI3pZjtiZo3PRmPYW7DXZmVd
	eNIfglLM7QYyPvdx2qQcymfQD68iIAzfQgloWCvtLwfEilAoYhDraLHCKTMGpGw2jLKwMzLSEet
	Ov+EZhvQQcCU2HR8SIwb3XhOIK6RPn0Fkt6H13FKUfwTCwF8vTidXVnCOw5UcCgPWgWpAtjqpEm
	gOwnlBqpWTxgQrxpDCP5nKr4xzdBaYRj+49la1b7osVSu3ZiRaJdXY+yqJJwxMBHyYd7WS1m1Hl
	MptjoCeqwDkOHs+dTIebnMsKGVaXb/QZyDlJgMpU6xUGKy1mxEFcRqyB46HL1J60gesl+y9Jlg+
	QMVQfmyh/N4F0jP3dpVyaKZGHhv70pAJOtEzrawtt+QhYQGza5X57JMp/3mWs7BJ8yJ9ciyCdP7
	SN1hAAj/7bvkSMJJNKA9hsE4UeQyj+Vr/3wUjA5L/he0ZfQmNYedWydJcBVMaxaaY/bsQY4YrRO
	tB89grXfMYh3IRO0TPNxMCwo9CXM7iIWvs+XJfikqnem77BpwedlvWoZ1BaW8IbfED4XDHmpzBx
	5/v2yQ7SWf9zVFR45cg==
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id 5a478bee46e88-38648c1719dmr12070166eec.37.1795500891853;
        Mon, 23 Nov 2026 22:14:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm13328033eec.27.2026.11.23.22.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:14:51 -0800 (PST)
Date: Mon, 23 Nov 2026 22:14:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Siqi Chen <chensiqi@uniontech.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adafruit-seesaw - check i2c_transfer() return
 value
Message-ID: <awUrVOJjlHUrDXUD@google.com>
References: <20261124054344.1067234-1-chensiqi@uniontech.com>
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
In-Reply-To: <20261124054344.1067234-1-chensiqi@uniontech.com>

On Tue, Nov 24, 2026 at 01:43:44PM +0800, Siqi Chen wrote:
> i2c_transfer() returns the number of messages transferred or a negative
> error code. The seesaw register read helper only checks for negative
> errors and therefore treats short transfers as successful.
> 
> If only the register-address message is transferred, callers consume
> data that was not read from the device. This can result in bogus button
> or axis events.
> 
> Require both messages to be transferred, preserve negative error codes,
> and return -EIO for a short transfer.
> 
> Fixes: 52c4e5985a73 ("Input: driver for Adafruit Seesaw Gamepad")
> Signed-off-by: Siqi Chen <chensiqi@uniontech.com>

Applied, thank you.

-- 
Dmitry
