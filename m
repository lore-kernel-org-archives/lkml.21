Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847565;
	b=Ps0zMt48lQPFIV3l+JdZO1jutXZEQ9YE7HNsgaeu+zZLUqA8PHAeW39IyEd6RN4Pltmr
	 iCYIlolvi8zGy8CF8bO3IC1SzNYFttqBcqZlqlEWyYsP+nS5YcLmFQvA0IFrpHuMqJdTj
	 TW3jnSsJ6yXmuXDLAPXVZxpYfQm3PDVCkpUL/ocZZicE1XdZXJAhgayadYxaSIJJHFcQL
	 scFP976Zks/2OiRgdq0ZBzo5KTb0TjEZ9UKxQcfNNNRkCJ44ctqZly7WXLDBlXQ2bBUCV
	 jIqul8zDS0N9QGOaT741fkceHspBlu4PLE6Xq7LlNIHxnLYMUN7HA8egMmAd0OcuzYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=G/9/xCXzLq9nfKwGAL0dNahckVdBItuM5SsizE2GR1o=;
	b=5hArrkAHO9p3zv4u5xCGCjefqUnfXZdhyirUyXfMwRTPj8bF+TDF4awidwqUOOhsSRz9
	 9/j2LYOn/uu6Zdc44uMyHoTRuaJSM9wzEVllYiAwf+rQo34V7g79cF2mJ30TBoAALjOiQ
	 mD8QyG9lHnvBQoZMKjaigjrpS+SmestXKK7Ej8WvJfBe5tnR0POG9YvmgN39WYF3q9CP5
	 aHcvuiuWMfZybtG6MGB0/qHJ2BF8GHyXlVFc2l75F56lKbi6xtsYQdUZYzqOXW7PBSk0/
	 a7kpQbi4aZTfUaz/0K3Nnas3HT0UbNaInR6trNbi51JGSVhoxLJk60SDkPX9WEmAmCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfUqxV2c;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12550606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12550606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfUqxV2c
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so6351272eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795847564; x=1796452364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/9/xCXzLq9nfKwGAL0dNahckVdBItuM5SsizE2GR1o=;
        b=yfUqxV2cZ62OLs4s+VB5qKkMOt8vhpmppUzoJNxqzUEv2jQLQu7LNP1eReCS1+scMl
         y1p90SiR8V4T+JtZfzocYxpQQZ33M8M3KaDAPL2Xgu22vGk5Yo0AhuWwUi/zfecSyszG
         u+X70pyIbR2p2DfoJ2LgCe4LVmfOfF7UfkkT+0wFFaExiaNdSXTNQT02vq0afSroGnkQ
         Cezta8AXUB0f/2RjdGmlPbxWi/9tVmpiAIqU3KyvQQWvGkXC4VDQUBBTUnZzt3B5VYGv
         SVNz8bhT2Gim7kTZNYoZDDxHtlc6qVp+Xq9SToyPYr5JYsrje/oC4s2tTWCKFEQ/uDHV
         GEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795847564; x=1796452364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G/9/xCXzLq9nfKwGAL0dNahckVdBItuM5SsizE2GR1o=;
        b=CtJLFTMnfN8QMzg3zhUsb0QJZooR2zdixh9EMpMW3Ti2UsPHqDZ4MV4+wqXFrMT373
         JHYsGkv9FcR4wRaeRcAeSXBQG1EW76FugqYR68Yxrn3TqYQK49pV+NV42NVRMLUTaVHf
         yEGlzG8KEMO2E1ir8u32cT3QhY4lMZwZuNCn4Ie4qrxnfeyd5tRHuOurpWv3kXNIdnI2
         vV5/HXAULxn4xJGWt074GwFtCIKLSqy5RvJz/DNxp/fD/cp4D2VmjY/TOccTN5WxXQfl
         /ZI4uAuKq76aq/OYhcVWQkkKziyNIz8i3Wk5oJ8NrhzhKEQH6iChlpIyySu8B7yyA4Og
         AeQg==
