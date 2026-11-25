Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573927;
	b=vojImpf73NEprsy+K9QNnwA8BrdZxw/fwyD9oRcKpyvJTMJHMFTR3HjjVKjiZkQbO1xG
	 P2WAm32MX2Y1kEU6lAYFcnptXAHLnv3VEalnjR0WtfxAx5Q9kbzTILVmC53kVLsVXsdkT
	 0EEavFT9eTWBXnQFXPuYdWVKmlVn8YuNGMV9UF4iY89fD3yzZo2H18NPIae7HYpal4Tfg
	 vpiapTHRx1gRoGpQ3D7Tr00sTtpKASzLY3ikt9APhieNQMrYH680n+4Pu5YhNXqQQ2PZq
	 28msdKkBB+iUIe5emlqEMT8CC9EQds3Fq2pbKZCY+rdT6Kx3hwebJetO9pcneBXe6vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZkakucMXa/GLA6c3NEIv0nalbNEBO6xsvd9bftKJ/G0=;
	b=aRDY2UIpJyr7uamCRbDwLCLRenzf+nJHk87bPUI4mIrDfGzq1i57cXUYmTxV+CWxz+h0
	 KrZTkM1lDEOuoGY3MsfPA+rrFY1sVudB+SQASk9ZpdZ6mK1GJNwpPSjtlLkfy/kjGlSTE
	 griUFff0598D895jjzPLC5dIM5qW+z2XhUiLgsuzRlEfB/nvvPugOukE2nzD2/hlLnxCJ
	 amuh3VK6XnlU1VlA+sv1VsBxmQKgA5w6VIS/7iSScTE741bN2vwcb+V9DtS8gg6JOH/he
	 /qnTVr5D4AnjTjZbGvP8XIPGKgk0qC6kOhC5m9QkmdJGTvrBr3rHjMz8Qilez0NwgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYJ1MbM7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYJ1MbM7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so10520725eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573926; x=1796178726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkakucMXa/GLA6c3NEIv0nalbNEBO6xsvd9bftKJ/G0=;
        b=fYJ1MbM7KOuGMRCQcWCIqbfMFOr2CUQf/B4ldHnewSb4cE9+E0UiaaU/soSCEPq5Dv
         QHXY0aDlp0D/RDykZzPagQjfF3Bb1TR9D2HLkw5cJJa/RI7l0DS8rmtLSYn372k7W9pe
         FmNcn1v4CFhzOVrhoyW5ihXGylpn8ajH+Gi68rsERfTmgWWfxZocFIqUdK/cpfHZx5RR
         Qd/9xyIg7bE3k5+roqXV1QtL0v8zpAJgszjD3SAefDRhLZsZhhB+FF8UaakaZ0t5dFaj
         FKHLBCZNs1EevVE0mbRaQ/4QDMVCoI1rlucSesLMTKQ638Z5qjL+UwbZ5fZF42mLQeNG
         jbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573926; x=1796178726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkakucMXa/GLA6c3NEIv0nalbNEBO6xsvd9bftKJ/G0=;
        b=QDOXg86/czgDP2j2xhnQGay3JW1RHi4yH0Oa7ObTFvmjtudJkE08Yu4PNYWjEGJ9ou
         L6xW4BeK/1nWSnYbrUebG06vm2YhhTUISSXHYBrTp0I2nbebFGcqJftvMdVfffCWAjew
         JLCw0UjBYTWUFWYdIMxzGL2knVrUJwNaiezBVkkOb04kDPuj4yzNQoxMm0oALcRWMnRO
         rSkaxYpVccv0WUlIPqgL4JavRPXDWBGP5bDGBkKQEnpz9VUuBwTfnSI/tFoEnXFplPDY
         KRLtXNG64U2Ax41bT7Ir4TZH+/hTdhtdDJPfZEA4B7eAeFQtGccfimEm6fXFoqxoiSIq
         2P2w==
X-Forwarded-Encrypted: i=1; AL+hErEXyaNOx5+XpokhhKu305a3u3n8i/Nl+xqy9vmWn+S59VtIUxzKWS6IgzDCpSZLjztQaFNIJ+ILsYwrT84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NXxJieNo4BZQIn9We4DFEX94/NDHjMnSFDeJtMb/31jcdplW9
	LnJ9z+x4+iefG8CrmYI7KgnQ8fj+CsxCTh82AsWxEWdKncjWDEVRDTwA
X-Gm-Gg: AZFdTZeBDh+oFQVN/l4iOMknkOTzJ+wzThGNwNbpQ49j7P+F8i4Htcld+fwC68A1AZF
	ty8LyEC3q/1tgknpVmNvY5c78W+JbvXpnY5HwOrDcWaedV5Nb8U8jbEkrNGz0sACKWMxMBQfOPN
	NRzrZanMVHWkUHl+0cYV6i2bzbdIb9rmHtfGAG5lpxszkhtEsWS2kvl/09HjaE9sX+o3sC4xNuV
	fBXw3Vd0TzmutCgf0i7SzyvMQBXPUa79In6kLuYx09DiTe8V+VUxYW3bbUvXpeCJnsRu0ZMffZ/
	fZ2NTVjE1r3qDvGbzZX4jwC5Pf+BHCAWK6RXuJIM8WK2v/ggA1Qxc+pSui6X9v2VqsO2DXn1LUj
	7aoJkD2R9tjAqY0YQxOm6vnHI9q3R4t6EEx1bSBDFjAX6FFScsvJYAo2mJLUR7Zv9+jO8gnFUZC
	oxBZvtdkFOKO5Q5VSJAehpc4ocHupv41ueVjTrpXD1L3/Ld8CWkDfNevm9AS5wMuJoAVltSkN9f
	hIMX787C5xFzEmvh+DFdIC5kvXA+eUUrw06Df2H/5wtjeu6Ux59MNo9H2xvAxai0KCJxyfhhrdB
	cT/ZmntfKpN6E4QTYWWGTTocUd4Li7VZDjjQRyhxBg3RwxsyP5+5NGoqkTntA5Y7izNMo0Q=
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr6055021eec.40.1795573925600;
        Tue, 24 Nov 2026 18:32:05 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm50729285eec.12.2026.11.24.18.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:32:05 -0800 (PST)
Date: Tue, 24 Nov 2026 18:32:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hefei <3066883572@qq.com>
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, conor@kernel.org
Subject: Re: [PATCH v3 5/6] Input: add Jadard JD9365TX in-cell touchscreen
 driver
Message-ID: <awZIEjbpVfVNoc05@google.com>
References: <20261125021127.1430-1-3066883572@qq.com>
 <tencent_03FEA6A02E8E137CCC5AC97E6F118A3CC10A@qq.com>
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
In-Reply-To: <tencent_03FEA6A02E8E137CCC5AC97E6F118A3CC10A@qq.com>

On Wed, Nov 25, 2026 at 10:11:26AM +0800, Hefei wrote:
> Signed-off-by: Hefei <3066883572@qq.com>

Spare a few words (or maybe even a paragraph) for patch description.

Thanks.

-- 
Dmitry
