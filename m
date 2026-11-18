Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000788;
	b=KebbUo69FCRnhWNiIBaXTLd6CZuo3dLK8dESyMaXwAGokkqQDh+Mzo44f6KA3mEyTIN2
	 NnzHwL4ynUrMWBTwVNw5gIqw96gJ5eHa9fIHSJ8r3+TcdkJOjc40Nn6WZA9JkVjtT6zwb
	 he5GwhQrefY+YEgNCOXloKLEYi44IJgmG9AHwaMZEStd1/L/MxSzjdX1ZPF48h5jwFyxf
	 voUxpbdejYmSyBgjPqc6FQsA9ws7AcTccZ5zq6NyjTmghdoLft8de91wa6G86goy2zj1X
	 FPzSnE40mAXs1A8BdZjD7EQKhcUvAfKDhK89w/AyoSjozOUMG4ZxUArkVxkMLp41ZCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AoUPKNSiZS6kFkBYlEFOdT09eSZL+nuPSg0RxUA4uP4=;
	b=qyY6mvbQIq1qCyIO/xOzpCtEv/JkxMvIQTKPrMc+FypDojl00iAk81K8Tb8YftRAkOZm
	 Lcz6valnAXqURRWp+vxlncU/pbtkyHeqf9uqcxSP51TbFZU5K8nOTZahjSNNA1GLtPnqH
	 FUssGLaY6iEvNolbyeMI0SNT/0rR0oqkNRYAe6ovrk5mtGvpRgVQDZkAomBc6vVvhQQyW
	 KiKSnDNzBRjkDMIoYFnE8yF4pSC92FD6ertwsRsW9IzOG8BisVv7x7kgwUX4sXaBSbG/z
	 SCfeZ7DGRQUd56SxObBCbGDWLTF6KuxSAALyomvtelPrioa2NTFeL6OUhPy6nSLvc2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Bs1zU/He";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B330A606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B330A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bs1zU/He
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso12884675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795000786; x=1795605586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AoUPKNSiZS6kFkBYlEFOdT09eSZL+nuPSg0RxUA4uP4=;
        b=Bs1zU/HelI92Y92VsC5XqEAVHTMlDp24GAQzIjVL7cWoxb9GnfS46Kqa2R0xWUIKuK
         lg8LEroSiQPy66zLQZkIQkZnOAVR/CwGCPQjz0gMBZHdmlfkCLqD1ibxfGajTGnquuH5
         r06AxBpYPJ5UwWlUEePYlOdp6iC38ENWXZ4zys7Er1F3Fp+OKDA6RDvSBF8X8U4QtwyX
         OCo+qvP2zxAiyPGF6XvNoXifgTIepu0gofJZ1oSLtd5K7kxoLCBAAwlXLmCFLUrShx9U
         so4IjpBK1ZpYj/0bM3K3L+ZV5CQeU+fVSOQZyUZLaqI+lmIVDc8uuCynBnSaNUIkOwtO
         jZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000786; x=1795605586;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoUPKNSiZS6kFkBYlEFOdT09eSZL+nuPSg0RxUA4uP4=;
        b=LujDS83uuyFtSDODpLhwBIsEmUsian/Aoh0NtJeXpBnAQ2gYMykuv3UWwJtXnFZGR6
         WJRfe9NafzWLgCf7sgmFJtavdeZh/LoMn+LQsrp71JNcZz9ZAgNo2r/pTpJ6k2mogHv0
         fAZXv1rB7e8FCwhQ1huNRSZo7Y3Ud7b7rqxI6ShkT7DHNJElvnKzaAJ3l1uXOY78Yv/+
         rwtWMq0AeorvAw6LA1oqu1dJaRFFRZcvnN8pPI/WCr66XJUMpn+6Rz7VhzFXCgEL0qYW
         9+urjfgZbG6AcV2zvWiPKsQRc57XMEWF/+EMERSmEoK4rpY/+QFjMopYSZq3d5klO0bh
         klNw==
