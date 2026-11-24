Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551241;
	b=RqTNBKQFPzeMYINOhjTGbdq5YtOrPGYlFeyYIBR/xDcbsQwAUdhyIWLoxnspGbIbkuJa
	 b0qjFZapcdz7DhefvLyioYxjOXzNGMBPk+4TKcgXHs1DyXdLw5zFx/iobkdYhQ1+36iwq
	 FPkFCc7Tre5BT8NQMxB1z5rPiFnVU4duzq0aeZ5a3RK069GELHv1a8oMxBvIoRvxHRWxy
	 +/sc6mg46FX8mZaK+6xZPXTCutS4raN8CAOuvhL0i4u4zSDLyPiRJU3xPtT2QEORXCasR
	 B4lhUzE4vc7zd+JYGg6URPZ/wYBetfK0xtVdM3CIkm+pTqBYg9B6yddR9SISqBh+v0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551241;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
	b=GKJlm1TBlnsPqhLeuX9Gjd3Wt4WHtX3PlaKZCFr7wE/Tln2LDMstYMDAI9lwOLAPOZ/k
	 RphIvc24qpBzbWbhebRPj/s14RSMWq0hfp0GYDzNJfAu1NK5afwtwbFBRe2jjgP7kY9Nm
	 yqMqDWEcAGfDCxckNYStO9iuBaK3yZ+rSpBt5thgn2IWVgeMGFqeWw8qkqXK6B20RdR2y
	 eTXuDSkeqRaW1Ef40nA4zoyj/LfsxR7AGshNJz5esO70P2bGyN5WMldlj8/y0bMKzcrEM
	 C93O5VdG16tE9vGAiCGr8Ofj/5jIxNMmMBX0VOOTaRvowd6VWud9tGU21vQSJlX7Rvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="OpNNE/2B";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CE7606A696
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CE7606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OpNNE/2B
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2095789a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551240; x=1796156040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
        b=drZNH5aVwRJb5NPBMzx5Q8Hk/ZIZyP58yexhR6MRGzZoUaoAm7nCMUBrR7ls+i0TYP
         NpFuy9Il6YkGw/ZAr4rAyUeBKQg+p6U0faPnnNiGOgGqVYKoI8yU9r4WQ4wXAcs6mDla
         T4155VrKSDCdVO6lF2p3oXmQ6TT8iud/NM0h9A1uJnitsO3Or4uM9DdoDlbXD6uu1lSU
         YuxEsdOLo63cspv8EU1hPDFrTegucEjfgAM2MMBnKGkdM0eH1l6YDO0vEVN4f39ZM4jl
         AA+6SJUbW4BXAc0n15CAcX3t543MsSQWY4sCf1f/BEmiT+1TfEUcdDHAmVHGBhQVI+2C
         Wjsg==
X-Forwarded-Encrypted: i=1; AL+hErFyHx8ZeVek+o8OTuKl5wSsI7zvNf/IgAO5fF3V8pEA9UIEwcbwKF09zyIoCk9PGJTGYgkXAe5tEdAfHBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z80O0P5YKirAx1rzdk62f0uj7o6GQ0i3TFqVP24OCZM45N56kA4
	ouqp0X4k3XDNhN9y6mki7cCpdrfNdJ0poLgJQN4TJVepgITsEsRx1wkc1tjl8r4zLmRcfJFvR5m
	sHvXvbyEQdWhzDVycgMaVa0/T67EDTp8xFTvOTO5QNoOMHdWz2ubmhQXcthJF5FVvUiR4Kucohi
	gFKQOfH4ICJ1gSKfMuMvc4AIwc9IClSBrf7SyNIRLPeNDWGUYW88xcevdJZS1RIXr2PbbSTL3Hm
	ARP6xNNTj2TbsdOXDow8CdzUg==
X-Gm-Gg: AZFdTZedvHotLBrBRDk5jLqGlWZFNBXHycCcYwQ+lrjVKoSDK+zWivBZkoK8YhGJHS5
	gz46XwTy75AS+HSdqQyMsNMuQQI3GRtuGQrUlyf2y2v1BiL+QhSTN9IgTQNgEGEAP422Pu48vGz
	xG6UOO2Pkgj7CGhzIrKsA9o4ephDbWalKLlIoV0OX72dLmkOTt1odP+e2+3l81f0T1iexo6fB5O
	H/KE90I6dJscM+GLG0w4tnL3aY8/Z+d/TyEUEjnxJZ15vVShAeRmc0NbppJWRfNQk7NEXKMxzYr
	1+Buy0QWY8eURuEPeelRV5edCs4PQe6ff+xV84xU6SNk8w0QeVBtRV8FZJyT3BsNkbJE84jAFYk
	IXm2lp+/ACBaOHx1pSt8Ph8PmE7Oay96GF+vWZwVwSx/MOxTvobNkIujR9wWEqD2lSz68IRgk4e
	CiQJYTWD6k5ECdYLiAukmteaVA+6tB+dQa2YxkdWk=
X-Received: by 2002:a17:90b:52cc:b0:3b3:fcd4:36f with SMTP id 98e67ed59e1d1-3b41c966a8cmr14838696a91.43.1795551240099;
        Tue, 24 Nov 2026 12:14:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d683sm12213231a91.3.2026.11.24.12.13.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c950b47ffso79243671cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551238; x=1796156038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
        b=OpNNE/2BchRrdz9FDDWkKh3eOdzGa7fjHIO8McNST670TnnRasXfOtdWwwzDlTBuqQ
         RaGwEhobyJS8y8PDxzXkIpV0Oey8YfaQLbKEl7qMrFpBNvuL3AKsG+zKwa3gWcxoCkyz
         ZULvSiw7nzwQPaZMem8tfONg7JXwXo0tPt8KU=
X-Forwarded-Encrypted: i=1; AL+hErEUcyJVCSk0BlSmYgvf12EOmSkGBm7EW8sEmuHOIeklFJ3DWSMlpVrdTquoGxAZHfqcS6DiXoqADnCzUD0=@vger.kernel.org
X-Received: by 2002:a05:622a:1909:b0:55c:a104:ebe2 with SMTP id d75a77b69052e-55d7690eeb1mr297462181cf.9.1795551237808;
        Tue, 24 Nov 2026 12:13:57 -0800 (PST)
X-Received: by 2002:a05:622a:1909:b0:55c:a104:ebe2 with SMTP id d75a77b69052e-55d7690eeb1mr297461581cf.9.1795551237281;
        Tue, 24 Nov 2026 12:13:57 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm136149711cf.9.2026.11.24.12.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:56 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential use-after-free on monitor registration failure
Date: Tue, 24 Nov 2026 21:13:54 +0100
Message-ID: <20261124201354.3496134-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
References: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
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

On Mon, 16 Nov 2026 22:13:24 +0800, Guangshuo Li <liguangshuo@mail.sdu.edu.cn> wrote:
> A failed netdevice registration can invoke priv_destructor while
> cfg80211_register_netdevice() still needs the wireless_dev embedded in
> the vif. The caller also frees the vif on this error path.
>
> Install the destructor only after registration succeeds, as done for
> regular interfaces, and leave failed registration cleanup to the caller.
>
> This issue was found by our static analysis tool under development.
> Fixes: 20f2c5fa3af0 ("brcmfmac: add initial support for monitor mode")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
