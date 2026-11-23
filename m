Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448444;
	b=N9grWtBOyYhxPLhoW+dM2AbntFAPpxA3XzIqrppbLnQBGbCU7M4r9f4hO8fk8+fKrQnW
	 p+6j5qDlI/yI4yYKfCSEzSNIRkuxLP+0jPdD/1z4K8mk+B3mIaEaJ0YeZXGe8KyBF4lbS
	 8dw8pRAb3hYJ3yygCvJpOD74nG4rw/q5TrAUUp3SHVAfwLhU9I8d7NR50+H5uGh4OW25X
	 2XtbV3dOM9gbmFuTH68PxX1cWLbEeZfyoyAADx04Jux8UHGWFtO+z+AAoGgN11Co2OSwt
	 Kc4QBPlCrNDItwyhYzYewLANoqYIxHy/rTRQ4ZJ5x6LKbt9yh+JUKWWYCXh8sRXt3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
	b=PSNQxsuPXe1Y4NDhBDyD/XfULAdjf+oH2J0ARqVgDbxJY0i1H6PZwDdTaK5RR9L/mwV6
	 hqlV35OfcEt7BHJrgN/E96NrhwpJqSMmeg/CeD8LF9RKyy9lC80jyF2hHtDrCTKxf1f9g
	 oBui2GRO+zTIlFetnom8dOumCi5DHgyNGVpa/vc30n/7vYK/O1BoGk7ZZePRaRSwuh5lY
	 BGXir8pc1ENhhh4P0AXzlDme48FzZSGAijg4k5OthnVvYRnOmIIYy2itZq3XU/JRhsPw4
	 cfUGfKVY3hFIuR1pmZ+W4CcTtAt/Xfdky3QnsOATyP78VSdHOAjUz/98wGr6IZDjq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DCWIajyU;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9560A262C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF9560A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DCWIajyU
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365d26ccbdso43397291cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795448443; x=1796053243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
        b=DCWIajyUd2NrR5Rg5QH4BYrc18jOuaIFNK9krdfrMVuNBFHlfubE8POzOdp0A6zoio
         BK3Jm8Da6025c7dLknh9DJk0+VZH9DV55cQrJ8yJnUw7oCdRMpIHTUv6YgHpYHhqIori
         GGrUVou8pcQMhd9KQWvZXddio3gurupEp+aji/SeMFzVVqTC+CtP/te/WmUVmR+NlGSs
         KmBOlJCgCk0+qX6nR0Aw5RMZqvS6VBJFSdaldgcPjsZr2AoWVUN5puz1Vgd90tEBLzpY
         eAIRonSuZWxNolGYAuXxViEQpSYv2RNGlQkdAhBcBAeO1UcT99mpa3vZgxg4rC/bbjsA
         7Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448443; x=1796053243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
        b=SHSvUF60opip2iIHDTcXy9YTRPbC5fkADGdXurrxmeG0Gz7tjXNeHi4V09C95v8A1r
         ffRkTOO0s7Nc9/vhOuo+TIecMr4CaEEoChxMqzbmOSwrROJqvbGalDFMau/5Wsfy6j6p
         NQ9xg/wG3QRt3k55oq60NjzPCgvcb5BSNHwtgQ70IpmL327TfCaol2BLI+/U5H85ZQnt
         VTXJ6m01NMQioXPK16nuAhaRuwR8OzwOhN6ya4IpEUOv7MG5wkat3Tm4F9sZlhCD5jL2
         Q8GjuwPwyqKujVC+QFSCEsUMfISCndOrBmTvhYkMocFq7mRqDcXBVRwnNx1RA0pzwCSX
         6EUA==
X-Forwarded-Encrypted: i=1; AL+hErEKwRjRQAae6VSYR24XxhR982SmoahWrbonFFItS/PtujegWjGaiclxOS+UFp0z+oqwfK3py3pksxohm5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MhU68nG+fbuykhEkFs0mmo6weOscHT17knHN9dFHK0gHsGUFm
	VOsKaOk5I85VRjUfu01+K3QQP8miNWz1i3o1P2RuOrOrORmt3whRGDmx5BI7gX+4ccM=
