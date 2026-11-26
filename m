Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697567;
	b=QpfQbr8ipJBcEDeAFnH+FKXk3rlGdctPRZ7uLL5XDHNt97cOAytbx0De5iPMWJOIEtUr
	 RgfMZxWImE3mSwn084Po7z5CWhm8ipWdq0rWr5OT/4ZcT12iG7SzqEHQmIHHorsI12yn1
	 xFagYQcnBT98r3oRjpuz8qCiUIgkVuBd5Fj5SKFRCPMc90ho33poa6bC7sE0yzrZA/y6D
	 ktgYLP5tbj7EmgfQ1f71g+zhQ7AoPfND0q4MrU+rzexwZ4ZJKUNCZs7ctUu1OzrVf999T
	 O5IRWJI3jkM/ekI6ENlhulY1vJrqo3zaM3NvN006up9meXmy0r4FaOF90lO92B0Y82A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697567;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
	b=VA4+8QudxuXrwJnvwFJ9HfbJbY19SBodHxcRgiWIDAKByGzUEm7fs+/j+0vslqdG/2hq
	 cRFSBgWSZmH3DwfOjzPOmK7m/hPsO4K8GT/qVu7o9/f6U5N8Ez67Hg0yp8ztjh3gIlx91
	 3UOv3bQcyO8Lz0E49BuywXY5Ms0DcuPDHai0u7qcu4RxLG6kM26sQnb2ucsdc1uMKYYgH
	 +4Tb2uQ97Zg1OKqKU8VV8b3+1RD3jJTjCf52abJs2bf6arA02Ve/1YdTRxhbiqMX0m3qF
	 B/Q0W8ftS1t24DAcHob6Aggli8fL2Xaoq4dJvEopKNMwV/p5yXuS24yFsUpCeE4EKcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C43ld5DV;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868F3606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C43ld5DV
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso3110534a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697567; x=1796302367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
        b=SCTBFiXE3hzVxaf2ADhJ6ZdOsEmGLxYlXBiTz63saeeRNzuCrD0mOGI7fXCn6NF9Sa
         hh18Z0xwjhAIE4b6Vdc2RjlCZBC1AuTCqloqFmLs+nbLI9/RXY87pmc0/+THR5UxL3j0
         RLO5lWlACf9+3so530ALXxXoESJig3m/pFv7nhiof5n7a84p/kWSQQH4a92KDuJwa2OX
         qswAkTY7AAnyA933hBttEAQRlAW0E6OBQLcJfAuy5r9oo/P3CZIasjvWXD1WKvQN2JqF
         skFJ/x0M+q7L84su0fAWVb/Z9LBUUDNIH+6cDcoRw3I6/q9ysF//BkFd+LM5yay2J+JE
         PoWA==
X-Forwarded-Encrypted: i=1; AL+hErHyVAXENYVeA7SnFCWY1B93ciT70fYJ/lLSx7FJ6lKZ4SWxj0lZ8UJRess1rqwoWSP0KWg4bF5TX0kSosk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IgZf4HnepJIrY6Hn5/FZIXx2MNExu7rXxskqxR4Alnku2oWSV
	pXhcr+0dQNZl2ZR0a5ypALTjpVJtU2ne8+DYUZkBkxNE1rFNvAEYnGkM0NrdtHoVH8KQU7mOIxI
	oiFEJyqqQkCI0gxpH6Lllvg3Ozuled3+Yi9vj5kklDmM4mqBm0t0egfaMFHzJ6hhSCr0imcrv+3
	+62X13QtElyYP2MxfFoT+IzKrYihh8re52hS09KYVyhfUKpo2GDzgcf6xtASVDwSEKWLaSkIHbz
	04LINgnlxQvAoSDrPW8+oo=
