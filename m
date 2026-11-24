Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551222;
	b=IYOrukmlTMhePBGSYzKHfGlC1ZmjkI3dFCwCRpmHxeqPPEUoX1NZOqyfGi3YXoB2u7rf
	 AgR3nLWBTNKn3AtzFmvlmGUJs97mwVykxZYBxTUyZbYRbhypTGIHGGbg0mAFvFfInJY2e
	 9j+XpgldnjmiSr9BAwLnCiOzOjIcat6/CE3/Vw0btvc8Bzn+UnlHPVawuBLdgiysMHhmU
	 6dgq4bqJsiTruvWXi9/jNAzSsh6BAfxljc6uH1uAnDjFljqwRpl2SR5Gj2WS1AmZWgHYb
	 d1LFDAMuo1pHli/5CqBFAf+tYdmvtuDsQfeah3E4vyQZcx+Kpqr6z7yuyEAWgSegXag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551222;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
	b=vhTauY8OPAkdFQ+d/XK7S6L1VxVYYeeoW+c9yjTAg6kfZti3+Fj/qKymo1+0sf7Ciqa3
	 J1qD+NAjJvLul769FzCb/wbbPeFqFWaRisGOdqe9ME6S8e1gbJm520NuxEYYVWNlpgfd8
	 ptDVdFdaKBzE4Y9syF8QX03F0o7XNfk+gZFM8iNupnfHXJqBtEbtSCYE1XmRQRz8xZaND
	 7JAQahMvE3jW4ounilsEEeQySD2fS8/M+VsNQSSDFXHQCcNavX3kgg4dBv5Ofu/+43O2z
	 85UCFgDF8BiWt/dSokdjRuPvE26NM4EXP1wb1gbvuTzTKy41uAVPIWSBYICsRgbUWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cBUMUjDG;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDBD606A691
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDBD606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cBUMUjDG
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2381248a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551221; x=1796156021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
        b=QnoXLK8+WsLy2ksTb1LBWzEF7ZMlcPxj2I8SoEIrMwQy7UTN8YQeS7rtJ1HoRJs5gF
         KiZ6WnXFQ6NGS37ws1HllXX1cgRw1OQPxBjsn9fm8tqYzfoOJb/RMDzIlKMUUlwKVUDx
         y1Ew0ES5zrVDdkdjg0TPlYUBvG9u7/Jh5PlLo66fAu27hjoGyNnqAHVqtDDaNAm0ZbNT
         mTV4zo+qXUKUOH90+9amF1xi2O1vjGZvG4M+l66pVva+hsvoOJG1g8d+Etm05XaIesKN
         yoVjmFfS8Z9FvZjCscimUcseuXiYJOBE5E6PBaHp51l7hus2DzgLukLVUawi17vqXPjZ
         G5qQ==
X-Forwarded-Encrypted: i=1; AL+hErFut0CzsiH2ViAZO5gxjxuJi3akyrTL6HsTmZ0eEETO4XKFC8EPwefRTACd4A1eKwVBLOMtMIT79p09Sf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xtve/DQ4qoJywvYPKjdYso2zGjFzZHDuS0ymcznLdXcCdqEnJ
	7AWTS5UufW/l9DdSdQ8s70T3kYGWTkgylDZcOKqbBJd8dlW5GyDZqaZiCBRGwdonwJHXB7I6NvI
	53j6yThSZ2Ktu88t5NmZ4YtO/gkrFX4asebYEFpp8V9nqi1mYi//ZfP6ayPLHpktZuFUt+3Rylg
	RyboqoChcTPRY7XW4xI+K8hwxZpAAsDnMsBKP0SAkh9K+md6PL/bPHI1sy0UyuXdJQ3YU1/FIt5
	AZFT57l3JfqxDWVC1wL0liGnw==
X-Gm-Gg: AZFdTZdqjYgdsSpoPDVV2daCNQJR0GSmE4X+eLATWhRCqKuUg8wUYe28QCepoHLYF4h
	gNLwSK+xplLpK1wz8/EJgP4BHnA5DQdPZEvaFBSG1KMGLNT0YUPqPJq0dBicbqjZBpD+Fu+p+Iv
	jaH/Dp14rWmocPOqHsp2nVChG+ASr9w4yN8vSgfXBL73tvcGaOt65ca+7tbywGuDpMpRLzcRr0S
	LGGKCokO5LWKBoRNvv1Ew2zmE9Niw4wDXDdljIsl3sUex0jecMabEt0jxDmxyqLuptnwDFUmF+g
	HJG7ZboPEVIcjIfmr/S50x+oRZfwpcHbfH0ZGrIkES1EarvBGObE9HAnNiaeLXV5Hs526lxGeme
	cUzk3krKJUE7cjq90hHqd4JzTx/j9Z4klRbRZrK7jq9e+p5kN9ZiQEJ3t4DmqSh99Jt3RmI0r3l
	muxxpVo5BXVDfcCDggmiU/L8+F4JPwQbGM0tiJh9RrMA==
X-Received: by 2002:a17:90b:3d92:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3b41c8dd1a2mr14890958a91.15.1795551221496;
        Tue, 24 Nov 2026 12:13:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm11064988a91.3.2026.11.24.12.13.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so33806385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551220; x=1796156020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
        b=cBUMUjDGMLmrzZrsyp3N5M9LYqERAkiUr+7PQpbFUrLM6AL378G/WURo84inu6RViD
         2ycQ6DK05diIn/cadN13q1dDSZ4jLXGWmcI1UkeB0nESqZ5yiDZR56cL5yZ/pjd72l2/
         yZJoea7dPG8iFHdIwG/6ch4Vxp8wWwq9ytdIk=
X-Forwarded-Encrypted: i=1; AL+hErEfjXmM27KciuDZPT4ciCHVlu/sIQlzaPMm185VS5fmmWld5cSXziPVymbWTV1wqaVNawjOr8Im+6S25hI=@vger.kernel.org
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr2866153085a.46.1795551220197;
        Tue, 24 Nov 2026 12:13:40 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr2866149285a.46.1795551219842;
        Tue, 24 Nov 2026 12:13:39 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm80768285a.28.2026.11.24.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:39 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Tue, 24 Nov 2026 21:13:36 +0100
Message-ID: <20261124201336.3493037-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118141024.92354-1-dev@deq.rocks>
References: <20261118141024.92354-1-dev@deq.rocks>
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

On Wed, 18 Nov 2026 15:10:24 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK and, with "sae",
> NL80211_EXT_FEATURE_SAE_OFFLOAD_AP. hostapd and wpa_supplicant then leave
> the AP side of the handshake to the firmware, which doesn't complete.

[...]

> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
