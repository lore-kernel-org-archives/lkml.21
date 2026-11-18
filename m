Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001796;
	b=IUMfmVIn9SQ64+udaQhrb/4vM0AOjJ3HV10WvFZJlgxuhrSZ21sjP/tXbCF2IDGRJX7W
	 Xch0j8gZSXIbaHllMX4l8w2dktjscu/Bdw8NybYqboBEyQc3eJ/KAe1ywIY46EK+spptV
	 tR16oAS2JD3m98rQjaR3r27+VBPWpsJZWy09bZAFlYHEeI03KT8nL9y+/ro1t4juY9ikv
	 t1/g/l/1RdA4lhffqMvP7Ckr6mi5o/KQNAJFjUkm3z+7dIODteFJPJcv5Rj6VJVP0vYfI
	 /WyrFfMnDeuGsBqELwVGkP1CAWKRfl67zTcTrTd5rAY8j/NZft53baKk3kbK7joZZyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
	b=svNGgfCP9XfWuyCOMTs65S0GWUEHwpaSQ2/fh82vCKmMAPMZ4cML3X4YMtjbTCFmpj5d
	 SyhIEOJA6VEJRqAjBLgOmz7146YT+Rerqg38q1vKZnXRkimAONGN0cBbQfWxei/ypTawp
	 eDxUoeBgekQcFgrBLdsbvbnjYuhS2gI5KK1Es6eYaD/EpGtFag5FbQVzRb7xX7h/CyoKx
	 98GdxgR2QGfT/cbsLnHu4xfzaTRKvLL68dItxvwbB/ndBwR9sjLpaLmqBLU2uo7zVQr9J
	 2xJVd4nk900wYUYRssSDp/5LvYu7Fx0LmModObTnhOZI3rBPyNfApcA+MvAT7ue0TVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0yvDTMd;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA7E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0yvDTMd
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso407245a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001795; x=1795606595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=f0yvDTMdH6CmYF5yLvtKtTMohE6GLZES7exj5T1NWg17Jyc/YlN1EAJEalUzRXOER7
         /zF/f95S16DpfT6X9bFh7Vo8U6Fos8557o1LuFdpigMsLw2mLX2nIQ5CB5355pXguMVx
         UtcjxU32tLtJB4uTKnTRYh0fFPzFRh2I4oDoFCK+QJHf/YdJE9yvz+WIcKkmzZ9DEY9w
         qwAuGc4tjfcOKbYsWJ2pdGAFGEyqunyryV5sQGVPh06ldLGn4SKHBXIg3chQNn0Pcg9A
         fIV3CtmbMioM87y7nqoxTXV+A5I+TCEV5CBrNWL55gSwlJxZG6V2hmYFyRRgxkM487RK
         R/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001795; x=1795606595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=r7yNmpKLVMrtR6tYhMeMTbC6RmRXyUZBZ+ockteszF3CM5/slRByhwiS2FB9EHacRJ
         QDJbfvBwFFiFJcwNt+G18cbv6ilH7UOhqUUQDPSh7ayl1BoSd9k00HKZEuoLtdekc189
         6GnXLqOzG+1fpTTj5iNZlIwnfFrydKhOOxNhickqlsnEoc4oNGPZ6Wer6kqGysmLd51i
         H8enaXKVLrNHDKaqi36t7nHZAnLQB443IV9rrMM/kFE5xDgnmUecELKnVsghwuFaizfU
         5ZcfaF6IanVmBN3v/XtuQWihRwN9VeE3zKYYCvtyaubHV/wUdlwdDCXFV4QJZJXlqAMk
         F2Tg==
X-Forwarded-Encrypted: i=1; AL+hErHJEyVyQgYIuSv/RUqIppzSID+7bRO6sZ6xB3fV6tr9ocryV01GDOiawnoLknq7mpkjHjMCVn3F+rGFwYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nWWJ0DhGlYGvWmWryca61QrZgkTNVTWgcNQSgazQw8hfik88Z
	ctaUmoIXwE486CCtfU+JV412n++aCi0ZxUTmRmrq2uaXyEwCn6eevzDJ
