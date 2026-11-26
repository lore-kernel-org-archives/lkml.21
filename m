Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663971;
	b=wU+dQTQ2VnxAPt4Ei2YYWiID+/FHVLWyj/5/QVoRt5ZALvep/jqZE5uKkLtfqhCDxCrS
	 xo8IFyzRtW9TC18FCqagx6N1Gh1/v4EeQO56FJQg96MhYckbawPHlY4AiFWMxKgA7Dlwa
	 wJo/r1TB+ARzqOd8hgQWe2ybGldXrAAeWrlOt4xQmf9Ac74IOv0bNZvRQJudzAWFkW0+m
	 B9DTDQnz/+rUWcprRQdQIEu9u+6si1WYZZkiS7fmM5B4Bczq+HhPsrA65Z1AEAT8Pf2BA
	 LEbgo9cmQCfeyfyFXF3wqe3R1Q5VFbqCnAnGwtQvI6KpZeIj6E/KLtDII6SpG6FMCLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KqMXbibufbrLO7FuyYV+tOnQOeMcHqxXW03JIGh+8Oo=;
	b=QrlJCQDcnhsK4csEDdS4862GS4mWDJmfljWAIOA4qJHueeioK6C4raJa6oZdn6HBdkXx
	 YYPRgh6rtF3CbtehdV0mcEKoa4E8uMYB53i1yb7bQ8Cky6Y5P25r/Je+qUgXO+5yagQIv
	 /UnF2tit6CzrzfYZeejDXKIUp0uIfKM/u38kMZm8HF/m3hmO29FM8zzRxmhI0Jxq0ojLs
	 qWgJnp0pbJBJE7UyYfAWkfiz2pVLhpdpxPbW4uWylyA0TNxUjXaj4U6M/XixpDwe1Tkk+
	 s8oBl2SqpuXMdfZCNvDVOwu/6dkLXo1shDDxn5oDMJRFjd0o070mX4sbXbqKi9YJCyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nGgCfqoy;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DEA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DEA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nGgCfqoy
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9212dac247aso67033916d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795663969; x=1796268769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqMXbibufbrLO7FuyYV+tOnQOeMcHqxXW03JIGh+8Oo=;
        b=nGgCfqoywj9N/UUp7RYNDrk/Qi2joonPlUffAD7sOSXdh6zAawTaKRgf1d7HiE6UZY
         CwjJoT/XL7zLyDwjc4hFtjAmEy0dpsZQA+FZeZqfpxD/b2UbyZi3eruENCC2BfaEFn6J
         WGmgmKPAu7ZJzH6q0KlAkzFmFA6h9RrkNLpz2EWNEmw6OszUWO2rZwoLdnTPSHb1qrSf
         T4D5DeYYk/F4IXdF0VpddCKa12jrea5Hikgp61s5zP+E8Gy1KissJcu2uJPYrSLw03m1
         X9hPHDBzGAfq7bOQ6+7ApKMl815qJGek1c9fEtTEF1wA6txT6e386vvmBUwGMK9ANYMF
         X4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663969; x=1796268769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqMXbibufbrLO7FuyYV+tOnQOeMcHqxXW03JIGh+8Oo=;
        b=PFdd2bmd20Tj+I3mqeseeBzFu2ZM6fDlsc/N+hUVVfF2lK8hrnHnpQsA5eaQhFHrDf
         ILeqszZeNUAYMAWsO3+baN/8O/oMLQBAzvYw1fvB33SGKif+LkSTbyhRJnbdt0faNfMo
         qJeRsFaNNGOwvzVGZakTpmKbsNE8r67c7A75lwPIOm+80KZk0MNEp38TIhgnS/kmfGAG
         memqhqWTYNgfcjrIx/fKkxmQ6prL4oVpryM+j9/gDDcF2YJIoUPe8VXWiTkZaw6VYeOH
         wBCKwtgmjDmm6Pt5RMnpSC+QjrsepjoJN20jljHbetnj6gsHh87xTIoPdV9aKoxh9G9Y
         xedg==
X-Forwarded-Encrypted: i=1; AL+hErFetMO5qSq5EDJyG3MTbCy6Tc3xsgob95Js8SZBNUYSBUVESOuSzh5weQfSe7gSLxGXo75w0t4Bhf902VU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u6fvlsNt69jtLu0LEq7hQFc+jR+wIbiiyh6AQL8X4ltiKh7AQ
	Ri79joLjaEbjer5ItZcElnfGxdH5o8LnqhHK/SlSy/sFjCz+2UmxiA4YRKGqOv93An/IGwSzwG7
	/j0lyhg==
X-Gm-Gg: AZFdTZcSyC8zvwmLoURtQsYho0PUvLISva4OrW8hRA2HkyfDIT5a3rkzenAAPpSqlDC
	YE+XHPpiErEcyBIw0k/3IrINqWxOEHIJMNXPxUqlYjBDOKOtU3jUbCjpI05Z4uGRO9rbt2LGR9Q
	X1aUFz64PJHY4/Pd3PtMfUQfhA+z2l8gXwIh60DdI/VBH1glCssQ1CdQk3Kls9LhMvuhkhbJ0BL
	IBttyux51Avmz3wttgdhc8f0/Q8WxD1AATY62uiHGL/u2JM8xL4W9k/TGp+Nh0S36WhMhNHpUo5
	BPyimL/Q8wInDEscD1paVttb9l0UHbFZCrwaIIyUguBXVObuF9P3QnlAiOP4atijVt0P0IKBvEa
	2isjj18QGzCPtwWx0Q8Ehh6CIMewIrpgzdgsxx0NUls8yr5jLE+wyzUiw9pL1o8a536s2RPlyFj
	LhhsvEwmN3b2+kGCAS6ftkmMxWAhKxFvhUT1VvmElNJgYCc/QyiIfq/gek+l7O9pdSZ79ZYp9hT
	H3jCBrCydjkIBrXHYBqzml+UZvPJLySlNLLh99m4FcyPxk+7ZVK6vCVs7Ev7dB4Xoj9jDmDjaiq
	DVRppOBlXXkn/fbHza88FJQTFkMHWA==
X-Received: by 2002:a05:620a:46a5:b0:93f:6c76:215 with SMTP id af79cd13be357-949bab157e4mr3534856885a.50.1795663969349;
        Wed, 25 Nov 2026 19:32:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1245909585a.20.2026.11.25.19.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:32:48 -0800 (PST)
Date: Wed, 25 Nov 2026 22:32:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 3/4] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Message-ID: <3fe932e7-fa30-4d3f-917a-2ac8c3fd9605@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-3-8f90434574fe@gmail.com>
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
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-3-8f90434574fe@gmail.com>

On Tue, Nov 10, 2026 at 12:13:24PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> ep0_read() snapshots dev->ev_next, drops dev->lock while copy_to_user()
> runs directly from dev->event[], and subtracts the snapshot afterwards.
> A concurrent disconnect, connect, setup, or another reader can reset,
> deduplicate, or consume the queue in that window.  This races on
> dev->event[], can drop newly arrived GADGETFS_SETUP events, and wraps
> dev->ev_next if the queue shrinks below the snapshot.
> 
> Dequeue the events into the local buffer and update dev->ev_next before
> dropping dev->lock for copy_to_user().
> 
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---

This and the 4/4 patch look good.  They may need a little adjustment 
after you update the first two patches, though.

Alan Stern
