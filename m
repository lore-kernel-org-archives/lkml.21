Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795334121;
	b=szZk1Y4uUDMhDO97PIwF3/cDx5G+bXaSNL8oAQMZ6W0mHcjNBwTGdMZOsat/WYI/Y6w7
	 e5lGPZkzCPYS9Ici1/93bdwA3lQa8gXbBMh1VJb+6bIaS8st+5e9smIafVlgE04b5CDdS
	 ZmFbHdpquQ9Q0H3t0VlScr6zGCsqbGUAFTZ/uqP1Z1HNshQRwvG9rl4skuB5ebL1vgwvL
	 vEywUIm6OWyIJ0n3ct2/4gf83itnqUc3vod5cUjjGRhi5VXABOAShGcPZjrMDuxZHbRFh
	 iJWIhoe2Pat0lZmBP5TB70yZ7/tV/3oQo94P0/BgSRwzkD5S/4h40ppbxEcRf7fFlaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
	b=gYfAAGIdyZpi+XE5RtEetbPnWmy4p2WFHzUsidJLD0rT/mc0mfFo4whpKCVHN4b+R9QF
	 Iqh/NQgjoOB49BcoAGiZfidMAU5b99f8CO3KZgUrmr5unaWtPOOXQfuVdZ5TJ+g5p+Yth
	 f/U80+4ogltAY2Lz/EDjwKObFkEYciW0/+giiLiXVTLQlMlg2+Pvkh4ylalxLB7qS8bD9
	 mecA6hg4BmhRABL5M7BszVLXg/Rcvk4Xnmcll6+x3xICkL650Rbh2XMtFW74pVV1ZE399
	 eEQV3Agbrjm3GW4O/hKLkmmoAfQKKbqsqXRFXfQObnr+Zo22113fuGQ4nwrvA+s6DJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdKZHsHo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80849606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80849606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdKZHsHo
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4d5e645d1so13993367b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:55:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795334120; cv=none;
        d=google.com; s=arc-20260327;
        b=Cq42w0rBlItTglDYo9veFSAFO89OwdV7L9V3+3Fl/XoQU8vs3AgWjOgEoFAQBedun/
         dmFYRs0//KXm3x5kSWX7TOUCpzmLvEWhtUN1CQGGSvkdnblP7XGKF5FFHRpD2g5ZK5Aw
         VZ9Lse+dIeziRkBoxI56iXjzIEXU3rK4azLMJKMyACQfX1x2n9+Wysv9Vgwho+DGZPP3
         TxaFhP88j8dUGmFI8Ey1WdpjcPu3SpAnPYf5Tyhd7qgbPcgzZw3srIRALrg8h91+5nuB
         RhFOSoL6KchKYScxsXt7/uL3PuDyAHCDJvcrNuSB43QEX8La0pU69k62xKKLMFyBIz1l
         mC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
        fh=GTglh/bxix3ufHbn2KP/ryNr2H+LjmwkbaaUtb/VUtY=;
        b=sAcvIx49TNYoBf7tawZWU0zbjjMgCN3myxZnasLs1vQWJ7q+VuRnFAAViH33y8t2cI
         Qek0nrQcK1U8wo7HQp11HXMTj5/PcVgCdo/aFBl7Yao/i7wzOetJo+mJrv3htavaMXB+
         r5mz7Wij8dvPQ9secvlOHfeWu8eAMBjDgaZof+zBYfBl/y0k0wWoC7DGGXERpjrA7mbQ
         0lEEA8t8nEUvNtvGduZ1ijnG6NEKtBeJDq98ugpXcFLUZdvaDHTwIBVNZqbMX/5/XXXV
         HI2oX9Jgmf7nVSZBwJ3itSrNqtdrngSbOzVnLjlfBuSQj6hxpV6ATN+J2Tzx3s/tU/CE
         krlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334120; x=1795938920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
        b=QdKZHsHoV/ihbNVA4YFaKz7iqa3v/RpcSboY/jP3My9Z/xT+fVBQqjWTBuTPixWBmW
         kAnb8SbfVVbYAdJkd0IT1PXI/RMKDT4E388x99OV8vIuzG0dbuD9RPQT+EfCKXfmuj0D
         60NsZz4CaQJE4OeaY6Jzzc8IHIV4qvRFLM7F6Gwkjsev0zQSfUP1V0BUqsr0hKGsyY6a
         wS+wNY56tWFDvmwbExTPZbm72nkTvqmQjXWkWQweWWlVEpQoyeoUWnXoJ5nZVkdq4zKS
         iNLFAlhI6Hr6EeR2Ezb1XyQR9IylcvbHDLOGx444JMv4XLf2WjF/oFgGMQ5n8z2FHfSp
         BUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334120; x=1795938920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
        b=GftWzkivbpPHAvDi6fQ/mGK6TTYqES1znnYxTy174ZGb7yLCQMF/5t00dxDvxt5TBH
         RifQcdlTdOJGCqHGChXtY+nyButwdwF6OuIp+JZp6zC4tVH021m2qjYPc2/tw0l3CY5s
         IV+U25K2ixLqbgk6vFPZ7PJEUxF9k/13LKs8/6qeVIczkvQWpC5BhVogcbHrMwcYcXM1
         HfsTACu0hfX/zsjbO9oH+Z+g3eytZT3c1sgd4Ge+oiQOJ5G1ibra8cOp6dRTTgKfzhvw
         /a17gzEzd12H29nqHiz75g/H4YtIDhPDSUu8JqQ1m8Wycg4g62gWSrwzzGKGqIL3CUpy
         zKZg==
