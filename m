Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629548;
	b=313WGB7Unw+BDIl/+8x2iS70d+5/LUt7LOOZDIhbW47bqLKdEkxbiDGLl0R/vVZ8hf0n
	 /6Ae9i6N0IRqqtEu0bpF/RvsX5riCOyEFVLuB3ACuNzNWHN9Vm8mPUPoXdIg8KR2axO++
	 R7nLiCHW50tTH4EWcgZFUClg2IAkiMp6cW0v+L3ph/FEE9xeZB8UhtNOq6A+7lsrnv6id
	 z1jGCCex9h6v8GZi6hHA7rOR24Jeo+pNF4TN2eNSI0RwTTP6yJtXl4dDBNhXixxP3WsE+
	 jVGc7AB+92rPKI7R9amrYoOTo52pSiUriPzlAW9iDwtQ68UD0jClh/BXxQoeyFr4ZbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=V3ql+trEST5GBe5icgHLs8egrkIrOnsTHov8GZtBedQ=;
	b=IYoXY0fPBK66coiXLnelYoHEhrx6LulT9pl2O22L2aU8gZwsF/JaJFTKZdZMOwDrvNO7
	 rcxiisTAq4eCs0SnCiHoUo350FYaiBa+TS2ZcdMNuKg2qN4vD+W2wkTD00eKvSkPah9vP
	 GyucfcQyarM5fQKahl9oD2M0GMuVojIUpP2raCz4fVcgfcFnikCqogYoLbbVlvIhddzD4
	 e1aBhlTl7MIBN+rF7wIcGuh9lCpa1vWB3yfaGMzP/dpctFvgWE4AICBRIlovjHgqKv3Wd
	 aavl76ek5ThpuhRi9cHd+f+SKkAmZQspfIqroldbPuBbbWAHFk33ZsuZNcBtGIH18JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PQcmyNBS;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995F606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4995F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PQcmyNBS
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so3209812a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629547; x=1796234347; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3ql+trEST5GBe5icgHLs8egrkIrOnsTHov8GZtBedQ=;
        b=PQcmyNBS/RdM7Fi/IWNrrL7h9/qKovVbWbutC7iI2Bxdi3rstTjE5qf0IsBaO+LY4e
         AGw1iDAftKxj1P+224s+jC+i30zsWM7Fn5U1H2OrqH+I5sfkrfSVmfYvZN0S5Wxl/wL9
         BEWUPzKzzO7+J/yyrCqbnORpQcuMunOydZwtjERqxqiUXJGbSMFSKZzDi55pUM1DpsL4
         ExKQja2ZYhPUFqErJvZBsAWI6GQH9doWHXJ/ZtjYyhK+nuhRIcCKAgajswmljURUOOsS
         bJQPoz3Xf/WAgIxnML/c5vtyiszQg27LczhjTy45fC8nIs0egXzqo43tBcxMgV9FVPXk
         pNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629547; x=1796234347;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3ql+trEST5GBe5icgHLs8egrkIrOnsTHov8GZtBedQ=;
        b=sSabd7qgIHi4Yn4tCKeZFQpcprfx7ndGH0PQ58BLIgT70kZzCdbwczTn3Qo/emPO2T
         2Qf+WHSsPcRc5MxvPh1WsDLgqtmRlQ8Mvm2BmCCbInvd+Dh03+r74rmOKRIjAS0aATdM
         oOd5ricBSxluB6iFB3JSnhd7WbU8hSRCoKrdvm0A/PVJWQWCWUH6t06veI9AC+xb19ea
         hXqKwR/BYPpb9GTBdoYGGSTuVOKK+4GtGT+g2uVBQ5u5easU1BI5g4IsNjUHM3s3C8IL
         sUxMkCk52lOt4bu88WjOWbe6of2Vxwy0aXwtY+j+aMRr8hdm3BH22eBJl+1dWLJ1buqN
         P9lQ==
X-Forwarded-Encrypted: i=1; AL+hErFWviN8TDVLPh7PQnv8Y5ZtuFfaFCIkgGUXrqphANi+mePbT1fj0FucPXMljXPXz1HtyXnnnnGf11/JluU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jq8i1BLj5VpbiucWNDOsx4xETJSkGS7Rzv7h6GrjU7h1GHZW8
	PryPOCzu5lDKRaGV01tfy0H3PUjQKyRl+WbmoFO2LxkBmGIosK6Wm71+oUyKwa4Xqg==
