Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587753;
	b=mdxgvZAy5qpzUmXmkAalaA2RNJk8Vab0FRWuXnAwRc6viPAfNb8K/ie88rGQRjDhzYy+
	 /o35YlpbY1jJ1VHjfG6xvUFUxjWBG09bDPGif0E7zdk+sCsVOYuWDijOG9RkQZ8cdeIbA
	 vKP6ntMy1NTBVhuqe7miZNasR+tKzjUf42qpAZjQbaaWOBkNmKygaqFgyJtN7wl2Ls+1q
	 HE9VG10lDN9KH/ix9kIMkEfpNdVw6LNFdsH4k2s0qcVoL1fZQmxaOnhZUb70yZrkszBsS
	 VRs0vNKsC17ThFA2sAailt5loKFO91aNMAYHSK6aZsYkV3ICLC030H3cSfRy/yNVPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tjtx0YAdrMpcvwQv+CSokdx6fTpn2TH63lyYF/I9Hz0=;
	b=wygGCBgzInbt2lX7O+EwSveFNvNfWUNj21n0usOskowYARSX0LTIOwFDXIONlsE9EWAE
	 EpZ7BqHDyPXDc2ihBctJJxVyiclGO9m/nTGDnsTkgbN1BiYHj8EmkzIOpfE1O/NOr4gs6
	 m2G77ePO248yeBG5l9TVSzpYirUEnmJr+CPPV0vOuO5WnFmnWYBZgiuEx5/1iS642k/Bf
	 4HViQYiIxKp4OoL7HB30imqgOvKUTURVt6g+0dfGAcxWgtHVY7NxQghWF022TTmGZnH83
	 iNoCbi5k8W+keS1goaLktSL+a2G2KWcrqwBOUpBmCMZ+H1cC3vYjPWHtWiyuNdzWusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqpqaVI0;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DE0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqpqaVI0
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5124442f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795587751; x=1796192551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tjtx0YAdrMpcvwQv+CSokdx6fTpn2TH63lyYF/I9Hz0=;
        b=UqpqaVI08vg/ZUhs0YfTfM7EKN+BktLowjhHqXircA9B0nqfiWU/3SND1AkqbSr3sn
         /AVCl002szn2ePT5T4LcKjz1yWsIeJHk63uWnEJ+OOWpumoKerzXDUJIKFixz8xPmcfj
         a4QG/ITjUiPWrOd2Blx4AJZBlolGuRgZbwNaFUVihOQQ380cAaGL97Gd6pBeScNaj8Qs
         YLQa8XAxh1RgIn57M/1/qHlztxfcjoF0zKQDaH3w/y0pboJtXDX+L/aS//YtSZA0rdTj
         +z+vvN6r6+BvLvDuBRHIZOF3VPAGdXvR2wCtr8S1fH3nm+Gf+5lr+4EdAuanaY3lITdq
         3rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587751; x=1796192551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tjtx0YAdrMpcvwQv+CSokdx6fTpn2TH63lyYF/I9Hz0=;
        b=zlFe465KscRUK4Y6SnQsaLh0O9PeQMvSz7aS+lgrltfQzw3fFFPHGE1G6LKQg8dGCx
         Y7x2tAjhdUJxFrKxSZWtSPmpGKsDaggeUeHdNq4M08rDQRFFiK/GUdFtLH3A/URxfAVH
         awCQB+asmnA3DFzREdUJcyBvYxUS50UbreRJtxxv2v7JGtLvfKSJURhrrfMUaRzZv0Js
         wxTpY5zZnZ0EKyvaI1Af7Gmspsm0pEg/ogJoOIqrqqAMt2QFvq26S7v5QKJakf8BuKbx
         dRZsrBaB6813k/4bg8DS4PTBtZbU1wf7QHzFsHiX6uxunvv7Q9y2zWKGW0mMV6PaStuQ
         rHRw==
X-Forwarded-Encrypted: i=1; AL+hErGaPEycCCk+98su01fK3AxcvTCrD0nHoB6yxDJ/YlCsRDMaAzdsDFUanQDQJnj8vsr3PSmFD0MmAPdN6X4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hw/E0F/UBfa5RYJlLB+iA4qHArzMaDzsXAk7HYz9RPVjm5LNf
	838GRvdFoIELbDIaUnBCTsMR9pwsaSc8klz8JKOTcajnOJw4BO17QGBl
