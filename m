Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014333;
	b=jjF5EmrCgLb8LFOAqVqQhhocvYkaFdJgCpdaHE5bCP0zgUhArED0UChZ5GlXWy5BBf9K
	 ChtOdEjpI3JNKQEtj9ZbojXgvprZpKg8aDt+RgJxHLyd9P8ZWi8pLg97l7VIQaBnKJweK
	 Znus9IR/cH9vWeTwL4i7nQCySaIet8iWIJ3iL123XtRuC1RCFtVYP5seqv39Ncmyl7Ri/
	 w7nbWoKYWXupgSVnO2n7lZeUHlx7agf7piAjUu3t7fa7s/CnCv8GWCxzRaXyMC6QdJ92K
	 GnD9jLrWlI/p/+XtUASDXS0Qd6iexwYW1NoctcY5N9T+PvGDQ8A3Az6gHbTLtH493Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uHGZ+xOdJx3Zm8UTHiozAvdnroVoplilsdHtzudcbVI=;
	b=a+lC4PJYyNLq7ephWlx4o2ljOE0wgoUuCGJYby1WWVmvyncLwxNv56ijW6CofXSS0Klz
	 q62hRcGf0gSu9SAExYsqQF//1PTCxIdjswwo5h7xDctfsSQylzoloudKpGs0ZSuIU7T7k
	 57yibb64lh8G+DwfFfvCajyMfkJfn3l4nsPcKgyGzaVJPbfjoeBvwI1gZ72OkRFs78FJ0
	 bjcml70NyNR8l816KcMSQ03UPfpfbOoFYPXN7PkxuvWpdHxAzAhNLTgchyQaH4j+jdzOx
	 4WNBz6sQur/JLjk+Mw+q3kYyS1JZkq8hbkFUhNBB8kZJo5tFrPxa/6ujm1+9IvUpExA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QXFVnjhG;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217E606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B217E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QXFVnjhG
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e987a2ba0cso7921595ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795014331; x=1795619131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHGZ+xOdJx3Zm8UTHiozAvdnroVoplilsdHtzudcbVI=;
        b=QXFVnjhGcWNcZVxAiqFpRMw2oMh2dieUZe7T/JOKGprkANq54ojUus6S8PyO67nOy9
         7UlTC39NR3W/6RA7E9c2wfG0J/51zw50s+bzNZQTCmKm6ZUmT/NgA+NdNMD2Ic1hJYi5
         0OlR6ykWIKzo5LTIh1NF+fqBL3e7M4NH30jvRTIhNCcBtmGbxmBLqqXFjFvyhLvrTw3s
         NeR7MtbWNK/lNqEVwgeZpoy/YIKH9C2rBf2lZ6NfRkjJbHNpTYBoQ6t2Mqu9aIHaaITS
         Wxop2OBj+7YXmP7hqs14tCALq2glB4GmongionzM4ZGaty18pR2LO4s5XD+nT2UwZK46
         9rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014331; x=1795619131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uHGZ+xOdJx3Zm8UTHiozAvdnroVoplilsdHtzudcbVI=;
        b=n9lBcEWNrNkqwsN/71bUCXsE3jdaePyYUX1aIf2Bx/HJSyOC17SJ7uQKneksVyjdtF
         uP2kWqahNix1dxbpM8Yzp1gCFmU8EnyCf5OJ8C6NJyMQb94jb9nrGnnZoJz0taVFEUiG
         8SHRvT+2Cav5B/YUb2jpajC5OtPYYqwTbDzcOYwYgbg9Xc8z7vwiDsbsOthnnXFSm50Q
         Cpp9pHxgfWNTpQw26ZzSxKG/jpVi6j+/RcMVWV2ZG904MfI+Sxr+0S5dCAwyL9bEDexm
         LNQ7wSHhj7b7pYWAsARaxHmEtgds488wystlXKI1mrvSv9X8QIgkd6CTRU2oxwsXFmxf
         qAlQ==
X-Forwarded-Encrypted: i=1; AL+hErEn9dZZrVFqP2VmxbZrnbUlsrDKxmfuZ97vQZ+v2fl3UN/aI07tMgAL3G8I9vgq2hd2zyMAVma4I0yb6qI=@vger.kernel.org
X-Gm-Message-State: APuU4Z98hsEC+YiKvrmYstyGdVEIA++AF1Ttk2LBygLUZiko0aB2KbHw
	iDHFgC4A+iPm1NWg3l7HlsBNMrdLVgATJ/P2pI4Gu6qzaAJAgfA4edu7cPtf8STL43U=