X-Gm-Gg: AZFdTZcOzue+U18Tn8y+rFzg80TB9p2xMITpcRZrSRJ9sgYFXWvJlQn8TVWqcH3+vLP
	nAuJMes+6rskhSE0HzdhSWL0hmrz1SLbPvfVSmjYwvB23iu1ewyIMBNI95Vp2RHON5TTVtazDJ/
	BKeDHz/MKN4oLn/CG32juiqO5NxMG9yt0BscD7w3qdy7KD9lauHiTnFTNgFnTKQaer8Gt3pcynj
	LkyNGl4ogR95uQiTCo137mhPlM20a0R4YBqhL9yC7NqG/cMuxrTOmzizv3+vMFM2E07NuZbW6fU
	ABzGLllE1e0ciKvyBptY3vX51JnMidnpI4nGPGsIncqM7UJkKRJrwNIqhw8j2n5F7hIAWUfDMrX
	YVschj12dPqsVb6ViKIyK/XsXt25tDiBBdzyDTQUc6yBGVP2K7+Ks3G/d0WdQ5csd5gXQFKs8HJ
	k+4YGk3EnuoL6Q/PhsZVwzLCQ3y21erLtZkYh+DlYmm9bFLx74DI4tdmh1P88RtwE6fCX3aIxbt
	yH+ZDfakO2eJRkV8om4McmAdBOEVuC3+VQ6204QT7Ee77SO5Q43et1xFeIZ72UwoCKAlWlhCcL8
	PrMlkUzN4Xw9EZt5WTGOkMTPjCS5GDyo80gISWpP4D+eQ2mLswxevaBEQDAnk65c
X-Received: by 2002:a17:90a:e7d0:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b41c9cfc12mr15413655a91.32.1795629546987;
        Wed, 25 Nov 2026 09:59:06 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm29085960a91.2.2026.11.25.09.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:59:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 09:59:05 -0800
Message-Id: <DN4HJTFG5WHY.1BIGOM7LNESZA@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files
 after Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
 <DMZMRTXS7OSC.M79XF39ZVEWE@google.com>
 <20261125003759.GD3545683.vipinsh@google.com>
In-Reply-To: <20261125003759.GD3545683.vipinsh@google.com>

On Tue Nov 24, 2026 at 10:55 PM PST, Vipin Sharma wrote:
> On Thu, Nov 19, 2026 at 05:01:19PM -0800, David Matlack wrote:
>> This is a lot of complexity for one commit, and it's hard to review. I'd
>> like to start with the simplest approach and build from there: implement
>> can_finish() and have it return false until the device is fully
>> retrieved, i.e. retrieved and taken over by VFIO_DEVICE_BIND_IOMMUFD.
>> Then finish() only needs to free the incoming state and call
>> pci_liveupdate_finish().
>
> Closing session FD is not retriable. If it returns an error then
> userspace won't be able to retry. So, only option will remain to reboot
> the host.
>
> VFIO doesn't need to impose this restriction. We discussed in LPC to not
> block finish() as this call can only be tried one time in LU if
> session is leaked.

Right, if userspace closes the session before taking over all of its
devices, the session is leaked and the only way to recover is to reboot.
I'm ok with that in the first series. It only happens if userspace
misbehaves, and the device is left running with its memory still
preserved, so nothing gets corrupted.

I'm not opposed to improving finish() so that it handles devices that
weren't taken over and closing the session always succeeds. But that can
go in a follow-up series. It doesn't have to be in the first series, and
including it makes the first series larger, harder to review, and harder
to merge.

>> It also has a nice side effect: LUO calls can_finish() on every file in
>> a session before finishing any of them, so a memfd in the same session
>> that the device DMAs into can't be finished before the device has been
>> taken over.
>
> If userspace has two session, memfd in one and vfio in another, we will
> still have risk, where memfd is retrieved correctly and may be
> closed/released due to a process crash but VFIO device still acessing mem=
ory
> by continuing its DMA and potentially corrupting memory.

True, but resetting the device in finish() doesn't protect against that
either. The device is only reset when its own session is finished, which
can be after the memfd in the other session has been freed.

With iommufd (i.e. not noiommu), memfds mapped into a VFIO device must
be preserved in the same session, and iommufd enforces that
dependency [1]. noiommu is inherently unsafe in many ways, so I don't
think we need to worry about this one case there.

> I am still inclined to let finish proceed without blocking via
> can_finish(). I can try splitting patches.

Please go with can_finish() in this series, and send the finish()
improvements as a separate series on top. Splitting them into separate
patches within this series still leaves this series larger and harder to
review.

[1] https://lore.kernel.org/all/20261025021930.674647-16-skhawaja@google.co=
m/
