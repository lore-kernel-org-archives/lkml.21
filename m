Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096504;
	b=PL8GkSjrp76n4qDF6ePw8nPVOVLA98SEHjtN1m03hqKZVUfwA1RR2BqFyx2B8m06sIOp
	 G26PXy9gfJWlw2zLhVTXyaFhddW9Ta+nrv0tUfx2MI8WTDt1CF82mey/P+0q1CUkrXXEj
	 1oqGQwtjjzvlv9ZkxO9Oc0oNZxGQIvUuD8jV0KCiv5LmzAsxYtnvGR93GUi1vIT/DZvnr
	 j7x3Ux9hzLh19GLJmbuvRkUr/ULESjMehkh9PIrc1qjqDkCCkrpoOy3GKu5ztP+hx4cBE
	 mKEv42St1wFxQXC3ORcGrnM+HPi0BEDNsYOIsPmEj8X3PYJ97i02Yv8wpNuWXzn9gFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+RZLDuEn66qi2YdxAFuL7DH1veBrGjXr3VFwAmR19bU=;
	b=XRu8Zvp1B64HM04HBEQeEb5meN5bWroSrAelXKZydKovIEPn+bNc+2/wsMmDIDsC0GdQ
	 WV7HeFYQ23dDSllrsFVQ3vPs00BRd8QmUJ5NSDtsrYLqUBrmQIjlMeEpYBVgsh5oJ/rKk
	 TfQJl+HYDlsfBhbnSPq7MS6fMAdLOHVvbSCyg2onNKKqmdq1F9357qT+xN6irEvqNBv9g
	 nuqoNZVSx/Da8OSP+nWoDLf4r+UlEAP51Q5yrn5HnXVS0zAEx2soBbbHmY6BG8UNpITdC
	 hUL8KIn79I0sz5hzncrZ04ojUw84p5TM/hVPKbesxNBwMpxq/9RFX+Hl1cc/tExbszQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLOkQS5R;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB560A2626
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DB560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLOkQS5R
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f02ec4e3c1so510275ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795096504; x=1795701304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RZLDuEn66qi2YdxAFuL7DH1veBrGjXr3VFwAmR19bU=;
        b=kLOkQS5RpbJ6rgyY0XMuyR5K/iOBzyUMoQNhQBIHbxDOK53m7LhMV1n9bhG6yE7wDN
         Q2u2IhW00UKCGp5uS1FbFqOF0anJTOY9XG47zlvU3ymFqz3GsoLKPBCOcJvum5ksvv4N
         I1xaDJkS50qpQy7mq/CBuNCILne795NdE3/b7ZHisalPUGDf3czd0/d5nKo9vKwlEdJ2
         Jno62qOYQGmA972JL1XDXDOc7vgZizjC46wTsnpzJRLqwWb5W1sOQ8Ci1SINY3nX5f9L
         6pOrkcVkCUMzcj0r27dj9KqaOt01977uayrWyqnV0+XLNi8GNxf82ppZw1fF3ruCg8Hk
         srcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096504; x=1795701304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RZLDuEn66qi2YdxAFuL7DH1veBrGjXr3VFwAmR19bU=;
        b=HBSEjpL0hz41RNUMeLT0S+NZaZ14Z3uu4OncGoaGJFh+ivmu4fzQTTkqMxh2ZYD8yl
         jtZYTavjSZ0QdveYeKI9KlXuaffsOy9AFZ1G+CLcv2wscYL2Pb4gUSHaKmvbTafOpbK5
         9yxy2i+GLREczTXdkM5eIgx7tFHPVLUY6zgDOqMRAFP/5WQxfIlYEjtHo07uQgJlW+Op
         cNP2ZxHuOS01tRaIs1v09DUOy7ckayliFuJUYCTaWqVCZ/3h5FjFrOa6vU5rgVj4hRNg
         BPnsmZmb4pQ/PrZ1D4nxDHzxRxtNW+qM0SEf/KBmyCj01UZbMxvaoNXVVeLMx//U3dCL
         B68w==
X-Forwarded-Encrypted: i=1; AL+hErFaTt8T5kfQRycChq4JNF+YjFVU4Nct0Thx25IQw11yFIu7GbBfdpbb3CL3+PPg8JOnWdWA6hk1sUL5Bq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7SardWnnJAaNQLERDBSagU/p60vL2UTaBQpQ3I9+c2/4zKyQ+
	kVO9seqDZVdMAZ3MaEQ5LFQuygkOkQu8QcpnUqlF21C90GsQ8rGGBRUx