X-Forwarded-Encrypted: i=1; AL+hErFO0sckN2f1zvzC2gs7EiRZIhiCvrattSefqO8yvhTTbrtsZGe8gY4dxVg++Pi2HVzwQyDvXje/HIwJO6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xyyJlB+TRxWoHAXb26E9wflseN3ZtF7jxF6MT2voPRbj+fZdt
	7PHeub6qQnWaI0Gboe2qspzLuwo2GVt4qeL9kTX/352Mx4vIbcRKfq/XDzIXRcFBVe8ki0sQdQe
	Umsyt9Z080MMbfAnaRD1HgCER2C44tP0=
X-Gm-Gg: AZFdTZfE1jtsfLozXxfEeO5+zXRgKdRlXbCxSqrFA9u5Rgd8n47YbC73c6g9ZwAYdu8
	HVpgYIB+IJgpHnHXqJWvK/uaqB5nqwce/JGPV5egJVfIxMAGXcVONS5Q2uDD4Kdac8poNaW4tcF
	L2GlLgqXetw1B2Jmyo+zIr8F9hl3+HuDGc8peZOfXWje4jlFXoi+U24lHMlzUthn4zRMV8jwDYO
	PgU5URLGM5wevOqWvcA7xet0QU0upJf0kOhEL2emclJdQyw4hID4HBoW8xs4joqH0rlkPmhTgbb
	3xCoVlrcCUFzzPFD/Kv0VoUUdPlCbOLN3ICDiEyi/F0kCidLNhm8vyXU5mmjO6pTbKj899Tnh+0
	vxfGDkqE0w3fR/bpz36WmPCIbKdpDhYga3bZv7Ao=
X-Received: by 2002:a05:690c:b01:b0:8b4:e57d:9421 with SMTP id
 00721157ae682-8b52031b209mr33010807b3.7.1795334120430; Sat, 21 Nov 2026
 23:55:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
In-Reply-To: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 22 Nov 2026 16:55:07 +0900
X-Gm-Features: Aa3M54q1h5hYCprIEwOOOX9ZVBe-G655I8fGo68Sbafor7iQqw7YnSzMQ2bEnTE
Message-ID: <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: drop redundant zeroing of new GEM objects
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guillaume,

On Wed, Nov 11, 2026 at 6:43=E2=80=AFPM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> pvr_gem_object_create() clears every new object through a CPU mapping
> so that userspace never sees data left by a previous owner of the
> pages [1]. shmem already guarantees that: it clears each page it
> allocates, and the dma_sync_sgtable_for_device() call that follows
> makes those zeroes visible to the GPU. The second pass, write-combined
> on non-coherent devices, only adds latency.

I'm not very familiar with shmem, so I'd like to ask: is this zeroing
something shmem guarantees, or just a current implementation detail?

Since the driver would now rely on it, could you spell out in the
commit message where the zeroing happens and why it can be relied on?

--=20
Thanks,
Gyeyoung