X-Gm-Gg: AZFdTZeWtv+SU8NrDHgDmUTTuHBsa9o8Z6655NDjygdhtPoAWrRa4sajVncVJ52Fm0a
	VBLvYfW06K4dkYedh8PlRtBOkNL1fDI6FCjQ/a9BXdtDCQva8dyh3PRDyhrs4SlNydn8JL8/2Gv
	HRGu2RVIBb+mflgEuZTlJrxNkXt3CD2VigZLmWwK0iaj/YD4+LV6jyP8/bfPu/Y4pWmt0OzCeVC
	OUH7wLkKgXxIPD7G1WV6YG+/78zlcj+/oU+NnbqpyErBpHodBm+rYOiKpoQumhMOg+xZimQzQfE
	gttj/uD0F4omkNYFXdN3Ul932Lw0Z9fQoctldGzOcsfAfANLGuEv//Sguxk448Rfouxm167NZbu
	4pfpYTnLibTEA5yHLU9K0+UH5aZSoHMwaQ/6+nfO2JnYeSuX/0T+ylRtKsuxwrUNmZhMxA9PxDf
	IDNaiXqfMj2nhBUC1xgaMl+WlqUn0Imk9ieDmATEy/TskoTw1mhwdpMtFtai+onScohkxa+L56q
	DQxhI3vHk6JtqDpsXX27Fhio/yj3Zw7h0adnfJy0t+SlvYjEHcCE/SQhReDfxLLOwPWrP4XR+71
	Ha52lOuA4eKVB0PApNhM+QEcmg==
X-Received: by 2002:a5d:5f53:0:b0:4b7:6ea2:54be with SMTP id ffacd0b85a97d-4b76ec0df5fmr9041902f8f.14.1795587751217;
        Tue, 24 Nov 2026 22:22:31 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab9cf005f2sm26407054f8f.45.2026.11.24.22.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 22:22:30 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jkoolstra@xs4all.nl
Cc: amir73il@gmail.com,
	brauner@kernel.org,
	cyphar@cyphar.com,
	gregkh@linuxfoundation.org,
	jack@suse.cz,
	jlayton@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	neil@brown.name,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v8 07/12] vfs: short-circuit MAY_WRITE access for O_DIRECTORY opens
Date: Wed, 25 Nov 2026 09:21:46 +0300
Message-ID: <20261125062146.940336-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024213539.1307600-8-jkoolstra@xs4all.nl>
References: <20261024213539.1307600-8-jkoolstra@xs4all.nl>
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

Jori Koolstra <jkoolstra@xs4all.nl>:
> Requesting write access on a directory can never succeed. Rather
> than performing a path-walk to determine whether the target is
> actually a directory (-EISDIR) or not (-ENOTDIR), or does not exist
> (-ENOENT), etc., we short-circuit to -ENOTDIR.
> 
> Currently O_WRONLY for directories is only blocked in may_open(),
> which happens after we have the inode for the target, so after any
> create via O_CREAT|O_DIRECTORY.
> 
> The advantage of short-circuiting is that we don't have to add even more
> logic to lookup_open() to differentiate -EISDIR/-ENOTDIR. Also, for
> filesystems that define ->atomic_open, handling this cannot even be done
> at the VFS level, as we can't know ahead what the result of the lookup
> will be.
> 
> Suggested-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: NeilBrown <neil@brown.name>
> Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
> ---
>  fs/open.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/open.c b/fs/open.c
> index e43f02ff64ac..4334f30bb7ff 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -1343,6 +1343,15 @@ inline int build_open_flags(const struct open_how *how, struct open_flags *op)
>  
>  	op->intent = flags & O_PATH ? 0 : LOOKUP_OPEN;
>  
> +	/*
> +	 * Requesting write access on a directory can never succeed. Rather
> +	 * than performing a path-walk to determine whether the target is
> +	 * actually a directory (-EISDIR) or not (-ENOTDIR), we short-circuit
> +	 * to -ENOTDIR.
> +	 */
> +	if ((flags & O_DIRECTORY) && !(flags & __O_TMPFILE) && (acc_mode & MAY_WRITE))
> +		return -ENOTDIR;
> +

Please, do -EISDIR here, not -ENOTDIR. You returning error here, **because** user attempts to write to **directory**. EISDIR is natural here, ENOTDIR is not.

(I'm human, not LLM.)

-- 
Askar Safin