X-Gm-Gg: AZFdTZc/ia24gED1RflI/uEK3W43yc9Q+QYS7qaNwgdE2+AqFbWzOxZScCp4VmTxDF1
	OUql4hfDPiCV+b5JuBsWTOC61zuwtspi72UzEXu43NqIXX5fYAzjAE4C4C129HDGLiWRObBZEQG
	j7blhToCmBVWGusww0m21GrhLpuLo8p29IwseZomSE9cgldEvPUypl0EdbRbggEaMgpFq/1w5QO
	09oHQ69XGYzxnxjqaG1kVGBrZMKA1HieBz/2K7AHfa8c8h3rKmF2D4HlGTYNWhyALJTqDRGvcYa
	9FQ9Ypxrgac8uxLbW8buuFumIgVk9LlMOHzOck/jaq5Jm9/fkOCAdZnTJeGdTAi+62oTDEE7ae8
	TNGH0bB36XjMr5GFT2nzUQZA9zuh1AteQX0SmXxhFn4EyRo3ilTWdBQh85P7qJIqCVOhA2QbU1m
	T56HwcvGTKDVUCey8F5betJ5K6hqji2LHYHN78Qtpw3ofmLiv9w5AOdvJzmALHScDegJWM2Qov9
	fa352DkfxdIt8rcgigesl8jNpDqqwevy1jHCcwRamos1rXtivTCLS+AVtZLTCi8ZQYaoXv3T7gY
	ZPZIv7YVTR+9eDptrfhiNGKS0mk+Jzpt5+62z8pxMfYjQEo3EP3/wXODfNXMY4hy9InJjyAFDaO
	ulpcptkn4KV9v0Dnd1eEz997W
X-Received: by 2002:a17:903:3bd0:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2eff6f86b0emr95446435ad.0.1795096503762;
        Thu, 19 Nov 2026 05:55:03 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62876a6sm30641315ad.63.2026.11.19.05.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:55:03 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>,
	Chen Linxuan <me@black-desk.cn>,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pidfd: restrict pidfd_getfd() to the caller's pid namespace
Date: Thu, 19 Nov 2026 22:54:52 +0900
Message-ID: <20261119135452.990-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3e4103cbcf7b76535e2f957762174515ef00f08d.camel@amutable.com>
References: <3e4103cbcf7b76535e2f957762174515ef00f08d.camel@amutable.com>
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

On Thu, 2026-11-19 at 14:42 +0100, Alexander Mikhalitsyn wrote:
> It it an interesting point, because pid namespace itself it not a
> security boundary. While user namespace and capabilities are mechanisms
> to manage permissions.

Hi Alex,

thanks for looking at this.

Agreed, and the patch does not try to make it one. I followed the rule
Christian suggested in [1], requiring pid_vnr(pid) != 0 for operations
that grant access to additional resources of the target, which
ee8323fdc827 then applied to the namespace ioctls. pidfd_getfd() hands
out one of the target's open files, so it looked like it belongs to the
same group.

> Currently, you can do something like this on your machine:
[...]
> and this will actually print hello in the Terminal 0, while the process
> doing that lives in nested pid namespace. But this is not a problem
> because this guy is a root:

Right. As far as I can see this also works for an unprivileged task of
the same uid, as long as it can reach the outer task through a procfs
instance of the outer pid namespace. So pidfd_getfd() currently behaves
like procfs here, and the patch would make it stricter than procfs, in
line with the pidfd ioctls and PIDFD_GET_INFO instead.

The case I had in mind is the one Jann described in [2]: a task in a
child pid namespace that gets a pidfd for an outer task over a socket.
When it has no procfs view of the outer task, as in a container with its
own procfs, that pidfd is its only handle to it. There, the ioctls refuse
the pidfd with -EREMOTE, while pidfd_getfd() returns the target's file.

> So please understand me right, I'm not saying that your point is not
> valid, but I'm not sure what was the intention behind pid_getfd() API
> in the first place and we might want to have semantics and model close
> to the one procfs has.

Understood. If pidfd_getfd() should keep following the procfs model, I'm
fine with dropping this patch; the inconsistency would then be on the
ioctl side. I'll leave that to Christian.

> To conclude, it looks like we have a little bit of inconsistencies
> around here :-) [ But please, don't go and change anything in procfs as
> we might break some tricky use-cases like CRIU and SCM_RIGHTS users. ]

No plans to touch procfs.

[1] https://lore.kernel.org/all/20260925-gewischt-auftrag-tierzucht-c153cb3f9f74@brauner/
[2] https://lore.kernel.org/all/CAG48ez1T5-tUHVK_iHsgUtWa-inVdrZxA3E-ZCW0iENJvasKfg@mail.gmail.com/

Thanks,
Jiwoo Kim
