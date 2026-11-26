Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723884;
	b=lYzh3xtKGCdZp83VmgB9KoV8F5n1+MrN/i1+4Z9XREJDXg/O6ngqoi1AS7vPDmRe5ean
	 FyG+7cZ88bm0zrme3ExyXy/INqR0L6fx3HjRThaZjMYfab++Zht9JZkZ1u290yMDtm119
	 5oS74u+FZ8dwkLw98LbJtzWd+1BGhjx4bEMCDfTPMEIEFz2T6Y1IXeepfeC45MF5w/8EH
	 9vx+pWXSwpZrMP5zoVVtxbUvFkRNcMjIwhO3FvzKExkHwJfbad3LZEuxBHEphP/avt6er
	 eAUZzTR2pAyuEKOjXUumbuRnUcXWu2J4zxmLrLW1tiNjl5aspCxjLOIc91vmtWGJXrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Nj/WNmNbH2CCgoWWWQhTKahPha5+ME+4yoPGAZbSie0=;
	b=cwT6U66Ze14tvsIm43bvHcfSbn9ZL4ePeykL81OTbkJgsZeyuzMFMtGz+Z/yuhLftT7/
	 Y3UPYsHFojzf8KaJ11lENoCI5ZiKnL4NqWuj5R1LTWZaOydJzlhk7iow+yT6+Wwn85XcH
	 avOF9EY/GEqpiPbIkdLPaCsH0/zIaTf5eOGPlzrxU/KEVmrLYAiMHwCbF5Mtnb8J2/HeE
	 AByyq04sWDcE134XDjUQ6vgCY891zA8071JwLF9ZOwQJUVzjlyf02lLSSgdwblhs0EZs9
	 NVwwGrslYRSFWmUocJ4tCqkASkXd5FgmEERNo1Rj/DULjt6kv8glmPSwVwtQsF9LaOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n5wLgfHB;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D45606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D45606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n5wLgfHB
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so20121835e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795723881; x=1796328681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nj/WNmNbH2CCgoWWWQhTKahPha5+ME+4yoPGAZbSie0=;
        b=n5wLgfHB651Ue69O8vuJNdc3m9TPZ3NV736Bukjoncr14J6JE6ZlPSDZf7cla6cn2V
         ORIDrgd2fLu04O14u8BfyVeJIx/nMFXCAfZYs1bDJyr1l/pY5LDq4+l08uv5RxnwOYUn
         jpnsmkJdjsLEsI/NL/VH2wmaRpWXyzCs/GitGAGbHX/URfwmgNr0eDFACsg9gnwuiMZ3
         nTti0NiKz/zCW0Mz8EpKZEjCzFXKxGtV4wl0hX0zNn2Ym0v55YcaJhyqzVh4oUAYQzK3
         6XRiJH+piIcKnoulAcULwF6A3YlxwLFe0eG7SwiIq0o/LifXE064nF2hWbx6hdCBsUcx
         Y6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723881; x=1796328681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nj/WNmNbH2CCgoWWWQhTKahPha5+ME+4yoPGAZbSie0=;
        b=h271epQJzgld1EXuRwfUrZJzKxv48C1zaeXrFoju6XxejWDAfXh2/fZAqBXRqom0qi
         MxU5fnUlzOeD+xmy17n0IANuoh6FaB1TaVxqPSRsWJG466NFGLZw3IHvWkbRy2Kiu3f4
         btPf3UYPilZzDyRjiglUxdzaW4AvH0avZ5ykpgz2Leq+bhY0a5+m7zqZY8aZS9Za1eyX
         H/cJDXMX0TLGA4bQfub/7z5Jc5Lly2T5jiZFqAE6dk+gPoClHpHOkkEhfV9uJunbyVw1
         UFXCE4cjPPA+t7cnEDwL5rjxRvxx+BUQkivf8sQwaHGFWkv9pK07KH/KxLmWx6n1o76L
         magQ==
