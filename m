Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396633;
	b=A0qUBeI0NB6oMekOmOfYQwuFdW8alnhKjK03rcRLq58AXi78zJaszNFlWmnL+oKm6HFG
	 PvakIjV9jYOoduf4Tb4DExWGGIk7mYh54n8xf4HRuvQm94iiVtU+MlxWWhxNAi99Z0Ovl
	 mQNXe0eP9HtNFuuGDKJPWSh+LlR4ZaEayTQry5RVGEP3zoCczF5dmPMOzGoIj7RWCLW5p
	 SgLMwCXwlqwa7iK+BQpjmkEUCuqr/M/jiLS323ONrtuje2HQCznBAaaKOpSOdvniCJJCh
	 sPFCHwbeoQEKio7YGmZ0wxNOakpPys7VYA1eHVNzhoEz86htNCjSG1p9ZoIvnxj6F8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
	b=EPLNbvpi3tXbYCkeLliwKBmg3EvbAx4bOhbuNUuq3mud6fZshfSy8MtB5gw44BkLPQzW
	 Tl1ufjRRt/qxPHNwwKFnkwsHmyfMMVrPYrnofS/CCJ1GGZjHp425w4+jNsqKDf14+Cg0o
	 GZAQw33PwuT8Yg+ltneRwNyj4qmJuKlrih+KH13oBp5STLknSgsJDQE7xLAovpK6cHxoS
	 /dBVw2ub56iRSnOELMTiMyotH8p1dEdUkCLXUea/PudeCNZjtweVo2luwwfhTzX+WW5By
	 oWNzszkpn5pMCkcnIsS3y3IMkZDIo1FPO26g7pNVaqMvLvd+dcRYxxsrFZhLiUXtrxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3oiXrb7;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68664606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68664606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3oiXrb7
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so3874962c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396632; x=1796001432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
        b=D3oiXrb7ZmV6BWAyg9ScNT/pB4kPE7fyRC3Fy7kYNpwrjx3he5btiKZvcUhIe41p/G
         JhAEMuGmmzQPQd4cLdMi6Pji+ComVY+E5+WpVWCvDkb/KE2VjWuqoPzDYDw+vNYAoZHm
         vh9EZrh06QHbkwflnvIKtYD8TWxfbCB9hquDR+zecgKzlth6KSPemD9z+BExFCcES+5c
         mERpZRe01ozEDuHbKLe1TRWij5M38D8FHyCfRGJq9CB6LPzvK6hIlkzov7jmAe2JvRdQ
         +P4NMcO4Vox5Eh/HgYXXkOjWQ/n2T3ZWjhmWkYnLVc5+4WbXYzFcr3PblxFCJhAlcePW
         OtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396632; x=1796001432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UgZ/UaOfprcYE1+TJLcwuO2nl1zM9v7WpMLhsF+tYU=;
        b=au+Y5D/CXO6lFUg0pbD6JxUpPZ+t8tRkefqtP1U4AofEL/PQ+x0JpMXyv4T5H/1Pzo
         NKpyIn63SEW96tqwJXohoxK6eBBEM7rGdw7n/tmt5yQcSN/W9pfk6sIqw4rNso1Q6OB1
         GOjoCWkCXDM82TFfe64YjX9BgNmivpGCZM1mQIIdt8wsCL/Tudf1Wv7g2pPncoiHeS5y
         pXWiU9t7mmMVvfJD8FCf303g33k8Q08zs+uFwhZ1czJ4zwvgFssnuiQE13vOr84HLmhi
         TWTvqwxKyq4U2//3um7hc1LV4Q+Li6+0kU0Fu+udroK8DdIDgEemMDZsYo2OqImz64yx
         uZ1w==
X-Forwarded-Encrypted: i=1; AL+hErG/OIAMH3UbhPN6Lf+2iAEbSI0dTFQ3XYcIJJaA2N2nxvEkg8cQqciEFs8NLkWFgffRSIOmTJjN3ysBTEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4brj8vAiQ3RHEKKvfmW17p8FBJeQcX9vDtILYuv65ie8NSmt4
	yFWU0EDGHE/9EH+Gh+3v0QGZl0HdmcAW4vP4K8qt7v1ZmAeef9TV/Xia
X-Gm-Gg: AZFdTZcPeu+Pc8r6GGLW7NCYfpIlYgWNoHNQBRxzTtUriIB1fWFc19pt7rAPKwZ3AWP
	ffOWp/82ruXSq9Bk32TIL5gDCIVmhZI4TSpuGs/hP/p54ZpAYJXMBZHWOSFM45EzZbl3EFY4j6U
	/ewr3aatP/TMNfVULjmT5ilLy7pw2wQGCih5cqmzMQDokGgrAPR55r/zOARgIW1d+UhtvyAquLr
	Fvpn5akNkrX37DtRgHvnzC/K4kGGVHOTN24QMg1j5k9lucSgpfUYg6rA98tunXDyzOJ9st+9Wne
	875JIC7yjRAeaqDFEY6HiYqKgxULxBd8M0Mdb1FMoDGFu7VlqwcrWQgqazm46VZSGNwAnLxXpj0
	bjuSxewjgtwUIRElNjGAp0e/kGguddiSMnD3We3vccZLoIma1xJXmyIkuZJpAcWA/O02Pk2z+YG
	K4y5k6DtZ/5E2MgXxZJMa4sbZQlSvvqSdWgtkJ94cw75DRaLC9AiXYKsP0yuS5e5p8hbRvaFg5m
	HkOQosl/GRiboE4UlXchR5rMEytfbBta6HsnV0ryJDZ/2xwV+cwXxN3mgnLuKL6Ez4k178qfWQS
	kpF6G/WE6tDwwJwGB0Cb38O86Op+4VO2pspo05LNlWhfeDl9snkwlnHEh6uPjArnlGkhfM0=
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr16998658c88.17.1795396632411;
        Sun, 22 Nov 2026 17:17:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm23764321c88.1.2026.11.22.17.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:17:11 -0800 (PST)
Date: Sun, 22 Nov 2026 17:17:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Martin Diehl <m-diehl@gmx.de>, 
	"Alfred E . Heggestad" <aeh@db.org>, Thomas Reitmayr <treitmayr@devbase.at>, 
	Slawomir Stepien <sst@poczta.fm>, Jie Wang <jie.wang@intel.com>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Randy Dunlap <rdunlap@infradead.org>, usbb2k-api-dev@nongnu.org, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: remove obsolete yealink USB phone driver
Message-ID: <awOT9WG0ZdNkIm69@google.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 01:57:21PM -0800, Dmitry Torokhov wrote:
> This short series removes the obsolete yealink driver for the mid-2000s
> Yealink USB-P1K (0x6993:0xb001) USB 1.1 Skype/VoIP telephone handset
> and drops its module selection from ppc6xx_defconfig.
> 
> The hardware relied on dedicated userspace bridge utilities (such as
> usbb2k-api / kb2kskype for the defunct legacy Skype desktop API, or
> yeaphone for liblinphone) to drive its keypad, segmented LCD, and tones
> through custom sysfs attributes. That userspace ecosystem has been
> unmaintained for over 15 years, and the driver itself has seen no
> functional updates, hardware testing, or new device IDs since 2008
> while continuing to attract syzbot USB fuzzing reports and drive-by
> cleanup patches.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
>   Input: yealink - remove driver

Applied the lot.

-- 
Dmitry
