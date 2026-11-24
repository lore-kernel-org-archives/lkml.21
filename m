Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551255;
	b=0MlkA6CJtkutldyCtYhFfE4+PKWycGKG05aZMMsa3mtgNkNDZt8mSP2bGAPgS7F9Pjk1
	 K0r14/ZBO3ZEcrXAZ8VLf2tSRekL5mBgC3vddxBzcppDya3Y57GnHQo0J6DXIsBuz4GmE
	 uIjoczTJR2UgWZJBB/V235OgVrYa/9z4b6HqJ4xsYQ9+zKHPFkoYF2gKz9nllIproq/TW
	 dzo41QEvBeWi1mMoh13AmZHogwXcS9pve+JJ9JVjYztXJTuRVNW3z1fWyqxNknNhSkpSa
	 sX4sut0SDBmiGJ29HKLV29d02Y8ZVQ+mpjmMTVSxZDYiqfiI6ZraII2ZAlcOwh1k0nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551255;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
	b=WdvkxHbLuqVxQbT9SF6Vr1aYBirHAeib+BhLdAgqY0kZRoV3YxVcyQ0b+/Bs+j2Yoq5K
	 +IoUf1smggNkkbGUr3KRTJ3U2I0XAt0dHSJE856L9+x6TeISTpV6VUzD9x0c5rn+ISEYf
	 UoCemTYvv+oWVyeKHSjNIOxMwq1zJwwuOKSoVfOUd0U/eXsaV/raycf+kzHj86vs+++at
	 LAX1SG3UN7NEBxKRx3gDZf9oCTOJNy1caWnQsYivIv9hqDffdpWfr6nmiqXOMeWOyFuwz
	 EsidT0hNmEU1X5mF6HqkCXfQrW1s+3G4keoPT+jaH8xsKVp/j16V1asGbexbNRDsxBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DBu4gMcp;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E4606A6A5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084E4606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DBu4gMcp
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2f06ff94acfso19125095ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551254; x=1796156054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
        b=1lrNttbWLVnTjR/oaJvORBDKSk6DlAJPfZrBsX1YJk6DMwOJruYbXu97YeS7oXvhia
         hAO9VflKsjImmBIcz+pqWCSYUTz/annvVo4mBrh2r7cJ5pbJQDFt0367S0+fjP4il5SL
         G5cKxnYr6gBClxxkCXHZ8bXFJiej34EUqDQbI3f4mAUbSNIPGv3YUjvxfLZ5mBk3kgTl
         SC01wrBk6O3gRqFhe+iwYRKaVVDFgX7UdXYXk68RZ88MXSj6zeNblR8V0ff8qieQtOjX
         1fE3sgUvgMn+9+yYQMawKVCGapnfNCzMFrC1u9BWw3l1TD+ALF788KNk4t5FXnHK7eiP
         Wy/w==
X-Forwarded-Encrypted: i=1; AL+hErF2pWiN4f76w8vzvBva61GV9WR5hJ4eV+FeqA3cORIyL/EnX7OkIgLtZbV1haPPYTq+Ak/rAjTADxboNtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q5Q84KHQZFEB4fOF0S62+pyXLouoA4Z7aMTJ2nUIUMNO+pryx
	9pGPFdoQXjXeWZ+4uB95bqoUEyVk2WE5qEPQvLeyggUAEK69HIKd7ca6rQQKXRa9gA2eZ8fVlAq
	vGUtwOpYXENTF+KLzMqUoIoxsDCEa6BBxDtLuT8Q/v11hpoMeobmO9XllZt+htDqn7WbaxFKX1I
	bqqvuOAw3jmEatwdINt46sorP6sVKEQsEAIekn7gs9xLoh6pnth6b8XXLdmK9JVey7NvZ9VJpsJ
	TEqQeichoWjc8Vuyujy7YbT3A==
X-Gm-Gg: AZFdTZfiwZLqktywQwNMCN8ilmSwtlIGF/4D5skvCpTE94SM5b6ovBPfkQAWlUAlbft
	fc8LkdbyItM5pOgybnM/djeEOs9ygUxeeJTvdBxMnve3ZdTmM//elMV9C4wdG6QZfPMt+py2ene
	LeDpaqU5UXrSOqhpdhgZpiuDxNa+ZF7/5Oq8gYrB027XBcelanrqcr0fQAZ2V0z0kZxn1PuWlcG
	qc4A9qkiH/lxoWsSMyoSvr87Vrsx/9Xjrv59KlG22IKv2XGbZuzqQVGPPzxaliaFVUF66CSjFvo
	4QE/I/gNHf+iMGW6XO+OPX/+t1NBTRN6NKraUlOvzxX/QoZTpOq7ysBYakSmOIxsRY9mTjWUQGa
	XwYgaqo8BQ1uUl9Ol71mtgT5XlIF7I7de5DnA0f/4TnDS6QEfmNCP8mD+VMQPQofjMcjEgx4HEU
	OvBvpzXsAgFYtJ8/wB8p8/oa98yTi85JBCBqT5Kxs=
X-Received: by 2002:a17:90b:5350:b0:3b4:2eb:d9cf with SMTP id 98e67ed59e1d1-3b41c9086d7mr13132249a91.19.1795551254203;
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae532fesm11557926a91.7.2026.11.24.12.14.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92106c98714so102346466d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551253; x=1796156053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
        b=DBu4gMcppjwDDUbqObiqwpC20dr8D3ByFD6h+B8DiUVeKhu3Z+HifWRYFtEQc44caf
         TkEKuOwWs0TtA5/wGpH/V7dUrTAHQo5lU72aBZ04mCLTCpkdiYVrxsIadh+KpKrdJYmP
         NVHOE9xCKpdEWkPcSTOdc4KUj/QVcnIvUEZeU=
X-Forwarded-Encrypted: i=1; AL+hErFgSjdxlcSVThr4UYr4Eszop+uf/6gEQlEvxDhf1dlSJ59pCRm1iVic1UvA6qsoWZYtX0uiFf3qFj5KrsU=@vger.kernel.org
X-Received: by 2002:a05:6214:8018:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92134b20d5amr225168136d6.27.1795551252936;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Received: by 2002:a05:6214:8018:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92134b20d5amr225167466d6.27.1795551252306;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:00 +0100
Message-ID: <20261124201402.3499613-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-7-rosenp@gmail.com>
References: <20261111042554.232998-7-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:53 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> There is only one struct brcms_core and it has the same lifetime as
> struct brcms_c_info. Embed it directly instead of allocating it
> separately, removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 +--------
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
>  2 files changed, 2 insertions(+), 9 deletions(-)

[...]

> @@ -470,7 +470,7 @@ struct brcms_c_info {
>  	/* multiband */
>  	struct brcms_core *core;
>  	struct brcms_band *band;
> -	struct brcms_core *corestate;
> +	struct brcms_core corestate;
>  	struct brcms_band bandstate[MAXBANDS];
>  
>  	/* packet queue */

With the embedded struct there is no need for the separate pointer
anymore. wlc->core always points at wlc->corestate, so the core pointer
could be dropped and the users could use &wlc->corestate directly.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
