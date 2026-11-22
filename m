Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795309446;
	b=lyw7RzXosGPwz49BYSHiKDZJ9tXNIF+p+IbJ6QEXbIx/WjDOb1sLCmKVKLfzOSJnN3lG
	 Z5FpuWHnKTrjd9qlsapWrrD7P+Oo5jHajaRbzjxYS7T93aOSdkvkBQDXRKVNKRJMV30sS
	 ZuF3qddXDSiBiAZx1r9vFuVauRR+90v6lJOwQlSFgB4I0uSvKWbPmGm87zuJHpsh11BKp
	 w+DrR2dtwo6/ijMkH3Nc10a/ntLN4GzzQGfkBYdc9PmDPNlffYuq9hdtsyVYB6W4BfJhm
	 wLxfD+T5rqh0tDK2MmklD5TuqdLipvPB/HPoXgF9CKFug25wsJMABbarnYIMAwZQFMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795309446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
	b=Yj7f4bgeUD1c6eJEkY80etk6p11DTryVDloYx3lC95sIBMOEtFM+TVqx9d9ZQ9UZrzXv
	 73K5qi16Ima6LMVzI0GGZ80pSohM223d4UN+hekS5syfko6oKE/4i06terU2abLQEjEhu
	 9zPj+oCxOhAlRqIvwps4uJ79KFU69cGfmHVOWyp8/Zb6Ng23i6jRieVA7gJtjjbByg4Kq
	 5LjpmJ1R4egItmgbAQtgUvbysCiaggO0c0DcmJ7lqiiYe2OfZ2GsplKT3HUU0ryii4b2B
	 aoYXJ1sxfPlqMxLcnPtknotKUdvIvnOEvcS2Bicxt8o20rqutyU4yA0MiwgUio07izg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E2606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407E2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso2088294c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795309440; cv=none;
        d=google.com; s=arc-20260327;
        b=g0kK/DXGJ5QdswF5zR9IOEQ9gCTVm85lSDOcP+1uUi51e33iiMGkfK0idCrlKg7oLn
         Z8Bk4AT2uf8SA3upefvaMGJ31bCUGGdT7zNU8HpHBswBaCZhJxp5Pd+hQHUbCD0rY3ac
         QB5WcU/NLuy5npy8MYL15zt33CuKybm0O6X/3pboj/up8eroi2GamCsDQcXI/R+7KpnL
         EKZtRUjT5fgElPFYIovyOjgJJsoMYUALBR0SGhPCiNJYm9iSezmp3PPf1yL6iO9b9kVZ
         WSJs1ue2yX7zCw3VsaFJUSp1qF2wOs2/nX/Ia09ySy0L/L1vseduROU/4cNjyXFVznpx
         yW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        fh=+Kj7Yg5fAXb4OY/9eZhJ8OBozmzYpMaBYnk+nQitOpU=;
        b=IVoVVGiIWdWuk9Rkr2urEai6CygbRppvxp6Su91yFYbi4feAU1qzIZRokOjnEviBbi
         UBig4RNVnY1jxd//53G7NbXLhSPdFcQM1HIapM6yQludD6caYZGvb4UaMsA3RpJCSVeX
         KrVTdR2IHHdd6R09eWp8OA1ffYKaPCkdqfna9MHr2s4fPZFFZ5AImvat4fy+ZoX+Yz0R
         RThHktK4TEUaVw+xm/lqlimqrg6ub61gnVCg2MaGR3hGbIbqQyWRtsIWIu6rYbnudRJE
         6PNRcU/twi1zqFB53QSFXv+QPWAs+3KtqLTcrpCSSJD6+933tQs38NPo0rtn0193kLZX
         n/+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795309440; x=1795914240; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        b=Or7bJpmPMdcCFB3t5NhRjZTEydDqiebvD4Vbvu/y1ErSGc5OodZjxAAXsmyucEzzIe
         yGTDt4VzIwVglh9B++JjOiylBzTux5Z4/W397y3+0i0832ysu2oMl79pVEC9Njnz7coS
         cV6WLcGxMw8DZQO5Ur3W9ktlR5U+uIRVNKS5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795309440; x=1795914240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        b=iYkW438w4jZoSpd7297F4b++9HQtU27Mufd1dLXplZQCffN40OjD+b27nU+hYVfPdl
         d3HvPnXhaHFaqkHHQvP7tc08k8WtOAq23TyignWacwTrPCGUbBeZRrqkTmhYz067o00n
         22gGaWUjsT+yVyl2Ma0gsGVZsaePEjMFtJC9ol4b1/VllrtsWP6JQJNKl+mNT4v7grcg
         nnyWgDa+r1Eu3hCP17/QQdZnqYtxQylLFjvdpdIUm60dQQ3lb0OETsDPBxzrCbYIWXcg
         gf4kJtHadwlZcyMc5n18ZpaKdpwNTr0syi6oafoATop3cjWe81Lu5fwTTm670hK4j9ZZ
         uzew==
