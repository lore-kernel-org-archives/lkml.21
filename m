Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062561;
	b=tJramSd5TFN1ZTbGPHsFuU4Q9Y8KHg8fp5dKmghtFmJcBgo9U6UDnG6PIAYcyBT533Jq
	 VK1yOfgUoCa5NQRHlhqJ9JcjikvAIKPF6zIiIq95tS9pEMhFFKOJIvWDje/GCEHitcupg
	 J50n1jG4gxzD/Lh/dqPcvltWXkHz69cg9NyJUDjku7wbZN5cF1LhiNdHpHuhpWu3ReP7x
	 c93QJ/vM0Uu8UvkNczq574amJ0BidUqFf5FVNgztQ/mXKvZcetPhymTSHoWpJtVwNAWrR
	 MwLLBzj2K4adnVTnI7eBCpkqlBypA9Ml6LE2J4jMN0p6fERvij4AU2rYmilaOfVMbRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dCICOQDRVMWPO5nwEzDmnqXj88ffqAN3Sthv4ao13Hs=;
	b=PkaT0zrkudJakt3aOKqVbC8ko4oW+iZ5AOrhgbnYiZ7cxXwRkx6xAY/Fx0RTzO+pjlLI
	 38GByDnaocCAZTB5MXOmg5OOIq99GHOHJwsWxeDS4BD0Wl8PTrDGd/5X3ja6ebJTD7Bgg
	 q04ZvbLnp5WT/16YjWGts/hQQ57ZPLiJ3OCdkZ9AQhsntuqVvHfVK+liGcJ8Hn36myovT
	 DJkux7QYsNKNLwySzsqLTMP0M99vxpwu4ngg0qBJsQD2H6sI1+dDqgHzXY7sM69Anr4P3
	 REbEJID84TmrusnGJZXzs9UGhi3NhXE2H3VlD/9FcZ5C4w8kLy8jc2UGG5VHsuwCsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Zq7L4T3J;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E9606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59E9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Zq7L4T3J
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f00fc215f9so6926625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795062560; x=1795667360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCICOQDRVMWPO5nwEzDmnqXj88ffqAN3Sthv4ao13Hs=;
        b=Zq7L4T3J8M42EFfoxkNRZCacZXcWTgN/kfBStmAHfA92PN3CWDZ15fxTLn257uEIfu
         jZz7TTlyUbIsW+hz4oljQdAXyxU5G+0KQMiDhorTmAwACDLQogma/l6ndlQe2OlzEF5C
         F7GEhB5DQcaD7uzwPIJZnGdQRiQLMeasgf7eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795062560; x=1795667360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCICOQDRVMWPO5nwEzDmnqXj88ffqAN3Sthv4ao13Hs=;
        b=qpAqovZ47dZuARu5NE+QdeogN7AfCXOZfvZZCsmperKS+wzygzV6QGOLRTlbQ7pmHc
         AR8rp1kYuHcjku7DNjm19em1ggz3I/r3yYNy0YFxF+H8rj4OXVeppaq9egBx5TPzOiUE
         nI2gUVWoE6SeoDIkjpWpDt50IQoAln86NgZnT0J/Ow8pilvEs1ViB2caj156lnw7CfFg
         GoxXI1WP8ALaEyR9bnLF3y2RbiP8Jny/wOmNL1ZqOABJAHJx7KiBN73SKgxxt+IzgcW2
         gnQqU/80BQSB0/DVyqTo3lbNEH3ZWqID4hTeLb/pKMk+OmkorgvLU5ElaklPxcew1pOb
         819w==
X-Forwarded-Encrypted: i=1; AL+hErGWVo/Pm08cEzUIHXmCxHbXVkZPsGc4B9jRn8RWkZ0siTs6C03AIfgMCHDYyrZIAINJZkaUwFS46Vp1ntQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dh0dlPoy6sihrU60BcYONpeHZuIwJZFuJdf+g8o4l9xggoaJV
	VbWqa0AhjlTSdZhJHI+2GARvTYT8v0qG9ZLsJgSFCIz6OlGOFjJGkhT0JTjcpo7msA==
X-Gm-Gg: AZFdTZfg2V+mNuwem0nrra1RQyOvlLZ0JHddhPSJvpI2rjVlgo2h7Tln9FSit1NSZut
	SGCz79Njg1Ywa2ESG4JOuUuiYsm4jzjvkrW9EyU8DyKFCO1dlxTSQufp5EQBactmRjbPqBn5SVz
	6lvuaLdoOB+m1JqiioHuKQ5XxBwcTvb87PFVoZr9uLfroXK7mmN3QrDVgF4MrOPrA8PksyhzQr6
	9/PuHkdAZnXlDb0yrUxTFZtiOWatiEQSSzxmWXnULe6O30oMvpd9jk08jYOEeW1FFLnyVguUBek
	9REOcxjDVebf3tdEiePpPGlhlx59JUys7mbaNV6+pkRT/7ViS6xUNQlQ+9TlBfCRnmACiSm5cjo
	Tl7ZvPIli808YvEKKDoBBU9NmSe1XMmSNO+BlHx4tIKppKmvxU7FGVY6cz40rLwDVsX4H40j+a4
	P2U6jt8n6Df8DwqMukHVzkUct8IplYUc/8zNFsbmY3X/VjRIxaw1Nf1mWpFZ+ncq2w8QzP1nDY4
	ZA6ziHN506jmbiN9Q7b4eQl+bid8KlsO/fnqhQUoGzk9Zx5hnacXdtTZO513KuXvbVSYYauyyLB
	nTWNpujZ/KVz0hqqT8YvQvZTeHS3c78FRR6a9ioULP6kV3RvpSXw7IfbxVa1rx9hc6INtw==
X-Received: by 2002:a17:903:3bd0:b0:2e9:5829:9b48 with SMTP id d9443c01a7336-2eff72ea3f2mr42869015ad.20.1795062560125;
        Wed, 18 Nov 2026 20:29:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:9297:4989:4c44:dad6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ec9cd0sm23174315ad.11.2026.11.18.20.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:29:19 -0800 (PST)
Date: Thu, 19 Nov 2026 13:29:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] zsmalloc: fix SPDX license identifier
Message-ID: <av56Sq5ZxntVn3al@google.com>
References: <39f6056e0c8834fc3eca2001fcb44f3b6048f74d.1795061575.git.senozhatsky@chromium.org>
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
In-Reply-To: <39f6056e0c8834fc3eca2001fcb44f3b6048f74d.1795061575.git.senozhatsky@chromium.org>

On (26/11/19 13:13), Sergey Senozhatsky wrote:
[..]
> +++ b/mm/zsmalloc.c
> @@ -1,16 +1,10 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)

So this was introduced by commit 91d0ec834786 ("replace kmap_atomic
with kmap_local_page").  It doesn't look like I have reviewed that
patch [1].  Somehow.  It would have been difficult to spot that
SPDX one-liner among all the kmap changes anyway.

[1] https://lkml.kernel.org/r/20241001175358.12970-1-quic_pintu@quicinc.com
