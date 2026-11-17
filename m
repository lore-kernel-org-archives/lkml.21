Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956527;
	b=cE9ep3dap0oB6nfbPU+6dVEGuLVSI1HXhpiJa12Ha4w6f773UM3URGo2ELVBQIMz+3EP
	 fTpc4apTvk1ayMl27Yf4ZuNzpqAbMUai1GqtQI/VzphOXtiGLk2ZDv5qFVCKA4obUNBII
	 3rrWx+l5QPS2GPCBw84En10IiTCel9XTeh4ILuqMJg809GeTs9sD4gNkaZiuD/KVO7gse
	 SIyDeJirZ5y3QUzSiGqoCFpXmdXIRQeIWwlbviC3UT42DDIEt3ee1iqBKhHwYK27c/XC8
	 1qrWv7JXl9z+X02ABG2GRLcOlfhW/z6flnGmds3FZgLQx2PfxNHH9erJzku+VTXm5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZoF+arBWk9nIrqmILMC/g3drcspiC3u5ktWITZiT+Hs=;
	b=T2q23+8iq09CnSXrd5QGAb7tiMw4VV50TEEvXVhR53eMBy2U0FgLTqdcO+DKus0bdvQj
	 3XsrnZPc8ZJ36nsUPuJlT7gB9diocrZeP0zazP4zr513urWGencz/AvXs8IKg03yV8Ee0
	 j2itJfxPGwPUKkHHkgFbQvgiKQ1j4jwyq5bPB0IivsbO6AtanGP8gqMjOp4ZJFzOXN2YK
	 m6Qg8aRDW38rYEn6kmwjSs9viuGXId8SE6NsVsG12DyBdyFNcGd0qDsFptmTFvlmm+MQH
	 1Ugunwpf8nIcwnhDhlSTUW9ixKxh0ig/M6OvrekT/RIPTtj1HXBHHfajufQw8wfuSyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bzYymmFN;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FF4606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FF4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bzYymmFN
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ee254f6eefso27345ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794956526; x=1795561326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoF+arBWk9nIrqmILMC/g3drcspiC3u5ktWITZiT+Hs=;
        b=bzYymmFNaVKjp7L9MQq9R//EKsOqfeAxHD+Ud1myIbc/mUrQ6wb5lXhu3/WkgmWQn3
         EXHUPh7xD6fpYWAIw9tcXYbRSP1jKIBmu/8V9vI33uRR++ojmr3asblhLlGzBLFtyPx7
         ff2ZxZEeAB066nvX99j3cKIcpUFVReBClcK80H5KOhAG5qPc2761CNjaa/sjn4yV5WxT
         H6PDKZXK/BCoq/JmXesRCdRxLuxLd3peE2U/PoB+23vz90lcSiFVW6a70gUP4IVHz2z3
         4QlucaplFmn2oPbIs6geQaH7vQwJDNh/YVTvIpDyVHOimPH0KJ69NVyru48ymakX7UXR
         MvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956526; x=1795561326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoF+arBWk9nIrqmILMC/g3drcspiC3u5ktWITZiT+Hs=;
        b=BxmSDEVncaIJEzmhyNtqfsTE33WPsJU2Th1P4MTCW4O+GYPYFrBbazgg7/OcIuupyd
         ffFWGwcnl780NMV39+itFKhVA7/T9854TGCGRKvpLe2lysuLCa0/V45201xR9QomcYfN
         8wVuPnQrB8X4G8jADcavoZg10q+cQPYzJoQMUouYeTQE+1qpUNAIjTycWawwiZqpWAp8
         6z+GIvTyEKgzz+SWqg2nvke8WTepb1isjJHYkGJyVpAEQ9fu6Eh7zqgjruSSbhfDr0Ti
         YmXJgiOvxPDyeDpyJ2LNGYo4Kmeet2muQxb8zmpj+rbEmLaJtCji1Mb8I74KKNZkqMWP
         PcWw==