X-Forwarded-Encrypted: i=1; AL+hErGsXq4Zsxyv9c61vnbVMsCyEEHHaQvdJq0ttot5QJHZpYbmJGFhfV0QY9n35AhdlRquQzREdWA5+jz6fzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X5MjTxrZvmjxRlu/np0LzFyz1HvF94xeVRGVLYp879hQrhD6J
	MVNfKLxtDllO1hcagVwAU0B9fwgay9/0TPeN98cAWfRzMzAqDsajIfaUeueuWcXUmXo=
X-Gm-Gg: AYBFou3nRJBbCt5kUT9hIY6nVcINKJbmICQsEssJMelN3QC4N/n18SNESZFqAHJfpWb
	EoeJRlSbXGE5jsh7ohUooHhDYV8NPXB2um3DY4o2rIHCWyOd4x07KnNkygGNMv4mE4avFYKl2ci
	vX+ECVtmdQS0m14Bp84EWg/R8TK8juvkLvaROnE+2zzrDoitJZsn34frND0HtMUmHD0cjQBXGIU
	rwsicp6Z+sny+LHhHIkXDg7vpzlRP58sxAVJYMHZi8lhxGp6YVtTpJ7dm/0DMFx2XXfm/Bo5dR+
	v1kBAKSnTV0AJN9lyiklnuuqySP51pezELBSOk/vqbSQwBTYtrQWFPU2zc2XO41xwb8+HNIyiD2
	gyFBIKUqifheUv9eQiyMXryiHnJLXnBjMf7fxrM2Rpbk5+QsEkkQetCSXuGmjOFRRxI7aqCCfyM
	Xc+dr7PYzM1F4Dqlo9pzfXKDd7r+JxE1KR72o60d1HrkFX/MBtRZ2BAGSOzxnYfTPUk8GEaa0IA
	pR7MIjIZmCZT1q1fhT+p1K7Gx49JSV3jzhjY0F5NrkLqvWlQH2pMMYYINJMMjQvr0QAQNwNANi5
	/P8DKH1d6BguvDEBjjE2DndfPb4uYZeoli4+ukkyp5GW87Mkl/C7r0gx/Prs0VoD2Hy0yXKkUkk
	08kBmzdH27yCCELf8nS96G2h+sgvSNDCdCsv/HcZpZtgc0RJO5VcAFfs0Pl62xDrDUTP5jDA=
X-Received: by 2002:a05:600c:3d9a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb7da585cdmr42908225e9.31.1795000785807;
        Wed, 18 Nov 2026 03:19:45 -0800 (PST)
Received: from alcachofa.home (cst-prg-52-235.cust.vodafone.cz. [46.135.52.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm4030711f8f.49.2026.11.18.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:19:45 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Heiko Stuebner <heiko@sntech.de>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Triet Hoang <triet.hoang.dev@gmail.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Igor Paunovic <royalnet026@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: Fix up sched array handling on open and close
Date: Wed, 18 Nov 2026 12:17:55 +0100
Message-ID: <179500061658.273030.6545426361573791193.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118101901.253550-1-tomeu@tomeuvizoso.net>
References: <20261118101901.253550-1-tomeu@tomeuvizoso.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Nov 2026 11:18:58 +0100, Tomeu Vizoso wrote:
> Don't WARN when drm_sched_entity_init() fails in rocket_job_open().
> It can return -ENOMEM, which is an allocation failure and not a
> driver bug, so it doesn't deserve a stack trace.
> 
> Also free the scheduler array in rocket_job_close() only after the entity
> has been destroyed, so that entity->sched_list never points to freed
> memory.
> 
> [...]

Applied to drm-misc-fixes.

[1/1] accel/rocket: Fix up sched array handling on open and close
      commit: a23e1f240f4309013e8e7d877944748f24a64a73

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>