X-Gm-Gg: AZFdTZdLZd4lQylckxbOvqPoISE9JdcM/aHGNF4aD5407D/Zn0IFsAOPqJemyqck6rk
	DkR11YO52poNDFIDueFf+iHLG7OYDX3uGsMXkhbANXA4j8LK9lIoPg6vHXU7IFshZQghMSiW/Bh
	Jp9ngTqbVWz0bAjNDd23p0VpDDrErS8Iup4eEDshEHmv+vjdjVdWFgPnkEaGksleb6L1/qNnzPL
	6S3zC5iI3B6XdsBr+J7vrHtq95gFtFvKqGVEDXYviUiTge0We2ddj0vLQ9NMYgNtusS2qHGXr4p
	HnyE0LskOrKb4h760zLGcP5M+dB7QWLAtY3NB463XehWERGF+L+qEFP7bRaaAEJeKNafU04/51i
	5MhW252H+kDvpnFT+YfQ0OWJIjGXA/d7Yz7+sHj8WeNY+IYFp5AXPZ/BhUta8jqMWEQauo40S36
	zCqMXhQC8ZI2siU+jHOW3VlGATXCiK7cIxxLPiGZHbvCI0aJBArimozuJDjD80hF72LEKkYx5Pd
	trjLDXWnHpwFiJf1r0NdtCiLNJ4m3PIWROgF7VssEhbU1dS/OwoopHjYTid/pMbz9aFc/ClXQLC
	Dqi6yAQo/nXxCnIxO6E6i9ORLIlpCpVbxJ4yYPsXo6QeKwaw1Gum1Ylx9Qq79No4
X-Received: by 2002:a17:902:ce10:b0:2ed:2104:9a6f with SMTP id d9443c01a7336-2eff73f1e64mr28760675ad.22.1795014330948;
        Wed, 18 Nov 2026 07:05:30 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm15446135ad.19.2026.11.18.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:05:30 -0800 (PST)
Date: Wed, 18 Nov 2026 07:05:29 -0800
From: Joe Damato <joe@dama.to>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] igb: link queues to NAPIs under RTNL after
 runtime resume
Message-ID: <av2+uVOytr5BDs5P@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Antonio Quartulli <antonio@mandelbit.com>,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261116153041.3002666-1-antonio@mandelbit.com>
 <20261116153041.3002666-3-antonio@mandelbit.com>
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
In-Reply-To: <20261116153041.3002666-3-antonio@mandelbit.com>

On Mon, Nov 16, 2026 at 04:30:38PM +0100, Antonio Quartulli wrote:
> __igb_open() links queues to NAPIs with netif_queue_set_napi(), which
> requires RTNL, but RTNL isn't held when resuming from runtime suspend:
> this triggers "RTNL: assertion failed".
> 
> Don't link them in __igb_open() when resuming: do it right away on
> system resume (RTNL held) and from a work item taking RTNL on runtime
> resume. The links can't be kept across a suspend, because
> __igb_shutdown() frees the q_vectors. These are only freed under RTNL
> with __IGB_DOWN set, so the work item checks __IGB_DOWN under RTNL.
> 
> Tested with the 82576 emulated by QEMU.
> 
> Fixes: b75a1dea500f ("igb: Link queues to NAPI instances")
> Cc: stable@vger.kernel.org # 6.16+
> Closes: https://bugzilla.ipfire.org/show_bug.cgi?id=13562
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> ---
> v2: no code changes; mention the tested hardware.
> 
> Note: igc may have the same issue: __igc_open() also links queues to NAPIs
> (igc_set_queue_napi()) on the RTNL-less runtime resume path. We didn't
> have igc hardware to test a fix with, so no igc patch is sent for now.

I have an igc I can test on if you want to send me the script you used to test
this. Feel free to message me off list if you like.

>  drivers/net/ethernet/intel/igb/igb.h      |  1 +
>  drivers/net/ethernet/intel/igb/igb_main.c | 38 +++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