X-Forwarded-Encrypted: i=1; AL+hErHqj6s3hZNpfqJoVGpz/HqeuSr/Wy99XegUzT6yvqdsNJw1CYbLBVbUme7geO1+EF5ufqX82gfpnwMZtJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JMIbt8RiDCN7L6I1lsA4efWSOdSHkTntqXWTqDPypgdchkus0
	m/zUuWemlIYV2MYfDO5PkHx/YMBHifSu0c9ORs5NX/BAx0d+9EfYhoO+xrwq/kztO2XSWB21DDE
	3Utg2j8Vm
X-Gm-Gg: AZFdTZfVRL/9AcAHnjGeMNwkd9Z21HbeJN/4LwkwgE2C5p494lVJ9P8sITs9QY6FJac
	TN27LRrq2W2Olzf+QCmbD5e2yAOD2tgUlO3+w6DXkWUTeFZD3ruwuxBjSpwePyzHSan0EAfIxRk
	zmd8UoYoiztV0oJqowdoBMCrvQEw4zTovG/xk+XzS6cnfnreeccsBuvHMi2P0Xq8qQhT87JGWOw
	PTD4uNwMN+0uIrAyQ2q9tL0zyyThrDimCawFXKkje+rvLY2MgDkxEl+4gmmM6CROx6qdbG2Iq7y
	Coa5Kp5nkvxAHHeBQRGqjbE/GQHtWm1xG/Dca2hHmIp3NtWhKIkvD2/ZNDFyVAMKPtHXnqcMvXF
	8xat1fBbAcXsoxQA3G0CXm5KDvLDvQN0lO4t0IrLm0BXP07jKJhJ2wMnraiYPPEFb9H6E5nxTyL
	n/1493o6ZtiFwNSVTiCYFq9nu2ihkL3lt6WrtexdY2YkqjGOvMRrkjFClCnoan//ksWd9HfUPU4
	NG4ocHsxA5sOPocY/9ihdgX8Z1ge1M+0Cr1QpnBYCbi9QTGDnL+Y/Z/vP0iSSzhwcCfpheZnwvY
	p1xuzPfBEBRo+GT4UT7J/k3i1CdlmsJyrnlj2HyM/4mzVpd9Hnxx+gBlD57Rqj2nf/s=
X-Received: by 2002:a17:903:324e:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2eff98d2120mr941545ad.8.1794956525618;
        Tue, 17 Nov 2026 15:02:05 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac29a846sm5891026a91.9.2026.11.17.15.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:02:04 -0800 (PST)
Date: Tue, 17 Nov 2026 15:02:00 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, kvm <kvm@vger.kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
Subject: Re: [RFC PATCH 0/5] PCI/vfio-pci: Guard resets against active SR-IOV
 VFs
Message-ID: <20261117225559.GB2250529.vipinsh@google.com>
References: <20260812045325.2733631-1-alex.williamson@nvidia.com>
 <an0BOyexLcOjFJw9@google.com>
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
In-Reply-To: <an0BOyexLcOjFJw9@google.com>

On Thu, Aug 13, 2026 at 10:30:45PM +0000, Samiullah Khawaja wrote:
> On Tue, Aug 11, 2026 at 10:53:18PM -0600, Alex Williamson wrote:
> > It's recently been found[1] that vfio-pci doesn't restrict resets on PFs
> > while SR-IOV is enabled.  This can not only result in an uncoordinated
> > disruption of the use of the associated VFs, but the ongoing use of and
> > access to the VF has the potential to result in machine checks.
> > 
> > This series proposes that this gap is largely an oversight of
> > pci_reset_function() to recognize that a PF reset affecting SR-IOV VFs
> > violates the scope boundary of the pci_reset_function() API.
> 
> Hi Alex,
> 
> Thanks for sending out the RFC to fix this issue. I cherry-picked it
> into my environment to verify that whether it fixes the issue I was
> experiencing and it does fix it. I will continue to do more testing, but
> when you send this as a formal v1, you can add:
> 
> Tested-by: Samiullah Khawaja <skhawaja@google.com>
> Reported-by: Samiullah Khawaja <skhawaja@google.com>
> 

Hi Alex,

Is this series still on your radar for formal v1?

If this is the direction we are going in I can use it for liveupdate work
  https://lore.kernel.org/all/auzftbPFO_6XBYVw%40google.com/

Thanks
Vipin