X-Forwarded-Encrypted: i=1; AL+hErGl9dhRLjvRcRRMh2evjw+NePPS9yY1+E5jEZpKX8jK66NohfRlnj0f7EAxgpqM90fSlzzJEWcVl7Oy7tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EuKcfwMH/DJkRdXKdFpitJse5eMCfFSj1ukHlwe5dX8epWVsp
	9GPLRVhKOIBcoqSHTu7UDwV51+28Z8t3x5myh/F2h9GhFs8vx1G58ivIWGfIakJ3lzjK3YGTASP
	K23+zrwWCmnTU30AXuUVxGSElIMKDaRBspySzJ+vDsQ==
X-Gm-Gg: AZFdTZfxTyWevPt2xpKqZ5K8LueE0aiktHD8YhUp6dkSg5Lxp96QLouDCisSzxF/b2P
	G4SjVRsv9WGk62Kaj3ykecXm7DNyFNa3nIvSbsy/VDP51pOevZrYTpyQs/i9/X+u6OTwPHcyDOE
	lpHcSHfjC3pKEcRtMi8T/Z1z1n3xbPejJaP5JdIIC2aDjLcxQCHOZjOlOqappqRLPgALY8P5o4p
	rsA5unOpmT1VDsYx68wxfD/o41yJKL0BOxUUUrCXz6rXZcGW22nnEpA6uIeE3vDaVijNcbkeEDO
	sVGhpP+wUgFzsNPUplfJcFuhB4EqB/qRz0ipQl/JoLTINv7ey9qgk/2EamF1FuLgeYZ3OmAcqZv
	GMYcCyjk4Re4+Tt8cs0qCyY1N12C6zuchuF5Bt3o=
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id
 a92af1059eb24-1b56f87ab60mr41806c88.16.1795309440060; Sat, 21 Nov 2026
 17:04:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111163735.227286-1-p.pisati@gmail.com>
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 22 Nov 2026 10:03:48 +0900
X-Gm-Features: Aa3M54q1ImzjAY62LMRYJIQ2A3YvuU8mR98bZ0JQppFgLr97xa3DaAxEG-GBzXM
Message-ID: <CAFr9PXm9+gn0Gz47TU+PG7LexCYWWrU915BLcLAHg8GSsEDDeg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] zorro: add a CS-Lab Warp 1260 MFD
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Paolo

On Thu, 12 Nov 2026 at 01:41, Paolo Pisati <p.pisati@gmail.com> wrote:
>
> The CS-Lab Warp 1260 is an A1200 trapdoor multifunction accelerator: it
> contains a 68060, an FPGA, an ARM co-processor and several sub-devices
> hanging off them. The 68k drives the IDE interface and the RTG display
> controller directly, through the FPGA; the ARM owns most of the rest -
> USB, SD card, WiFi, audio, the Kickstart slots, the CPU clock, fan
> control and the board telemetry - and the 68k reaches it through a
> dual-port RAM mailbox.

I can't test your patches (I wish I could but I only have a 060 + G3 +
Radeon hd 2400 A4000 ;)).
But since you have an 060 could you maybe test these for me:
https://lore.kernel.org/linux-m68k/20261119123558.2108296-1-daniel@0x0f.com/T/#m42ec8c1fe97b64b22f9cfc8d7ce753937bdbab1a

I also have a fix for a small performance issue in 060 only kernels
which I'll send next if someone else can test.

Thanks,

Daniel
