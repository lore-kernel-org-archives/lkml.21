Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551250;
	b=0ZfZhCnSuVa+YZwBG8RfacrouPviss3YnfsMxuB2NNJ1VfDGVviB81yiDru1p0akOVN6
	 R7O6fxGBqq+B12gJAOaewB35G6z8mZrmnC5uG45VE8xrODbk4/ovqGMTjNNsMqsaPLqU0
	 /qR7YSJ2SpE+DL84xyhcz7Qa6DBSi8PYuCzBQO+OZu21NiMa9q0ZDA5Bm4IFsccSmP9Jz
	 oBPDUwib2LTBotEnLl+AdFB0YRrswTNzq0GdZYA3jlfK6u9KZD2CO/GFPmFS6BG8XbKlA
	 If3RXJ+0ax059VvslC4H8NHRwkp/TNhLnvDoWxY1mTcbyNTFNOPwQXZC2rydJymdO6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551250;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
	b=tDA65Es8re21FRjSTBN7GtMO34/j2R+yUQAH4MShcp2kgym+iSHvzwx2gdA8a5kWeZZv
	 dfrltEl11gdA7hfg273VBSIAcODFni3cTLUA1lQJberCQsMETasjA+GbRbBdpSKbqIPTC
	 gkqoJ04S65lH1DhUgNyiAytjBSzCx49pGqRvPKmZCy8JpoRUlXft7N3f2EsuP/XNDtFMX
	 JY17nCyjVXoqpNeWyPDl40Xhuua4vt/enBat5E4ZFT/RbKTSVAyhhLoMOWxpk2ia79Y+/
	 cUKrxOf9X3Iw+9geJLWx316revDME9AitHyO10f7GA3yIIkAy/E/SMF4VxlFOb/sUyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ASSBWlhC;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C160A2604
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4C160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ASSBWlhC
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3219090a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551249; x=1796156049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
        b=rgOD6eUAhHUX30ojqiCZlWKeAkJbBbO3HzNZzlJPt4SBu6levUeNxZYEDbYKZH2L8D
         UWYDGduIyJ3+CkcaxpoclNTtO5zc6d+RILIXtLPuAaurLH28sYTS2KQJPS9qeQSNPGCl
         +jE3cwktI3HlTtQ9TEJauyRa39RMmN2r8lK+gkLi6q9yGfZHvVC/4/uMbGrm8H/eG5Eu
         06U/70ADegfRrYTiHv8MxbQOa2b3fx8kg84vMJDetFauTn8nVQW2PeWx/3L5ly+xWf7o
         wKs4OH3hKRTnFloeEa2m34jlDkXp1dcZ3FLiR1P1BnuJuXy+MpX4eEAGML3AVAoYxtJH
         mUsQ==
X-Forwarded-Encrypted: i=1; AL+hErH6SPuw+HM2WYDd6XspH4yPg3iBbJPyMjQJMH7zismL0xx828HYP7ESHYVp5rCHvGKYs1DvSHxD7D02Z1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YikOxykR3SmhNu1yn/rbaa7wYYrASVtBLxMzM3PdA89v/2+6o
	7k28MYEuK7rcqpEs0cozAsZ2Uc/axaOiFnaV7SgTqWi5UpSXjc8LFfyI4VbGx0grgn9zQ+Fp6ly
	YSCecJ8Civsm6+A+VrRHS7rHGXjtfslxj61ZdqLpmOX7BpBusv1jiOcTigGSp6NyGBMLimho+tg
	Ys1d+cq+9lz0gdKT5Jg1IrCwM14nkBNUTjNx6iqVAgsyKe1pfD6KdtcMlI+HOeFu+KOTr+WylLf
	CjQFBrfV0fMHA69fj4DkOyitQ==
X-Gm-Gg: AZFdTZf1Su6JED2nEZMUrkOVw+09/89ahy61CVbhZL4DuwR1IAYc1zvkREUayaqPXF5
	06sUA1IZTmfVMwolAxyTRiTJFL6bBcRmHhHaDSP7i4Sh+gCUY0hhnZb8lG8p08aT42e4fXoZx0b
	ZuIII59iBnfpYpWylT9N5mUrei0aBgKFNqiiMKi2NPR64/BEVU/ADS4FdHxxm4Q7VKiiVRimsuZ
	CoCLZFU3T+fsfm/CZLmhSM44+HWl7iZTlMozOmdGKaDvufnBOTLQEcF4PFxlhxfyg6AxMGO160l
	5Hxiwwq8Va9TdcLRJCmulHaL7EDCGoRvQAGWuma/ZLKLZICGcRGz5iB3vtnRJh5+GswLA9802ss
	A5AZaY5wpXaFfy+KhGxEyNcswisii0BzS0aAaqVstgEvMLlPU7aTZHpIsIxWbXBeFxtl54YtvR/
	bmQe1cVndC3JYmrud55g8WhEslyHKJp/IxtraGeh+6lQ==
X-Received: by 2002:a17:90b:17cd:b0:3b4:1aec:3a43 with SMTP id 98e67ed59e1d1-3b41c9032camr13423096a91.25.1795551249351;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d22a928sm4371551a91.1.2026.11.24.12.14.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55db3f05536so9079861cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551248; x=1796156048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPLVVDAmC8PDn8fCPCfleQnG71yk1pEKS9gObPmVymc=;
        b=ASSBWlhCwEEWaAsLsKUp6eUyencEhh/4goJxt5xV5MalDiz732nbRHzDWrvz/FLn/s
         Yvo+dc7NA1EGZbmnQYeH9r+WF4NKULRZZ+AC5697qBFMQE1vJ6GSLp1g0s5pOHqNO076
         /hvb5gVgoH+ojee16zGdW8F8AMSOLRjFAJ0R4=
X-Forwarded-Encrypted: i=1; AL+hErHsdCslLZshDJI538XeZwlop2C9JNTfkt6I7anWdCU/JVyOPAPOAkq+x00rAgcoAGXekZBacIDdbELw6hI=@vger.kernel.org
X-Received: by 2002:a05:622a:4d43:b0:55c:96a1:b6b2 with SMTP id d75a77b69052e-55d76a6f482mr260166611cf.13.1795551248029;
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Received: by 2002:a05:622a:4d43:b0:55c:96a1:b6b2 with SMTP id d75a77b69052e-55d76a6f482mr260165941cf.13.1795551247420;
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:06 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 24 Nov 2026 21:13:57 +0100
Message-ID: <20261124201402.3499613-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-3-rosenp@gmail.com>
References: <20261111042554.232998-3-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:49 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated module callback array with a
> directly embedded fixed-size array in struct brcms_c_info,
> removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
>  2 files changed, 1 insertion(+), 9 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