X-Gm-Gg: AZFdTZfamKfHy5zGMf98wLd3Agn2PrQgjW+D983pLgWMkO+jJfhVsrmPNgwXHMmrGSY
	9Zgc8voHXtpJpI9iQswe+p61uRlSoIWDldABid6D/+/4VSyOboGSVxBldLqUEMTb5u73Rk0kJdS
	pTMpuylKvmJXrR4LQUT7BwSILOA4ROPGm5omNRlgYYbnS9/i6W0gSJFPKCeZ7EltK9JlROWGPpi
	4IQRZeb5NpIPHGX+sKlMm4tLNWdDlZHJd25p5epcBukKcmlZRBVFwwipwRYfAkuemg1M8tyqp+c
	id3DKzd+bRhgYTUiqrMD16gxywIrqK2yz1a66DxdWjEn5r4e79m5gQ6klzgRAx9pxjyVWSIHhOV
	OtulwQpWDrQThGDRTBQd+UqiV6Qtb7MHM+IV5Dahs1rwiJy+oZZ/bRwu/SP19fy2jV5BTpKxZiI
	xk+qm0ezpb+5RpzXrWJD3sLphfD9K9WNlTl/+XU9SDIA==
X-Received: by 2002:a17:90b:3b52:b0:3b4:15e3:3a4e with SMTP id 98e67ed59e1d1-3b41c92c96cmr21883904a91.41.1795697566778;
        Thu, 26 Nov 2026 04:52:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm7682254a91.2.2026.11.26.04.52.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:52:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so964124985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795697565; x=1796302365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
        b=C43ld5DVjh0EFQDGc8CsBRsGWj+Xv+RtyfKrgD38ggGjJUJQDuXl3eMavsdm/O9LEU
         KCZAmMAOjlwiwmqhVWf0H1BOsGl1ZLiDYU+mhidoHBOhFqB4Ry++iMir6ZQRXCjNhh10
         bXi8aJYIOyBqHr4d7LZrEaYYI0yw0M14N1wSw=
X-Forwarded-Encrypted: i=1; AL+hErHN3OtPNZRyEe7O5t6wyGBBBJLpaGfn+M+njjOBnnRm5Ns46Jy7Lu82vrbb86I9cN4d/0wcsjOOVbATW0M=@vger.kernel.org
X-Received: by 2002:a05:620a:460d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-949ba81a543mr3602881685a.12.1795697565337;
        Thu, 26 Nov 2026 04:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-949ba81a543mr3602878285a.12.1795697564924;
        Thu, 26 Nov 2026 04:52:44 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0c18267esm311983385a.4.2026.11.26.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:52:44 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
Date: Thu, 26 Nov 2026 13:52:40 +0100
Message-ID: <20261126125240.958940-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102122311.181075-2-tristmd@gmail.com>
References: <20261102122311.181075-2-tristmd@gmail.com>
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

On Mon, 2 Nov 2026 12:23:10 +0000, Tristan Madani <tristmd@gmail.com> wrote:
> brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
> boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
> extra bytes come from heap memory past skb->data, leaking stale kernel
> data to the wireless device.
>
> Zero-fill the padding before the SDIO write.
>
> Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")

[...]

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
>  1 file changed, 3 insertions(+)

[...]

> @@ -323,6 +323,9 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
>  	req_sz = skb->len + 3;
>  	req_sz &= (uint)~3;
>  
> +	if (req_sz > skb->len)
> +		memset(skb->data + skb->len, 0, req_sz - skb->len);
> +
>  	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
>  
>  	if (err == -ENOMEDIUM)

The padding lies beyond skb->len, so this memset is only safe when
skb_tailroom(skb) >= req_sz - skb->len, and nothing guarantees that for
the skbs reaching this function (e.g. a data skb in the non-glom path).
If the tailroom is short the memset overwrites skb_shared_info. Please
check the tailroom (brcmf_sdio_txpkt_prep_sg() does so before it adds
tail padding) and handle the short case, e.g. by expanding the tail.

Also, the 4-byte rounding of the length predates the commit in the
Fixes tag, which only split the function up. Please point the tag at
the commit that introduced the rounding. The SDPCM header carries the
unpadded frame length so the device should ignore the padding bytes; a
word on the actual impact and how this was tested would be good.

Regards,
Arend