X-Gm-Gg: AZFdTZdua32zrDaSQxGuczYxDeUfU9UaSrlTvUoporGAHVQQOzHOmS+liPwHPzXHJuu
	geJxcDLsVUVAxO1ZKou0YSeZZDRubB46A5z6Wt1xDjsVbARQxeAGoP5ORsmBG1gCXzcw9V35Ydi
	tUKoKHLuj3FZa7DFWJS+9M3aoevN/omR3mLbif0/IP5ba57J0tzjaiUpw2LY2OpOX7AZK5kUR+V
	DQid7sVEifurm9ifb0FblAcYvAjusLuVfu2Ae/knk0JqVivlT+yy7RLGXxWNIKM7KrBBikU1E0B
	M9xp6d46J3T0MZ48w4T4S5xuy9zND8Y59Uqp7Toy+0A283pBLALlfdsHcva9LZslUWYHcxaVB69
	cWFlrdqODnBFa2Z7HT84kW966f0EA2iMGyQqG0WBHJCF5VYrShMVQMQhZu/fl9mELZUkcmw1IAk
	nfIgK+G4rSZeonXz8Tg7vLlfhKijoKn5Of/df/X/GMSDip6bvns1RSuJDOHUmrrOtk8oJhxqk7O
	XStsC3Z1iGENofChMzqqOOFDS/FUwYJC/4/oE2I76Cla/q2eKGdHQfUKxQgAGvPh+O6A8Jlk+5D
	YI5xY0AVIXOJjKhTtpF/o+s69JQ=
X-Received: by 2002:a17:90b:4488:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b3d0761702mr2554146a91.29.1795001794613;
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8944570a91.4.2026.11.18.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Date: Wed, 18 Nov 2026 19:36:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hminas@synopsys.com, gregkh@linuxfoundation.org, 
	looong.bin@gmail.com, dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Message-ID: <av2M-6w1u5mOyqDM@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261113072305.220610-1-chenyou910331@gmail.com>
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
In-Reply-To: <20261113072305.220610-1-chenyou910331@gmail.com>

On Fri, Nov 13, 2026 at 03:23:05PM +0800, Chen-Yu Yeh wrote:
> On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> > The current DRD implementation of DRD will cause a interrupt flow on
> > CV1800 Series SoC. It has two reasons:
> > 1. The DRD does not sync the phy mode when change the controller mode,
> >    it is a violation of the DRD as it does not rely on a OTG phy.
> > 2. The CV1800 is entered with a Session End Detected interrupt, but the
> >    DRD code has no change on it, so the controller will enter the
> >    interrupt storm.
> 
> Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
> series [1].
> 
> I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
> f66469d9905b, with this on the board DTS:
> 
>   &usb {
>   	dr_mode = "otg";
>   	usb-role-switch;
>   	role-switch-default-mode = "peripheral";
>   	status = "okay";
>   };
> 
> R=/sys/class/usb_role/4340000.usb-role-switch below.
> 
> Bare board on a PC, after booting:
> 
>   # echo device > $R/role
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
>   PC$ lsusb | grep 0525
>   Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget
> 
>   # echo host > $R/role
>   # devmem 0x04340000 32    (GOTGCTL)
>   0x002C00FC
>   # devmem 0x04340004 32    (GOTGINT)
>   0x00000000
> 
> The interrupt count did not move over one second in host mode, so no
> storm. Switching back to device gave "configured" again, and "none"
> went back to device. I did one host/device round on each of two boots.
> 
> On the USB & Ethernet IO board, with a USB stick plugged in:
> 
>   # echo host > $R/role
>   [  136.556790] hub 1-1:1.0: 4 ports detected
>   [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
>   [  139.174764]  sda: sda1 sda2 sda3 sda4
> 
>   GINTMSK 0xF300081E, HPRT0 0x00001005
> 
> Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
> 
> > Note: This patches set does not resolve all the problems, as
> >       usb_add_hcd() will override the role set by dwc2, but I am not
> >       sure whether it should change skip_phy_initialization of hcd.
> >       So I kept it as it is and users still needs to set the role
> >       in the userspace as "role-switch-default-mode" in devicetree
> >       takes no effect.
> 
> I see the same at boot, and the "set mode" print in the PHY driver
> shows the order:
> 
>   [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
>   [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
>   [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1
> 
> That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
> supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
> host (0x03000048 = 0x142) while the controller is still in device mode
> (GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
> and the PC sees nothing. On the IO board the hub does not show up
> either. So until a role is written, the port does not work in either
> mode. This was the same on all three boots.
> 
> I am happy to test the next versions on the Duo 256M, in both device
> and host mode, and send a Tested-by.
> 

If there are no other bug in this patch. There should be no new
version. The device probe problem is not a very big one. And I have
no idea about these thing. Since my time is tight, you are free to
send the fix for the device mode.

> Once your series is merged, would you like me to send the DTS change
> for the Duo 256M, or would you prefer to do it yourself?
> 
> [1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/
> 
> Regards,
> Chen-Yu

It depends, if you accept setting this to host, I can add them
at once. (Note: once set, no change will be accepted).

Regards,
Inochi