X-Gm-Gg: AZFdTZcLTSOQmIshfEyI79DrUnjV5SvNvKvMe3M6e0KoXUX1WERP3VekGXztIfL1XU6
	YuRE7JMVOXEHgvF7xDoKNhKQ6L46E/EzLKBrdrHxeleM7xhJzvNbTjX6tEPtudPhQxDr/dUkIim
	XFYHCsRqW3jySXaqKJgZtJAQu9wMmq0oNL7ReO8h4cO9Ly3nn10JExABVEc+0SMNfcBk66LF8qp
	uglPpeA+KNVLJ9+aSk3NyaxRfEq4AdoiU1JMeAdFi28WGAHNMo8eZvwvS8yvvi6IFxhqiz+R7LH
	JnjKu4xvqvFRK/Hxi1zFKEw/Pmhk4MEgfVqn5HC1XRQs4GPPm1/v86/BFufJA4njDQ7+7NvV/rd
	XmDCEDtjQvBEnZ6BowPSkxbhG+YPnb6TXfGFyZ7XT+W1XBy04FUNkHlK5L1Lv3Ysqcay2AepFN+
	mk5eF5Argwiy3KF3SOcvxjeHDGYm+kgi2ytphtW1SVQvn6KSqR1kWGrUpH7xcVqCR47yymtB2py
	JXSLWvZDxHCXusA44rV4Yh44MCUTFXi3RhYUJy9yQQyM3NNNyeiCQyCeGMkpyDAqKz31mCXO1xg
	42iAIj03ricTGs6+T45S//WAjMzsqGXOy00/p+SVeo1sL+oKjiSFPm6A/BzdU1Qf9whQ1bh4tK6
	YMm8=
X-Received: by 2002:ac8:570d:0:b0:55c:bc0:63cc with SMTP id d75a77b69052e-55d768a2916mr224280231cf.6.1795448443241;
        Mon, 23 Nov 2026 07:40:43 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796329sm107324056d6.2.2026.11.23.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVW9q-00000000t9u-0g9S;
	Mon, 23 Nov 2026 11:40:42 -0400
Date: Mon, 23 Nov 2026 11:40:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@resnulli.us>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	zohar@linux.ibm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com,
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <20261123154042.GI179082@ziepe.ca>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
 <20261123151128.GD179082@ziepe.ca>
 <awRYr7yB8IWj7S3G@kernel.org>
 <awRan8ZELzpTwduV@kernel.org>
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
In-Reply-To: <awRan8ZELzpTwduV@kernel.org>

On Mon, Nov 23, 2026 at 05:24:15PM +0200, Jarkko Sakkinen wrote:
> > > > As per the function, perhaps tpm2_calc_event_log_size() should be
> > > > relocated to lib and have non-TPM name like firmware_event_log_size()
> > > > or something.
> > > 
> > > Probably under drivers/attestation since that is where all the TCG
> > > formatted logs should end up. It should be 'tcg_event_log_size()' or
> > > something. Maybe a tiny module for it like we would have done in lib/
> > 
> > +1 for the name, as it is obviously more accurate prefix.
> 
> Location, I don't know. I was thinking something like "lib/tcg.c" with
> routines that are plain calculations based on TCG/TPM data.

I think we should not have new users outside attestation subsystem,
but the legacy onces will still exist obviously..

IDK either, but this is my guess..

> And perhaps for tpm_buf (both stack/heap allocatable), if Trenchboot
> ever moves forward.

DRTM users will route through attestation subsystem to do their
extends so the tpm_buf user would be the TPM driver inside
attestation. We definitely need this for ROT agility.

We should be able to build the attestation TPM driver without any
trenchboot stuff to motivate it.

Jason