X-Gm-Message-State: APuU4Z/BVywsRf8kjm1TFh11SFqvrWBwupISmIh3p/rU680BmVMkctCr
	skf0B2TN5+IjbTo9qTlM9spyLGT+zVJTty2krSB++WB+bOdT3WTZ3YV6DKgW2g==
X-Gm-Gg: AZFdTZcCGKug/fNeq/84xfMC0KMXBQM2gS9+3TFutm4eKDvIeh4RB+0V21SeS9eFqSs
	oyaocYsfPsbydQ9evPt2Fvz2bdXRhyLb5QxYtJeq+uNo7CisQbnobX8fP2OYbirzJ7SmLqZoTxy
	bcukExiqUnoek0SNGpbOw8JjB2mRE3T9jNwQr0oA2MHd5mnDmVJN5DWYy16tuhKe2wDz/DHWnCE
	O3mfPZ5MBMK2/TXDpr9fgBXQ2+0cGsMcugZu2lbZ86P/DmWT3FZnE336iAx2yLhdK5e62VvFGQT
	oKINZvrogPzD9Nlth3RDgPZNiek/AvRdAdssv4l0MfEkc12ay8xCww3FK5HaJrrCF1cllYfpXL+
	DaCLrLOnseCRdDpj87g1UmgOTfPfIQrE2Q422tyQo6e0XHNwKAU2bphGILe8ciY05s6zAsoKvCM
	nY9jYDuUGMD+Mmi7PcJmlwqJjXkqgnqvmP3vjC4tseGC17KiSbE7Kv/ewRrm0PMfQilY2WeS2uy
	Lef4JMp1HGtxc9l3mOY9AqMrMxs09MeM+qjk0EDbpX5OV72pbCw6jdAnUyr7mVnUHV70k0sX48r
	KSF59ba5zOjoWEKMiHpclKeiChJqr9U8YyNHyLnqrTIfWc187w4pLb+jmzUaxiuLwhVfEg==
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr27236869eec.12.1795847564106;
        Fri, 27 Nov 2026 22:32:44 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:aaa:5a07:6335:86c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386f676c3ccsm4242369eec.12.2026.11.27.22.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:32:43 -0800 (PST)
Date: Fri, 27 Nov 2026 22:32:40 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Ronald =?utf-8?B?VHNjaGFsw6Ry?= <ronald@innovation.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.y.miao@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, 
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@arm.linux.org.uk>, Trilok Soni <soni.trilok@gmail.com>
Subject: Re: [PATCH v2 0/3] Input: Fix GPIO bounds, work teardown, and
 suspend bugs
Message-ID: <awp1fzBA40znp66K@google.com>
References: <20261127145209.2884170-1-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261127145209.2884170-1-lee@kernel.org>

On Fri, Nov 27, 2026 at 02:51:53PM +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> This v2 series contains the remaining three patches from the initial
> Input Sashiko bug-fix set, rebased onto input/next now that the other
> seven patches have been applied.
> 
> v1 => v2:
>  - Drop the seven patches already applied to input/next.
>  - Drop the redundant zero GPIO count check and stable tag on matrix_keypad GPIO bounds validation, per Dmitry Torokhov's review.
>  - Switch applespi removal from cancel_work_sync() to disable_work_sync(), per Dmitry Torokhov's review.
>  - Update the Fixes tag on the matrix_keypad sleep fix.
> 
> Cc: "Ronald Tschalär" <ronald@innovation.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: linux-input@vger.kernel.org
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Trilok Soni <soni.trilok@gmail.com>
> 
> Lee Jones (3):
>   Input: matrix_keypad - validate GPIO counts against matrix limits
>   Input: applespi - disable touchpad registration work on removal
>   Input: matrix_keypad - only stop and start active device across sleep

Applied the lot, thank you.

-- 
Dmitry
