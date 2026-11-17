Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794942724;
	b=qdLcHuP2Qp0ovERbaqL1ZNR/q+N/RqbZHZfa66UL6ghh2yGeQHHoG1+cIsbwD0nQbYfZ
	 X+OFYVoN3MzQtKhLGtdJFdLicYBsyMvVys2Po0+oVUY2Is6Lqzy1Ey3LNRxxNUBB8DGTr
	 iWnOttTPiWI1HDVIElMj6ZxDVJZX5Fcu7GJlvHpFykAG7DjxwTNPDqVhC7iJdkZzXruHg
	 pYAiYPsmRup8n+gQaMGvmw+PrJq1hBS71ZJfkAE4DORM8v3bvjU45ql3m0sveg/R8WAf+
	 vd4qvK7SvuNSfYPdM6PBLPc+FYr8w+QUrvH5WhUrQ4o0u5NPL4WTRowHkboUVyGci8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
	b=pMd5nTlcsaoC/ijjnmdo0MGqfq9in5i7M9j07FBHmPzxr1jp3r3cvQ+8LeCpdt/zqh35
	 cpDVt5qiXTUY62pe8OvuWXjGf/NRpi569/C5xwR7+rU7GPuF8CVQY59If1F00rsUhtpoU
	 22p5RbxGXyCCYVzD+7KWKNcXA3nkzlzjoiGNSmqGHMgFxyPZg1hvE0GzsTeNykIqdj2DP
	 E03GEiWvy0kBZ3Gl1nU/oG+ntukVJfDeZwvqzORMww9DeOr5lnY28TMBaSiZwZmZzpHpx
	 zkgwey6LBG97+0gi9dgicjQAWDpFDf1XoA35odwKFod+aZmc8oqAWzOSDbgyr+Sh2Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTxJVUPY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1F606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA1F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTxJVUPY
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so292964a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942723; cv=none;
        d=google.com; s=arc-20260327;
        b=VMpCjUDWuNaXerUGIqq/xOPpB9G/zOgKN18MfA5n7ajZpiaPt3XBzUeSzbcPV3ubmF
         y06GjjLDEX2BFaW4cD6/Q/7dSPa2LLI1/7sL4k2zIaSDnYywEyW0273oadZAEzxYJAPm
         i4oGYPTjJxi/2Sinrt6pUbmjc6+S8ytJ7rEa+mS7Tcmx4RruJCCp0Zp0DcIwiL/FYHTy
         fb9tVzc6fyBUnEEMG0P6+JTxSzKszmodu3xyEr6Io0D3GU4dq7oIPOT/nvn9oao7PBt4
         WG+l3a5iRaNKlBWpACXeSxhzTmz2MXjqqoCG+TBsGWLc8oO9cuogiw0YG0h8aH0K5ERu
         3Nkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        fh=QMCLDjgjn0K30e6LDYZHds/7le/UqtO8hIUdsJpSvAk=;
        b=p2Ri5i1r8L+IRs/YImSMa1MIEncOqUN8PEVr3rAIRwVn9LL1c6RdymH2fFu/GS0Wyi
         jxq/Nhnr1+6CQaAPI9pUsmwsMnXzmG5/hwT+Lo7oiJO5X7qzDHWblmjVflmVTstCNfL+
         CcTXwqdSlYT7ZKqAYQ1fYNCrdi8TUPGsj9vISHYLYPHNz7/4Smac9Wn7+fMLYSAVLFh8
         l5W0GSOeblaCMz8l1S2nVNa7OZR6OOovTc8NrpWYFDO7Ax8egwihroDls1cXnPE5QCvp
         3orGju9t5LQZ/h9TvIJIgwqEAN43DM9J1sjVeADmJOP+C66fOLgnySZBo6IRrcxzyeXm
         yTiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942723; x=1795547523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=eTxJVUPYQeNVqYvPNfQ/zIVr91hEoyVYtGXi47xK5LJlVK2HmqlU0pTukuNssTl9wQ
         Wzc6U4MrBTPIvjXrct3384he7nd9RNucOc+BbzW49GIztEguygjsUjuGvli3rZ5MBFN0
         CXI4h5J3BS8TvpASfKs7+j2yUdBmoVf4H+/zk6Nxn2kx541JD9GUVglZW7kT//OC3EvW
         Z0gIN7aXEg9YDS6J8K1fgvCIGZBAk1X+i/FJSij5oHoJsww58itTGvnbFcPqxKm3zNbp
         cN6uKiy6XgnpUIvaxJnK3yUzdjDNMUwXq1mvN6zw/qvnt1vXxSbCZrFe7rEic+SU3qXl
         s2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942723; x=1795547523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=tsULN7Ys27Nk0ezs9Hrs+iqNqgSG6jyok7H+Zxl0SycvYkMZp3vjWgLPMXzEHLcppI
         tn2j1OIJIyd3tcjzvZmD1iBUaewMLBCwr696ReYoTxK4k5UYF4TiboJhR+pIMwJ9+E1L
         gI/vDHKymsnHE4lyEq61UqtrBItvvJtsBVWw4gOvX6+zqTJd4dq+PtJvrG1jH6F8UmCX
         0Qc5LsabjUhAF7582aP1tkWBJ91IM1aGlEn8zM94dK0BzaVpY37QwmV6A+rrZE65hmbM
         Og62SIuMCZAC7U1wnXHgMgfCyutAEhzIF+xXyhczhB56zHNpq2x3ekcYgmZYeVBR5R9E
         Vd+Q==
