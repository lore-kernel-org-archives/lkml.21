Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551260;
	b=n+FTBrr7380OSXz2Ehr4kDz0sF1A7mRDOOnbMetsk0X+qo0Ub6yAKHOdzF3P7u32tgsB
	 OtFhbVvAI2xFKncK9T3TB8N8MpRfJBj4YuUEjmU+unH2yWjG/14ClckDr7e8DyUZS7cve
	 O97bCW9BfcrPoQE5g875vgEGhezJ5T5G/6nZjiPybvvTsS0vLs2oFcRwM9P6BiP7hGJ+N
	 uSVMTNHihtZOrj2pfolYgcAXIFQltZK99QdHFA26WfIyqzXvysnmcZn1EUj/Ek1TI34Nr
	 wov+nE4enyh5Ien8jujw0chwpaR2HhixBPAuXessrG4vhyBgCiLCC9GP3H8HDAfTRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551260;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
	b=5lxZr9uW3LKnSl9q5eIJPtMyPUrgtsIOksnPOk/I0xfjTLDyXB2HnJxu6zdGKi3Ct97Z
	 r0NN+xNWYe9ZzCnDYK4/KrK+aoDaUJG8J8tSWkblDNBc9BzetbTlV/0H1zq99aAYNPYUZ
	 OdxxCsWmAZ7LTileetk0Tjrgfj/PpCIqUnWOZoDSSYjZ6Fy2fpnMuMV0n4MjZZyovdAZb
	 B57gqD2HKYDVXKS4j3U4MbWWE6RffW070k8uYsqCN3Dw3BOEKXNE0he42zJo3p+0Pfhtk
	 N0XvqbL4mJYPhU/wb7//4YrunyYp7GrAnODqyZiO0anKsoeFRRf/yrcBxx7jKXaxdmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbbfkcCM;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF288606A6B2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF288606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbbfkcCM
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso1959645a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551259; x=1796156059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
        b=PmQdjBHuj6SSwR8tjC4N90ciH68AkVL5woe5K4tNrVOXDaeCdckqMDvk80STA8tpG2
         RxcjUit3jkXT0+XmTTNiSR3/mGhHXhi+33AzALmjgBbLJfUYKPCbjcBccwLfAijXuE4i
         9GscoRZHGAXnZyffxeZBWdQfwaWhBRyMKVgtXkkIWYS5ghDfReG94Kbq/e95RFpCGqAr
         q5/zGet1DDa/NqCkkhstaVcgs0qEPbOK+mwvTx64gx4AxEE0gbTdfPwzd7ZY4IZZzL+Q
         Q70e/EPEIoeHNLAWCGWh6GXKdeA10qlrXUuMgkzCOsnUMmdkGcjyWPDZkN8H/NA6i7s/
         D83A==
X-Forwarded-Encrypted: i=1; AL+hErFbN/LVSxcCyIfeYFzG0KoFuMeakrYWjumngwkO8WMB++nxnsER5OpxpUUATsMux69lPU3s9CwnbdtV7Xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r2/kj33H3gezltl4CtvEWNheah37H9dBI2ZyCFdEvRPlObZfC
	8ds0APCIqhImv2Be3sNENJYjuOdw1OtKPAYtTUeVSbNMTGrapEZARJ26n8nhS10+I7tktjcJ1nc
	xb6aDAEPP8sZLxjOhY8to6H9B65xMSqLodxVcbzJ3iXqzhMln4PMqrEQTCTzC906+6yZ91/mMST
	i5AJ1vfSae0Bal28Qk0cg4gGbp2M7V+tTeQ//xldoAglweRYZybwjsQtcri8213z53LVqHd8daW
	AxXDiAXl1JdmYHWmZHyNFU=
X-Gm-Gg: AZFdTZe7mCqm4yfr7b4n4JNxGTvdyYvnowxQ8XM5T/dzY7J/Pd1dtPLN97ydXOxD2Vs
	PWfeiaGpvuzrx3jDspyK26PVeZo1o8QGkYT0WH0k4eCAUjId7iqsVVkHIcrfCjFfrNcNlTsJL/P
	FC/9rkGBZJz6gzlCnExfW/teDgG3kJA6O98nGhkpv7J+MJsCMl5IxzealGpUKGADC/4dgfzTfb1
	89/7oIbsJPSFvt/dQ1v/jiAQCafBHeEacdEDdUmTmbOVrl3Oaglb3osqiP/H5Rs+wj/rQSmJUpM
	vukOI6bCidkVr8mFAB2atwf92nUS3kl4EXyHncM7b6aUzQ3MJm5fB6gNlGPVUKkdWVxWMQS1Zi+
	TxaRiJ2/73wdhmL8+L1iAoVCzSdZeNRnLSmKkPNjBVHThmLEqM8/QX+b4yB22DNONtIkaOTuR4S
	XfF5ztl2sWGrJm8ljyUx/imDa+j684BUqjuxUfe58=
X-Received: by 2002:a17:90b:1b09:b0:3b4:d6a6:e5b with SMTP id 98e67ed59e1d1-3b4d6a60f6dmr2504899a91.33.1795551259162;
        Tue, 24 Nov 2026 12:14:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffed164sm5156943a91.4.2026.11.24.12.14.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92114c39cadso93647006d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551256; x=1796156056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
        b=BbbfkcCMYzwowtg+cSH+l8MLWSBokcmpoSHueXc3gv3ApTm1NApN4TXvxK50UpYxXw
         WtKiZsfD3TNGvS7IXGcXarIxUGU5OgwQqRo5UvIdMNoMCK7llIiLUPO2PN1Foe1LNSTs
         BywoHox0a3hT4n9eurhFhO5cu3bZdmqgMltBQ=
X-Forwarded-Encrypted: i=1; AL+hErGIb2iBfc2ZHtFw+3yT+WVSF9GEvaJ18LTHrVftBcxjdSaavr+0uv9Krf299g2Dff5cxw5XLgxCrcDrleQ=@vger.kernel.org
X-Received: by 2002:a05:6214:2dc6:b0:921:3573:1b25 with SMTP id 6a1803df08f44-92135731bb2mr286489246d6.27.1795551256086;
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Received: by 2002:a05:6214:2dc6:b0:921:3573:1b25 with SMTP id 6a1803df08f44-92135731bb2mr286488826d6.27.1795551255663;
        Tue, 24 Nov 2026 12:14:15 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:15 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:02 +0100
Message-ID: <20261124201402.3499613-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-5-rosenp@gmail.com>
References: <20261111042554.232998-5-rosenp@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:51 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated default_bss pointer with a
> directly embedded struct brcms_bss_info in brcms_c_info,
> removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
>  .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>  3 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
