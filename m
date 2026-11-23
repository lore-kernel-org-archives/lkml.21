Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438036;
	b=zOvYqJ4mJk6s11q/gTnu5lKm8BRg2Buk+WrooFP9IMEGccnla680nA3Ktepi14hJoZLj
	 0SY+z3O90him1+k4DKpoKjw8fDRmSrAJs03U5zmLmABmNmJvLZAoE0H2s9dklL+6AyDQV
	 WEpyLOhVBTrTXEX0l/vOG0WIJXTwGyW+j7MjK2lauBJ8H5R+KIVMTnPBl3lZV3Pvj3v/r
	 CkWXzdA8FzSdO40D8Vvd2UD5j0uQrMsBahEUxEBu3U/yHxt+Gc6oX46SijOIgR4dIt431
	 gnpMKKM3YtNTTzx3T0ADDil0lVtvQSJT3OT3QBhfdoDR0wS4PbHzX7VkCJRGid+fJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
	b=bDnu3+v5p+5PcshYK4SxZQjyrA3Uf1WT9RQFXMufNujstvt7nklOP/T4uDMULV1H9JUv
	 QMB35Hzh1PLqG9m/GKhS31w8vtI9QMen41R4B/nSNKLIHQ1E9cIyqx161nYSdSIqZPHu7
	 hpQh9/2zAcuCsSHtdFwEGkToP/b/L/5075Xbp5Es048Ez9GuvVQ07vJVgGa5ex4J8X0mN
	 8NrrmxLVV2CYBQwMO8IUR/I7wc0uEMYjhQCm2uYN+qlWpPbyLF2lp68LLYDp4/e15Rl/c
	 g5/2SUSgjhPJ/cYIdL2Jj9Davo1BvyqYCetCb6MXnIO5zoxBPMXwv1kyEs9WfJbiGrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdoBDMDk;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7441D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QdoBDMDk
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so2157520b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438035; x=1796042835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=QdoBDMDkTwWoMibB3nGc13HUaEw1mJUf8C6D9sn0HZ9pF0FF9+4RhzNOJfuASXfJGt
         kO5ApXyzdXHZt/B8kOaM33uSKVhfGbcnAKjknpbIHTp6Yo0ReVwFvkP1Is0PhIOhKdUW
         aw6zak5dWbkxOgTbOQ1qFPvy4ubuzll/J/lS1mXegS0vtkVm9ED4CDhLlDSdHbCc8lhh
         6dG8bG1pl4ncJUjQG6k7Mdd5lJYv41jZUdvoGkfdvcm15Pui4xgeZ2isuenrj6pKm/x5
         WRuKxiAEGQwMe7Cjk72p+Dfid1g8TUBmpuO4k4D9gyBQg5YosHKOCusGgfrHjJW/cWd7
         TXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438035; x=1796042835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVO8QU6aaInlhKIohIqrjiN9QqnCTSKNv3BTArRdkBM=;
        b=Yvmjj3aaevEbsr01IjL8HeLehF86JnDeAPJX1gHrtE3Pig+J8elGdeg43zDL2Bg5O5
         UPTxTuEAzjflEV7LeHzI3pkN1Mo3wpxRDnuPnkYi4ovqNXuQeAFGJ6KJo9Ih7rdrtjz3
         RG+Oc7aVSmylWY0fA+roHffAQZHlhZBewetkjr1nEE3Hj8bRonvuQPb9PXADlwlGiN3Y
         aYS8MrnINDQ1L9zV6AB3FLiJnBWfheyr7HshZo0wlMpI+p42Hw6dJGutBRhOkWEj/Azs
         c6nsAFoghJOklx7Pssf0hl368HccKedgypk20F87aZoUUSA9wjibUPSTUnOiLtJ7l9wQ
         Xcrg==
X-Forwarded-Encrypted: i=1; AL+hErFWbQS3UbMkA/oN5zZttkoK2gQFAl4eG5Us1mtxjuycgkhppsBV6OvqExBdzeIb8hx6bIyONoHaKgjAmQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QCmWBOlbRDopD7kDvX1rMj0FyRSX5a/FpWgxmue9j4oVcip4U
	hZMShpgsMf69GbpjpMLqQBLsYjykNikD6T9G0HckVacG2p2Wd6MH6KfM
X-Gm-Gg: AZFdTZcgd9SDsJzr15ERk0rOAdB0UzK8RFXmXcUqAlyuFSVqZFZVTe6y3XwRSb/4jV3
	xq08Xz68TZY7gEjivhAxunfl0E5UvliT5tPxTQgg9bjM89XouJj0dqYY3PFOYC0M0IDpIv8nwES
	1LeZ403MsiK/fU7+wK2a2cU3lXaJgBYE6zbUaIrtdg7RX50ynCitRQGja0M7PI7kL9KfBVpQPXh
	NFIHp4c2EmwnslxEznoNXOY+3RWRgpKsBfoOgZjCPO5QSz9I1/ZDaeds7gzEIo875aTF7vnkFkg
	twqumOuMLVTe6Hd8oEaIRdF1nzrddzSO8mPxTw/04MhPwocgUERdyT5ELE0+fTh4P5vuwAvnqIs
	gO3HKj5V6IJmLwJCki2L6i08cMEK6dH9tHIZYn/X/K+89Wx/4VOo9/DlqLqxQj2jG7hKxPckaEg
	2170X2d+KVGA2I1NTs3mY7mFypcc72Xk5ZBXreuhUZVuf0IRrOSl+7nE9pkoQVCjjtSyZXaoMtr
	ePF6WOKW6n3hFPC8n1k0z6geBdQIOG+1xVKQSf5dij2iRP4GM4ElvKUAOHH9zeR6w5R5CUzDyB+
	YroM0+yWezvL8yixDl7ZxFn05SdM
X-Received: by 2002:a05:6808:2224:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-57a0bd98885mr12866171b6e.44.1795438035324;
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250ef2sm9385288b6e.3.2026.11.23.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:47:15 -0800 (PST)
Date: Mon, 23 Nov 2026 20:47:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, me@ziyao.cc, aurelien@aurel32.net, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <nke33b3mdeut4fmp2noqf3xknpfvujesco44va3yamecdb722y@u66rmnx6t6gk>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
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
In-Reply-To: <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>

On Mon, Nov 23, 2026 at 09:24:52AM +0000, Troy Mitchell wrote:
> On Mon, 23 Nov 2026 01:38:09 +0800, Jiayu Du wrote:
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> 
> v2 said why only banks 0 and 7 are exposed, here and in a comment
> above k3_efuse_keepouts. v3 drops both. Banks 1 and 2 hold the root
> key and the SSK, so please keep that explanation.
> 
> [...]
> >
> > +static const struct nvmem_keepout k3_efuse_keepouts[] = {
> 
> The comment belongs here.

Thanks, I'll restore the explanation in both the commit message and the
comment above k3_efuse_keepouts in v4. I'll wait for feedback from the
other reviewers before sending it.

Regards,
Jiayu Du