X-Forwarded-Encrypted: i=1; AL+hErHt220wHEhdzK95Po3P4pEJ3nqkDScKGPG/0rriRL/aj5KwmpE1ltwwsJyIM1PFcn86a00kqlDl3RrL7I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I/1vbVaAL3QVLwEpymcMkr5E1tNSNY7hv96fO4gtbU4vPtkXO
	XEAmZAub3vMYjM3BRShHC7vYM0WmZOgJ59d7ZjQWV8MirQZEBfFjLWTprA3ngZThAtZibUjWhFC
	qrj/NxS04EkW9WkQTnoQFxpNZoGqUSBg=
X-Gm-Gg: AYBFou27kfcjDoWm/DhA/q2ZPEIz/YX7xW260eLC2qx6AsNdZdSuNKeJg8fwqoslM2s
	IgneCfeSwinHqpIuKCxVlb82SgKRB58ytdgbWhEZOXbYhQc2TSqUoQ3pqlIEcOlNTXu3tWZLeQs
	bM+k0AUDYG3b4iZBT+2nEStk9rjWjXTq8IGwNrW7Jz+hbkcq6+k6RD8lCJXwMSwDuoONxdz/3lh
	Y9r3Z5JM3FC3tLawP5cyuW3zsmbkYacVltRRzwHazubVfUzNZSQ2LejvI8vXatDBwuNSgaia56P
	iSg24bBCGvvgzR3UVLtYS6vk0FIHcl4wLLXwXnvVthcEYUNyD/DPIf3qR+8MJfEvjHTFx04U9Rg
	aXKmd8CzOUErHGNhmLc+M6x36/vWlUhWlt3Y=
X-Received: by 2002:a05:6402:2805:b0:6b8:7775:515b with SMTP id
 4fb4d7f45d1cf-6b887e52cc5mr201512a12.8.1794942722510; Tue, 17 Nov 2026
 11:12:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org> <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
 <53298044-3595-4231-a498-d78052799727@kernel.org>
In-Reply-To: <53298044-3595-4231-a498-d78052799727@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 20:11:50 +0100
X-Gm-Features: AclHuK_tAaAmV8XPp2n_nIuVB_4g8FKHhKrmOBsZ4DZheY4_R5_9zza4TO_AcK8
Message-ID: <CAORyz2J9HrKr5JU1rigB7apEUpHg-P_ke=STWz-_sn64afqQgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> bindings and DTS should be complete

Thank you for your patience, I understand now.

According to the current mediatek-drm code, aliases are not really
required unless there's multiple instances of the same block type [1].
On mt8167 this only happens for the dpi1 block and the rdma1 block. It
should be possible to introduce main display support without the
aliases with a couple of changes:

- rdma1 drives the secondary display pipeline; it can be omitted from
the DTS while still having the primary display pipeline work;
- dpi1 is used to drive HDMI output (not upstreamed yet). I can omit
it from the DTS for now, adding only the dpi0 node.

With this approach the DPI bindings would remain as submitted. Once an
appropriate mechanism to describe the blocks' indexing is in place
those two nodes can be reintroduced without having to change any other
component.
I have done a quick test on my devices and the approach seems to work.

Please let me know if you can see any issue with this idea, meanwhile
I'll run more rigorous device and DT tests.
Thank you for your help
--
Luca

[1] https://github.com/torvalds/linux/blob/666539eecdf4db623f5e3c3e55cf9f2dfad24aa4/drivers/gpu/drm/mediatek/mtk_ddp_comp.c#L566
