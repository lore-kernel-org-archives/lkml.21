Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378182;
	b=cJeGmuGrwiBRTZxoo6qDuLSeVReXnEko5rPsumW7WI0iMbT3DmO7+7Cn+cEvfNO+keIZ
	 JWsj4gV8DHhaE97pqpEiy2BdvQ538Y4+9K8GhgXgLrK1FWydYQSCMhzWXLua1mtWGp2ew
	 Q+7Lwm/3eV0FYZzpiKURlRVV7sU4C8LnxEQPpt0TaLBJeLsCkjcjHTTlCZCk5kVAi11HL
	 VT2tPlgNnSjggUoZPRrG63iGevUCTZ/0E0HPETemIPRIlzmTh6FTAlv7J6izwQ1jZY+hO
	 W67Zd7HYu9cYr7/RnWHzbcpbVtzMQ1L74VfZo7ENsCwS/x8NasL8FzSeIp9nf6AmYsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
	b=rxtKfxdBoTSTb6OHApndrW6hHUNlnW4uWKjWd0t47mePbznHDoXfTji8twUur1xTzzNi
	 alUVlIVU5g7HwtHUbxy8x80Bn9dc5s9pgeZfAb9oGpb66DWg8Qc0GC5bFwwjzOMjbbVMS
	 4cXGd+9E7LrRdOwYm8NGRRqoJdLfHiHbTgtY0f1TkMcZOHMA6xUhSSI7EkTsp+hP8ysBy
	 uM0zazosZi6DKPqKoV7QP4WCjnMC4cjd1kiDNDvnjrTCA0erWCzsV5cZ1CeZIN0aKxIUS
	 Xep6f7tEtZfKmC4fl/0nEQrRLLVe4ZPUpgoZ4ukc5gQSTi8IguEXbbOlKO/AZwiIG6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U7q16PjP;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71743606A683
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71743606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U7q16PjP
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1200336a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378182; x=1795982982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
        b=N5cI5Q2vIkypCHYBrj0ayNVO0YZGiyV2Z5xMhXc+giohwbVxpNAOGgMA1inY3t6+2l
         wRp2L77yOeVRbDQxGx41b/LB86C8QZgMXn/S/Froc79bq3oPAYTBwiMrILUsodyObR8g
         f307QIu+sFB5Hi4AuDm/G5XPHk9IjhYTemVAFwQXqKeEXfKUhbRghldCv1Xu/BsKapVk
         FPGZnA95GFNSd7P4Ip9gEe8gqEs4OkcKR8Y5aiNxcuuply0gGINhSbqUmI4PBvnmY9XT
         1Gz8g+GQj/ePqRBM0KUUY7Hys5j4Nrbvq4jZdMeGyEEFr2VocnvoHTesvXsDWWxEDKez
         nROg==
X-Forwarded-Encrypted: i=1; AL+hErG9NN4KktUd18PFm3qj2Ct7cjrX7ubKYazB1vfRloRV3Lvw1dhNXei0s6Tuky1R0cWrD+tRnpD3Qw/w14E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IdWyPgLHkEIgGS+s9sOYHQkpijINXg9Zbyqqu76cObllMTuql
	FOjR+YnhjR9baYsCnuazKuwW4SHLDKcSTrGiQW/BR43UxZJ10n1mfWG0GRFqklpH90trkiwBmYY
	0U4IVI97V7iDg7xkuVhVlC2QPLpXqGW+oHzQ3jiP7gaQnbCeclmCR6biviAUPgF0kcKzsUBXqBW
	2iMHJr+bDWAq/SxJT5/eQT+hhOC5eTTLKmoMufnsJh1F+XNOF/XaljhfI6+92qgF3uj0RNajoGq
	C9fGmv+j+0LUF+T53vyUKk=
X-Gm-Gg: AZFdTZd18cigW0RPnfbRTBRvBILpp8C/xFfbCEFCHsh2e7EfFH1BTxu41Nu2fSm6Lg6
	S9veQV9GnvvU05IUqtTForOx2z75HJLrN5eaUeNnBSV8qkqbNt3S2//Yj3rNRMktm5O5PpDaA1G
	V/+Q2IfwxEYx5DgGJ7PB/7C6lv/VTgQB12fJ6+G5rEiYCB+NlfU4Z4GGqql3/2pEdpMdI+f2qz0
	xPzGPgPfWICGgJlyejSY/QPE1aKKpf6/XZVGijDkVs70W3YzZMcFV51TxAZilDL1UMB88UopZ98
	GQrUbPLAcQfx0UG4Ii11TSkUxDQACf29y1FI0QBxh9CK/rHcISQb5a9pEtR9shv6k/RHVIlrOIj
	rJuIbmFDlx3t2m22v3QkXO9+7Z3a5w3AsRDRhRDWBB2pGlkXv3YnYf7KJV8JeBEPzsk4usmMkVV
	xnvfgOftf343H0zbfdBcM3LVrURSPjtDbimNcGv9E=
X-Received: by 2002:a17:90b:5289:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b41c908147mr6672563a91.21.1795378181716;
        Sun, 22 Nov 2026 12:09:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae59fa2sm6618992a91.8.2026.11.22.12.09.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so505323585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378179; x=1795982979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
        b=U7q16PjP63Je0pHFRXcnI5DmOdy6uByjTYfkK0jf0/RKZ8/ck/ZnaQHINxwxu94ro4
         4liry/yWwg8iJxymRqPyTuobOW+UG+Ujqx8UvW5pWKSrdQVl2CO5PXvLGBw3GUJJ+K6P
         zQSebKQr7mzfh4NuONixx81Gtnl/EdrSxmgnk=
X-Forwarded-Encrypted: i=1; AL+hErHbfZZ1U9Tr+KOLMT0Bo8Gy7VEcodvIJS5Lz44azjTElNaQv8SAJs4qIJ2Omw7Vv9vXN2fpwC5Cf0MCMfU=@vger.kernel.org
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr1770005485a.21.1795378179125;
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr1770001685a.21.1795378178726;
        Sun, 22 Nov 2026 12:09:38 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:37 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 2/7] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Sun, 22 Nov 2026 21:09:27 +0100
Message-ID: <20261122200931.2090372-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-3-dev@deq.rocks>
References: <20261104151547.70333-3-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:42 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The interface_create iovar structures and flags are firmware interface
> types like the others in fwil_types.h. Move them there so code outside
> cfg80211.c can create firmware interfaces as well.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)

Straightforward move, but not surprising the series does no longer
apply to the current wireless-next main. So a rebase is needed. You
can add my acknowledgement for this patch in v2 series:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
