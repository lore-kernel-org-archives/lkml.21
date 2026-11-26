Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663405;
	b=axg4C5yrZImy4Xrh1ewW4ab8u/NfFcn4DJ/f6uXMsxI68PVDCfyq2S2lqhk8HnUdLhWN
	 rMKpinaoQFARzce0Qc2TctmIx29r9v1s9oqCftHpefMn0kovHWe7BB0O+BwllA55jJ8oq
	 b2ntPQTv/9iBE9e7NGGNDv+K/R+sMJmXewcWIejrxgBkUcuOdRaMq0uh90yjVxoDLfj+z
	 FVxoEs1W91rJMIblf3biBJtXQvynbcSGV+i5hEQFd+5aEGMj8ZNumq5xWQYY43jRepuRI
	 NQ+/1IJxPyP3sv3fUTai0cHLZNIidwQ0Ub8vIF3g+ZLnrrPpa80N6XmIQD1JTWKD6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HtWcfzq6QYRKud0neDB6yUmZQgDuRRFbJcQVKQlnPhY=;
	b=DLwhVub0kzJKYLcjhfpna+dsRnCAThJp0JK6AMtulgw5VZkkDf1ZmUeloWn64hsWHfwZ
	 JsDK35c4sHr11HAOkCGQmyS5FZx+QmLB3HwNTbSbzx/M1pAmGHR0NEAxkQjmfBPp8hJWb
	 ORgsJUfffv2HPrdq2BYCA14sHH6OgrjJaT5kLxt7+V4Yrn2cJ6GaQ7Wukd12xI5yNQ43e
	 DsDsMdrHUed5BLvkFKAMgjsGTv3twZkbalszxwfLTwq9j1sWXmmSGCb7dbuaso8zfYQTs
	 jtid1FwA75dtdMiSpgMiaDF7JEEcp/PykfTHk3DWNbdoMtm8o1l0lLvi7xa2oRSCkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZ8omOQH;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDA7606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDA7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZ8omOQH
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b77e464208so592206b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795663404; x=1796268204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtWcfzq6QYRKud0neDB6yUmZQgDuRRFbJcQVKQlnPhY=;
        b=MZ8omOQHP+4FtzemVgluZ07wogDoVxnEWU7QChkmcm/I6PKG3R2Sx40QVCkasgkmvR
         k13Gpx4dEKzkvwZA64ZgN0DfaVuP8PAk1Fkeg1wtrtUewQ66j4Ju1z49G+gfiboOKgjK
         OplyMiqF3oaKbYCHT+RaW21OFvkfl5925+QnTJYXcBcwaAbbRDdWIJhtfEDZ8285sWb4
         8Ad/EDVAYOuMk5T8PiRP4twyX6+JM2uEe6TntYruNC5tJTnNH1fUlTUADZa+yxTb+Ehj
         +h4255cvw2515MIno6yVFy1RXGzuf2ZmaCkv7vWkeb5jRbGjEZ7eYCsOBll1A1eD5yNg
         pSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663404; x=1796268204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtWcfzq6QYRKud0neDB6yUmZQgDuRRFbJcQVKQlnPhY=;
        b=mDRCEPB/txsx+/HrJNxF0rp3bHTYkKt5EgnWN9EmGh5v77NdzNymf0eSIo0HVuIXNX
         9VJp/AkHOUTh7roxPgoHH/jMqMgKBa63SnKjfRmNMbZWVhVwhZHWUUaUVrtpA1Lpk8jv
         Rk1FnVTCpMA5VzPYjITCNLaDFbjrfldUsKRXNSOWgCRziG7ltk7WxM6ExeAm2HhYpCeE
         PcUIRrpkDqBUISARkTUpx8Agy30XOy5gwyZcgYNvU2ftkFtZd/fD9Q32HV9GJ3Sxn9pU
         gtJrK6czLjzpvS8zOqa4ay3zQQdjSEsXyLyZV97Otz1I1Ic3tVADPuk8x+LyN+ZAYo1w
         KQTA==
X-Forwarded-Encrypted: i=1; AL+hErFSlU1GFSY1yvFUqDIrujt8WXvh2O7hrOSNE0WL9rrIAHX0c264a5FuWvItapvKVpvRxRA9HD9jXo7IG2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XVszYarovNEs/Z5TkTSV4HN3QPax2En4AaZjw1/n0xqTKKowU
	KM43hsnN09sA74CPl7rB3+ftRI1xQNlCOedp+EUIZ23x3dyTw1yuB/o5
X-Gm-Gg: AZFdTZfWjtGl4BkM9Pd+NERJsM6t7GUO1eartUcvXU0vBLlWydr3IAgSl0VDHLSdpna
	PnLN/rlGQaiHav3aUM714SuSRfplPclM651GqTVqtxf96yutu0JOeDw3AGA6nnI5gu+fCj1eVzY
	ol56VdW/KPAyAniXiifp4EZOaEj3mDk3s8xURlCi8vZkydLe7IA2jXb4FFFsaYDEk5gvOfk4Jns
	CocGi8sMB2SbEmR8LSoTcam3beFP3QRFwHeK1AEf5MIyXb5oNUSUiQ88s862pkVxqO3QdDcPSSz
	uRLavfGBOIks98oPSpfOGpCJA9d1SmqBBE4hj4q5uSaK28Gps87QtZWk+wmm1ubNPxbeyMUNK4l
	c/Fe4uHYFuiRDWexe8AyoRjELChJ8oU68fcYJ+PaCiwRns64LafKjMjGXAaHpHYkgxzCglbEQhI
	yKCBbjmlWUu6NLDSZN3sZm0/HcESLfP1vZ9KE/Kv4ur374sOc6O3TAVf2uKN6IElAFvI1f6hz0y
	qd6VBpKSJPzIxwIRawXTihEu++H46nNzql5SgYN00eXsdQY7z/xNXYLK0tNb9zx19kjogk9Lxw6
	IfWot8k5wE0U+z32x+3e43Ely7fa6xUQ
X-Received: by 2002:a17:90a:e705:b0:3b0:9e2c:9b55 with SMTP id 98e67ed59e1d1-3b41c803ae0mr28913249a91.2.1795663404159;
        Wed, 25 Nov 2026 19:23:24 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdea2aed207sm3916423a12.11.2026.11.25.19.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:23:23 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: xiaqinghuan@mail.ustc.edu.cn
Cc: abhinav.kumar@linux.dev,
	dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the first PHY enable
Date: Thu, 26 Nov 2026 11:23:15 +0800
Message-ID: <20261126032315.2226704-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117052047.32129-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052047.32129-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Qianhui,

On Tue, 17 Nov 2026 13:20:47 +0800, Qianhui Xu wrote:
>Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
>Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com>

I can confirm this patch fixes DSI panel on my Xiaomi Pad 5 Pro. Thanks
for your work and I'm looking forward to it getting merged.

BTW I wonder if this mail is ignored by the mailing list because from this
link[1], I can see:

-- strict thread matches above, loose matches on Subject: below --
2026-11-17  5:20 [PATCH v2] " Qianhui Xu

And the mail from 11-17 doesn't have a subject.

[1] https://lore.kernel.org/linux-arm-msm/20261116150334.78710-1-xiaqinghuan@mail.ustc.edu.cn/

Best regards,
Jianfeng