X-Forwarded-Encrypted: i=1; AL+hErHNgwgqYpM3QcZLPp6QVNheWvrg0oMsFtUB3yi0TJM/vC31ZZz8yy62Hbds/oEzT9nA4Ah9/kMtNYsKe3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fhWWQbALuB2r+dT+0KKVB1Km0ZMFB4de7VjHvXvzliv88KV7U
	7Yb94gHcOmDp4nQ9+HKZPOEJo38c6zhATsv1rneYWKgIvNC9lTBY1Ew5KRNLD1IOTQ==
X-Gm-Gg: AZFdTZc38tQhzZdiiu3l5uwB5RGd8HY8WUdjEx4ZTTTXQLnDOhKCMho1EeIgL7Firde
	OQHmZriCqsjxgUk+iQEeUWABGW8XBJhzlSLNyCLLpuAU6EoadvlSSI8kmd4Qm1nta8elRyezetP
	JtmbNntOYAazNicIl69C5SEyvrphSt6GX/BOd93P0N7vOR5CWWkRM3VjpGL3oVdUNsJvlJnuxz+
	3ULcqo3gXuQkodKrIEQyL1JRaNwiIGmsrKPrHZe7x3Wf1wZmfY7c5/2FCnIuN5Reo6ySlztkQdT
	ggmtsm6yhvBUI5QrDrjFiGajAP6Nt/LqhBYgmsYDEDeP07eo94mOEBBAGaZ0BAFSW1m5Z2cjKq5
	m8cDgD2VfOr/2uRwHgBF5gpu24SjNFfpFJ4VCHWNBR7m74Y7xMbysbs9UtAiSx3NTAh5sPwSRzz
	Ce8VcFfmLk4RsEdv3PiqyzQjp6pT72X5iHcv9qXVfEQCubnU4h10TylkYvU+dJMiNS7Z3E6PLhC
	cwyO2u1l/VX+VHwOV4jYSssVzjUmezeg7Vk+KJgmd0T30NOXiVpi0rdUq8/yPoBxDNsEFpWe2Cr
	vsTDNKQz93zVGOnFCgq6IMhsNM6nGoxp3WLXZQwkNmhLVJuFY6ZlCDiO3VpX9ZvrchKH9/TBmmi
	AmS/y1lI1Z4RpOKBAUnY+4UY=
X-Received: by 2002:a05:600d:8402:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb88806287mr356853825e9.14.1795723881055;
        Thu, 26 Nov 2026 12:11:21 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm618620195e9.5.2026.11.26.12.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:11:20 -0800 (PST)
Date: Thu, 26 Nov 2026 20:11:17 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ring-buffer: Remove unused absolute timestamp mode
Message-ID: <awiSZeJM642t3ScT@google.com>
References: <20261105202814.1350312-1-vdonnefort@google.com>
 <20261105202814.1350312-2-vdonnefort@google.com>
 <20261124210350.718adb37@robin>
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
In-Reply-To: <20261124210350.718adb37@robin>

On Tue, Nov 24, 2026 at 09:03:50PM -0500, Steven Rostedt wrote:
> On Thu,  5 Nov 2026 20:28:13 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Since commit b94bc80df648 ("tracing: Use a no_filter_buffering_ref to
> > stop using the filter buffer") dropped the last user of
> > ring_buffer_set_time_stamp_abs(), there's been no one enabling absolute
> > timestamps on the ring buffer.
> > 
> > Drop the support to simplify the ring buffer code. Keep the read-only
> > tracefs timestamp_mode file to preserve the ABI.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  Documentation/trace/ftrace.rst | 19 ++-------
> >  include/linux/ring_buffer.h    |  2 -
> >  kernel/trace/ring_buffer.c     | 77 ++++++++++------------------------
> >  kernel/trace/trace.c           | 10 +----
> >  4 files changed, 26 insertions(+), 82 deletions(-)
> > 
> > diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> > index 9423722848c6..88c0de3619be 100644
> > --- a/Documentation/trace/ftrace.rst
> > +++ b/Documentation/trace/ftrace.rst
> > @@ -712,27 +712,16 @@ of ftrace. Here is a list of some of the key files:
> >  
> >    timestamp_mode:
> 
> I think we should just delete this file too. And every mention of it.
> 
> -- Steve

ack, I'll clean that up too.

-- 
Vincent
